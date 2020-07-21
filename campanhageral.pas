unit campanhageral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, VclTee.TeeGDIPlus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart;

type
  Tr_campanhageral = class(TForm)
    DbGridCasa: TDBGrid;
    DbGridEstatisticas: TDBGrid;
    LblCidade: TLabel;
    Label1: TLabel;
    DbGridFora: TDBGrid;
    DbGridGeral: TDBGrid;
    Label2: TLabel;
    CbxAnos: TComboBox;
    Shape1: TShape;
    ImgSeutime: TImage;
    LblDtIniSeq1: TLabel;
    LblDtFimSeq1: TLabel;
    LblSequencia1: TLabel;
    Label3: TLabel;
    LblDtIniSeq2: TLabel;
    LblDtFimSeq2: TLabel;
    LblSequencia2: TLabel;
    Label6: TLabel;
    LblDtIniSeq3: TLabel;
    LblDtFimSeq3: TLabel;
    LblSequencia3: TLabel;
    Label7: TLabel;
    LblDtIniSeq4: TLabel;
    LblDtFimSeq4: TLabel;
    LblSequencia4: TLabel;
    Label11: TLabel;
    Shape11: TShape;
    Shape12: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label5: TLabel;
    LblMelhorResult1: TLabel;
    Label10: TLabel;
    LblPiorResultado1: TLabel;
    Label15: TLabel;
    LblCodMelhorResult1: TLabel;
    LblCodPiorResultado1: TLabel;
    LblMelhorResult2: TLabel;
    LblPiorResultado2: TLabel;
    LblCodMelhorResult2: TLabel;
    LblCodPiorResultado2: TLabel;
    LblMelhorResult3: TLabel;
    LblPiorResultado3: TLabel;
    LblCodMelhorResult3: TLabel;
    LblCodPiorResultado3: TLabel;
    Label8: TLabel;
    qryGolsPorPeriodo: TFDQuery;
    qryGolsPorPeriodoGols: TIntegerField;
    qryGolsPorPeriodoIntervalo: TWideStringField;
    DBChart1: TDBChart;
    Series1: THorizBarSeries;
    procedure CbxAnosChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LblSequencia1Click(Sender: TObject);
    procedure LblSequencia2Click(Sender: TObject);
    procedure LblSequencia3Click(Sender: TObject);
    procedure LblSequencia4Click(Sender: TObject);
    procedure LblMelhorResult1Click(Sender: TObject);
    procedure LblMelhorResult2Click(Sender: TObject);
    procedure LblMelhorResult3Click(Sender: TObject);
    procedure LblPiorResultado1Click(Sender: TObject);
    procedure LblPiorResultado2Click(Sender: TObject);
    procedure LblPiorResultado3Click(Sender: TObject);
    procedure DbGridEstatisticasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DbGridGeralDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r_campanhageral: Tr_campanhageral;

implementation

{$R *.dfm}

uses funcoes, telapadraojogos, home;

procedure Tr_campanhageral.CbxAnosChange(Sender: TObject);
begin
  f_gerais.preencherGridsCampanhaGeral(r_campanhageral.CbxAnos.Text);
  r_campanhageral.Caption := 'CAMPANHA GERAL POR ANO - ' + CbxAnos.Text;

  if qryGolsPorPeriodo.Active then
     qryGolsPorPeriodo.Close;

  if CbxAnos.Text = 'Geral' then
  begin
     f_gerais.buscaImagemPorCodigo(r_campanhageral.ImgSeutime, '0', '0');
     qryGolsPorPeriodo.Params.ParamByName('Temporada').Value := 0;
  end
  else
  begin
     f_gerais.buscaImagemPorCodigo(r_campanhageral.ImgSeutime, '0', CbxAnos.Text);
     qryGolsPorPeriodo.Params.ParamByName('Temporada').Value := StrToInt(CbxAnos.Text);
  end;
  qryGolsPorPeriodo.Open;

  r_jogospadrao.numerorelatorio := '28';
  r_jogospadrao.codauxiliar1 := r_campanhageral.CbxAnos.Text;
end;

procedure Tr_campanhageral.DbGridEstatisticasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False); // Remove barra Horizontal
end;

procedure Tr_campanhageral.DbGridGeralDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False); // Remove barra Horizontal
end;

procedure Tr_campanhageral.FormActivate(Sender: TObject);
begin
  CbxAnos.SetFocus;
end;

procedure Tr_campanhageral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_campanhageral.Close;
      end;
  end;
end;

procedure Tr_campanhageral.LblMelhorResult1Click(Sender: TObject);
begin
  if LblCodMelhorResult1.Caption = EmptyStr then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblCodMelhorResult1.Caption);
end;

procedure Tr_campanhageral.LblMelhorResult2Click(Sender: TObject);
begin
  if LblCodMelhorResult2.Caption = EmptyStr then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblCodMelhorResult2.Caption);
end;

procedure Tr_campanhageral.LblMelhorResult3Click(Sender: TObject);
begin
  if LblCodMelhorResult3.Caption = EmptyStr then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblCodMelhorResult3.Caption);
end;

procedure Tr_campanhageral.LblPiorResultado1Click(Sender: TObject);
begin
  if LblCodPiorResultado1.Caption = EmptyStr then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblCodPiorResultado1.Caption);
end;

procedure Tr_campanhageral.LblPiorResultado2Click(Sender: TObject);
begin
  if LblCodPiorResultado2.Caption = EmptyStr then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblCodPiorResultado2.Caption);
end;

procedure Tr_campanhageral.LblPiorResultado3Click(Sender: TObject);
begin
  if LblCodPiorResultado3.Caption = EmptyStr then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblCodPiorResultado3.Caption);
end;

procedure Tr_campanhageral.LblSequencia1Click(Sender: TObject);
begin
  if LblSequencia1.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq1.Caption, LblDtFimSeq1.Caption, 2);
end;

procedure Tr_campanhageral.LblSequencia2Click(Sender: TObject);
begin
  if LblSequencia2.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq2.Caption, LblDtFimSeq2.Caption, 2);
end;

procedure Tr_campanhageral.LblSequencia3Click(Sender: TObject);
begin
  if LblSequencia3.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq3.Caption, LblDtFimSeq3.Caption, 2);
end;

procedure Tr_campanhageral.LblSequencia4Click(Sender: TObject);
begin
  if LblSequencia4.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq4.Caption, LblDtFimSeq4.Caption, 2);
end;

end.
