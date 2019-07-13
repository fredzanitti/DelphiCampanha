unit relCarreiraJogador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, frxRich;

type
  TfrmRelCarreiraJogador = class(TForm)
    frxDBRelCarreiraJogadores: TfrxDBDataset;
    frxRelCarreiraJogadores: TfrxReport;
    qryCarreiraJogadores: TFDQuery;
    qryCarreiraJogadoresJogador: TWideStringField;
    qryCarreiraJogadoresNomeCompleto: TWideStringField;
    qryCarreiraJogadoresFoto: TWideStringField;
    qryCarreiraJogadoresPosicao: TWideStringField;
    qryCarreiraJogadoresEscudo: TWideStringField;
    qryCarreiraJogadoresClube: TWideStringField;
    qryCarreiraJogadoresCidade: TWideStringField;
    qryCarreiraJogadoresBandeiraPais: TWideStringField;
    qryCarreiraJogadoresPais: TWideStringField;
    qryCarreiraJogadoresanoini: TIntegerField;
    qryCarreiraJogadoresanofim: TWideStringField;
    qryEstreia: TFDQuery;
    frxDBEstreia: TfrxDBDataset;
    frxRichObject1: TfrxRichObject;
    qryEstreiatipo: TWideStringField;
    qryEstreiadata: TDateField;
    qryEstreiajogo: TWideStringField;
    qryUltimo: TFDQuery;
    WideStringField1: TWideStringField;
    DateField1: TDateField;
    WideStringField2: TWideStringField;
    frxDBUltimo: TfrxDBDataset;
    qryTotalClubes: TFDQuery;
    frxDBTotalClubes: TfrxDBDataset;
    qryTotalClubesqtde: TLargeintField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCarreiraJogador: TfrmRelCarreiraJogador;

implementation

{$R *.dfm}

end.
