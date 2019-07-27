unit sumula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, relSumula, Vcl.Buttons;

type
  Tr_sumula = class(TForm)
    Shape1: TShape;
    ImgMandante: TImage;
    Shape2: TShape;
    Shape3: TShape;
    ImgVisitante: TImage;
    LblNomeMandante: TLabel;
    LblNomeVisitante: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    LblCidadeMandante: TLabel;
    LblCidadeVisitante: TLabel;
    LblPenaltiMandante: TLabel;
    LblPenaltiVisitante: TLabel;
    LblPlacarMandante: TLabel;
    LblPlacarVisitante: TLabel;
    LblCampeonato: TLabel;
    LblDataEHora: TLabel;
    LblLocalEPublico: TLabel;
    LblArbitro: TLabel;
    Shape6: TShape;
    ImgBola1: TImage;
    LblGol1: TLabel;
    LblNome1: TLabel;
    LblCod1: TLabel;
    ImgBola2: TImage;
    LblGol2: TLabel;
    LblNome2: TLabel;
    LblCod2: TLabel;
    ImgBola3: TImage;
    LblGol3: TLabel;
    LblNome3: TLabel;
    LblCod3: TLabel;
    ImgBola4: TImage;
    LblGol4: TLabel;
    LblNome4: TLabel;
    LblCod4: TLabel;
    ImgBola5: TImage;
    LblGol5: TLabel;
    LblNome5: TLabel;
    LblCod5: TLabel;
    ImgBola6: TImage;
    LblGol6: TLabel;
    LblNome6: TLabel;
    LblCod6: TLabel;
    ImgBola7: TImage;
    LblGol7: TLabel;
    LblNome7: TLabel;
    LblCod7: TLabel;
    ImgBola8: TImage;
    LblGol8: TLabel;
    LblNome8: TLabel;
    LblCod8: TLabel;
    ImgBola9: TImage;
    LblGol9: TLabel;
    LblNome9: TLabel;
    LblCod9: TLabel;
    ImgBola10: TImage;
    LblGol10: TLabel;
    LblNome10: TLabel;
    LblCod10: TLabel;
    ImgBola11: TImage;
    LblGol11: TLabel;
    LblNome11: TLabel;
    LblCod11: TLabel;
    LblCod12: TLabel;
    LblNome12: TLabel;
    ImgBolaEntrou1: TImage;
    LblGolsEntrou1: TLabel;
    LblEntrou1: TLabel;
    LblCodEntrou1: TLabel;
    ImgBolaEntrou2: TImage;
    LblGolsEntrou2: TLabel;
    LblEntrou2: TLabel;
    LblCodEntrou2: TLabel;
    ImgBolaEntrou3: TImage;
    LblGolsEntrou3: TLabel;
    LblEntrou3: TLabel;
    LblCodEntrou3: TLabel;
    ImgBolaEntrou4: TImage;
    LblGolsEntrou4: TLabel;
    LblEntrou4: TLabel;
    LblCodEntrou4: TLabel;
    ImgBolaEntrou5: TImage;
    LblGolsEntrou5: TLabel;
    LblEntrou5: TLabel;
    LblCodEntrou5: TLabel;
    ImgBolaEntrou6: TImage;
    LblGolsEntrou6: TLabel;
    LblEntrou6: TLabel;
    LblCodEntrou6: TLabel;
    ImgBolaEntrou7: TImage;
    LblGolsEntrou7: TLabel;
    LblEntrou7: TLabel;
    LblCodEntrou7: TLabel;
    ImgBolaEntrou8: TImage;
    LblGolsEntrou8: TLabel;
    LblEntrou8: TLabel;
    LblCodEntrou8: TLabel;
    ImgBolaEntrou9: TImage;
    LblGolsEntrou9: TLabel;
    LblEntrou9: TLabel;
    LblCodEntrou9: TLabel;
    ImgBolaEntrou10: TImage;
    LblGolsEntrou10: TLabel;
    LblEntrou10: TLabel;
    LblCodEntrou10: TLabel;
    ImgBolaEntrou11: TImage;
    LblGolsEntrou11: TLabel;
    LblEntrou11: TLabel;
    LblCodEntrou11: TLabel;
    LblSaiu1: TLabel;
    LblSaiu2: TLabel;
    LblSaiu3: TLabel;
    LblSaiu4: TLabel;
    LblSaiu5: TLabel;
    LblSaiu6: TLabel;
    LblSaiu7: TLabel;
    LblSaiu8: TLabel;
    LblSaiu9: TLabel;
    LblSaiu10: TLabel;
    LblSaiu11: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    LblEsquema: TLabel;
    Shape7: TShape;
    LblContra: TLabel;
    Shape8: TShape;
    shtatica1: TShape;
    shtatica2: TShape;
    shtatica3: TShape;
    shtatica4: TShape;
    shtatica5: TShape;
    shtatica6: TShape;
    shtatica7: TShape;
    shtatica8: TShape;
    shtatica9: TShape;
    shtatica10: TShape;
    shtatica11: TShape;
    GbxPatrocinios: TGroupBox;
    ImgFornec: TImage;
    ImgPatroc: TImage;
    ImgBandPatroc: TImage;
    ImgBandFornec: TImage;
    Shape9: TShape;
    GbxUniformes: TGroupBox;
    ImgUniforme: TImage;
    ImgBandJog1: TImage;
    ImgBandJog2: TImage;
    ImgBandJog3: TImage;
    ImgBandJog4: TImage;
    ImgBandJog8: TImage;
    ImgBandJog7: TImage;
    ImgBandJog6: TImage;
    ImgBandJog5: TImage;
    ImgBandJog11: TImage;
    ImgBandJog10: TImage;
    ImgBandJog9: TImage;
    ImgBandJog12: TImage;
    Label1: TLabel;
    ShCa2: TShape;
    ShCa1: TShape;
    ShCa3: TShape;
    ShCa4: TShape;
    ShCa5: TShape;
    ShCa6: TShape;
    ShCa7: TShape;
    ShCa8: TShape;
    ShCa9: TShape;
    ShCa10: TShape;
    ShCa11: TShape;
    ShCaEntrou2: TShape;
    ShCaEntrou1: TShape;
    ShCaEntrou3: TShape;
    ShCaEntrou4: TShape;
    ShCaEntrou5: TShape;
    ShCaEntrou6: TShape;
    ShCaEntrou7: TShape;
    ShCaEntrou8: TShape;
    ShCaEntrou9: TShape;
    ShCaEntrou10: TShape;
    ShCaEntrou11: TShape;
    Image3: TImage;
    Image1: TImage;
    Image2: TImage;
    ShCa12: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LblNome1Click(Sender: TObject);
    procedure LblNome2Click(Sender: TObject);
    procedure LblNome3Click(Sender: TObject);
    procedure LblNome4Click(Sender: TObject);
    procedure LblNome5Click(Sender: TObject);
    procedure LblNome6Click(Sender: TObject);
    procedure LblNome7Click(Sender: TObject);
    procedure LblNome8Click(Sender: TObject);
    procedure LblNome9Click(Sender: TObject);
    procedure LblNome10Click(Sender: TObject);
    procedure LblNome11Click(Sender: TObject);
    procedure LblNome12Click(Sender: TObject);
    procedure LblEntrou1Click(Sender: TObject);
    procedure LblEntrou2Click(Sender: TObject);
    procedure LblEntrou3Click(Sender: TObject);
    procedure LblEntrou4Click(Sender: TObject);
    procedure LblEntrou5Click(Sender: TObject);
    procedure LblEntrou6Click(Sender: TObject);
    procedure LblEntrou7Click(Sender: TObject);
    procedure LblEntrou8Click(Sender: TObject);
    procedure LblEntrou9Click(Sender: TObject);
    procedure LblEntrou10Click(Sender: TObject);
    procedure LblEntrou11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure visualizarFichaReduzida(codigo: String);
  end;

