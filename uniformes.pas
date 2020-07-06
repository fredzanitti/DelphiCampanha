unit uniformes;

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
  FireDAC.Comp.UI, jpeg, Vcl.Buttons, Vcl.ExtDlgs, Vcl.Menus, Vcl.ComCtrls,
  frameBotoesMenuPadrao;

type
  TCA_UNIFORMES = class(TForm)
    EdtFotoUniforme: TDBEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ImgUniforme: TImage;
    EdtCodigo: TDBEdit;
    EdtDescricao: TDBEdit;
    BtnEscolherFoto: TBitBtn;
    OpenLogo: TOpenPictureDialog;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    fraBotoes: TfraBotoes;
    procedure BtnEscolherFotoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure fraBotoesBtnPrimeiroClick(Sender: TObject);
    procedure fraBotoesBtnAnteriorClick(Sender: TObject);
    procedure fraBotoesBtnProximoClick(Sender: TObject);
    procedure fraBotoesBtnUltimoClick(Sender: TObject);
    procedure fraBotoesBtnIncluirClick(Sender: TObject);
    procedure fraBotoesBtnEditarClick(Sender: TObject);
    procedure fraBotoesBtnExcluirClick(Sender: TObject);
    procedure fraBotoesBtnGravarClick(Sender: TObject);
    procedure fraBotoesBtnCancelarClick(Sender: TObject);
    procedure fraBotoesBtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_UNIFORMES: TCA_UNIFORMES;
  NomeArquivo, NomeArquivoAnterior: String;
  caminho: String;

implementation

{$R *.dfm}

uses module, funcoes, pesquisauniformes;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_UNIFORMES.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.DtsUniformes.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsUniformes.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := True;
    MnEditar.Enabled := True;
    MnExcluir.Enabled := True;
    BtnEscolherFoto.Enabled := false;
    // demais componentes
    EdtDescricao.Enabled := false;
  end;

  if FrmDm.DtsUniformes.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    MnCadastrar.Enabled := false;
    MnEditar.Enabled := false;
    MnExcluir.Enabled := false;
    BtnEscolherFoto.Enabled := True;
    // demais componentes
    EdtDescricao.Enabled := True;
    EdtDescricao.SetFocus;

  end;

  // buscar uniforme
  f_gerais.buscaImagem(ImgUniforme, EdtFotoUniforme.Text);

  // inibir pesquisa se o cadastro de jogos estiver ativo
  if FrmDm.DtsJogos.DataSet.State in [dsInsert, dsEdit] then
    fraBotoes.BtnPesquisar.Enabled := false;

end;

procedure TCA_UNIFORMES.FormActivate(Sender: TObject);
begin
  estadoDosBotoesdeCadastro();
  caminho :=
    'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Uniformes\UNIF_';
  fraBotoesBtnUltimoClick(Self);
end;

procedure TCA_UNIFORMES.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FrmDm.DtsUniformes.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self);
end;

procedure TCA_UNIFORMES.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoesBtnIncluirClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsUniformes.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          CA_UNIFORMES.Close;
      end;
    VK_RETURN:
      begin
        fraBotoesBtnGravarClick(Self);
      end;
    VK_LEFT:
      begin
        if not(FrmDm.DtsUniformes.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnAnteriorClick(Self);
      end;
    VK_RIGHT:
      begin
        if not(FrmDm.DtsUniformes.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnProximoClick(Self);
      end;
    VK_HOME:
      begin
        if not(FrmDm.DtsUniformes.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnPrimeiroClick(Self);
      end;
    VK_END:
      begin
        if not(FrmDm.DtsUniformes.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnUltimoClick(Self);
      end;
    VK_F10:
      fraBotoesBtnPesquisarClick(Self);
  end;
end;

procedure TCA_UNIFORMES.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsUniformes.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_UNIFORMES.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  EdtCodigo.Clear;
  FrmDm.DtsUniformes.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_UNIFORMES.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_UNIFORMES') > 0 then
  begin
    FrmDm.DtsUniformes.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_UNIFORMES.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  if f_gerais.contRegComUmParametro('ca_jogos', 'coduniforme', EdtCodigo.Text) > 0
  then
  begin
    Application.MessageBox
      ('Impossível excluir, pois existem jogos em que este uniforme está associado.',
      'ATENÇÃO', MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar o escudo do patrocinador
      f_gerais.deletarImagens(EdtFotoUniforme.Text);
      // deletar o registro do patrocinador
      FrmDm.DtsUniformes.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_UNIFORMES.fraBotoesBtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtDescricao.Text, 'DESCRIÇÃO UNIFORME')
  then
    EdtDescricao.SetFocus
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtFotoUniforme.Text, 'UNIFORME') then
      BtnEscolherFotoClick(Self)
    else
    begin
      CopyFile(PChar(NomeArquivo), PChar(caminho + FormatFloat('00000',
        StrToFloat(EdtCodigo.Text)) + ExtractFileExt(OpenLogo.FileName)
        ), false);
      FrmDm.DtsUniformes.DataSet.Post;

      if NomeArquivoAnterior <> EdtFotoUniforme.Text then
        f_gerais.deletarImagens(NomeArquivoAnterior);

      estadoDosBotoesdeCadastro();
      FrmDm.DtsUniformes.DataSet.Refresh;
    end;
  end;
end;

procedure TCA_UNIFORMES.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsUniformes.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_UNIFORMES',
    'coduniforme'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_UNIFORMES.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaUniforme(h_uniformes.DbGridUniforme, 'TODOS');
  h_uniformes.identificacao := 'CA_UNIFORMES';
  h_uniformes.ShowModal;
end;

procedure TCA_UNIFORMES.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsUniformes.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_UNIFORMES.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsUniformes.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_UNIFORMES.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsUniformes.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_UNIFORMES.BtnEscolherFotoClick(Sender: TObject);
begin
  NomeArquivoAnterior := EdtFotoUniforme.Text;
  if OpenLogo.Execute then
  begin
    NomeArquivo := OpenLogo.FileName;
    f_gerais.buscaImagem(ImgUniforme, NomeArquivo);
    EdtFotoUniforme.Text :=
      PChar(caminho + FormatFloat('00000', StrToFloat(EdtCodigo.Text)) +
      ExtractFileExt(OpenLogo.FileName));
  end;
end;

procedure TCA_UNIFORMES.MnCadastrarClick(Sender: TObject);
begin
  fraBotoesBtnIncluirClick(Self);
end;

procedure TCA_UNIFORMES.MnEditarClick(Sender: TObject);
begin
  fraBotoesBtnEditarClick(Self);
end;

procedure TCA_UNIFORMES.MnExcluirClick(Sender: TObject);
begin
  fraBotoesBtnExcluirClick(Self);
end;

end.
