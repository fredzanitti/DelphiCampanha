unit UGerenciadorJogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  frameGrafico, Vcl.Mask;

type
  TfrmGerenciadorJogos = class(TForm)
    qryJogos: TFDQuery;
    qryJogoscodjogo: TIntegerField;
    qryJogosdata: TDateField;
    qryJogoscodadvermand: TIntegerField;
    qryJogosplacar1: TIntegerField;
    qryJogosplacar2: TIntegerField;
    qryJogoscodadvervisit: TIntegerField;
    qryJogoscodcompeticao: TIntegerField;
    qryJogospublico: TIntegerField;
    qryJogosMandante: TStringField;
    qryJogosVisitante: TStringField;
    qryJogosCompeticao: TStringField;
    dtsJogos: TDataSource;
    GroupBox1: TGroupBox;
    dbgJogos: TDBGrid;
    GroupBox2: TGroupBox;
    ScrollBox1: TScrollBox;
    panAdver: TPanel;
    lblSetaAdver: TLabel;
    lblAdver: TLabel;
    panSelectAdver: TPanel;
    cmbAdver: TDBLookupComboBox;
    chkAdver: TCheckBox;
    panJogo: TPanel;
    lblSetaJogo: TLabel;
    lblJogo: TLabel;
    panSelectJogo: TPanel;
    chkJogos: TCheckBox;
    panEstadio: TPanel;
    lblSetaEstadio: TLabel;
    lblEstadio: TLabel;
    panSelectEstadio: TPanel;
    cmbEstadio: TDBLookupComboBox;
    chkEstadio: TCheckBox;
    panPeriodo: TPanel;
    lblSetaPeriodo: TLabel;
    lblPeriodo: TLabel;
    panSelectPeriodo: TPanel;
    chkPeriodo: TCheckBox;
    panCampeonato: TPanel;
    lblSetaCampeonato: TLabel;
    lblCampeonato: TLabel;
    panSelectCampeonato: TPanel;
    cmbCampeonato: TDBLookupComboBox;
    chkCampeonato: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    edtCodJogo: TEdit;
    lblCodigodoJogo: TLabel;
    panRivais: TPanel;
    lblSetaRivais: TLabel;
    Label2: TLabel;
    panSelectRivais: TPanel;
    rbtTodos: TRadioButton;
    rbtRivais: TRadioButton;
    btnSelecionar: TBitBtn;
    qryCampeonatos: TFDQuery;
    dtsCampeonatos: TDataSource;
    qryCampeonatoscodcompeticao: TIntegerField;
    qryCampeonatosnome: TWideStringField;
    qryCampeonatostipocompeticao: TWideStringField;
    dtsAdversarios: TDataSource;
    qryAdversarios: TFDQuery;
    qryAdversarioscodadver: TIntegerField;
    qryAdversariosnome: TWideStringField;
    qryAdversarioscodcidade: TIntegerField;
    qryAdversariosrival: TSmallintField;
    qryAdversariosescudo: TWideStringField;
    GroupBox3: TGroupBox;
    fraGrafico: TfraGrafico;
    GroupBox4: TGroupBox;
    qryEstatisticasGerais: TFDQuery;
    qryRecuperaAdver: TFDQuery;
    lblDescVitorias: TLabel;
    lblVitoria: TLabel;
    Label3: TLabel;
    lblEmpate: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblDerrotas: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    lblGolsPro: TLabel;
    Label15: TLabel;
    lblGolsContra: TLabel;
    Label4: TLabel;
    lblSaldoGols: TLabel;
    Label14: TLabel;
    lblAproveitamento: TLabel;
    Label1: TLabel;
    lblJogos: TLabel;
    qryEstatisticasGeraisJ: TFMTBCDField;
    qryEstatisticasGeraisV: TFMTBCDField;
    qryEstatisticasGeraisE: TFMTBCDField;
    qryEstatisticasGeraisD: TFMTBCDField;
    qryEstatisticasGeraisGP: TFMTBCDField;
    qryEstatisticasGeraisGC: TFMTBCDField;
    qryEstatisticasGeraisSG: TFMTBCDField;
    qryEstatisticasGeraisAPR: TFMTBCDField;
    ImgAdver: TImage;
    lblAdversario: TLabel;
    ImgBandPaisAdver: TImage;
    qryCidadeAdver: TFDQuery;
    qryCidadeAdvercodcidade: TIntegerField;
    qryRecuperaAdverCodigoAdversario: TIntegerField;
    qryEstadios: TFDQuery;
    dtsEstadios: TDataSource;
    qryEstadioscodestadio: TIntegerField;
    qryEstadiosnome: TWideStringField;
    qryEstadioscodcidade: TIntegerField;
    edtDataIni: TMaskEdit;
    edtDataFim: TMaskEdit;
    procedure qryJogosCalcFields(DataSet: TDataSet);
    procedure lblAdverClick(Sender: TObject);
    procedure lblEstadioClick(Sender: TObject);
    procedure lblJogoClick(Sender: TObject);
    procedure lblCampeonatoClick(Sender: TObject);
    procedure lblPeriodoClick(Sender: TObject);
    procedure lblRivaisClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure chkCampeonatoClick(Sender: TObject);
    procedure chkAdverClick(Sender: TObject);
    procedure dbgJogosDblClick(Sender: TObject);
    procedure dbgJogosCellClick(Column: TColumn);
    procedure dbgJogosKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkJogosClick(Sender: TObject);
    procedure chkEstadioClick(Sender: TObject);
    procedure chkPeriodoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure VerificarSelecao;
    procedure EstatisticasAdversario(CodJogo: Integer);
  public
    { Public declarations }
    procedure SelecionarJogos;
  end;

