unit restore;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellApi,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmRestore = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtOrigem: TEdit;
    BtnDestino: TBitBtn;
    EdtRestaurar: TEdit;
    MemScript: TMemo;
    BtnGerar: TBitBtn;
    BtnSalvar: TBitBtn;
    ChkEscudos: TCheckBox;
    ChkJogadores: TCheckBox;
    ChkBandPais: TCheckBox;
    ChkBandUf: TCheckBox;
    EdtUser: TEdit;
    Label4: TLabel;
    EdtSenha: TEdit;
    Label5: TLabel;
    EdtInstancia: TEdit;
    Label6: TLabel;
    OpenDialog1: TOpenDialog;
    ChkFornecedores: TCheckBox;
    ChkPatrocinadores: TCheckBox;
    ChkUniformes: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure BtnDestinoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRestore: TFrmRestore;

implementation

{$R *.dfm}

uses funcoes;

procedure TFrmRestore.BtnDestinoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EdtOrigem.Text := OpenDialog1.FileName;
end;

procedure TFrmRestore.BtnGerarClick(Sender: TObject);
var
  dir: String;
begin
  dir := ExtractFileDir(EdtOrigem.Text);
  if EdtOrigem.Text = EmptyStr then
    Application.MessageBox
      ('É necessário selecionar o diretório onde se encontra o backup',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtUser.Text, 'USUÁRIO') then
    begin
      EdtUser.SetFocus;
    end
    else
    begin
      if f_gerais.verificarStringEmBranco(EdtInstancia.Text,
        'INSTÂNCIA DO BANCO') then
      begin
        EdtInstancia.SetFocus;
      end
      else
      begin
        MemScript.Clear;
        MemScript.Lines.Add('@echo off');
        MemScript.Lines.Add('color 17');
        MemScript.Lines.Add('title REALIZANDO RESTORE, AGUARDE...');
        MemScript.Lines.Add(Copy(EdtOrigem.Text, 1, 1) + ':');
        MemScript.Lines.Add('cd ' + dir);
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo Verificando diretorios...');

        if ChkEscudos.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Escudos');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + dir + '\Escudos\*.*" "' +
            EdtRestaurar.Text + '\Escudos\" ');
          MemScript.Lines.Add('echo.');
        end;

        if ChkPatrocinadores.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Patrocinadores');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + dir +
            '\Patrocinadores\*.*" "' + EdtRestaurar.Text +
            '\Patrocinadores\" ');
          MemScript.Lines.Add('echo.');
        end;

        if ChkFornecedores.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Fornecedores');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + dir + '\Fornecedores\*.*" "'
            + EdtRestaurar.Text + '\Fornecedores\" ');
          MemScript.Lines.Add('echo.');
        end;

        if ChkUniformes.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Uniformes');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + dir + '\Uniformes\*.*" "' +
            EdtRestaurar.Text + '\Uniformes\" ');
          MemScript.Lines.Add('echo.');
        end;

        if ChkJogadores.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Jogadores');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + dir + '\Jogadores\*.*" "' +
            EdtRestaurar.Text + '\Jogadores\" ');
          MemScript.Lines.Add('echo.');
        end;

        if ChkBandPais.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Bandeira dos Paises');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + dir +
            '\BandeiraPaises\*.*" "' + EdtRestaurar.Text +
            '\BandeiraPaises\" ');
          MemScript.Lines.Add('echo.');
        end;

        if ChkBandPais.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Bandeira dos Estados');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + dir + '\BandeiraUF\*.*" "' +
            EdtRestaurar.Text + '\BandeiraUF\" ');
          MemScript.Lines.Add('echo.');
        end;

        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo Realizando restore do banco de dados...');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
        MemScript.Lines.Add(Copy(EdtRestaurar.Text, 1, 1) + ':');
        MemScript.Lines.Add('cd ' + EdtRestaurar.Text + '\backup\');
        MemScript.Lines.Add('mysql -u ' + EdtUser.Text + ' -p' + EdtSenha.Text +
          ' ' + EdtInstancia.Text + ' < "' + EdtOrigem.Text + '"');

        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('title RESTORE REALIZADO COM SUCESSO');
        MemScript.Lines.Add('echo RESTORE REALIZADO COM SUCESSO');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('pause');

        MemScript.Visible := true;
        BtnSalvar.Enabled := true;
      end;
    end;
  end;
end;

procedure TFrmRestore.BtnSalvarClick(Sender: TObject);
begin
  MemScript.Lines.SaveToFile(EdtRestaurar.Text + '\backup\restore.bat');
  if FileExists(EdtRestaurar.Text + '\backup\restore.bat') then
  begin
    Application.MessageBox
      ('Script salvo com sucesso! O restore será iniciado e o sistema será fechado.',
      'RESTORE', MB_OK + MB_ICONINFORMATION);

    ShellExecute(Application.Handle, 'open',
      PChar(EdtRestaurar.Text + '\backup\restore.bat'), nil, nil, SW_NORMAL);
    FrmRestore.Close;
    Application.Terminate;
  end
  else
    Application.MessageBox('Problemas ao salvar o script!', 'RESTORE',
      MB_OK + MB_ICONEXCLAMATION);
end;

procedure TFrmRestore.FormActivate(Sender: TObject);
begin
  BtnSalvar.Enabled := false;
  ChkEscudos.Checked := true;
  ChkJogadores.Checked := true;
  ChkBandPais.Checked := true;
  ChkBandUf.Checked := true;
  ChkPatrocinadores.Checked := true;
  ChkFornecedores.Checked := true;
  ChkUniformes.Checked := true;
  EdtUser.Text := 'root';
  EdtSenha.Text := 'root';
  EdtInstancia.Text := 'zanittic_software';
end;

procedure TFrmRestore.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        FrmRestore.Close;
      end;
  end;
end;

end.
