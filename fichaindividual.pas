unit fichaindividual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Th_fichaindividual = class(TForm)
    ImgFoto: TImage;
    Shape1: TShape;
    ImgBandPaisAdver: TImage;
    LblCidade: TLabel;
    LblPais: TLabel;
    LblUf: TLabel;
    ImgUfAdver: TImage;
    LblNome: TLabel;
    LblNomeCompleto: TLabel;
    Shape2: TShape;
    LblDtNasc: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LblTituloJogosComoTit: TLabel;
    Shape3: TShape;
    Label7: TLabel;
    LblEstreia: TLabel;
    LblUltimoJogo: TLabel;
    LblJogosTitular: TLabel;
    DbGridEstatisticas: TDBGrid;
    Label12: TLabel;
    DbGridTotais: TDBGrid;
    LblPosicao: TLabel;
    LblCodJogoEstreia: TLabel;
    LblCodJogoUltimo: TLabel;
    Label1: TLabel;
    LblIdadeEstreia: TLabel;
    Label2: TLabel;
    LblIdadeUltimoJogo: TLabel;
    Shape4: TShape;
    Shape5: TShape;
    btnCarreira: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure LblEstreiaClick(Sender: TObject);
    procedure LblUltimoJogoClick(Sender: TObject);
    procedure DbGridEstatisticasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnCarreiraClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigojogador: Integer;
  end;

var
  h_fichaindividual: Th_fichaindividual;

implementation

{$R *.dfm}

uses pesquisajogadores, funcoes, relCarreiraJogador;

procedure Th_fichaindividual.btnCarreiraClick(Sender: TObject);
begin
  // primeiro jogo do jogador com a camisa do clube
  frmRelCarreiraJogador.qryEstreia.Close;
  frmRelCarreiraJogador.qryEstreia.Params.ParamByName('CodJogador').DataType :=
    ftInteger;
  frmRelCarreiraJogador.qryEstreia.Params.ParamByName('CodJogador').Value :=
    codigojogador;
  frmRelCarreiraJogador.qryEstreia.Open;
  // ultimo jogo do jogador com a camisa do clube
  frmRelCarreiraJogador.qryUltimo.Close;
  frmRelCarreiraJogador.qryUltimo.Params.ParamByName('CodJogador').DataType :=
    ftInteger;
  frmRelCarreiraJogador.qryUltimo.Params.ParamByName('CodJogador').Value :=
    codigojogador;
  frmRelCarreiraJogador.qryUltimo.Open;
  // TOTAL DE CLUBES NA CARREIRA
  frmRelCarreiraJogador.qryTotalClubes.Close;
  frmRelCarreiraJogador.qryTotalClubes.Params.ParamByName('CodJogador').DataType :=
    ftInteger;
  frmRelCarreiraJogador.qryTotalClubes.Params.ParamByName('CodJogador').Value :=
    codigojogador;
  frmRelCarreiraJogador.qryTotalClubes.Open;
  // preview do relatório
  frmRelCarreiraJogador.frxRelCarreiraJogadores.PrepareReport();
  frmRelCarreiraJogador.frxRelCarreiraJogadores.ShowPreparedReport;
end;

procedure Th_fichaindividual.BtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS', 'N');
  h_jogadores.identificacao := 'FichaIndividual';
  h_jogadores.ShowModal;
end;

procedure Th_fichaindividual.DbGridEstatisticasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_fichaindividual.FormActivate(Sender: TObject);
begin
  // ficha do jogador
  frmRelCarreiraJogador.qryCarreiraJogadores.Close;
  frmRelCarreiraJogador.qryCarreiraJogadores.Params.ParamByName('CodJogador')
    .DataType := ftInteger;
  frmRelCarreiraJogador.qryCarreiraJogadores.Params.ParamByName('CodJogador')
    .Value := codigojogador;
  frmRelCarreiraJogador.qryCarreiraJogadores.Open;

  if frmRelCarreiraJogador.qryCarreiraJogadores.IsEmpty then
    btnCarreira.Visible := False
  else
    btnCarreira.Visible := true;

end;

procedure Th_fichaindividual.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_fichaindividual.Close;
      end;
  end;
end;

procedure Th_fichaindividual.LblEstreiaClick(Sender: TObject);
begin
  f_gerais.preencherSumula(LblCodJogoEstreia.Caption);
end;

procedure Th_fichaindividual.LblUltimoJogoClick(Sender: TObject);
begin
  f_gerais.preencherSumula(LblCodJogoUltimo.Caption);
end;

end.
