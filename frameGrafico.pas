unit frameGrafico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, VclTee.TeEngine, VclTee.Series, Vcl.ExtCtrls,
  VclTee.TeeProcs, VclTee.Chart, VclTee.DBChart, Vcl.StdCtrls;

type
  TfraGrafico = class(TFrame)
    dbcEstatisticas: TDBChart;
    Series1: TPieSeries;
    qryRecuperaAdver: TFDQuery;
    qryRecuperaAdvercodadver: TIntegerField;
    qryGrafico: TFDQuery;
    qryGraficoCLUBE: TWideStringField;
    qryGraficoPERC: TFMTBCDField;
    qryGraficoSIGLA: TStringField;
    qryNomeTimesDoJogo: TFDQuery;
    qryNomeTimesDoJogomandante: TWideStringField;
    qryNomeTimesDoJogovisitante: TWideStringField;
    lblTituloGrafico: TLabel;
    procedure qryGraficoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreencherGrafico(CodJogo: integer);
  end;

implementation

uses
  funcoes;

{$R *.dfm}

procedure TfraGrafico.PreencherGrafico(CodJogo: integer);
begin
  dbcEstatisticas.Visible := True;
  if qryNomeTimesDoJogo.Active then
    qryNomeTimesDoJogo.Close;
  qryNomeTimesDoJogo.Params.ParamByName('CodigoJogo').DataType := ftInteger;
  qryNomeTimesDoJogo.Params.ParamByName('CodigoJogo').Value := CodJogo;
  qryNomeTimesDoJogo.Open;

  dbcEstatisticas.Title.Caption := '';
  lblTituloGrafico.Caption := 'Percentual de vitórias entre ' + #13 +
    f_gerais.RemoveAcento(qryNomeTimesDoJogomandante.Value) + ' e ' +
    f_gerais.RemoveAcento(qryNomeTimesDoJogovisitante.Value);
  if qryRecuperaAdver.Active then
    qryRecuperaAdver.Close;
  qryRecuperaAdver.Params.ParamByName('CodigoJogo').DataType := ftInteger;
  qryRecuperaAdver.Params.ParamByName('CodigoJogo').Value := CodJogo;
  qryRecuperaAdver.Open;
  if qryGrafico.Active then
    qryGrafico.Close;
  qryGrafico.Params.ParamByName('CodigoVitoria').DataType := ftInteger;
  qryGrafico.Params.ParamByName('CodigoVitoria').Value :=
    qryRecuperaAdvercodadver.Value;
  qryGrafico.Params.ParamByName('CodigoDerrota').DataType := ftInteger;
  qryGrafico.Params.ParamByName('CodigoDerrota').Value :=
    qryRecuperaAdvercodadver.Value;
  qryGrafico.Params.ParamByName('CodigoEmpate').DataType := ftInteger;
  qryGrafico.Params.ParamByName('CodigoEmpate').Value :=
    qryRecuperaAdvercodadver.Value;
  qryGrafico.Open;
end;

procedure TfraGrafico.qryGraficoCalcFields(DataSet: TDataSet);
begin
  qryGraficoSIGLA.Value := f_gerais.RemoveAcento(qryGraficoCLUBE.Value);
end;

end.
