unit splash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, dxGDIPlusClasses, Vcl.Imaging.pngimage,
  Vcl.Samples.Gauges;

type
  TFrmSplash = class(TForm)
    Image1: TImage;
    LblVersao: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  cVersao = 5;

var
  FrmSplash: TFrmSplash;
  versao: String;

implementation

{$R *.dfm}

uses login, home, informacao, funcoes;

procedure TFrmSplash.FormActivate(Sender: TObject);
begin
  versao := 'Versão 7.1 Março/2020';
  LblVersao.Caption := versao;
  FrmPrincipal.LblVersao.Caption := versao;
  FrmPrincipal.StbSistema.Panels[cVersao].Text := versao;
  h_informacao.LblVersao.Caption := versao;
  f_gerais.versao := versao;
end;

end.
