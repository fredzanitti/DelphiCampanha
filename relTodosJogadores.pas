unit relTodosJogadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmRelJogador = class(TForm)
    frxDBRelJogadores: TfrxDBDataset;
    frxRelJogadores: TfrxReport;
    qryJogadores: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelJogador: TfrmRelJogador;

implementation

{$R *.dfm}

uses module;

end.
