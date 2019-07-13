unit relacaotitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tr_titulos = class(TForm)
    lblTitulosNacionais: TLabel;
    LblTitNacional: TLabel;
    LblTitInter: TLabel;
    lblTitulosInternacionais: TLabel;
    Shape2: TShape;
    LblTempo: TLabel;
    Shape1: TShape;
    ImgEscudoSeutime: TImage;
    Shape3: TShape;
    LblQtdeTitulos: TLabel;
    LblUltimoTitulo: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r_titulos: Tr_titulos;

implementation

{$R *.dfm}

procedure Tr_titulos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_titulos.Close;
      end;
  end;
end;

end.
