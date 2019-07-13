unit SelRelatorioAdversario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  frameSelecionarClube, relTodosClubes, frameSelecionarNacionalidade,
  frameSelecionarEstado;

type
  TfrmSelRelatorioAdversario = class(TForm)
    fraSelecionarClube: TfraSelecionarClube;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    fraSelNacionalidade: TfraSelNacionalidade;
    fraSelUf: TfraSelUf;
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure fraSelNacionalidadedblPaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelatorioAdversario: TfrmSelRelatorioAdversario;

implementation

{$R *.dfm}

procedure TfrmSelRelatorioAdversario.BtnCancelarClick(Sender: TObject);
begin
  frmSelRelatorioAdversario.Close;
end;

procedure TfrmSelRelatorioAdversario.BtnGravarClick(Sender: TObject);
var
  sql: String;
begin

  sql := 'SELECT ca_adver.nome as Clube, ca_cidad.nome as Cidade, ca_pais.nome as Pais, '
    + 'ca_adver.escudo as Escudo, ca_pais.bandeira as Bandeira FROM ca_adver ' +
    'INNER JOIN ca_cidad ON ca_cidad.CodCidade = ca_adver.CodCidade ' +
    'INNER JOIN ca_pais ON ca_cidad.codpais = ca_pais.codpais ' +
    'INNER JOIN ca_uf ON ca_cidad.coduf = ca_uf.coduf ' +
    'WHERE ((:TODOSCLUBES <> 0) OR (ca_adver.codadver = :CODADVER)) ' +
    'AND ((:TODOSPAISES <> 0) OR (ca_pais.codpais = :CODIGOPAIS)) ' +
    'AND ((:TODOSESTADOS <> 0) OR (ca_uf.coduf = :CODIGOUF)) ' +
    'ORDER BY ca_adver.nome, ca_pais.nome ';

  frmRelAdversarios.qryClubes.Close;
  frmRelAdversarios.qryClubes.sql.Clear;
  frmRelAdversarios.qryClubes.sql.Add(sql);

  // filtra clubes
  if fraSelecionarClube.chbTodos.Checked then
  begin
    frmRelAdversarios.qryClubes.Params.ParamByName('TODOSCLUBES')
      .AsInteger := 1;
    frmRelAdversarios.qryClubes.Params.ParamByName('CODADVER').AsInteger := 0;
  end
  else
  begin
    frmRelAdversarios.qryClubes.Params.ParamByName('TODOSCLUBES')
      .AsInteger := 0;
    frmRelAdversarios.qryClubes.Params.ParamByName('CODADVER').AsInteger :=
      fraSelecionarClube.CodigoAdversario;
  end;

  // filtra nacionalidade
  if fraSelNacionalidade.chbTodos.Checked then
  begin
    frmRelAdversarios.qryClubes.Params.ParamByName('TODOSPAISES')
      .AsInteger := 1;
    frmRelAdversarios.qryClubes.Params.ParamByName('CODIGOPAIS').AsInteger := 0;
  end
  else
  begin
    frmRelAdversarios.qryClubes.Params.ParamByName('TODOSPAISES')
      .AsInteger := 0;
    frmRelAdversarios.qryClubes.Params.ParamByName('CODIGOPAIS').AsInteger :=
      fraSelNacionalidade.CodigoPais;
  end;

  // filtra estados
  if fraSelUf.chbTodos.Checked then
  begin
    frmRelAdversarios.qryClubes.Params.ParamByName('TODOSESTADOS')
      .AsInteger := 1;
    frmRelAdversarios.qryClubes.Params.ParamByName('CODIGOUF').AsInteger := 0;
  end
  else
  begin
    frmRelAdversarios.qryClubes.Params.ParamByName('TODOSESTADOS')
      .AsInteger := 0;
    frmRelAdversarios.qryClubes.Params.ParamByName('CODIGOUF').AsInteger :=
      fraSelUf.CodigoUF;
  end;

  frmRelAdversarios.qryClubes.Open;
  if frmRelAdversarios.qryClubes.RecordCount = 0 then
    Application.MessageBox('Nenhuma informação para esta seleção de dados!',
      'ATENÇÃO', MB_OK + MB_ICONWARNING)
  else
  begin
    frmRelAdversarios.frxRelClubes.PrepareReport();
    frmRelAdversarios.frxRelClubes.ShowPreparedReport;
  end;

end;

procedure TfrmSelRelatorioAdversario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      frmSelRelatorioAdversario.Close;
  end;
end;

procedure TfrmSelRelatorioAdversario.fraSelNacionalidadedblPaisClick
  (Sender: TObject);
begin
  fraSelNacionalidade.dblPaisClick(Sender);
  if fraSelNacionalidade.CodigoPais = 29 then
    fraSelUf.Visible := true
  else
  begin
    fraSelUf.chbTodos.Checked := true;
    fraSelUf.dblEstado.KeyValue := -1;
    fraSelUf.Visible := false;
  end;
end;

end.
