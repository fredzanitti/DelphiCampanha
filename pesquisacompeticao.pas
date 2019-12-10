unit pesquisacompeticao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  Th_competicao = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridCompeticao: TDBGrid;
    BtnSelecionar: TBitBtn;
    BtnIncluir: TBitBtn;
    procedure BtnSelecionarClick(Sender: TObject);
    procedure DbGridCompeticaoDblClick(Sender: TObject);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnIncluirClick(Sender: TObject);
    procedure DbGridCompeticaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_competicao: Th_competicao;
  i, cont: Integer;
  codcompet: String;

implementation

{$R *.dfm}

uses funcoes, module, competicao, jogos, telapadraojogos, selecionarano,
  titulos;

procedure Th_competicao.BtnIncluirClick(Sender: TObject);
begin
  CA_COMPE.ShowModal;
end;

procedure Th_competicao.BtnSelecionarClick(Sender: TObject);
begin
  DbGridCompeticaoDblClick(Self);
end;

procedure Th_competicao.DbGridCompeticaoDblClick(Sender: TObject);
begin

  codcompet := DbGridCompeticao.Columns[0].Field.AsString;

  // ==========================================================================
  // presquisa proveniente do cadastro de competições
  // ==========================================================================
  if identificacao = 'CA_COMPE' then
  begin
    FrmDm.TblCompeticao.First;
    while FrmDm.TblCompeticaocodcompeticao.AsInteger <> DbGridCompeticao.Columns
      [0].Field.AsInteger do
    begin
      FrmDm.TblCompeticao.Next;
    end;
    CA_COMPE.estadoDosBotoesdeCadastro();
  end;

  // ==========================================================================
  // pesquisa proveniente do cadastro de títulos
  // ==========================================================================
  if identificacao = 'ES_TITULOS' then
  begin
    ES_TITULOS.EdtCompeticao.Text := DbGridCompeticao.Columns[0].Field.AsString;
    ES_TITULOS.EdtCompExtenso.Text := DbGridCompeticao.Columns[1]
      .Field.AsString;
  end;

  // ==========================================================================
  // pesquisa proveniente do cadastro de jogos
  // ==========================================================================
  if identificacao = 'CA_JOGOS' then
  begin
    CA_JOGOS.EdtCodCompeticao.Text := DbGridCompeticao.Columns[0]
      .Field.AsString;
    CA_JOGOS.EdtCompeticao.Text := DbGridCompeticao.Columns[1].Field.AsString;
  end;

  // ==========================================================================
  // Pesquisa para relatório jogos por campeonato
  // ==========================================================================
  if identificacao = 'MnJogosCampeonato1' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '17';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      'and j.codcompeticao = ' + codcompet;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver',
        'codadver', '0')) + ' não disputou' + #13 + 'nenhum jogo pelo(a) ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao',
        codcompet));
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
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
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j ' + 'where codcompeticao = ' + codcompet +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codcompet;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'pelo(a) ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao',
        codcompet));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados pelo(a) ' +
        f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao', codcompet);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Campeonato por ano
  // ==========================================================================
  if identificacao = 'MnJogosCampeonato2' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '18';
    r_jogospadrao.codauxiliar1 := codcompet;
    f_gerais.codcompeticao := codcompet;
    f_gerais.anocompeticao := 'MnJogosCampeonato2';
    h_anos.identificacao := 'MnJogosCampeonato2';
    h_anos.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Adversario em campeonatos
  // ==========================================================================
  if identificacao = 'MnAdversario7' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '19';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      'and j.codcompeticao = ' + codcompet + ' and r.codadver = ' +
      r_jogospadrao.codauxiliar1;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver',
        'codadver', '0')) + ' não disputou' + #13 + 'nenhum jogo pelo(a) ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao',
        codcompet)) + #13 + ' contra o ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1));
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
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
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j ' + 'where codcompeticao = ' + codcompet +
        ' and (j.codadvermand = ' + r_jogospadrao.codauxiliar1 +
        ' or j.codadvervisit = ' + r_jogospadrao.codauxiliar1 + ') ' +
        'order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := codcompet;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'pelo(a) ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao',
        codcompet)) + ' contra o ' + AnsiUpperCase(f_gerais.buscarNome('nome',
        'ca_adver', 'codadver', r_jogospadrao.codauxiliar1));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime,
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1)));
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados pelo(a) ' +
        f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao', codcompet);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;
  h_competicao.Close;
end;

procedure Th_competicao.DbGridCompeticaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_competicao.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa
  f_gerais.pesquisacompeticao(DbGridCompeticao, EdtPesquisa.Text);
end;

procedure Th_competicao.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_competicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_competicao.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridCompeticaoDblClick(Self);
      end;
  end;
end;

end.