var
  frmGerenciadorJogos: TfrmGerenciadorJogos;

implementation

uses
  module, funcoes, UProgresso;

{$R *.dfm}

procedure TfrmGerenciadorJogos.EstatisticasAdversario(CodJogo: Integer);
begin
  if qryRecuperaAdver.Active then
    qryRecuperaAdver.Close;
  qryRecuperaAdver.Params.ParamByName('CodigoJogo').DataType := ftInteger;
  qryRecuperaAdver.Params.ParamByName('CodigoJogo').Value := CodJogo;
  qryRecuperaAdver.Open;

  if qryEstatisticasGerais.Active then
    qryEstatisticasGerais.Close;
  qryEstatisticasGerais.Params.ParamByName('CodAdverM').DataType := ftInteger;
  qryEstatisticasGerais.Params.ParamByName('CodAdverV').DataType := ftInteger;
  qryEstatisticasGerais.Params.ParamByName('CodAdverM').Value :=
    qryRecuperaAdverCodigoAdversario.Value;
  qryEstatisticasGerais.Params.ParamByName('CodAdverV').Value :=
    qryRecuperaAdverCodigoAdversario.Value;
  qryEstatisticasGerais.Open;

  lblJogos.Caption := qryEstatisticasGeraisJ.AsString;
  lblDescVitorias.Caption := 'VITÓRIAS DO ' +
    UpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0')) + ':';
  lblVitoria.Caption := qryEstatisticasGeraisV.AsString;
  lblEmpate.Caption := qryEstatisticasGeraisE.AsString;
  lblDerrotas.Caption := qryEstatisticasGeraisD.AsString;
  lblGolsPro.Caption := qryEstatisticasGeraisGP.AsString;
  lblGolsContra.Caption := qryEstatisticasGeraisGC.AsString;
  lblSaldoGols.Caption := qryEstatisticasGeraisSG.AsString;
  if qryEstatisticasGeraisAPR.AsFloat >= 50 then
    lblAproveitamento.Color := clGreen
  else
    lblAproveitamento.Color := clRed;
  lblAproveitamento.Caption := qryEstatisticasGeraisAPR.AsString + '%';
  f_gerais.buscaImagemPorCodigo(ImgAdver,
    qryRecuperaAdverCodigoAdversario.AsString);
  lblAdversario.Caption := 'Adversário: ' +
    UpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
    qryRecuperaAdverCodigoAdversario.AsString));
  if qryCidadeAdver.Active then
    qryCidadeAdver.Close;
  qryCidadeAdver.Params.ParamByName('CodAdver').DataType := ftInteger;
  qryCidadeAdver.Params.ParamByName('CodAdver').Value :=
    qryRecuperaAdverCodigoAdversario.Value;
  qryCidadeAdver.Open;
  f_gerais.buscaBandPaisPorCodCidade(ImgBandPaisAdver,
    qryCidadeAdvercodcidade.AsString);
