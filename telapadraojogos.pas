unit telapadraojogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tr_jogospadrao = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    LblDescricao1: TLabel;
    LblDescricao2: TLabel;
    ImgEscudoSeutime: TImage;
    Shape3: TShape;
    Label3: TLabel;
    Label4: TLabel;
    LblCompEst: TLabel;
    LblData1: TLabel;
    LblMandante1: TLabel;
    LblVisitante1: TLabel;
    LblEstadio1: TLabel;
    LblCompeticao1: TLabel;
    ImgEscudoMand1: TImage;
    ImgEscudoVisit1: TImage;
    LblPlacarMand1: TLabel;
    LblPlacarVisit1: TLabel;
    LblX1: TLabel;
    LblCodJogo1: TLabel;
    LblData2: TLabel;
    LblMandante2: TLabel;
    LblVisitante2: TLabel;
    LblEstadio2: TLabel;
    LblCompeticao2: TLabel;
    ImgEscudoMand2: TImage;
    ImgEscudoVisit2: TImage;
    LblPlacarMand2: TLabel;
    LblPlacarVisit2: TLabel;
    LblX2: TLabel;
    LblCodJogo2: TLabel;
    LblData3: TLabel;
    LblMandante3: TLabel;
    LblVisitante3: TLabel;
    LblEstadio3: TLabel;
    LblCompeticao3: TLabel;
    ImgEscudoMand3: TImage;
    ImgEscudoVisit3: TImage;
    LblPlacarMand3: TLabel;
    LblPlacarVisit3: TLabel;
    LblX3: TLabel;
    LblCodJogo3: TLabel;
    LblData4: TLabel;
    LblMandante4: TLabel;
    LblVisitante4: TLabel;
    LblEstadio4: TLabel;
    LblCompeticao4: TLabel;
    ImgEscudoMand4: TImage;
    ImgEscudoVisit4: TImage;
    LblPlacarMand4: TLabel;
    LblPlacarVisit4: TLabel;
    LblX4: TLabel;
    LblCodJogo4: TLabel;
    LblData5: TLabel;
    LblMandante5: TLabel;
    LblVisitante5: TLabel;
    LblEstadio5: TLabel;
    LblCompeticao5: TLabel;
    ImgEscudoMand5: TImage;
    ImgEscudoVisit5: TImage;
    LblPlacarMand5: TLabel;
    LblPlacarVisit5: TLabel;
    LblX5: TLabel;
    LblCodJogo5: TLabel;
    LblData6: TLabel;
    LblMandante6: TLabel;
    LblVisitante6: TLabel;
    LblEstadio6: TLabel;
    LblCompeticao6: TLabel;
    ImgEscudoMand6: TImage;
    ImgEscudoVisit6: TImage;
    LblPlacarMand6: TLabel;
    LblPlacarVisit6: TLabel;
    LblX6: TLabel;
    LblCodJogo6: TLabel;
    LblData7: TLabel;
    LblMandante7: TLabel;
    LblVisitante7: TLabel;
    LblEstadio7: TLabel;
    LblCompeticao7: TLabel;
    ImgEscudoMand7: TImage;
    ImgEscudoVisit7: TImage;
    LblPlacarMand7: TLabel;
    LblPlacarVisit7: TLabel;
    LblX7: TLabel;
    LblCodJogo7: TLabel;
    LblData8: TLabel;
    LblMandante8: TLabel;
    LblVisitante8: TLabel;
    LblEstadio8: TLabel;
    LblCompeticao8: TLabel;
    ImgEscudoMand8: TImage;
    ImgEscudoVisit8: TImage;
    LblPlacarMand8: TLabel;
    LblPlacarVisit8: TLabel;
    LblX8: TLabel;
    LblCodJogo8: TLabel;
    LblData9: TLabel;
    LblMandante9: TLabel;
    LblVisitante9: TLabel;
    LblEstadio9: TLabel;
    LblCompeticao9: TLabel;
    ImgEscudoMand9: TImage;
    ImgEscudoVisit9: TImage;
    LblPlacarMand9: TLabel;
    LblPlacarVisit9: TLabel;
    LblX9: TLabel;
    LblCodJogo9: TLabel;
    LblData10: TLabel;
    LblMandante10: TLabel;
    LblVisitante10: TLabel;
    LblEstadio10: TLabel;
    LblCompeticao10: TLabel;
    ImgEscudoMand10: TImage;
    ImgEscudoVisit10: TImage;
    LblPlacarMand10: TLabel;
    LblPlacarVisit10: TLabel;
    LblX10: TLabel;
    LblCodJogo10: TLabel;
    BtnVoltar: TBitBtn;
    BtnAvancar: TBitBtn;
    CbxPagina: TComboBox;
    Label1: TLabel;
    LblTotalReg: TLabel;
    Label2: TLabel;
    LblDescricao3: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    BtnSumula1: TBitBtn;
    BtnSumula2: TBitBtn;
    BtnSumula4: TBitBtn;
    BtnSumula5: TBitBtn;
    BtnSumula6: TBitBtn;
    BtnSumula7: TBitBtn;
    BtnSumula8: TBitBtn;
    BtnSumula9: TBitBtn;
    BtnSumula10: TBitBtn;
    BtnSumula3: TBitBtn;
    Shape13: TShape;
    QrExcel: TFDQuery;
    BtnExcel: TBitBtn;
    QrExcelcodjogo: TIntegerField;
    QrExceldata: TDateField;
    QrExcelcodadvermand: TIntegerField;
    QrExcelplacar1: TIntegerField;
    QrExcelplacar2: TIntegerField;
    QrExcelcodadvervisit: TIntegerField;
    QrExcelcodestadio: TIntegerField;
    QrExcelcodcompeticao: TIntegerField;
    QrExcelmandante: TStringField;
    QrExcelvisitante: TStringField;
    QrExcelestadio: TStringField;
    QrExcelcompeeticao: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnAvancarClick(Sender: TObject);
    procedure CbxPaginaChange(Sender: TObject);
    procedure BtnSumula1Click(Sender: TObject);
    procedure BtnSumula2Click(Sender: TObject);
    procedure BtnSumula3Click(Sender: TObject);
    procedure BtnSumula5Click(Sender: TObject);
    procedure BtnSumula6Click(Sender: TObject);
    procedure BtnSumula7Click(Sender: TObject);
    procedure BtnSumula10Click(Sender: TObject);
    procedure BtnSumula4Click(Sender: TObject);
    procedure BtnSumula8Click(Sender: TObject);
    procedure BtnSumula9Click(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure QrExcelCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    numerorelatorio, codauxiliar1, codauxiliar2, codauxiliar3: String;
  end;

var
  r_jogospadrao: Tr_jogospadrao;
  corte: integer;

implementation

{$R *.dfm}

uses funcoes, home, module;

procedure Tr_jogospadrao.CbxPaginaChange(Sender: TObject);
begin
  // define o número do corte para ser exibido; diminuir um pois começa do zero.
  corte := (StrToInt(CbxPagina.Text) - 1) * 10;

  sql := f_gerais.sqlJogosPadrao(numerorelatorio);
  f_gerais.preenchimentoTelaPadraoJogos(sql, corte, 10);
end;

procedure Tr_jogospadrao.BtnExcelClick(Sender: TObject);
begin
  f_gerais.gerarExcel(QrExcel);
end;

procedure Tr_jogospadrao.BtnSumula10Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo10.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo10.Caption);
end;

