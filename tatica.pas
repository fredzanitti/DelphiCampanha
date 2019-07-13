unit tatica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, jpeg, Vcl.Buttons, Vcl.ExtDlgs, Vcl.Menus;

type
  TCA_TATIC = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BtnCancelar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnEditar: TBitBtn;
    BtnIncluir: TBitBtn;
    BtnUltimo: TBitBtn;
    BtnProximo: TBitBtn;
    BtnAnterior: TBitBtn;
    BtnPrimeiro: TBitBtn;
    BtnGravar: TBitBtn;
    EdtCodigo: TDBEdit;
    EdtNome: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_TATIC: TCA_TATIC;
  sql: String;

implementation

{$R *.dfm}

uses module, funcoes, home;

procedure TCA_TATIC.BtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsTatica.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_TATIC.BtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsTatica.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_TATIC.BtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_TATIC') > 0 then
  begin
    FrmDm.DtsTatica.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_TATIC.BtnExcluirClick(Sender: TObject);
begin
  sql := 'select count(*) from CA_JOGOS where codtatica = :CODIGO';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString := EdtCodigo.Text;
  FrmDm.QrGeral.Open;

  if FrmDm.QrGeral.Fields[0].AsInteger > 0 then
  begin
    Application.MessageBox('Impossível excluir, pois existem jogos cadastrados '
      + #13 + 'em que utilizam este esquema tático.', 'ATENÇÃO',
      MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar o registro do clube
      FrmDm.DtsTatica.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_TATIC.BtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtNome.Text,
    'DESCRIÇÃO DO ESQUEMA TÁTICO') then
    EdtNome.SetFocus
  else
  begin
    FrmDm.DtsTatica.DataSet.Post;
    estadoDosBotoesdeCadastro();
    FrmDm.DtsTatica.DataSet.Refresh;
  end;
end;

procedure TCA_TATIC.BtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsTatica.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_TATIC', 'codtatica'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_TATIC.BtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsTatica.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_TATIC.BtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsTatica.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_TATIC.BtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsTatica.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_TATIC.EdtNomeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_TATIC.EdtNomeExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_TATIC.estadoDosBotoesdeCadastro();
begin
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsTatica.DataSet.State in [dsBrowse] then
  begin
    // botões
    BtnPrimeiro.Enabled := true;
    BtnAnterior.Enabled := true;
    BtnProximo.Enabled := true;
    BtnUltimo.Enabled := true;
    BtnIncluir.Enabled := true;
    MnCadastrar.Enabled := true;
    BtnEditar.Enabled := true;
    MnEditar.Enabled := true;
    BtnExcluir.Enabled := true;
    MnExcluir.Enabled := true;
    BtnGravar.Enabled := false;
    BtnCancelar.Enabled := false;
    // demais componentes
    EdtNome.Enabled := false;
  end;

  if FrmDm.DtsTatica.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    BtnPrimeiro.Enabled := false;
    BtnAnterior.Enabled := false;
    BtnProximo.Enabled := false;
    BtnUltimo.Enabled := false;
    BtnIncluir.Enabled := false;
    MnCadastrar.Enabled := false;
    BtnEditar.Enabled := false;
    MnEditar.Enabled := false;
    BtnExcluir.Enabled := false;
    MnExcluir.Enabled := false;
    BtnGravar.Enabled := true;
    BtnCancelar.Enabled := true;
    // demais componentes
    EdtNome.Enabled := true;
    EdtNome.SetFocus;
  end;
end;

procedure TCA_TATIC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        BtnIncluirClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsTatica.DataSet.State in [dsInsert, dsEdit] then
          BtnCancelarClick(Self)
        else
          MnSairClick(Self);
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

procedure TCA_TATIC.MnCadastrarClick(Sender: TObject);
begin
  BtnIncluirClick(Self);
end;

procedure TCA_TATIC.MnEditarClick(Sender: TObject);
begin
  BtnEditarClick(Self);
end;

procedure TCA_TATIC.MnExcluirClick(Sender: TObject);
begin
  BtnExcluirClick(Self);
end;

procedure TCA_TATIC.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsTatica.DataSet.State in [dsInsert, dsEdit] then
    BtnCancelarClick(Self)
  else
    CA_TATIC.Close;
end;

end.