end;

procedure TfrmGerenciadorJogos.btnSelecionarClick(Sender: TObject);
begin
  SelecionarJogos;
end;

procedure TfrmGerenciadorJogos.chkAdverClick(Sender: TObject);
begin
  if chkAdver.Checked then
    cmbAdver.Enabled := False
  else
  begin
    cmbAdver.Enabled := True;
    cmbAdver.SetFocus;
  end;
end;

procedure TfrmGerenciadorJogos.chkCampeonatoClick(Sender: TObject);
begin
  if chkCampeonato.Checked then
    cmbCampeonato.Enabled := False
  else
  begin
    cmbCampeonato.Enabled := True;
    cmbCampeonato.SetFocus;
  end;

end;

procedure TfrmGerenciadorJogos.chkEstadioClick(Sender: TObject);
begin
  if chkEstadio.Checked then
    cmbEstadio.Enabled := False
  else
  begin
    cmbEstadio.Enabled := True;
    cmbEstadio.SetFocus;
  end;
end;

procedure TfrmGerenciadorJogos.chkJogosClick(Sender: TObject);
begin
  edtCodJogo.Clear;
  if chkJogos.Checked then
    edtCodJogo.ReadOnly := True
  else
  begin
    edtCodJogo.ReadOnly := False;
    edtCodJogo.SetFocus;
  end;

end;

procedure TfrmGerenciadorJogos.chkPeriodoClick(Sender: TObject);
begin
  edtDataIni.Clear;
  edtDataFim.Clear;
  if chkPeriodo.Checked then
  begin
    edtDataIni.ReadOnly := True;
    edtDataFim.ReadOnly := True;
  end
  else
  begin
    edtDataIni.ReadOnly := False;
    edtDataFim.ReadOnly := False;
    edtDataIni.SetFocus;
  end;
end;

procedure TfrmGerenciadorJogos.dbgJogosCellClick(Column: TColumn);
begin
  fraGrafico.PreencherGrafico(dbgJogos.Columns[0].Field.AsInteger);
  EstatisticasAdversario(dbgJogos.Columns[0].Field.AsInteger);
end;

procedure TfrmGerenciadorJogos.dbgJogosDblClick(Sender: TObject);
begin
  f_gerais.preencherSumula(dbgJogos.Columns[0].Field.AsString);
end;

procedure TfrmGerenciadorJogos.dbgJogosKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fraGrafico.PreencherGrafico(dbgJogos.Columns[0].Field.AsInteger);
  EstatisticasAdversario(dbgJogos.Columns[0].Field.AsInteger);
end;

procedure TfrmGerenciadorJogos.FormCreate(Sender: TObject);
begin
  lblAdverClick(nil);
  lblEstadioClick(nil);
  lblJogoClick(nil);
  lblCampeonatoClick(nil);
  lblPeriodoClick(nil);
  lblRivaisClick(nil);
end;

procedure TfrmGerenciadorJogos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      frmGerenciadorJogos.Close;
    VK_RETURN:
      btnSelecionarClick(Self);
  end;
end;

procedure TfrmGerenciadorJogos.lblAdverClick(Sender: TObject);
begin
  panSelectAdver.Enabled := not panSelectAdver.Enabled;
  panSelectAdver.Visible := not panSelectAdver.Visible;
  if panAdver.Height < panSelectAdver.Height then
  begin
    lblSetaAdver.Caption := 'p';
    lblSetaAdver.Font.Color := clRed;
    panAdver.Height := panAdver.Height + panSelectAdver.Height;
  end
  else
  begin
    lblSetaAdver.Caption := 'q';
    lblSetaAdver.Font.Color := clGreen;
    panAdver.Height := panAdver.Height - panSelectAdver.Height;
    if qryAdversarios.Active then
      qryAdversarios.Close;
    qryAdversarios.Open;
    // panAdver.SetFocus;
  end;

