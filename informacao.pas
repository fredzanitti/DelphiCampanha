unit informacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  Th_informacao = class(TForm)
    Image1: TImage;
    MainMenu: TMainMenu;
    MnSair: TMenuItem;
    LblVersao: TLabel;
    procedure MnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  h_informacao: Th_informacao;

implementation

{$R *.dfm}

procedure Th_informacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        MnSairClick(Self);
      end;
  end;
end;

procedure Th_informacao.MnSairClick(Sender: TObject);
begin
  h_informacao.Close;
end;

end.
