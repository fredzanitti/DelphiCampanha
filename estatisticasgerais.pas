unit estatisticasgerais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  Tr_estgerais = class(TForm)
    Shape2: TShape;
    ImgAdver: TImage;
    LblTimeMand: TLabel;
    Shape1: TShape;
    ImgSeutime: TImage;
    LblDtIniSeq1: TLabel;
    LblDtFimSeq1: TLabel;
    LblSequencia1: TLabel;
    Label2: TLabel;
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
    Label1: TLabel;
    LblTimeVisit: TLabel;
    Shape4: TShape;
    Label3: TLabel;
    Shape5: TShape;
    Label4: TLabel;
    LblUltimaVit1: TLabel;
    Label8: TLabel;
    LblMelhorResult1: TLabel;
    Label10: TLabel;
    LblUltimaDerrota1: TLabel;
    Label13: TLabel;
    LblPiorResultado1: TLabel;
    Label15: TLabel;
    LblUltimaVit2: TLabel;
    LblMelhorResult2: TLabel;
    LblPiorResultado2: TLabel;
    LblUltimaDerrota2: TLabel;
    LblUltimoJogo1: TLabel;
    LblUltimoJogo2: TLabel;
    Label5: TLabel;
    Shape8: TShape;
    DbGridEstatisticas: TDBGrid;
    Shape9: TShape;
    DbGridTotais: TDBGrid;
    Shape3: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Label9: TLabel;
    Shape16: TShape;
    Label12: TLabel;
    Shape17: TShape;
    Shape18: TShape;
    LblResumo: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LblSequencia1Click(Sender: TObject);
    procedure LblSequencia2Click(Sender: TObject);
    procedure LblSequencia3Click(Sender: TObject);
    procedure LblSequencia4Click(Sender: TObject);
    procedure LblUltimoJogo1Click(Sender: TObject);
    procedure LblUltimaVit1Click(Sender: TObject);
    procedure LblUltimaDerrota1Click(Sender: TObject);
    procedure LblPiorResultado1Click(Sender: TObject);
    procedure LblMelhorResult1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r_estgerais: Tr_estgerais;

implementation

{$R *.dfm}

uses funcoes, home;

procedure Tr_estgerais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_estgerais.Close;
      end;
  end;
end;

procedure Tr_estgerais.LblMelhorResult1Click(Sender: TObject);
begin
  if LblMelhorResult2.Caption = '0' then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else  f_gerais.preencherSumula(LblMelhorResult2.Caption);
end;

procedure Tr_estgerais.LblPiorResultado1Click(Sender: TObject);
begin
  if LblPiorResultado2.Caption = '0' then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblPiorResultado2.Caption);
end;

procedure Tr_estgerais.LblSequencia1Click(Sender: TObject);
begin
  if LblSequencia1.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq1.Caption, LblDtFimSeq1.Caption, 1);
end;

procedure Tr_estgerais.LblSequencia2Click(Sender: TObject);
begin
  if LblSequencia2.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq2.Caption, LblDtFimSeq2.Caption, 1);
end;

procedure Tr_estgerais.LblSequencia3Click(Sender: TObject);
begin
  if LblSequencia3.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq3.Caption, LblDtFimSeq3.Caption, 1);
end;

procedure Tr_estgerais.LblSequencia4Click(Sender: TObject);
begin
  if LblSequencia4.Caption = 'Não houve' then
    Application.MessageBox('Não há jogos para serem exibidos', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.relPeriodoEstGerais(LblDtIniSeq4.Caption, LblDtFimSeq4.Caption, 1);
end;

procedure Tr_estgerais.LblUltimaDerrota1Click(Sender: TObject);
begin
  if LblUltimaDerrota2.Caption = '0' then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblUltimaDerrota2.Caption);
end;

procedure Tr_estgerais.LblUltimaVit1Click(Sender: TObject);
begin
  if LblUltimaVit2.Caption = '0' then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblUltimaVit2.Caption);
end;

procedure Tr_estgerais.LblUltimoJogo1Click(Sender: TObject);
begin
  if LblUltimoJogo2.Caption = '0' then
    Application.MessageBox('Não há um jogo para que a súmula seja exibida',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
    f_gerais.preencherSumula(LblUltimoJogo2.Caption);
end;

end.