end;

procedure TfrmGerenciadorJogos.lblCampeonatoClick(Sender: TObject);
begin
  panSelectCampeonato.Enabled := not panSelectCampeonato.Enabled;
  panSelectCampeonato.Visible := not panSelectCampeonato.Visible;
  if panCampeonato.Height < panSelectCampeonato.Height then
  begin
    lblSetaCampeonato.Caption := 'p';
    lblSetaCampeonato.Font.Color := clRed;
    panCampeonato.Height := panCampeonato.Height + panSelectCampeonato.Height;
  end
  else
  begin
    lblSetaCampeonato.Caption := 'q';
    lblSetaCampeonato.Font.Color := clGreen;
    panCampeonato.Height := panCampeonato.Height - panSelectCampeonato.Height;
    if qryCampeonatos.Active then
      qryCampeonatos.Close;
    qryCampeonatos.Open;
    // panCampeonato.SetFocus;
  end;

end;

procedure TfrmGerenciadorJogos.lblEstadioClick(Sender: TObject);
begin
  panSelectEstadio.Enabled := not panSelectEstadio.Enabled;
  panSelectEstadio.Visible := not panSelectEstadio.Visible;
  if panEstadio.Height < panSelectEstadio.Height then
  begin
    lblSetaEstadio.Caption := 'p';
    lblSetaEstadio.Font.Color := clRed;
    panEstadio.Height := panEstadio.Height + panSelectEstadio.Height;
  end
  else
  begin
    lblSetaEstadio.Caption := 'q';
    lblSetaEstadio.Font.Color := clGreen;
    panEstadio.Height := panEstadio.Height - panSelectEstadio.Height;
    if qryEstadios.Active then
      qryEstadios.Close;
    qryEstadios.Open;
    // panEstadio.SetFocus;
  end;

end;

procedure TfrmGerenciadorJogos.lblJogoClick(Sender: TObject);
begin
  panSelectJogo.Enabled := not panSelectJogo.Enabled;
  panSelectJogo.Visible := not panSelectJogo.Visible;
  if panJogo.Height < panSelectJogo.Height then
  begin
    lblSetaJogo.Caption := 'p';
    lblSetaJogo.Font.Color := clRed;
    panJogo.Height := panJogo.Height + panSelectJogo.Height;
  end
  else
  begin
    lblSetaJogo.Caption := 'q';
    lblSetaJogo.Font.Color := clGreen;
    panJogo.Height := panJogo.Height - panSelectJogo.Height;
    // panJogo.SetFocus;
  end;

end;

procedure TfrmGerenciadorJogos.lblPeriodoClick(Sender: TObject);
begin
  panSelectPeriodo.Enabled := not panSelectPeriodo.Enabled;
  panSelectPeriodo.Visible := not panSelectPeriodo.Visible;
  if panPeriodo.Height < panSelectPeriodo.Height then
  begin
    lblSetaPeriodo.Caption := 'p';
    lblSetaPeriodo.Font.Color := clRed;
    panPeriodo.Height := panPeriodo.Height + panSelectPeriodo.Height;
  end
  else
  begin
    lblSetaPeriodo.Caption := 'q';
    lblSetaPeriodo.Font.Color := clGreen;
    panPeriodo.Height := panPeriodo.Height - panSelectPeriodo.Height;
    // panPeriodo.SetFocus;
  end;

end;

procedure TfrmGerenciadorJogos.lblRivaisClick(Sender: TObject);
begin
  panSelectRivais.Enabled := not panSelectRivais.Enabled;
  panSelectRivais.Visible := not panSelectRivais.Visible;
  if panRivais.Height < panSelectRivais.Height then
  begin
    lblSetaRivais.Caption := 'p';
    lblSetaRivais.Font.Color := clRed;
    panRivais.Height := panRivais.Height + panSelectRivais.Height;
  end
  else
  begin
    lblSetaRivais.Caption := 'q';
    lblSetaRivais.Font.Color := clGreen;
    panRivais.Height := panRivais.Height - panSelectRivais.Height;
    // panRivais.SetFocus;
  end;
