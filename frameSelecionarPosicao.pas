unit frameSelecionarPosicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TfraSelPosicao = class(TFrame)
    GroupBox1: TGroupBox;
    lblSelecionarPosicao: TLabel;
    dblPosicao: TDBLookupComboBox;
    chbTodos: TCheckBox;
    procedure chbTodosClick(Sender: TObject);
    procedure dblPosicaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoPosicao: integer;
  end;

implementation

{$R *.dfm}

uses module;

procedure TfraSelPosicao.chbTodosClick(Sender: TObject);
begin
  if chbTodos.Checked then
    dblPosicao.KeyValue := -1;
end;

procedure TfraSelPosicao.dblPosicaoClick(Sender: TObject);
begin
  chbTodos.Checked := false;
  codigoPosicao := dblPosicao.KeyValue;
end;

end.
