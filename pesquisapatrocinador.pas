unit pesquisapatrocinador;

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
  Th_patrocinador = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridPatroc: TDBGrid;
    BtnSelecionar: TBitBtn;
    ImgPatroc: TImage;
    DtsQrPesquisa: TDataSource;
    QrPesquisa: TFDQuery;
    procedure DbGridPatrocCellClick(Column: TColumn);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridPatrocDblClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DbGridPatrocKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridPatrocDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_patrocinador: Th_patrocinador;
  sql, msg: String;

implementation

{$R *.dfm}

uses funcoes, module, patrocinadores, telapadraojogos;

procedure Th_patrocinador.BtnSelecionarClick(Sender: TObject);
begin
  DbGridPatrocDblClick(Self);
end;

procedure Th_patrocinador.DbGridPatrocCellClick(Column: TColumn);
begin
  f_gerais.buscaImagem(ImgPatroc, f_gerais.buscarNome('logo_patroc',
    'CA_PATROC', 'codpatroc', DbGridPatroc.Columns[0].Field.AsString));
end;

procedure Th_patrocinador.DbGridPatrocDblClick(Sender: TObject);
var
  i, cont: Integer;
  DtInicial, DtFinal: string;
begin
  // ==========================================================================
  // pesquisa quando acionado pelo cadastro de patrocinadores
  // ==========================================================================
  if identificacao = 'CA_PATROC' then
  begin
    FrmDm.TblPatroc.First;
    while FrmDm.TblPatroccodpatroc.AsInteger <> DbGridPatroc.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblPatroc.Next;
    end;
    CA_PATROC.estadoDosBotoesdeCadastro();
  end;


  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Jogos por patrocinador
  // ==========================================================================

  if identificacao = 'MnJogosPatroc' then
  begin

    sql := 'select dt_inicio, dt_fim from ca_patroc ' +
      'where codpatroc = :CODIGOPATROCINADOR ';

    QrPesquisa.Close;
    QrPesquisa.sql.Clear;
    QrPesquisa.sql.Add(sql);
    QrPesquisa.Params.ParamByName('CODIGOPATROCINADOR').AsInteger :=
      DbGridPatroc.Columns[0].Field.AsInteger;
    QrPesquisa.Open;
    QrPesquisa.First;

    DtInicial := QrPesquisa.Fields[0].AsString;
    DtFinal := QrPesquisa.Fields[1].AsString;

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '38';

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
        'desse fornecedor patrocinador';
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
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS DISPUTADOS - PATROCINADOR';
      r_jogospadrao.LblDescricao2.Caption := 'Patrocinador: ' +
        AnsiUpperCase(f_gerais.buscarNome('nomepatroc', 'CA_PATROC',
        'codpatroc', DbGridPatroc.Columns[0].Field.AsString));
      // buscar imagem da logo do fornecedor
      f_gerais.buscaImagem(r_jogospadrao.ImgEscudoSeutime,
        f_gerais.buscarNome('logo_patroc', 'CA_PATROC', 'codpatroc',
        DbGridPatroc.Columns[0].Field.AsString));
      // definir título do formulário
      r_jogospadrao.Caption := 'Jogos disputados por patrocinador';;
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;

    h_patrocinador.Close;
  end;
end;

procedure Th_patrocinador.DbGridPatrocDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_patrocinador.DbGridPatrocKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  f_gerais.buscaImagem(ImgPatroc, f_gerais.buscarNome('logo_patroc',
    'CA_PATROC', 'codpatroc', DbGridPatroc.Columns[0].Field.AsString));
end;

procedure Th_patrocinador.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de patrocinadores
  f_gerais.pesquisaPatroc(DbGridPatroc, EdtPesquisa.Text);
  f_gerais.buscaImagem(ImgPatroc, f_gerais.buscarNome('logo_patroc',
    'CA_PATROC', 'codpatroc', DbGridPatroc.Columns[0].Field.AsString));
end;

procedure Th_patrocinador.FormActivate(Sender: TObject);
begin
  f_gerais.buscaImagem(ImgPatroc, f_gerais.buscarNome('logo_patroc',
    'CA_PATROC', 'codpatroc', DbGridPatroc.Columns[0].Field.AsString));
end;

procedure Th_patrocinador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_patrocinador.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridPatrocDblClick(Self);
      end;
  end;
end;

end.