end;

procedure TfrmGerenciadorJogos.qryJogosCalcFields(DataSet: TDataSet);
begin
  qryJogosMandante.Value := f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
    qryJogoscodadvermand.AsString);
  qryJogosVisitante.Value := f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
    qryJogoscodadvervisit.AsString);
  qryJogosCompeticao.Value := f_gerais.buscarNome('nome', 'ca_compe',
    'codcompeticao', qryJogoscodcompeticao.AsString);
end;

procedure TfrmGerenciadorJogos.VerificarSelecao;
begin
  if (edtCodJogo.Text = EmptyStr) and (not chkJogos.Checked) then
  begin
    Application.MessageBox('Codigo do jogo não informado!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if (cmbCampeonato.Text = EmptyStr) and (not chkCampeonato.Checked) then
  begin
    Application.MessageBox('Campeonato não informado!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if (cmbAdver.Text = EmptyStr) and (not chkAdver.Checked) then
  begin
    Application.MessageBox('Adversário não informado!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if (cmbEstadio.Text = EmptyStr) and (not chkEstadio.Checked) then
  begin
    Application.MessageBox('Estádio não informado!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if (edtDataIni.Text = EmptyStr) and (edtDataFim.Text = EmptyStr) and
    (not chkPeriodo.Checked) then
  begin
    Application.MessageBox('Período não informado!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
    Abort;
  end
  else
  begin
    if (not chkPeriodo.Checked) then
    begin
      if StrToDate(edtDataIni.Text) > StrToDate(edtDataFim.Text) then
      begin
        Application.MessageBox
          ('Data inicial não pode ser maior que a data final', 'ATENÇÃO',
          MB_OK + MB_ICONWARNING);
        Abort;
      end;
    end;
  end;
end;

procedure TfrmGerenciadorJogos.SelecionarJogos;
var
  SQLFiltro: String;
begin
  VerificarSelecao;
  if qryJogos.Active then
    qryJogos.Close;
  SQLFiltro := '';

  // Jogos
  if not chkJogos.Checked then
    SQLFiltro := SQLFiltro + ' AND (j.codjogo = ' + edtCodJogo.Text + ') ';

  // Campeonatos
  if not chkCampeonato.Checked then
    SQLFiltro := SQLFiltro + ' AND (j.codcompeticao = ' +
      IntToStr(cmbCampeonato.KeyValue) + ') ';

  // Adversários
  if not chkAdver.Checked then
    SQLFiltro := SQLFiltro + ' AND ((j.codadvermand = ' +
      IntToStr(cmbAdver.KeyValue) + ') OR (j.codadvervisit = ' +
      IntToStr(cmbAdver.KeyValue) + ')) ';

  // Rivias
  if not rbtTodos.Checked then
    SQLFiltro := SQLFiltro +
      ' AND ((j.codadvermand in (SELECT c.codadver FROM ca_adver c WHERE c.rival = 1)) OR (j.codadvervisit in (SELECT c.codadver FROM ca_adver c WHERE c.rival = 1))) ';

  // Estádio
  if not chkEstadio.Checked then
    SQLFiltro := SQLFiltro + ' AND (j.codestadio = ' +
      IntToStr(cmbEstadio.KeyValue) + ') ';

  // Período
  if not chkPeriodo.Checked then
    SQLFiltro := SQLFiltro + ' AND j.data BETWEEN CONVERT(' +
      f_gerais.InsereAspasSimples(FormatDateTime('yyyy-mm-dd', StrToDate(edtDataIni.Text))) + ',DATE) AND CONVERT(' +
      f_gerais.InsereAspasSimples(FormatDateTime('yyyy-mm-dd', StrToDate(edtDataFim.Text))) + ',DATE) ';

  qryJogos.SQL[10] := SQLFiltro;
  qryJogos.Open;
  fraGrafico.PreencherGrafico(dbgJogos.Columns[0].Field.AsInteger);
  EstatisticasAdversario(dbgJogos.Columns[0].Field.AsInteger);
end;

end.
