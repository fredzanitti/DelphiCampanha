unit relatartilheirosporadver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  Tr_artilheirosporadver = class(TForm)
    LblPais: TLabel;
    LblCidade: TLabel;
    ImgBandPaisAdver: TImage;
    ImgUfAdver: TImage;
    LblUf: TLabel;
    ImgLogoAdver: TImage;
    Shape2: TShape;
    Shape1: TShape;
    DbGridArtClube: TDBGrid;
    ImgFotoJogador: TImage;
    Shape3: TShape;
    ImgNacionalidade: TImage;
    LblApelido: TLabel;
    LblNomeCompleto: TLabel;
    LblPeriodo: TLabel;
    LblPosicao: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DbGridArtClubeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridArtClubeCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    codtime: String;
  end;

var
  r_artilheirosporadver: Tr_artilheirosporadver;

implementation

{$R *.dfm}

uses funcoes, fichareduzida, home;

procedure Tr_artilheirosporadver.BitBtn1Click(Sender: TObject);
begin
  f_gerais.preencherEstJogadoresPorAdversario(codtime, 'J');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(DbGridArtClube.Columns[0].Field.AsString,
    ImgNacionalidade, ImgFotoJogador, LblApelido, LblNomeCompleto, LblPeriodo,
    LblPosicao);
end;

procedure Tr_artilheirosporadver.BitBtn2Click(Sender: TObject);
begin
  f_gerais.preencherEstJogadoresPorAdversario(codtime, 'G');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(DbGridArtClube.Columns[0].Field.AsString,
    ImgNacionalidade, ImgFotoJogador, LblApelido, LblNomeCompleto, LblPeriodo,
    LblPosicao);
end;

procedure Tr_artilheirosporadver.BitBtn3Click(Sender: TObject);
begin
  f_gerais.preencherEstJogadoresPorAdversario(codtime, 'M');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(DbGridArtClube.Columns[0].Field.AsString,
    ImgNacionalidade, ImgFotoJogador, LblApelido, LblNomeCompleto, LblPeriodo,
    LblPosicao);
end;

procedure Tr_artilheirosporadver.DbGridArtClubeCellClick(Column: TColumn);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(DbGridArtClube.Columns[0].Field.AsString,
    ImgNacionalidade, ImgFotoJogador, LblApelido, LblNomeCompleto, LblPeriodo,
    LblPosicao);
end;

procedure Tr_artilheirosporadver.DbGridArtClubeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(DbGridArtClube.Columns[0].Field.AsString,
    ImgNacionalidade, ImgFotoJogador, LblApelido, LblNomeCompleto, LblPeriodo,
    LblPosicao);
end;

procedure Tr_artilheirosporadver.FormActivate(Sender: TObject);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(DbGridArtClube.Columns[0].Field.AsString,
    ImgNacionalidade, ImgFotoJogador, LblApelido, LblNomeCompleto, LblPeriodo,
    LblPosicao);
end;

procedure Tr_artilheirosporadver.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        r_artilheirosporadver.Close;
      end;
  end;
end;

end.
