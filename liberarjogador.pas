unit liberarjogador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls;

type
  Th_liberarjogador = class(TForm)
    Label1: TLabel;
    BtnSelTudo: TBitBtn;
    BtnDesmTudo: TBitBtn;
    BtnLiberar: TBitBtn;
    BtnCancelar: TBitBtn;
    CbxAnos: TComboBox;
    QrAno: TFDQuery;
    DtsQrAno: TDataSource;
    lsvJogadores: TListView;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CbxAnosChange(Sender: TObject);
    procedure BtnSelTudoClick(Sender: TObject);
    procedure BtnDesmTudoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnLiberarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  f_gerais.liberaJogadores('TODOS');
  h_liberarjogador.Close;
end;

procedure Th_liberarjogador.BtnDesmTudoClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to lsvJogadores.Items.Count - 1 do
    lsvJogadores.Items[i].Checked := False;
end;

procedure Th_liberarjogador.BtnLiberarClick(Sender: TObject);
var
  i: Integer;
begin
  f_gerais.atualizaSituacao(0);
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
  for i := 0 to lsvJogadores.Items.Count - 1 do
    lsvJogadores.Items[i].Checked := True;
end;

procedure Th_liberarjogador.CbxAnosChange(Sender: TObject);
begin
  f_gerais.liberaJogadores(CbxAnos.Text);
end;

procedure Th_liberarjogador.FormCreate(Sender: TObject);
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
