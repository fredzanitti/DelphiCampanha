unit patrocinadores;

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
  FireDAC.Comp.UI, jpeg, Vcl.Buttons, Vcl.ExtDlgs, Vcl.Menus, Vcl.ComCtrls;

type
  TCA_PATROC = class(TForm)
    Label5: TLabel;
    Label3: TLabel;
    EdtLogoPatroc: TDBEdit;
    BtnPesquisar: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnEditar: TBitBtn;
    BtnIncluir: TBitBtn;
    BtnUltimo: TBitBtn;
    BtnProximo: TBitBtn;
    BtnAnterior: TBitBtn;
    BtnPrimeiro: TBitBtn;
    BtnGravar: TBitBtn;
    GroupBox1: TGroupBox;
    ImgBandPaisAdver: TImage;
    LblCidade: TLabel;
    ImgUfAdver: TImage;
    LblPais: TLabel;
    LblUf: TLabel;
    BtnLocCidade: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ImgLogoAdver: TImage;
    Label4: TLabel;
    Label6: TLabel;
    EdtCodigo: TDBEdit;
    EdtNomePatroc: TDBEdit;
    BtnEscolherFoto: TBitBtn;
    DataIni: TDateTimePicker;
    EdtDtIni: TDBEdit;
    DataFim: TDateTimePicker;
    EdtDtFim: TDBEdit;
    EdtCidade: TDBEdit;
    OpenLogo: TOpenPictureDialog;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnLocCidadeClick(Sender: TObject);
    procedure BtnEscolherFotoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure DataIniChange(Sender: TObject);
    procedure DataFimChange(Sender: TObject);
    procedure EdtDtIniExit(Sender: TObject);
    procedure EdtDtIniEnter(Sender: TObject);
    procedure EdtDtFimEnter(Sender: TObject);
    procedure EdtNomePatrocEnter(Sender: TObject);
    procedure EdtNomePatrocExit(Sender: TObject);
    procedure EdtDtFimExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_PATROC: TCA_PATROC;
  NomeArquivo, NomeArquivoAnterior: String;
  caminho: String;

implementation

{$R *.dfm}

uses module, funcoes, pesquisacidades, pesquisapatrocinador;

procedure TCA_PATROC.BtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsPatroc.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_PATROC.BtnCancelarClick(Sender: TObject);
begin
  EdtCodigo.Clear;
  FrmDm.DtsPatroc.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_PATROC.BtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_PATROC') > 0 then
  begin
    FrmDm.DtsPatroc.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_PATROC.BtnEscolherFotoClick(Sender: TObject);
begin
  NomeArquivoAnterior := EdtLogoPatroc.Text;
  if OpenLogo.Execute then
  begin
    NomeArquivo := OpenLogo.FileName;
    f_gerais.buscaImagem(ImgLogoAdver, NomeArquivo);
    EdtLogoPatroc.Text := PChar(caminho + FormatFloat('00000',
      StrToFloat(EdtCodigo.Text)) + ExtractFileExt(OpenLogo.FileName));
  end;
end;

procedure TCA_PATROC.BtnExcluirClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_PATROC') > 0 then
  begin
      if f_gerais.desejaRealizarAcao('excluir o registro?') then
      begin
        // deletar o escudo do patrocinador
        f_gerais.deletarImagens(EdtLogoPatroc.Text);
        // deletar o registro do patrocinador
        FrmDm.DtsPatroc.DataSet.Delete;
        // restaurar bandeiras e estado dos botões
        estadoDosBotoesdeCadastro();
      end;
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_PATROC.BtnGravarClick(Sender: TObject);
begin
  if StrToDate(EdtDtFim.Text) < StrToDate(EdtDtIni.Text) then
  begin
    Application.MessageBox('Data final não pode ser menor que a data inicial.',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtNomePatroc.Text, 'NOME PATROCINADOR')
    then
      EdtNomePatroc.SetFocus
    else
    begin
      if f_gerais.verificarStringEmBranco(EdtCidade.Text, 'CIDADE') then
        BtnLocCidadeClick(Self)
      else
      begin
        if f_gerais.verificarStringEmBranco(EdtLogoPatroc.Text, 'LOGOMARCA')
        then
          BtnEscolherFotoClick(Self)
        else
        begin
          CopyFile(PChar(NomeArquivo),
            PChar(caminho + FormatFloat('00000', StrToFloat(EdtCodigo.Text)) +
            ExtractFileExt(OpenLogo.FileName)), false);
          FrmDm.DtsPatroc.DataSet.Post;

          if NomeArquivoAnterior <> EdtLogoPatroc.Text then
            f_gerais.deletarImagens(NomeArquivoAnterior);

          estadoDosBotoesdeCadastro();
          FrmDm.DtsPatroc.DataSet.Refresh;
        end;
      end;
    end;
  end;
end;

