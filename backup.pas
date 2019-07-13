unit backup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellApi,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.FileCtrl;

const
  SELDIRHELP = 1000;

type
  TFrmBackup = class(TForm)
    EdtDestino: TEdit;
    Label1: TLabel;
    BtnDestino: TBitBtn;
    EdtOrigem: TEdit;
    Label2: TLabel;
    MemScript: TMemo;
    BtnGerar: TBitBtn;
    BtnSalvar: TBitBtn;
    ChkEscudos: TCheckBox;
    ChkJogadores: TCheckBox;
    ChkBandPais: TCheckBox;
    ChkBandUf: TCheckBox;
    Label3: TLabel;
    EdtUser: TEdit;
    Label4: TLabel;
    EdtSenha: TEdit;
    Label5: TLabel;
    EdtInstancia: TEdit;
    Label6: TLabel;
    ChkFornecedores: TCheckBox;
    ChkPatrocinadores: TCheckBox;
    ChkUniformes: TCheckBox;
    procedure BtnDestinoClick(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBackup: TFrmBackup;

implementation

{$R *.dfm}

uses home, funcoes, module;

procedure TFrmBackup.BtnGerarClick(Sender: TObject);
begin
  if EdtDestino.Text = EmptyStr then
    Application.MessageBox('É necessário selecionar o diretório de destino',
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
        MemScript.Lines.Add('title REALIZANDO BACKUP, AGUARDE...');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo Verificando diretorios...');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
        MemScript.Lines.Add(Copy(EdtDestino.Text, 1, 1) + ':');
        MemScript.Lines.Add('cd ' + EdtDestino.Text);
        MemScript.Lines.Add('md BackupCampanha');
        MemScript.Lines.Add('cd ' + EdtDestino.Text + '\BackupCampanha');

        if ChkEscudos.Checked then
          MemScript.Lines.Add('md Escudos');
        if ChkJogadores.Checked then
          MemScript.Lines.Add('md Jogadores');
        if ChkBandPais.Checked then
          MemScript.Lines.Add('md BandeiraPaises');
        if ChkBandUf.Checked then
          MemScript.Lines.Add('md BandeiraUF');
        if ChkPatrocinadores.Checked then
          MemScript.Lines.Add('md Patrocinadores');
        if ChkFornecedores.Checked then
          MemScript.Lines.Add('md Fornecedores');
        if ChkUniformes.Checked then
          MemScript.Lines.Add('md Uniformes');

        if ChkEscudos.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Escudos');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + EdtOrigem.Text +
            'Escudos\*.*" "' + EdtDestino.Text + '\BackupCampanha\Escudos\"');
        end;

        if ChkPatrocinadores.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Patrocinadores');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + EdtOrigem.Text +
            'Patrocinadores\*.*" "' + EdtDestino.Text +
            '\BackupCampanha\Patrocinadores\"');
        end;

        if ChkFornecedores.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Fornecedores');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + EdtOrigem.Text +
            'Fornecedores\*.*" "' + EdtDestino.Text +
            '\BackupCampanha\Fornecedores\"');
        end;

        if ChkUniformes.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Uniformes');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + EdtOrigem.Text +
            'Uniformes\*.*" "' + EdtDestino.Text +
            '\BackupCampanha\Uniformes\"');
        end;

        if ChkJogadores.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Jogadores');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + EdtOrigem.Text +
            'Jogadores\*.*" "' + EdtDestino.Text +
            '\BackupCampanha\Jogadores\"');
        end;

        if ChkBandPais.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Bandeira dos Paises');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + EdtOrigem.Text +
            'BandeiraPaises\*.*" "' + EdtDestino.Text +
            '\BackupCampanha\BandeiraPaises\"');
        end;

        if ChkBandUf.Checked then
        begin
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('echo Copiando arquivos... Bandeira dos Estados');
          MemScript.Lines.Add('echo.');
          MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
          MemScript.Lines.Add('xcopy /S /E /Y "' + EdtOrigem.Text +
            'BandeiraUF\*.*" "' + EdtDestino.Text +
            '\BackupCampanha\BandeiraUF\"');
        end;

        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo Realizando backup do banco de dados...');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('ping -n 3 127.0.0.1 > nul');
        MemScript.Lines.Add(Copy(EdtOrigem.Text, 1, 1) + ':');
        MemScript.Lines.Add('cd ' + EdtOrigem.Text + 'backup');
        MemScript.Lines.Add
          ('mysqldump --lock-tables --hex-blob -h localhost -u ' + EdtUser.Text
          + ' -p' + EdtSenha.Text + ' ' + EdtInstancia.Text + ' > "' +
          EdtDestino.Text +
          '\BackupCampanha\bkp%date:~0,2%_%date:~3,2%_%date:~6,10%.sql"');

        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('title BACKUP REALIZADO COM SUCESSO');
        MemScript.Lines.Add('echo BACKUP REALIZADO COM SUCESSO');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('echo.');
        MemScript.Lines.Add('pause');
        MemScript.Visible := true;
        BtnSalvar.Enabled := true;
      end;
    end;
  end;
end;

procedure TFrmBackup.BtnSalvarClick(Sender: TObject);
var
  sql: String;
begin
  MemScript.Lines.SaveToFile(EdtOrigem.Text + '\backup\backup.bat');
  if FileExists(EdtOrigem.Text + '\backup\backup.bat') then
  begin
    Application.MessageBox('Script salvo com sucesso! O backup será iniciado.',
      'BACKUP', MB_OK + MB_ICONINFORMATION);

    ShellExecute(Application.Handle, 'open',
      PChar(EdtOrigem.Text + '\backup\backup.bat'), nil, nil, SW_NORMAL);

    sql := 'insert into ca_backup values (:ID, :TIPO, :DATA)';

    FrmDm.QrBackup.Close;
    FrmDm.QrBackup.sql.Clear;
    FrmDm.QrBackup.sql.Add(sql);
    FrmDm.QrBackup.Params.ParamByName('ID').AsInteger :=
      f_gerais.novoCodigo('ca_backup', 'id_backup');
    FrmDm.QrBackup.Params.ParamByName('TIPO').AsString := 'B';
    FrmDm.QrBackup.Params.ParamByName('DATA').AsDate := now;
    FrmDm.QrBackup.ExecSQL;

    f_gerais.ultimoBackup(FrmPrincipal.LblUltimoBackup);

    FrmBackup.Close;
  end
  else
    Application.MessageBox('Problemas ao salvar o Script!', 'BACKUP',
      MB_OK + MB_ICONEXCLAMATION);
end;

procedure TFrmBackup.BtnDestinoClick(Sender: TObject);
var
  SelDir: String;
begin
  if SelectDirectory(SelDir, [sdAllowCreate, sdPerformCreate, sdPrompt],
    SELDIRHELP) then
    EdtDestino.Text := SelDir + '\';
end;

procedure TFrmBackup.FormActivate(Sender: TObject);
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

procedure TFrmBackup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        FrmBackup.Close;
      end;
  end;
end;

end.