procedure Tr_jogospadrao.BtnSumula1Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo1.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo1.Caption);
end;

procedure Tr_jogospadrao.BtnSumula2Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo2.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo2.Caption);
end;

procedure Tr_jogospadrao.BtnSumula3Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo3.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo3.Caption);
end;

procedure Tr_jogospadrao.BtnSumula4Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo4.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo4.Caption);
end;

procedure Tr_jogospadrao.BtnSumula5Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo5.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo5.Caption);
end;

procedure Tr_jogospadrao.BtnSumula6Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo6.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo6.Caption);
end;

procedure Tr_jogospadrao.BtnSumula7Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo7.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo7.Caption);
end;

procedure Tr_jogospadrao.BtnSumula8Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo8.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo8.Caption);
end;

procedure Tr_jogospadrao.BtnSumula9Click(Sender: TObject);
begin
  // checar se escalação está disponível
  if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo',
    LblCodJogo9.Caption) = 0 then
  begin
    msg := 'A escalação deste jogo não está disponível!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION)
  end
  else
    f_gerais.preencherSumula(LblCodJogo9.Caption);
end;

procedure Tr_jogospadrao.BtnVoltarClick(Sender: TObject);
begin
  corte := corte - 10;
  if corte <= 0 then
    corte := 0;

  if CbxPagina.ItemIndex <= 0 then
    CbxPagina.ItemIndex := 0
  else
    CbxPagina.ItemIndex := CbxPagina.ItemIndex - 1;

  sql := f_gerais.sqlJogosPadrao(numerorelatorio);
  f_gerais.preenchimentoTelaPadraoJogos(sql, corte, 10);
