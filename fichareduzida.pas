unit fichareduzida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tr_fichareduzida = class(TForm)
    ImgFotoJogador: TImage;
    LblApelido: TLabel;
    LblNomeCompleto: TLabel;
    ImgNacionalidade: TImage;
    LblPosicao: TLabel;
    LblPeriodo: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r_fichareduzida: Tr_fichareduzida;

implementation

{$R *.dfm}

uses home;

procedure Tr_fichareduzida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_fichareduzida.Close;
      end;
  end;
end;

end.