procedure TCA_PATROC.BtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsPatroc.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_PATROC', 'codpatroc'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_PATROC.BtnLocCidadeClick(Sender: TObject);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaCidade(h_cidades.DbGridCidades, 'TODOS');
  h_cidades.identificacao := 'CA_PATROC';
  h_cidades.ShowModal;
end;

procedure TCA_PATROC.BtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaPatroc(h_patrocinador.DbGridPatroc, 'TODOS');
  h_patrocinador.identificacao := 'CA_PATROC';
  h_patrocinador.ShowModal;
end;

procedure TCA_PATROC.BtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsPatroc.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_PATROC.BtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsPatroc.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_PATROC.BtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsPatroc.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_PATROC.DataFimChange(Sender: TObject);
begin
  EdtDtFim.Text := DateToStr(DataFim.Date);
end;

procedure TCA_PATROC.DataIniChange(Sender: TObject);
begin
  EdtDtIni.Text := DateToStr(DataIni.Date);
end;

procedure TCA_PATROC.EdtDtFimEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_PATROC.EdtDtFimExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
  EdtDtFim.Text := f_gerais.retornaData(EdtDtFim.Text);
end;

procedure TCA_PATROC.EdtDtIniEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_PATROC.EdtDtIniExit(Sender: TObject);
var
  erro: boolean;
begin
  f_gerais.MudaCor('Sai', Sender);
  EdtDtIni.Text := f_gerais.retornaData(EdtDtIni.Text);
end;

procedure TCA_PATROC.EdtNomePatrocEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_PATROC.EdtNomePatrocExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_PATROC.estadoDosBotoesdeCadastro();
begin
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsPatroc.DataSet.State in [dsBrowse] then
  begin
    // botões
    BtnPrimeiro.Enabled := True;
    BtnAnterior.Enabled := True;
    BtnProximo.Enabled := True;
    BtnUltimo.Enabled := True;
    BtnIncluir.Enabled := True;
    MnCadastrar.Enabled := True;
    BtnEditar.Enabled := True;
    MnEditar.Enabled := True;
    BtnExcluir.Enabled := True;
    MnExcluir.Enabled := True;
    BtnGravar.Enabled := false;
    BtnCancelar.Enabled := false;
    BtnLocCidade.Enabled := false;
    BtnEscolherFoto.Enabled := false;
    BtnPesquisar.Enabled := True;
    // demais componentes
    EdtNomePatroc.Enabled := false;
    EdtDtIni.Enabled := false;
    EdtDtFim.Enabled := false;
  end;

  if FrmDm.DtsPatroc.DataSet.State in [dsInsert, dsEdit] then
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
    BtnGravar.Enabled := True;
    BtnCancelar.Enabled := True;
    BtnLocCidade.Enabled := True;
    BtnEscolherFoto.Enabled := True;
    BtnPesquisar.Enabled := false;
    // demais componentes
    EdtNomePatroc.Enabled := True;
    EdtNomePatroc.SetFocus;
    EdtDtIni.Enabled := True;
    EdtDtFim.Enabled := True;
  end;

  // buscar logo do adversário
  f_gerais.buscaImagem(ImgLogoAdver, EdtLogoPatroc.Text);

  // buscar bandeiras do Pais e UF
  f_gerais.buscaBandeiras(ImgBandPaisAdver, ImgUfAdver, EdtCidade.Text,
    LblCidade, LblPais, LblUf);

  // inibir pesquisa se o cadastro de jogos estiver ativo
  if FrmDm.DtsJogos.DataSet.State in [dsInsert, dsEdit] then
    BtnPesquisar.Enabled := false;

end;

procedure TCA_PATROC.FormActivate(Sender: TObject);
begin
  estadoDosBotoesdeCadastro();
  if f_gerais.contadorRegistros('ca_patroc') = 0 then
  begin
    LblCidade.Caption := EmptyStr;
    LblPais.Caption := EmptyStr;
    LblUf.Caption := EmptyStr;
  end;
  caminho :=
    'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Patrocinadores\PATRO_';

end;

procedure TCA_PATROC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FrmDm.DtsPatroc.DataSet.State in [dsInsert, dsEdit] then
    BtnCancelarClick(Self);
end;

procedure TCA_PATROC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        BtnIncluirClick(Self);
      end;
    VK_F10:
      begin
        BtnPesquisarClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsPatroc.DataSet.State in [dsInsert, dsEdit] then
          BtnCancelarClick(Self)
        else
          CA_PATROC.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

procedure TCA_PATROC.MnCadastrarClick(Sender: TObject);
begin
  BtnIncluirClick(Self);
end;

procedure TCA_PATROC.MnEditarClick(Sender: TObject);
begin
  BtnEditarClick(Self);
end;

procedure TCA_PATROC.MnExcluirClick(Sender: TObject);
begin
  BtnExcluirClick(Self);
end;

procedure TCA_PATROC.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsPatroc.DataSet.State in [dsInsert, dsEdit] then
    BtnCancelarClick(Self)
  else
    CA_PATROC.Close;
end;

end.
