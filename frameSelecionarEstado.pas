unit frameSelecionarEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TfraSelUf = class(TFrame)
    GroupBox1: TGroupBox;
    lblSelecionarPais: TLabel;
    chbTodos: TCheckBox;
    dblEstado: TDBLookupComboBox;
    procedure chbTodosClick(Sender: TObject);
    procedure dblEstadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoUF: integer;
  end;

implementation

{$R *.dfm}

uses module;

procedure TfraSelUf.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked then
    dblEstado.KeyValue := -1;
end;

procedure TfraSelUf.dblEstadoClick(Sender: TObject);
begin
  chbTodos.Checked := false;
  CodigoUF := dblEstado.KeyValue;
end;

end.
