unit frameSelecionarClube;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TfraSelecionarClube = class(TFrame)
    GroupBox1: TGroupBox;
    lblSelecionarJogador: TLabel;
    chbTodos: TCheckBox;
    dblClube: TDBLookupComboBox;
    procedure chbTodosClick(Sender: TObject);
    procedure dblClubeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoAdversario: integer;
  end;

implementation

{$R *.dfm}

uses module;

procedure TfraSelecionarClube.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked then
    dblClube.KeyValue := -1;
end;

procedure TfraSelecionarClube.dblClubeClick(Sender: TObject);
begin
  chbTodos.Checked := false;
  CodigoAdversario := dblClube.KeyValue;
end;

end.
