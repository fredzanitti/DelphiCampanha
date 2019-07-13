unit frameSelecionarJogador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfraSelJogador = class(TFrame)
    GroupBox1: TGroupBox;
    chbTodos: TCheckBox;
    lblSelecionarJogador: TLabel;
    dblJogador: TDBLookupComboBox;
    procedure chbTodosClick(Sender: TObject);
    procedure dblJogadorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoJogador: integer;
  end;

implementation

{$R *.dfm}

uses module;

procedure TfraSelJogador.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked then
    dblJogador.KeyValue := -1;
end;

procedure TfraSelJogador.dblJogadorClick(Sender: TObject);
begin
  chbTodos.Checked := false;
  codigoJogador := dblJogador.KeyValue;
end;

end.
