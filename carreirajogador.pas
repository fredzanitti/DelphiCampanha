unit carreirajogador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frameSelecionarAnoCompleto,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, frameSelecionarClubeCompleto,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCarreiraJogador = class(TForm)
    fraSelAnoInicial: TfraSelAnoCompleto;
    fraSelAnoFinal: TfraSelAnoCompleto;
    fraSelClubeCompleto: TfraSelClubeCompleto;
    DbGridClubesCarreira: TDBGrid;
    qryCarreira: TFDQuery;
    qryCarreiranomeClube: TWideStringField;
    qryCarreirapais: TWideStringField;
    qryCarreiraanoini: TIntegerField;
    qryCarreiraanofim: TIntegerField;
    dtsCarreira: TDataSource;
    qryGravarCarreira: TFDQuery;
    qryGravarCarreiracodjogador: TIntegerField;
    qryGravarCarreiracodclube: TIntegerField;
    qryGravarCarreiraanoini: TIntegerField;
    qryGravarCarreiraanofim: TIntegerField;
    BtnGravar: TBitBtn;
    LblApelido: TLabel;
    BtnCancelar: TBitBtn;
    qryCarreiracoditem: TFDAutoIncField;
    qryDeletarCarreira: TFDQuery;
    procedure FormActivate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DbGridClubesCarreiraCellClick(Column: TColumn);
  private
    procedure PreencherGridCarreira;
    { Private declarations }
  public
    { Public declarations }
    codigoJogador: integer;
    codigoitem: integer;
  end;

var
  frmCarreiraJogador: TfrmCarreiraJogador;

implementation

{$R *.dfm}

uses module;

procedure TfrmCarreiraJogador.BtnCancelarClick(Sender: TObject);
begin
  if codigoitem > 0 then
  begin
    qryDeletarCarreira.Close;
    qryDeletarCarreira.Params.ParamByName('coditem').DataType := ftInteger;
    qryDeletarCarreira.Params.ParamByName('coditem').Value := codigoitem;
    qryDeletarCarreira.Open;
    qryDeletarCarreira.Delete;
    codigoitem := 0;
    PreencherGridCarreira;
  end;
  fraSelAnoInicial.edtAno.Clear;
  fraSelAnoFinal.edtAno.Clear;
  fraSelClubeCompleto.dblClube.KeyValue := -1;
  fraSelClubeCompleto.dblClube.SetFocus;
end;

procedure TfrmCarreiraJogador.BtnGravarClick(Sender: TObject);
begin
  if (fraSelClubeCompleto.dblClube.Text = EmptyStr) or
    (fraSelAnoInicial.edtAno.Text = EmptyStr) then
  begin
    Application.MessageBox('Todos os campos são de preenchimento obrigatório!',
      'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION);
    Abort;
  end;

  if (fraSelAnoFinal.edtAno.Text <> EmptyStr) and
    (StrToInt(fraSelAnoInicial.edtAno.Text) >
    StrToInt(fraSelAnoFinal.edtAno.Text)) then
  begin
    Application.MessageBox('Ano inicial maior que ano final!', 'ATENÇÃO',
      MB_OK + MB_ICONEXCLAMATION);
    Abort;
  end;

  qryGravarCarreira.Close;
  qryGravarCarreira.Open;
  qryGravarCarreira.Append;
  qryGravarCarreiracodjogador.Value := codigoJogador;
  qryGravarCarreiracodclube.Value := fraSelClubeCompleto.dblClube.KeyValue;
  qryGravarCarreiraanoini.Value := StrToInt(fraSelAnoInicial.edtAno.Text);
  if fraSelAnoFinal.edtAno.Text <> EmptyStr then
    qryGravarCarreiraanofim.Value := StrToInt(fraSelAnoFinal.edtAno.Text);
  qryGravarCarreira.Post;
  PreencherGridCarreira;
end;

procedure TfrmCarreiraJogador.DbGridClubesCarreiraCellClick(Column: TColumn);
begin
  if not qryCarreira.IsEmpty then
    codigoitem := DbGridClubesCarreira.Columns[0].Field.AsInteger
  else
    codigoitem := 0;
end;

procedure TfrmCarreiraJogador.PreencherGridCarreira;
begin
  qryCarreira.Close;
  qryCarreira.Params.ParamByName('codjogador').DataType := ftInteger;
  qryCarreira.Params.ParamByName('codjogador').Value := codigoJogador;
  qryCarreira.Open;
end;

procedure TfrmCarreiraJogador.FormActivate(Sender: TObject);
begin
  codigoitem := 0;
  PreencherGridCarreira;
  fraSelAnoInicial.edtAno.Clear;
  fraSelAnoFinal.edtAno.Clear;
  fraSelClubeCompleto.dblClube.KeyValue := -1;
  fraSelClubeCompleto.dblClube.SetFocus;
end;

procedure TfrmCarreiraJogador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      frmCarreiraJogador.Close;
  end;
end;

end.
