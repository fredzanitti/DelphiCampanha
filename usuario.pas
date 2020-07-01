unit usuario;

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
  TCA_USER = class(TForm)
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
    CbAdmin: TCheckBox;
    EdtSenhaOficial: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtPerfil: TDBEdit;
    EdtSenha: TEdit;
    LblMsg: TLabel;
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
    procedure MnSairClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
    procedure EdtSenhaExit(Sender: TObject);
    procedure EdtSenhaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_USER: TCA_USER;

implementation

{$R *.dfm}

uses module, funcoes, home;

procedure TCA_USER.BtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsUsuario.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_USER.BtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsUsuario.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_USER.BtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_USER') > 0 then
  begin
    FrmDm.DtsUsuario.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_USER.BtnExcluirClick(Sender: TObject);
begin

  if StrToInt(EdtCodigo.Text) = 9999 then
  begin
    Application.MessageBox('Não é possivel excluir o usuário padrão.',
      'ATENÇÃO', MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar o registro
      FrmDm.DtsUsuario.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_USER.BtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtNome.Text, 'NOME DO USUÁRIO') then
    EdtNome.SetFocus
  else
  begin
    if CbAdmin.Checked then
      EdtPerfil.Text := '0'
    else
      EdtPerfil.Text := '1';

    if EdtSenha.Text <> EmptyStr then
    begin
      EdtSenhaOficial.Text :=
        IntToStr(f_gerais.criptografarSenha(EdtSenha.Text));
    end;

    FrmDm.DtsUsuario.DataSet.Post;
    estadoDosBotoesdeCadastro();
    FrmDm.DtsUsuario.DataSet.Refresh;
  end;
end;

procedure TCA_USER.BtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsUsuario.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_USER', 'codusuario'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_USER.BtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsUsuario.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_USER.BtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsUsuario.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_USER.BtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsUsuario.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_USER.EdtNomeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_USER.EdtNomeExit(Sender: TObject);
begin
  if f_gerais.validaNomeUsuario(EdtNome) then
    EdtNome.SetFocus;
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_USER.EdtSenhaEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_USER.EdtSenhaExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_USER.estadoDosBotoesdeCadastro();
begin
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsUsuario.DataSet.State in [dsBrowse] then
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
    EdtSenha.Clear;
    EdtSenha.Enabled := false;
    CbAdmin.Enabled := false;
  end;

  if FrmDm.DtsUsuario.DataSet.State in [dsInsert, dsEdit] then
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
    EdtSenha.Enabled := true;
    CbAdmin.Enabled := true;
    CbAdmin.Checked := false;
  end;

  if EdtPerfil.Text = '0' then
    CbAdmin.Checked := true
  else
    CbAdmin.Checked := false;
end;

procedure TCA_USER.FormActivate(Sender: TObject);
begin
  if getkeystate(vk_CAPITAL) = 1 then
    LblMsg.Caption := 'ATENÇÃO! A tecla CAPS LOOK está ativada'
  else
    LblMsg.Caption := '';
end;

procedure TCA_USER.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        if FrmDm.DtsUsuario.DataSet.State in [dsInsert, dsEdit] then
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

procedure TCA_USER.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if getkeystate(vk_CAPITAL) = 1 then
    LblMsg.Caption := 'ATENÇÃO! A tecla CAPS LOOK está ativada'
  else
    LblMsg.Caption := '';
end;

procedure TCA_USER.MnCadastrarClick(Sender: TObject);
begin
  BtnIncluirClick(Self);
end;

procedure TCA_USER.MnEditarClick(Sender: TObject);
begin
  BtnEditarClick(Self);
end;

procedure TCA_USER.MnExcluirClick(Sender: TObject);
begin
  BtnExcluirClick(Self);
end;

procedure TCA_USER.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsUsuario.DataSet.State in [dsInsert, dsEdit] then
    BtnCancelarClick(Self)
  else
    CA_USER.Close;
end;

end.




