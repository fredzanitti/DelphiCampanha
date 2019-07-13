unit geraljogadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  Tr_geraljogador = class(TForm)
    CbxAnos: TComboBox;
    DbGridEstatisticas: TDBGrid;
    Shape1: TShape;
    Label1: TLabel;
    ImgNacionalidade: TImage;
    LblApelido: TLabel;
    LblNomeCompleto: TLabel;
    LblPeriodo: TLabel;
    LblPosicao: TLabel;
    ImgFotoJogador: TImage;
    Shape3: TShape;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label3: TLabel;
    LblAcoes: TLabel;
    procedure CbxAnosChange(Sender: TObject);
    procedure DbGridEstatisticasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridEstatisticasCellClick(Column: TColumn);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DbGridEstatisticasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  r_geraljogador: Tr_geraljogador;

implementation

{$R *.dfm}

uses funcoes;

procedure Tr_geraljogador.BitBtn1Click(Sender: TObject);
begin
  f_gerais.preencherEstatisticasGeraisJogadores(DbGridEstatisticas,
    CbxAnos.Text, 'J');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
  LblAcoes.Caption := 'ORDENADO POR NÚMERO DE JOGOS';
end;

procedure Tr_geraljogador.BitBtn2Click(Sender: TObject);
begin
  f_gerais.preencherEstatisticasGeraisJogadores(DbGridEstatisticas,
    CbxAnos.Text, 'G');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
  LblAcoes.Caption := 'ORDENADO POR NÚMERO DE GOLS';
end;

procedure Tr_geraljogador.BitBtn3Click(Sender: TObject);
begin
  f_gerais.preencherEstatisticasGeraisJogadores(DbGridEstatisticas,
    CbxAnos.Text, 'M');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
  LblAcoes.Caption := 'ORDENADO POR MÉDIA DE GOLS';
end;

procedure Tr_geraljogador.BitBtn4Click(Sender: TObject);
begin
  f_gerais.preencherEstatisticasGeraisJogadores(DbGridEstatisticas,
    CbxAnos.Text, 'A');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
  LblAcoes.Caption := 'ORDENADO POR CARTÕES AMARELOS RECEBIDOS';
end;

procedure Tr_geraljogador.BitBtn5Click(Sender: TObject);
begin
  f_gerais.preencherEstatisticasGeraisJogadores(DbGridEstatisticas,
    CbxAnos.Text, 'V');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
  LblAcoes.Caption := 'ORDENADO POR CARTÕES VERMELHOS RECEBIDOS';
end;

procedure Tr_geraljogador.CbxAnosChange(Sender: TObject);
begin
  f_gerais.preencherEstatisticasGeraisJogadores(DbGridEstatisticas,
    CbxAnos.Text, 'G');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
end;

procedure Tr_geraljogador.DbGridEstatisticasCellClick(Column: TColumn);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
end;

procedure Tr_geraljogador.DbGridEstatisticasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Tr_geraljogador.DbGridEstatisticasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
end;

procedure Tr_geraljogador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        r_geraljogador.Close;
      end;
  end;
end;

end.