end;

procedure Tr_jogospadrao.BtnAvancarClick(Sender: TObject);
begin

  corte := corte + 10;
  if corte >= ((StrToInt(LblTotalReg.Caption) * 10) - 10) then
    corte := ((StrToInt(LblTotalReg.Caption) * 10) - 10);

  if CbxPagina.ItemIndex = StrToInt(LblTotalReg.Caption) then
    CbxPagina.ItemIndex := StrToInt(LblTotalReg.Caption)
  else
    CbxPagina.ItemIndex := CbxPagina.ItemIndex + 1;

  sql := f_gerais.sqlJogosPadrao(numerorelatorio);
  f_gerais.preenchimentoTelaPadraoJogos(sql, corte, 10);
end;

procedure Tr_jogospadrao.FormActivate(Sender: TObject);
begin
  corte := 0;
  if (numerorelatorio = '26') or (numerorelatorio = '35') then
  begin
    LblCompEst.Caption := 'COMPETIÇÃO / JOGADORES';
  end
  else
  begin
    LblCompEst.Caption := 'COMPETIÇÃO / ESTÁDIO';
  end;
end;

procedure Tr_jogospadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      r_jogospadrao.Close;
    VK_NUMPAD1:
      if BtnSumula1.Visible then
        BtnSumula1Click(Self);
    VK_NUMPAD2:
      if BtnSumula2.Visible then
        BtnSumula2Click(Self);
    VK_NUMPAD3:
      if BtnSumula3.Visible then
        BtnSumula3Click(Self);
    VK_NUMPAD4:
      if BtnSumula4.Visible then
        BtnSumula4Click(Self);
    VK_NUMPAD5:
      if BtnSumula5.Visible then
        BtnSumula5Click(Self);
    VK_NUMPAD6:
      if BtnSumula6.Visible then
        BtnSumula6Click(Self);
    VK_NUMPAD7:
      if BtnSumula7.Visible then
        BtnSumula7Click(Self);
    VK_NUMPAD8:
      if BtnSumula8.Visible then
        BtnSumula8Click(Self);
    VK_NUMPAD9:
      if BtnSumula9.Visible then
        BtnSumula9Click(Self);
    VK_NUMPAD0:
      if BtnSumula10.Visible then
        BtnSumula10Click(Self);
  end;
end;

procedure Tr_jogospadrao.QrExcelCalcFields(DataSet: TDataSet);
begin
  QrExcelmandante.Value := f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
    IntToStr(QrExcelcodadvermand.Value));
  QrExcelvisitante.Value := f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
    IntToStr(QrExcelcodadvervisit.Value));
  QrExcelestadio.Value := f_gerais.buscarNome('nome', 'ca_estad', 'codestadio',
    IntToStr(QrExcelcodestadio.Value));
  QrExcelcompeeticao.Value := f_gerais.buscarNome('nome', 'ca_compe',
    'codcompeticao', IntToStr(QrExcelcodcompeticao.Value));
end;

end.
