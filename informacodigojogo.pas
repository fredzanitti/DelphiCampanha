unit informacodigojogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Th_codjogo = class(TForm)
    Shape3: TShape;
    Shape1: TShape;
    Label2: TLabel;
    EdtCodJogo: TEdit;
    BtnGravar: TBitBtn;
    procedure BtnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  h_codjogo: Th_codjogo;

implementation

{$R *.dfm}

uses funcoes;

procedure Th_codjogo.BtnGravarClick(Sender: TObject);
var
  msg: string;
begin
  if EdtCodJogo.Text = EmptyStr then
  begin
    msg := 'Deve-se obrigatoriamente digitar um código!';
    Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    EdtCodJogo.Clear;
    EdtCodJogo.SetFocus;
  end
  else
  begin
    if (StrToInt(EdtCodJogo.Text) > f_gerais.maiorCodigo('codjogo', 'CA_JOGOS'))
      or (StrToInt(EdtCodJogo.Text) < 1) then
    begin
      msg := 'Deve-se obrigatoriamente digitar um código entre 1 e ' +
        IntToStr(f_gerais.maiorCodigo('codjogo', 'CA_JOGOS'));
      Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      EdtCodJogo.Clear;
      EdtCodJogo.SetFocus;
    end
    else
    begin
      f_gerais.preencherSumula(EdtCodJogo.Text);
    end;
  end;
end;

procedure Th_codjogo.FormActivate(Sender: TObject);
begin
  Label2.Caption := 'Selecione um código entre 1 e ' +
    IntToStr(f_gerais.maiorCodigo('codjogo', 'CA_JOGOS'));
  EdtCodJogo.Clear;
  EdtCodJogo.SetFocus;
end;

procedure Th_codjogo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_codjogo.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

end.
