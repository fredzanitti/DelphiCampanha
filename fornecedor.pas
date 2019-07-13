unit fornecedor;

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
  TCA_FORNEC = class(TForm)
    Label5: TLabel;
    Label3: TLabel;
    EdtLogoFornec: TDBEdit;
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
    EdtNomeFornec: TDBEdit;
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
    fraBotoes: TfraBotoes;
    procedure BtnLocCidadeClick(Sender: TObject);
    procedure BtnEscolherFotoClick(Sender: TObject);
    procedure EdtNomeFornecEnter(Sender: TObject);
    procedure EdtDtIniEnter(Sender: TObject);
    procedure EdtDtFimEnter(Sender: TObject);
    procedure EdtNomeFornecExit(Sender: TObject);
    procedure EdtDtFimExit(Sender: TObject);
    procedure EdtDtIniExit(Sender: TObject);
    procedure DataIniChange(Sender: TObject);
    procedure DataFimChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  CA_FORNEC: TCA_FORNEC;
  NomeArquivo, NomeArquivoAnterior: String;
  caminho: String;

implementation

{$R *.dfm}

uses funcoes, module, pesquisacidades, pesquisafornecedor;

procedure TCA_FORNEC.BtnEscolherFotoClick(Sender: TObject);
begin
  NomeArquivoAnterior := EdtLogoFornec.Text;
  if OpenLogo.Execute then
  begin
    NomeArquivo := OpenLogo.FileName;
    f_gerais.buscaImagem(ImgLogoAdver, NomeArquivo);
    EdtLogoFornec.Text := PChar(caminho + FormatFloat('00000',
      StrToFloat(EdtCodigo.Text)) + ExtractFileExt(OpenLogo.FileName));
  end;
end;

procedure TCA_FORNEC.BtnLocCidadeClick(Sender: TObject);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaCidade(h_cidades.DbGridCidades, 'TODOS');
  h_cidades.identificacao := 'CA_FORNEC';
  h_cidades.ShowModal;
end;

procedure TCA_FORNEC.DataFimChange(Sender: TObject);
begin
  EdtDtFim.Text := DateToStr(DataFim.Date);
end;

procedure TCA_FORNEC.DataIniChange(Sender: TObject);
begin
  EdtDtIni.Text := DateToStr(DataIni.Date);
end;

procedure TCA_FORNEC.EdtDtFimEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_FORNEC.EdtDtFimExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
  EdtDtFim.Text := f_gerais.retornaData(EdtDtFim.Text);
end;

procedure TCA_FORNEC.EdtDtIniEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_FORNEC.EdtDtIniExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
  EdtDtIni.Text := f_gerais.retornaData(EdtDtIni.Text);
end;

procedure TCA_FORNEC.EdtNomeFornecEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_FORNEC.EdtNomeFornecExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_FORNEC.estadoDosBotoesdeCadastro();
begin
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsFornec.DataSet.State in [dsBrowse] then
  begin
    // botões
    fraBotoes.BtnPrimeiro.Enabled := true;
    fraBotoes.BtnAnterior.Enabled := true;
    fraBotoes.BtnProximo.Enabled := true;
    fraBotoes.BtnUltimo.Enabled := true;
    fraBotoes.BtnIncluir.Enabled := true;
    MnCadastrar.Enabled := true;
    fraBotoes.BtnEditar.Enabled := true;
    MnEditar.Enabled := true;
    fraBotoes.BtnExcluir.Enabled := true;
    MnExcluir.Enabled := true;
    fraBotoes.BtnGravar.Enabled := false;
    fraBotoes.BtnCancelar.Enabled := false;
    BtnLocCidade.Enabled := false;
    BtnEscolherFoto.Enabled := false;
    fraBotoes.BtnPesquisar.Enabled := true;
    // demais componentes
    EdtNomeFornec.Enabled := false;
    EdtDtIni.Enabled := false;
    EdtDtFim.Enabled := false;
  end;

  if FrmDm.DtsFornec.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    fraBotoes.BtnPrimeiro.Enabled := false;
    fraBotoes.BtnAnterior.Enabled := false;
    fraBotoes.BtnProximo.Enabled := false;
    fraBotoes.BtnUltimo.Enabled := false;
    fraBotoes.BtnIncluir.Enabled := false;
    MnCadastrar.Enabled := false;
    fraBotoes.BtnEditar.Enabled := false;
    MnEditar.Enabled := false;
    fraBotoes.BtnExcluir.Enabled := false;
    MnExcluir.Enabled := false;
    fraBotoes.BtnGravar.Enabled := true;
    fraBotoes.BtnCancelar.Enabled := true;
    BtnLocCidade.Enabled := true;
    BtnEscolherFoto.Enabled := true;
    fraBotoes.BtnPesquisar.Enabled := false;
    // demais componentes
    EdtNomeFornec.Enabled := true;
    EdtNomeFornec.SetFocus;
    EdtDtIni.Enabled := true;
    EdtDtFim.Enabled := true;
  end;

  // buscar logo do adversário
  f_gerais.buscaImagem(ImgLogoAdver, EdtLogoFornec.Text);

  // buscar bandeiras do Pais e UF
  f_gerais.buscaBandeiras(ImgBandPaisAdver, ImgUfAdver, EdtCidade.Text,
    LblCidade, LblPais, LblUf);

  // inibir pesquisa se o cadastro de jogos estiver ativo
  if FrmDm.DtsJogos.DataSet.State in [dsInsert, dsEdit] then
    fraBotoes.BtnPesquisar.Enabled := false
  else
    fraBotoes.BtnPesquisar.Enabled := true;

