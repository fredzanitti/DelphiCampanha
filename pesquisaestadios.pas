unit pesquisaestadios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  Th_estadios = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridEstadio: TDBGrid;
    BtnSelecionar: TBitBtn;
    BtnIncluir: TBitBtn;
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridEstadioDblClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnIncluirClick(Sender: TObject);
    procedure DbGridEstadioDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_estadios: Th_estadios;
  codtime, codestadio, msg: String;

implementation

{$R *.dfm}

uses funcoes, module, estadios, jogos, telapadraojogos;

procedure Th_estadios.BtnIncluirClick(Sender: TObject);
begin
  CA_ESTAD.ShowModal;
end;

procedure Th_estadios.BtnSelecionarClick(Sender: TObject);
begin
  DbGridEstadioDblClick(Self);
end;

procedure Th_estadios.DbGridEstadioDblClick(Sender: TObject);
var
  cont, i: Integer;
begin

  codestadio := DbGridEstadio.Columns[0].Field.AsString;

  // ==========================================================================
  // pesquisa vinda do formulário de cadastro de estádios
  // ==========================================================================
  if identificacao = 'CA_ESTAD' then
  begin
    FrmDm.TblEstadio.First;

    while FrmDm.TblEstadiocodestadio.AsInteger <> DbGridEstadio.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblEstadio.Next;
    end;
    CA_ESTAD.estadoDosBotoesdeCadastro();
  end;

  // ==========================================================================
  // pesquisa vinda do formulário de cadastro de jogos
  // ==========================================================================
  if identificacao = 'CA_JOGOS' then
  begin
    CA_JOGOS.EdtCodEstadio.Text := DbGridEstadio.Columns[0].Field.AsString;

    f_gerais.buscaBandeirasJogos(CA_JOGOS.ImgBandPaisAdver, CA_JOGOS.ImgUfAdver,
      DbGridEstadio.Columns[0].Field.AsString, CA_JOGOS.LblCidade,
      CA_JOGOS.LblPais, CA_JOGOS.LblUf, CA_JOGOS.LblNomeEstadio);
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Por Um Adversário
  // ==========================================================================
  if identificacao = 'MnAdversario2' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '8';
    codtime := r_jogospadrao.codauxiliar1;

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      'and r.codadver =  ' + codtime + ' and j.codestadio = ' + codestadio;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver',
        'codadver', '0')) + ' nunca enfrentou o(a) ' + #13 +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        codtime)) + ' jogando no estádio ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_estad', 'codestadio',
        codestadio));

      Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // páginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das páginas e acrescentar os números de páginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where (codadvermand = ' + codtime +
        ' or codadvervisit = ' + codtime + ' ) ' + 'and codestadio = ' +
        codestadio + ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := codestadio;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'CONTRA ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        codtime)) + ' NO ESTÁDIO: ' + AnsiUpperCase(f_gerais.buscarNome('nome',
        'ca_estad', 'codestadio', codestadio));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, codtime);
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados contra: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver', codtime);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Por Estádio
  // ==========================================================================

  if identificacao = 'MnJogosEstadio' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '20';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      ' and j.codestadio = ' + codestadio;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver',
        'codadver', '0')) + ' nunca jogou no(a) ' + #13 +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_estad', 'codestadio',
        codestadio));

      Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // páginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das páginas e acrescentar os números de páginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codestadio = ' + codestadio +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codestadio;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'NO(A) ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_estad', 'codestadio',
        codestadio));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados no(a) ' +
        f_gerais.buscarNome('nome', 'ca_estad', 'codestadio', codestadio);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  h_estadios.Close;
end;

procedure Th_estadios.DbGridEstadioDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_estadios.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de estádios
  f_gerais.pesquisaEstadio(DbGridEstadio, EdtPesquisa.Text);
end;

procedure Th_estadios.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_estadios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_estadios.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        BtnSelecionarClick(Self);
      end;
  end;
end;

end.