var
  r_sumula: Tr_sumula;

implementation

{$R *.dfm}

uses funcoes, fichareduzida, home;

procedure Tr_sumula.visualizarFichaReduzida(codigo: String);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(codigo, r_fichareduzida.ImgNacionalidade,
    r_fichareduzida.ImgFotoJogador, r_fichareduzida.LblApelido,
    r_fichareduzida.LblNomeCompleto, r_fichareduzida.LblPeriodo,
    r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_sumula.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_sumula.Close
      end;
  end;
end;

procedure Tr_sumula.LblEntrou10Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou10.Caption);
end;

procedure Tr_sumula.LblEntrou11Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou11.Caption);
end;

procedure Tr_sumula.LblEntrou1Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou1.Caption);
end;

procedure Tr_sumula.LblEntrou2Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou2.Caption);
end;

procedure Tr_sumula.LblEntrou3Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou3.Caption);
end;

procedure Tr_sumula.LblEntrou4Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou4.Caption);
end;

procedure Tr_sumula.LblEntrou5Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou5.Caption);
end;

procedure Tr_sumula.LblEntrou6Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou6.Caption);
end;

procedure Tr_sumula.LblEntrou7Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou7.Caption);
end;

procedure Tr_sumula.LblEntrou8Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou8.Caption);
end;

procedure Tr_sumula.LblEntrou9Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCodEntrou9.Caption);
end;

procedure Tr_sumula.LblNome10Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod10.Caption);
end;

procedure Tr_sumula.LblNome11Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod11.Caption);
end;

procedure Tr_sumula.LblNome12Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod12.Caption);
end;

procedure Tr_sumula.LblNome1Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod1.Caption);
end;

procedure Tr_sumula.LblNome2Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod2.Caption);
end;

procedure Tr_sumula.LblNome3Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod3.Caption);
end;

procedure Tr_sumula.LblNome4Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod4.Caption);
end;

procedure Tr_sumula.LblNome5Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod5.Caption);
end;

procedure Tr_sumula.LblNome6Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod6.Caption);
end;

procedure Tr_sumula.LblNome7Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod7.Caption);
end;

procedure Tr_sumula.LblNome8Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod8.Caption);
end;

procedure Tr_sumula.LblNome9Click(Sender: TObject);
begin
  visualizarFichaReduzida(LblCod9.Caption);
end;

end.
