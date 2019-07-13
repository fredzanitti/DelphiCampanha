unit frameSelecionarAnoCompleto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TfraSelAnoCompleto = class(TFrame)
    GroupBox1: TGroupBox;
    lblSelecionarJogador: TLabel;
    edtAno: TEdit;
    procedure edtAnoKeyPress(Sender: TObject; var Key: Char);
    procedure edtAnoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ano: integer;
  end;

implementation

{$R *.dfm}

uses module;

procedure TfraSelAnoCompleto.edtAnoExit(Sender: TObject);
begin
  if not (edtAno.Text = EmptyStr) then
      Ano := StrToInt(edtAno.Text);
end;

procedure TfraSelAnoCompleto.edtAnoKeyPress(Sender: TObject; var Key: Char);
begin
  If not(Key in ['0' .. '9', #08]) then
    Key := #0;
end;

end.
