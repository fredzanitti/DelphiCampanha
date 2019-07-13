unit relSumula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet;

type
  TfrmRelSumula = class(TForm)
    frxDBRelSumula: TfrxDBDataset;
    frxRelSumula: TfrxReport;
    qrySumula: TFDQuery;
    qryTitulares: TFDQuery;
    qryReservas: TFDQuery;
    qrySumulacodcompeticao: TIntegerField;
    qrySumulacodadvermand: TIntegerField;
    qrySumulaplacar1: TIntegerField;
    qrySumulapenalty1: TIntegerField;
    qrySumulapenalty2: TIntegerField;
    qrySumulaplacar2: TIntegerField;
    qrySumulacodadvervisit: TIntegerField;
    qrySumuladata: TDateField;
    qrySumulacodestadio: TIntegerField;
    qrySumulapublico: TIntegerField;
    qrySumulacodarbitro: TIntegerField;
    qrySumulacodtatica: TIntegerField;
    qrySumulacontra: TIntegerField;
    qrySumulacodfase: TIntegerField;
    qrySumulacoduniforme: TIntegerField;
    frxDBRelTitulares: TfrxDBDataset;
    frxDBRelReservas: TfrxDBDataset;
    qrySumulaNomeCompeticao: TStringField;
    qrySumulahora: TWideStringField;
    qrySumulaNomeMandante: TStringField;
    qrySumulaNomeVisitante: TStringField;
    qrySumulaNomeEstadio: TStringField;
    qrySumulaNomeArbitro: TStringField;
    qrySumulaNomeFase: TStringField;
    qrySumulaEscudoMandante: TStringField;
    qrySumulaEscudoVisitante: TStringField;
    qrySumulaFotoUniforme: TStringField;
    qrySumulaDescricaoTatica: TStringField;
    qryTitularescodjogador: TIntegerField;
    qryTitularescamarelo: TIntegerField;
    qryTitularescvermelho: TIntegerField;
    qryTitularesgols: TIntegerField;
    qryTitularesNomeJogador: TStringField;
    qryReservascodjogador: TIntegerField;
    qryReservascamarelo: TIntegerField;
    qryReservascvermelho: TIntegerField;
    qryReservasgols: TIntegerField;
    qryReservascodjogadorsaiu: TIntegerField;
    qryReservasNomeJogador: TStringField;
    qryReservasNomeJogadorSaiu: TStringField;
    qryTitularesbandeira: TWideStringField;
    qryReservasbandeira: TWideStringField;
    procedure qrySumulaCalcFields(DataSet: TDataSet);
    procedure qryTitularesCalcFields(DataSet: TDataSet);
    procedure qryReservasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelSumula: TfrmRelSumula;

implementation

{$R *.dfm}

uses module, funcoes;

procedure TfrmRelSumula.qryReservasCalcFields(DataSet: TDataSet);
begin
  qryReservasNomeJogador.Value :=
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
    qryReservascodjogador.AsString));

  qryReservasNomeJogadorSaiu.Value :=
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
    qryReservascodjogadorsaiu.AsString));
end;

procedure TfrmRelSumula.qrySumulaCalcFields(DataSet: TDataSet);
begin
  // nome competicao
  qrySumulaNomeCompeticao.Value :=
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao',
    qrySumulacodcompeticao.AsString));

  // nome clubes
  qrySumulaNomeMandante.Value :=
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
    qrySumulacodadvermand.AsString));
  qrySumulaNomeVisitante.Value :=
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
    qrySumulacodadvervisit.AsString));

  // Escudo dos clubes
  qrySumulaEscudoMandante.Value := f_gerais.buscarNome('escudo', 'ca_adver',
    'codadver', qrySumulacodadvermand.AsString);
  qrySumulaEscudoVisitante.Value := f_gerais.buscarNome('escudo', 'ca_adver',
    'codadver', qrySumulacodadvervisit.AsString);

  // Uniforme
  qrySumulaFotoUniforme.Value := f_gerais.buscarNome('foto_uniforme',
    'ca_uniformes', 'coduniforme', qrySumulacoduniforme.AsString);

  // árbitro
  qrySumulaNomeArbitro.Value := f_gerais.buscarNome('nome', 'ca_arbit',
    'codarbitro', qrySumulacodarbitro.AsString);

  // estadio
  qrySumulaNomeEstadio.Value := f_gerais.buscarNome('nome', 'ca_estad',
    'codestadio', qrySumulacodestadio.AsString);

  // esquema tático
  qrySumulaDescricaoTatica.Value := f_gerais.buscarNome('esquema', 'ca_tatic',
    'codtatica', qrySumulacodtatica.AsString);

  // fase
  qrySumulaNomeFase.Value := f_gerais.buscarNome('nome', 'ca_fase', 'codfase',
    qrySumulacodfase.AsString);
end;

procedure TfrmRelSumula.qryTitularesCalcFields(DataSet: TDataSet);
begin
  qryTitularesNomeJogador.Value :=
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
    qryTitularescodjogador.AsString));
end;

end.
