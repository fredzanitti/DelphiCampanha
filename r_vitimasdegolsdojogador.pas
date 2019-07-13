unit r_vitimasdegolsdojogador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tr_vitimas = class(TForm)
    ImgFotoJogador: TImage;
    LblApelido: TLabel;
    LblNomeCompleto: TLabel;
    ImgNacionalidade: TImage;
    LblPosicao: TLabel;
    LblPeriodo: TLabel;
    Shape4: TShape;
    ImgEscudo1: TImage;
    LblClube1: TLabel;
    LblGols1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    ImgEscudo2: TImage;
    LblClube2: TLabel;
    LblGols2: TLabel;
    Shape3: TShape;
    ImgEscudo3: TImage;
    LblClube3: TLabel;
    LblGols3: TLabel;
    Shape5: TShape;
    ImgEscudo4: TImage;
    LblClube4: TLabel;
    LblGols4: TLabel;
    Shape6: TShape;
    ImgEscudo5: TImage;
    LblClube5: TLabel;
    LblGols5: TLabel;
    Shape7: TShape;
    ImgEscudo6: TImage;
    LblClube6: TLabel;
    LblGols6: TLabel;
    Shape8: TShape;
    ImgEscudo7: TImage;
    LblClube7: TLabel;
    LblGols7: TLabel;
    Shape9: TShape;
    ImgEscudo8: TImage;
    LblClube8: TLabel;
    LblGols8: TLabel;
    Shape10: TShape;
    ImgEscudo9: TImage;
    LblClube9: TLabel;
    LblGols9: TLabel;
    Shape11: TShape;
    ImgEscudo10: TImage;
    LblClube10: TLabel;
    LblGols10: TLabel;
    ImgEscudo12: TImage;
    LblClube12: TLabel;
    LblGols11: TLabel;
    Shape13: TShape;
    ImgEscudo13: TImage;
    LblClube13: TLabel;
    LblGols13: TLabel;
    Shape14: TShape;
    ImgEscudo14: TImage;
    LblClube14: TLabel;
    LblGols14: TLabel;
    Shape15: TShape;
    ImgEscudo15: TImage;
    LblClube15: TLabel;
    LblGols15: TLabel;
    Shape16: TShape;
    ImgEscudo16: TImage;
    LblClube16: TLabel;
    LblGols16: TLabel;
    Shape17: TShape;
    ImgEscudo17: TImage;
    LblClube17: TLabel;
    LblGols17: TLabel;
    Shape18: TShape;
    ImgEscudo18: TImage;
    LblClube18: TLabel;
    LblGols18: TLabel;
    ImgEscudo11: TImage;
    LblClube11: TLabel;
    Shape12: TShape;
    ImgEscudo19: TImage;
    LblClube19: TLabel;
    LblGols19: TLabel;
    Shape19: TShape;
    ImgEscudo20: TImage;
    LblClube20: TLabel;
    LblGols20: TLabel;
    LblGols12: TLabel;
    Label1: TLabel;
    Shape20: TShape;
    LblGolsTotal: TLabel;
    LblJogosTotal: TLabel;
    LblMediaTotal: TLabel;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r_vitimas: Tr_vitimas;

implementation

{$R *.dfm}

procedure Tr_vitimas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_vitimas.Close;
      end;
  end;
end;

end.
