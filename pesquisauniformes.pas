unit pesquisauniformes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  Th_uniformes = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridUniforme: TDBGrid;
    BtnSelecionar: TBitBtn;
    ImgUniforme: TImage;
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DbGridUniformeDblClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure DbGridUniformeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridUniformeCellClick(Column: TColumn);
    procedure DbGridUniformeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_uniformes: Th_uniformes;
  coduniforme: String;
  i, cont: integer;

implementation

{$R *.dfm}

uses funcoes, module, uniformes, jogos, telapadraojogos;

procedure Th_uniformes.BtnSelecionarClick(Sender: TObject);
begin
  DbGridUniformeDblClick(Self);
end;

procedure Th_uniformes.DbGridUniformeCellClick(Column: TColumn);
begin
  f_gerais.buscaImagem(ImgUniforme, f_gerais.buscarNome('foto_uniforme',
    'CA_UNIFORMES', 'coduniforme', DbGridUniforme.Columns[0].Field.AsString));
end;

procedure Th_uniformes.DbGridUniformeDblClick(Sender: TObject);
begin

  coduniforme := DbGridUniforme.Columns[0].Field.AsString;

  // ==========================================================================
  // Pesquisa quando acionada pelo menu Camisas
  // ==========================================================================

  if identificacao = 'MnCamisas' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '29';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      'and j.coduniforme = ' + coduniforme;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O uniforme ' + AnsiUpperCase(f_gerais.buscarNome('descricao',
        'ca_uniformes', 'coduniforme', coduniforme)) + ' não foi utilizado' +
        #13 + ' em nenhum jogo do seu clube!';
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
        + 'from ca_jogos j ' + 'where coduniforme = ' + coduniforme +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := coduniforme;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS';
      r_jogospadrao.LblDescricao2.Caption := 'utilizando o modelo ' +
        AnsiUpperCase(f_gerais.buscarNome('descricao', 'ca_uniformes',
        'coduniforme', coduniforme));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0', '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos utilizando o modelo ' +
        f_gerais.buscarNome('descricao', 'ca_uniformes', 'coduniforme',
        coduniforme);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // pesquisa quando acionado pelo cadastro de adversários
  // ==========================================================================
  if identificacao = 'CA_UNIFORMES' then
  begin
    FrmDm.TblUniformes.First;
    while FrmDm.TblUniformescoduniforme.AsInteger <> DbGridUniforme.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblUniformes.Next;
    end;
    CA_UNIFORMES.estadoDosBotoesdeCadastro();
  end;

  // ==========================================================================
  // pesquisa quando acionado pelo cadastro de JOGOS
  // ==========================================================================

  if identificacao = 'CA_JOGOS' then
  begin
    CA_JOGOS.EdtCodUniforme.Text := DbGridUniforme.Columns[0].Field.AsString;
    CA_JOGOS.EdtNomeUniforme.Text := f_gerais.buscarNome('descricao',
      'CA_UNIFORMES', 'coduniforme', CA_JOGOS.EdtCodUniforme.Text);
    f_gerais.buscaImagem(CA_JOGOS.ImgUniforme,
      f_gerais.buscarNome('foto_uniforme', 'CA_UNIFORMES', 'coduniforme',
      CA_JOGOS.EdtCodUniforme.Text));
  end;

  if identificacao = 'CA_JOGOS' then
     h_uniformes.Close;
end;

procedure Th_uniformes.DbGridUniformeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False); // Remove barra Horizontal
end;

procedure Th_uniformes.DbGridUniformeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  f_gerais.buscaImagem(ImgUniforme, f_gerais.buscarNome('foto_uniforme',
    'CA_UNIFORMES', 'coduniforme', DbGridUniforme.Columns[0].Field.AsString));
end;

procedure Th_uniformes.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de estádios
  f_gerais.pesquisaUniforme(DbGridUniforme, EdtPesquisa.Text);
  f_gerais.buscaImagem(ImgUniforme, f_gerais.buscarNome('foto_uniforme',
    'CA_UNIFORMES', 'coduniforme', DbGridUniforme.Columns[0].Field.AsString));
end;

procedure Th_uniformes.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
  f_gerais.buscaImagem(ImgUniforme, f_gerais.buscarNome('foto_uniforme',
    'CA_UNIFORMES', 'coduniforme', DbGridUniforme.Columns[0].Field.AsString));
end;

procedure Th_uniformes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_uniformes.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridUniformeDblClick(Self);
      end;
  end;
end;

end.
