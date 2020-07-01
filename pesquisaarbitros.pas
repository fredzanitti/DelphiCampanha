unit pesquisaarbitros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons;

type
  Th_arbitros = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridArbitro: TDBGrid;
    BtnSelecionar: TBitBtn;
    BtnIncluir: TBitBtn;
    procedure DbGridArbitroDblClick(Sender: TObject);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnIncluirClick(Sender: TObject);
    procedure DbGridArbitroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_arbitros: Th_arbitros;
  codarbitro: String;
  i, cont: Integer;

implementation

{$R *.dfm}

uses module, arbitros, funcoes, jogos, telapadraojogos;

procedure Th_arbitros.BtnIncluirClick(Sender: TObject);
begin
  CA_ARBIT.ShowModal;
end;

procedure Th_arbitros.BtnSelecionarClick(Sender: TObject);
begin
  DbGridArbitroDblClick(Self);
end;

procedure Th_arbitros.DbGridArbitroDblClick(Sender: TObject);
begin

  codarbitro := DbGridArbitro.Columns[0].Field.AsString;

  // ==========================================================================
  // Pesquisa proveniente do cadastro de árbitros
  // ==========================================================================
  if identificacao = 'CA_ARBIT' then
  begin
    FrmDm.TblArbitros.First;
    while FrmDm.TblArbitroscodarbitro.AsInteger <> DbGridArbitro.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblArbitros.Next;
    end;
    CA_ARBIT.estadoDosBotoesdeCadastro();
  end;

  // ==========================================================================
  // pesquisa proveniente do cadastro de jogos
  // ==========================================================================
  if identificacao = 'CA_JOGOS' then
  begin
    CA_JOGOS.EdtCodArbitro.Text := DbGridArbitro.Columns[0].Field.AsString;
    CA_JOGOS.EdtArbitro.Text := f_gerais.buscarNome('nome', 'CA_ARBIT',
      'codarbitro', CA_JOGOS.EdtCodArbitro.Text);
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogadores / Jogadores vs Jogadores (cont.)
  // ==========================================================================

  if identificacao = 'MnJogosArbitro' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '16';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      'and j.codarbitro = ' + codarbitro;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O árbitro ' + AnsiUpperCase(f_gerais.buscarNome('nome',
        'ca_adver', 'codadver', codarbitro)) + ' não apitou' + #13 +
        'nenhum jogo do seu clube!';
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
        + 'from ca_jogos j ' + 'where codarbitro = ' + codarbitro +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codarbitro;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS';
      r_jogospadrao.LblDescricao2.Caption := 'arbitrados pelo ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_arbit', 'codarbitro',
        codarbitro));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0', '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos arbitrados pelo ' +
        f_gerais.buscarNome('nome', 'ca_arbit', 'codarbitro', codarbitro);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  h_arbitros.Close;
end;

procedure Th_arbitros.DbGridArbitroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_arbitros.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de estádios
  f_gerais.pesquisaArbitro(DbGridArbitro, EdtPesquisa.Text);
end;

procedure Th_arbitros.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_arbitros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      // ações quando pressionar ESC
      begin
        h_arbitros.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridArbitroDblClick(Self);
      end;
  end;
end;

end.
