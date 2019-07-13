unit aniversariantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  Tr_aniversariantes = class(TForm)
    Shape1: TShape;
    Shape5: TShape;
    Label3: TLabel;
    Shape6: TShape;
    Label4: TLabel;
    LblNome2: TLabel;
    LblPeriodo2: TLabel;
    LblCodigo2: TLabel;
    LblNome3: TLabel;
    LblPeriodo3: TLabel;
    LblCodigo3: TLabel;
    LblNome4: TLabel;
    LblPeriodo4: TLabel;
    LblCodigo4: TLabel;
    LblNome5: TLabel;
    LblPeriodo5: TLabel;
    LblCodigo5: TLabel;
    LblNome6: TLabel;
    LblPeriodo6: TLabel;
    LblCodigo6: TLabel;
    LblNome7: TLabel;
    LblPeriodo7: TLabel;
    LblCodigo7: TLabel;
    LblNome8: TLabel;
    LblPeriodo8: TLabel;
    LblCodigo8: TLabel;
    LblNome9: TLabel;
    LblPeriodo9: TLabel;
    LblCodigo9: TLabel;
    LblNome10: TLabel;
    LblPeriodo10: TLabel;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    ImgBandNac2: TImage;
    ImgBandNac3: TImage;
    ImgBandNac4: TImage;
    ImgBandNac5: TImage;
    ImgBandNac6: TImage;
    ImgBandNac7: TImage;
    ImgBandNac8: TImage;
    ImgBandNac9: TImage;
    ImgBandNac10: TImage;
    LblPeriodo11: TLabel;
    ImgBandNac11: TImage;
    LblPeriodo12: TLabel;
    ImgBandNac12: TImage;
    Shape20: TShape;
    LblPeriodo13: TLabel;
    ImgBandNac13: TImage;
    Shape21: TShape;
    Shape22: TShape;
    LblPeriodo14: TLabel;
    ImgBandNac14: TImage;
    LblPeriodo15: TLabel;
    ImgBandNac15: TImage;
    Shape24: TShape;
    LblCodigo10: TLabel;
    LblCodigo11: TLabel;
    LblCodigo12: TLabel;
    LblCodigo13: TLabel;
    LblCodigo14: TLabel;
    LblCodigo15: TLabel;
    Shape23: TShape;
    LblNome11: TLabel;
    LblNome12: TLabel;
    LblNome13: TLabel;
    LblNome14: TLabel;
    LblNome15: TLabel;
    LblTitulos: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    procedure LblNome13Click(Sender: TObject);
    procedure LblNome14Click(Sender: TObject);
    procedure LblNome15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r_aniversariantes: Tr_aniversariantes;

implementation

{$R *.dfm}

uses funcoes, fichareduzida;

procedure Tr_aniversariantes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_aniversariantes.Close;
      end;
  end;
end;

procedure Tr_aniversariantes.LblNome10Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo10.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome11Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo11.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome12Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo12.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome13Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo13.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome14Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo14.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome15Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo15.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome2Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo2.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome3Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo3.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome4Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo4.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome5Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo5.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome6Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo6.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome7Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo7.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome8Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo8.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

procedure Tr_aniversariantes.LblNome9Click(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(LblCodigo9.Caption,
    r_fichareduzida.ImgNacionalidade, r_fichareduzida.ImgFotoJogador,
    r_fichareduzida.LblApelido, r_fichareduzida.LblNomeCompleto,
    r_fichareduzida.LblPeriodo, r_fichareduzida.LblPosicao);
  r_fichareduzida.ShowModal;
end;

end.
