unit frameSelecionarAno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfraSelecionarAno = class(TFrame)
    GroupBox1: TGroupBox;
    lblSelecionarJogador: TLabel;
    chbTodos: TCheckBox;
    dblAno: TDBLookupComboBox;
    qryAnos: TFDQuery;
    qryAnosano: TIntegerField;
    dtsAnos: TDataSource;
    procedure chbTodosClick(Sender: TObject);
    procedure dblAnoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ano: integer;
  end;

implementation

{$R *.dfm}

uses module;

procedure TfraSelecionarAno.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked then
    dblAno.KeyValue := -1;
end;

procedure TfraSelecionarAno.dblAnoClick(Sender: TObject);
begin
  chbTodos.Checked := false;
  Ano := dblAno.KeyValue;
end;

end.
