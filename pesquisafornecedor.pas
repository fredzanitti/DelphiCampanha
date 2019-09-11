unit pesquisafornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Th_fornecedor = class(TForm)
    Label1: TLabel;
    ImgFornec: TImage;
    EdtPesquisa: TEdit;
    DbGridFornec: TDBGrid;
    BtnSelecionar: TBitBtn;
    DtsQrPesquisa: TDataSource;
    QrPesquisa: TFDQuery;
    procedure DbGridFornecCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure DbGridFornecDblClick(Sender: TObject);
    procedure DbGridFornecKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure DbGridFornecDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_fornecedor: Th_fornecedor;
  sql, msg: String;

implementation

{$R *.dfm}

uses funcoes, module, fornecedor, telapadraojogos;

procedure Th_fornecedor.BtnSelecionarClick(Sender: TObject);
begin
  DbGridFornecDblClick(Self);
end;

procedure Th_fornecedor.DbGridFornecCellClick(Column: TColumn);
begin
  f_gerais.buscaImagem(ImgFornec, f_gerais.buscarNome('logo_fornec',
    'CA_FORNEC', 'codfornec', DbGridFornec.Columns[0].Field.AsString));
end;

procedure Th_fornecedor.DbGridFornecDblClick(Sender: TObject);
var
  i, cont: Integer;
  DtInicial, DtFinal: string;
begin

  // ==========================================================================
  // pesquisa quando acionado pelo cadastro de patrocinadores
  // ==========================================================================
  if identificacao = 'CA_FORNEC' then
  begin
    FrmDm.TblFornec.First;
    while FrmDm.TblForneccodfornec.AsInteger <> DbGridFornec.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblFornec.Next;
    end;
    CA_FORNEC.estadoDosBotoesdeCadastro();
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Jogos por período
  // ==========================================================================

  if identificacao = 'MnFornec' then
  begin

    sql := 'select dt_inicio, dt_fim from ca_fornec ' +
      'where codfornec = :CODIGOFORNECEDOR ';

    QrPesquisa.Close;
    QrPesquisa.sql.Clear;
    QrPesquisa.sql.Add(sql);
    QrPesquisa.Params.ParamByName('CODIGOFORNECEDOR').AsInteger :=
      DbGridFornec.Columns[0].Field.AsInteger;
    QrPesquisa.Open;
    QrPesquisa.First;

    DtInicial := QrPesquisa.Fields[0].AsString;
    DtFinal := QrPesquisa.Fields[1].AsString;

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '36';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      ' and j.data between :DATAINI and :DATAFIM';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Params.ParamByName('DATAINI').AsDate :=
      StrToDate(DtInicial);
    FrmDm.QrContador.Params.ParamByName('DATAFIM').AsDate := StrToDate(DtFinal);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Não há nenhum jogo disputado com uniformes ' + #13 +
        'desse fornecedor de material esportivo';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      r_jogospadrao.codauxiliar2 := DtInicial;
      r_jogospadrao.codauxiliar3 := DtFinal;

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
        + 'from ca_jogos ' + 'where data between :DATAINI and :DATAFIM ' +
        'order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption :=
        'JOGOS DISPUTADOS - FORNECEDOR DE MATERIAL ESPORTIVO';
      r_jogospadrao.LblDescricao2.Caption := 'Fornecedor: ' +
        AnsiUpperCase(f_gerais.buscarNome('nomefornec', 'CA_FORNEC',
        'codfornec', DbGridFornec.Columns[0].Field.AsString));
      // buscar imagem da logo do fornecedor
      f_gerais.buscaImagem(r_jogospadrao.ImgEscudoSeutime,
        f_gerais.buscarNome('logo_fornec', 'CA_FORNEC', 'codfornec',
        DbGridFornec.Columns[0].Field.AsString));
      // definir título do formulário
      r_jogospadrao.Caption :=
        'Jogos disputados por fornecedor de material esportivo';;
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;
end;

procedure Th_fornecedor.DbGridFornecDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, false);
  // Remove barra Horizontal
end;

procedure Th_fornecedor.DbGridFornecKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  f_gerais.buscaImagem(ImgFornec, f_gerais.buscarNome('logo_fornec',
    'CA_FORNEC', 'codfornec', DbGridFornec.Columns[0].Field.AsString));
end;

procedure Th_fornecedor.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de patrocinadores
  f_gerais.pesquisaFornec(DbGridFornec, EdtPesquisa.Text);
  f_gerais.buscaImagem(ImgFornec, f_gerais.buscarNome('logo_fornec',
    'CA_FORNEC', 'codfornec', DbGridFornec.Columns[0].Field.AsString));
end;

procedure Th_fornecedor.FormActivate(Sender: TObject);
begin
  f_gerais.buscaImagem(ImgFornec, f_gerais.buscarNome('logo_fornec',
    'CA_FORNEC', 'codfornec', DbGridFornec.Columns[0].Field.AsString));
end;

procedure Th_fornecedor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_fornecedor.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridFornecDblClick(Self);
      end;
  end;
end;

end.
