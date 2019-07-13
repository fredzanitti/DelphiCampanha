unit frameSelecionarNacionalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TfraSelNacionalidade = class(TFrame)
    GroupBox1: TGroupBox;
    lblSelecionarPais: TLabel;
    chbTodos: TCheckBox;
    dblPais: TDBLookupComboBox;
    procedure chbTodosClick(Sender: TObject);
    procedure dblPaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoPais: integer;
  end;

implementation

{$R *.dfm}

uses module;

procedure TfraSelNacionalidade.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked then
    dblPais.KeyValue := -1;
end;

procedure TfraSelNacionalidade.dblPaisClick(Sender: TObject);
begin
  chbTodos.Checked := false;
  CodigoPais := dblPais.KeyValue;
end;

end.
