unit liberarjogador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Th_liberarjogador = class(TForm)
    LblCodigo1: TLabel;
    LblNome1: TLabel;
    CbLiberar1: TCheckBox;
    LblCodigo2: TLabel;
    LblNome2: TLabel;
    CbLiberar2: TCheckBox;
    LblCodigo3: TLabel;
    LblNome3: TLabel;
    CbLiberar3: TCheckBox;
    LblCodigo4: TLabel;
    LblNome4: TLabel;
    CbLiberar4: TCheckBox;
    LblCodigo5: TLabel;
    LblNome5: TLabel;
    CbLiberar5: TCheckBox;
    LblCodigo6: TLabel;
    LblNome6: TLabel;
    CbLiberar6: TCheckBox;
    LblCodigo7: TLabel;
    LblNome7: TLabel;
    CbLiberar7: TCheckBox;
    LblCodigo8: TLabel;
    LblNome8: TLabel;
    CbLiberar8: TCheckBox;
    LblCodigo9: TLabel;
    LblNome9: TLabel;
    CbLiberar9: TCheckBox;
    LblCodigo10: TLabel;
    LblNome10: TLabel;
    CbLiberar10: TCheckBox;
    LblCodigo11: TLabel;
    LblNome11: TLabel;
    CbLiberar11: TCheckBox;
    LblCodigo12: TLabel;
    LblNome12: TLabel;
    CbLiberar12: TCheckBox;
    LblCodigo13: TLabel;
    LblNome13: TLabel;
    CbLiberar13: TCheckBox;
    LblCodigo14: TLabel;
    LblNome14: TLabel;
    CbLiberar14: TCheckBox;
    LblCodigo15: TLabel;
    LblNome15: TLabel;
    CbLiberar15: TCheckBox;
    LblCodigo16: TLabel;
    LblNome16: TLabel;
    CbLiberar16: TCheckBox;
    LblCodigo17: TLabel;
    LblNome17: TLabel;
    CbLiberar17: TCheckBox;
    LblCodigo18: TLabel;
    LblNome18: TLabel;
    CbLiberar18: TCheckBox;
    LblCodigo19: TLabel;
    LblNome19: TLabel;
    CbLiberar19: TCheckBox;
    LblCodigo20: TLabel;
    LblNome20: TLabel;
    CbLiberar20: TCheckBox;
    LblCodigo21: TLabel;
    LblNome21: TLabel;
    CbLiberar21: TCheckBox;
    LblCodigo22: TLabel;
    LblNome22: TLabel;
    CbLiberar22: TCheckBox;
    LblCodigo23: TLabel;
    LblNome23: TLabel;
    CbLiberar23: TCheckBox;
    LblCodigo24: TLabel;
    LblNome24: TLabel;
    CbLiberar24: TCheckBox;
    LblCodigo25: TLabel;
    LblNome25: TLabel;
    CbLiberar25: TCheckBox;
    LblCodigo26: TLabel;
    LblNome26: TLabel;
    CbLiberar26: TCheckBox;
    LblCodigo27: TLabel;
    LblNome27: TLabel;
    CbLiberar27: TCheckBox;
    LblCodigo28: TLabel;
    LblNome28: TLabel;
    CbLiberar28: TCheckBox;
    LblCodigo29: TLabel;
    LblNome29: TLabel;
    CbLiberar29: TCheckBox;
    LblCodigo30: TLabel;
    LblNome30: TLabel;
    CbLiberar30: TCheckBox;
    Label1: TLabel;
    BtnSelTudo: TBitBtn;
    BtnDesmTudo: TBitBtn;
    BtnLiberar: TBitBtn;
    BtnCancelar: TBitBtn;
    CbxAnos: TComboBox;
    QrAno: TFDQuery;
    DtsQrAno: TDataSource;
    LblCodigo31: TLabel;
    LblNome31: TLabel;
    LblCodigo32: TLabel;
    LblNome32: TLabel;
    LblCodigo33: TLabel;
    LblNome33: TLabel;
    LblCodigo34: TLabel;
    LblNome34: TLabel;
    LblCodigo35: TLabel;
    LblNome35: TLabel;
    LblCodigo36: TLabel;
    LblNome36: TLabel;
    LblCodigo37: TLabel;
    LblNome37: TLabel;
    LblCodigo38: TLabel;
    LblNome38: TLabel;
    LblCodigo39: TLabel;
    LblNome39: TLabel;
    LblCodigo40: TLabel;
    LblNome40: TLabel;
    LblCodigo41: TLabel;
    LblNome41: TLabel;
    LblCodigo42: TLabel;
    LblNome42: TLabel;
    LblCodigo43: TLabel;
    LblNome43: TLabel;
    LblCodigo44: TLabel;
    LblNome44: TLabel;
    LblCodigo45: TLabel;
    LblNome45: TLabel;
    CbLiberar31: TCheckBox;
    CbLiberar32: TCheckBox;
    CbLiberar33: TCheckBox;
    CbLiberar34: TCheckBox;
    CbLiberar35: TCheckBox;
    CbLiberar36: TCheckBox;
    CbLiberar37: TCheckBox;
    CbLiberar38: TCheckBox;
    CbLiberar39: TCheckBox;
    CbLiberar40: TCheckBox;
    CbLiberar41: TCheckBox;
    CbLiberar42: TCheckBox;
    CbLiberar43: TCheckBox;
    CbLiberar44: TCheckBox;
    CbLiberar45: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CbxAnosChange(Sender: TObject);
    procedure BtnSelTudoClick(Sender: TObject);
    procedure BtnDesmTudoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnLiberarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    codjogo: String;
  end;

var
  h_liberarjogador: Th_liberarjogador;

implementation

{$R *.dfm}

uses module, funcoes, reservas, jogos;

procedure Th_liberarjogador.BtnCancelarClick(Sender: TObject);
begin
  f_gerais.limparLiberaJogadores();
  f_gerais.liberaJogadores('TODOS');
  h_liberarjogador.Close;
end;

procedure Th_liberarjogador.BtnDesmTudoClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 45 do
  begin
    f_gerais.marcarDesmarcarTodos(i, false);
  end;
end;

procedure Th_liberarjogador.BtnLiberarClick(Sender: TObject);
var
  i: Integer;
begin
  f_gerais.atualizaSituacao(0);
  f_gerais.limparLiberaJogadores;
  FormActivate(Self);
  f_gerais.liberaJogadores('TODOS');
  if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
  begin
    f_gerais.jogadoresDisponiveis(h_substituicoes.DbGridDisponiveis,
      CA_JOGOS.EdtCodigo.Text, h_liberarjogador.Name, EmptyStr);
  end;
end;

procedure Th_liberarjogador.BtnSelTudoClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 45 do
  begin
    f_gerais.marcarDesmarcarTodos(i, true);
  end;
end;

procedure Th_liberarjogador.CbxAnosChange(Sender: TObject);
begin
  f_gerais.liberaJogadores(CbxAnos.Text);
end;

procedure Th_liberarjogador.FormActivate(Sender: TObject);
var
  sql: String;
begin
  sql := 'select ano from es_anos ' + 'where ano <= year(now()) ' +
    'order by ano desc';
  CbxAnos.Clear;
  QrAno.Close;
  QrAno.sql.Clear;
  QrAno.sql.Add(sql);
  QrAno.Open;
  QrAno.First;

  while not QrAno.Eof do
  begin
    CbxAnos.Items.Add(QrAno.Fields[0].AsString);
    QrAno.Next;
  end;

  CbxAnos.SetFocus;

end;

procedure Th_liberarjogador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_liberarjogador.Close;
      end;
  end;
end;

end.
