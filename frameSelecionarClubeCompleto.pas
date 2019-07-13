unit frameSelecionarClubeCompleto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TfraSelClubeCompleto = class(TFrame)
    GroupBox1: TGroupBox;
    lblSelecionarJogador: TLabel;
    dblClube: TDBLookupComboBox;
    procedure dblClubeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoClube: integer;
  end;

implementation

{$R *.dfm}

procedure TfraSelClubeCompleto.dblClubeClick(Sender: TObject);
begin
  CodigoClube := dblClube.KeyValue;
end;

end.