end;

procedure TCA_FORNEC.FormActivate(Sender: TObject);
begin
  estadoDosBotoesdeCadastro();
  if f_gerais.contadorRegistros('ca_fornec') = 0 then
  begin
    LblCidade.Caption := EmptyStr;
    LblPais.Caption := EmptyStr;
    LblUf.Caption := EmptyStr;
  end;
  caminho :=
    'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Fornecedores\FORNEC_';

end;

procedure TCA_FORNEC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoesBtnIncluirClick(Self);
      end;
    VK_F10:
      begin
        fraBotoesBtnPesquisarClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsFornec.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          CA_FORNEC.Close;
      end;
    VK_RETURN:
      begin
        fraBotoesBtnGravarClick(Self);
      end;
  end;
end;

procedure TCA_FORNEC.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsFornec.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FORNEC.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  EdtCodigo.Clear;
  FrmDm.DtsFornec.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FORNEC.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_FORNEC') > 0 then
  begin
    FrmDm.DtsFornec.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_FORNEC.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  if f_gerais.desejaRealizarAcao('excluir o registro?') then
  begin
    // deletar o escudo do patrocinador
    f_gerais.deletarImagens(EdtLogoFornec.Text);
    // deletar o registro do patrocinador
    FrmDm.DtsFornec.DataSet.Delete;
    // restaurar bandeiras e estado dos botões
    estadoDosBotoesdeCadastro();
  end;
end;

procedure TCA_FORNEC.fraBotoesBtnGravarClick(Sender: TObject);
begin
  if StrToDate(EdtDtFim.Text) < StrToDate(EdtDtIni.Text) then
  begin
    Application.MessageBox('Data final não pode ser menor que a data inicial.',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtNomeFornec.Text, 'NOME PATROCINADOR')
    then
      EdtNomeFornec.SetFocus
    else
    begin
      if f_gerais.verificarStringEmBranco(EdtCidade.Text, 'CIDADE') then
        BtnLocCidadeClick(Self)
      else
      begin
        if f_gerais.verificarStringEmBranco(EdtLogoFornec.Text, 'LOGOMARCA')
        then
          BtnEscolherFotoClick(Self)
        else
        begin
          if f_gerais.verificarStringEmBranco(EdtDtFim.Text, 'DATA FINAL') then
            EdtDtFim.SetFocus
          else
          begin
            CopyFile(PChar(NomeArquivo),
              PChar(caminho + FormatFloat('00000', StrToFloat(EdtCodigo.Text)) +
              ExtractFileExt(OpenLogo.FileName)), false);
            FrmDm.DtsFornec.DataSet.Post;

            if NomeArquivoAnterior <> EdtLogoFornec.Text then
              f_gerais.deletarImagens(NomeArquivoAnterior);

            estadoDosBotoesdeCadastro();
            FrmDm.DtsFornec.DataSet.Refresh;
          end;
        end;
      end;
    end;
  end;
end;

procedure TCA_FORNEC.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsFornec.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_FORNEC', 'codfornec'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FORNEC.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaFornec(h_fornecedor.DbGridFornec, 'TODOS');
  h_fornecedor.identificacao := 'CA_FORNEC';
  h_fornecedor.ShowModal;
end;

procedure TCA_FORNEC.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsFornec.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FORNEC.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsFornec.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FORNEC.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsFornec.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FORNEC.MnCadastrarClick(Sender: TObject);
begin
  fraBotoesBtnIncluirClick(Self);
end;

procedure TCA_FORNEC.MnEditarClick(Sender: TObject);
begin
  fraBotoesBtnEditarClick(Self);
end;

procedure TCA_FORNEC.MnExcluirClick(Sender: TObject);
begin
  fraBotoesBtnExcluirClick(Self);
end;

procedure TCA_FORNEC.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsFornec.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self)
  else
    CA_FORNEC.Close;
end;

end.
