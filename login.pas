unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Th_login = class(TForm)
    LblMsg: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    ShQuadro: TShape;
    procedure FormActivate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCancelarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtUsuarioEnter(Sender: TObject);
    procedure EdtUsuarioExit(Sender: TObject);
    procedure EdtSenhaExit(Sender: TObject);
    procedure EdtSenhaEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtivaCapsLook();
  end;

var
  h_login: Th_login;

implementation

{$R *.dfm}

uses funcoes, home, splash, module;

procedure Th_login.BtnCancelarClick(Sender: TObject);
begin
  FrmPrincipal.indicador := 'N';
  Application.Terminate;
end;

procedure Th_login.BtnCancelarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        BtnCancelarClick(Self);
      end;
  end;
end;

procedure Th_login.BtnGravarClick(Sender: TObject);
begin
  FrmPrincipal.indicador := 'S';
  { testa se os campos usuario e senha estão em branco }
  if (EdtUsuario.Text = EmptyStr) and (EdtSenha.Text = EmptyStr) then
    Application.MessageBox
      ('Usuário ou senha não preenchidos. Esses campos não podem ficar em branco, favor preencher corretamente seu nome de usuário e senha e tentar efetuar o login novamente.',
      'CAMPO OBRIGATÓRIO', MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    { compara o nome do usuário digitado para verificar se existe na tabela de usuários }
    if f_gerais.buscarNome('nome', 'ca_user', 'nome', EdtUsuario.Text) <>
      EdtUsuario.Text then
    begin
      Application.MessageBox('Nome de usuário incorreto ou não cadastrado',
        'ERRO DE LOGIN', MB_OK + MB_ICONERROR);
      EdtUsuario.SetFocus;
    end
    else
    begin
      { compara senha digitado com a armazenada no banco de dados }
      if StrToInt(f_gerais.buscarNome('senha', 'ca_user', 'nome',
        EdtUsuario.Text)) = f_gerais.criptografarSenha(EdtSenha.Text) then
      begin
        FrmPrincipal.codigousuario :=
          StrToInt(f_gerais.buscarNome('codusuario', 'ca_user', 'nome',
          EdtUsuario.Text));
        FrmPrincipal.StbSistema.Panels[3].Text :=
          AnsiUpperCase(EdtUsuario.Text);

        f_gerais.ultimoBackup(FrmPrincipal.LblUltimoBackup);

        if StrToInt(f_gerais.buscarNome('perfil', 'ca_user', 'codusuario',
          IntToStr(FrmPrincipal.codigousuario))) = 0 then
          FrmPrincipal.StbSistema.Panels[4].Text := 'Perfil: Administrador'
        else
          FrmPrincipal.StbSistema.Panels[4].Text := 'Perfil: Usuário';

        h_login.Close;
      end
      else
      begin
        Application.MessageBox('Senha incorreta!', 'ERRO DE LOGIN',
          MB_OK + MB_ICONERROR);
        EdtSenha.Clear;
        EdtSenha.SetFocus;
      end;
    end;
  end;
end;

procedure Th_login.EdtSenhaEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure Th_login.EdtSenhaExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure Th_login.EdtUsuarioEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure Th_login.EdtUsuarioExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure Th_login.FormActivate(Sender: TObject);
begin
  EdtUsuario.SetFocus;

  AtivaCapsLook();
end;

procedure Th_login.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
    VK_ESCAPE:
      begin
        BtnCancelarClick(Self);
      end;
  end;
end;

procedure Th_login.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  AtivaCapsLook();
end;

procedure Th_login.AtivaCapsLook();
begin
  if getkeystate(vk_CAPITAL) = 1 then
  begin
    LblMsg.Caption := 'ATENÇÃO! A tecla CAPS LOOK está ativada';
    ShQuadro.Visible := true;
  end
  else
  begin
    LblMsg.Caption := '';
    ShQuadro.Visible := false;
  end;
end;

end.


