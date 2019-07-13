unit relTodosJogadoresComFoto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmRelJogadorComFoto = class(TForm)
    frxDBRelJogadoresComFoto: TfrxDBDataset;
    qryJogadores: TFDQuery;
    qryJogadoresCodigo: TIntegerField;
    qryJogadoresApelido: TWideStringField;
    qryJogadoresNomeCompleto: TWideStringField;
    qryJogadoresDataNascimento: TDateField;
    qryJogadoresLocalNascimento: TWideStringField;
    qryJogadoresEstado: TWideStringField;
    qryJogadoresPais: TWideStringField;
    qryJogadoresPosicao: TWideStringField;
    qryJogadoresSituacao: TWideStringField;
    qryJogadoresBandeira: TWideStringField;
    qryJogadoresFoto: TWideStringField;
    frxRelJogadoresComFoto: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelJogadorComFoto: TfrmRelJogadorComFoto;

implementation

{$R *.dfm}

end.
