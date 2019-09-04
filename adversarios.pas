unit adversarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, ShellAPI,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, jpeg, Vcl.Buttons, Vcl.ExtDlgs, Vcl.Menus,
  framePesquisaCidades, frameBotoesMenuPadrao, SelRelatorioAdversario;

type
  TCA_ADVER = class(TForm)
    Label4: TLabel;
    EdtRival: TDBEdit;
    Label5: TLabel;
    EdtEscudoAdver: TDBEdit;
    OpenLogo: TOpenPictureDialog;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ImgLogoAdver: TImage;
    EdtCodigo: TDBEdit;
    EdtNomeAdver: TDBEdit;
    BtnEscolherFoto: TBitBtn;
    Label3: TLabel;
    EdtCidade: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    CbMeuTime: TCheckBox;
    fraCidades: TfraCidades;
    fraBotoes: TfraBotoes;
    BtnRelatorio: TBitBtn;
    ChkRival: TDBCheckBox;
    procedure BtnLocCidadeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnEscolherFotoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure CbMeuTimeClick(Sender: TObject);
    procedure EdtNomeAdverExit(Sender: TObject);
    procedure EdtNomeAdverEnter(Sender: TObject);
    procedure fraCidades1BtnLocCidadeClick(Sender: TObject);
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
    procedure BtnRelatorioClick(Sender: TObject);
    procedure ImgLogoAdverDblClick(Sender: TObject);
    procedure ImgLogoAdverMouseEnter(Sender: TObject);
    procedure ImgLogoAdverMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_ADVER: TCA_ADVER;
  NomeArquivo, NomeArquivoAnterior: String;
  caminho: String;

implementation

{$R *.dfm}

uses module, funcoes, pesquisacidades, pesquisaclubes, home;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_ADVER.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.DtsAdversarios.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsAdversarios.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := true;
    MnEditar.Enabled := true;
    MnExcluir.Enabled := true;
    fraCidades.BtnLocCidade.Enabled := false;
    BtnEscolherFoto.Enabled := false;
    BtnRelatorio.Enabled := true;
    // demais componentes
    EdtNomeAdver.Enabled := false;
    ChkRival.Enabled := false;
    CbMeuTime.Enabled := false;
  end;

  if FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    MnCadastrar.Enabled := false;
    MnEditar.Enabled := false;
    MnExcluir.Enabled := false;
    fraCidades.BtnLocCidade.Enabled := true;
    BtnEscolherFoto.Enabled := true;
    BtnRelatorio.Enabled := false;
    // demais componentes
    EdtNomeAdver.Enabled := true;
    EdtNomeAdver.SetFocus;
    ChkRival.Enabled := true;
    CbMeuTime.Enabled := true;
  end;

  if f_gerais.contadorRegistros('CA_ADVER') > 0 then
  begin
    // buscar logo do adversário
    f_gerais.buscaImagem(ImgLogoAdver, EdtEscudoAdver.Text);

    // buscar bandeiras do Pais e UF
    f_gerais.buscaBandeiras(fraCidades.ImgBandPaisAdver, fraCidades.ImgUfAdver,
      EdtCidade.Text, fraCidades.LblCidade, fraCidades.LblPais,
      fraCidades.LblUf);

    // apresentar checkbox do seu time marcado ou não
    if StrToInt(EdtCodigo.Text) = 0 then
      CbMeuTime.Checked := true
    else
      CbMeuTime.Checked := false;
  end;
end;

procedure TCA_ADVER.FormActivate(Sender: TObject);
begin
  estadoDosBotoesdeCadastro();
  if f_gerais.contadorRegistros('ca_adver') = 0 then
  begin
    fraCidades.LblCidade.Caption := EmptyStr;
    fraCidades.LblPais.Caption := EmptyStr;
    fraCidades.LblUf.Caption := EmptyStr;
  end;

  caminho :=
    'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Escudos\ADVER_';
end;

procedure TCA_ADVER.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self);
end;

procedure TCA_ADVER.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoesBtnIncluirClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          CA_ADVER.Close;
      end;
    VK_RETURN:
      begin
        fraBotoesBtnGravarClick(Self);
      end;
    VK_LEFT:
      begin
        if not(FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnAnteriorClick(Self);
      end;
    VK_RIGHT:
      begin
        if not(FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnProximoClick(Self);
      end;
    VK_HOME:
      begin
        if not(FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnPrimeiroClick(Self);
      end;
    VK_END:
      begin
        if not(FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnUltimoClick(Self);
      end;
    VK_F10:
      fraBotoesBtnPesquisarClick(Self);
  end;
end;

procedure TCA_ADVER.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsAdversarios.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ADVER.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  EdtCodigo.Clear;
  CbMeuTime.Checked := false;
  FrmDm.DtsAdversarios.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ADVER.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_ADVER') > 0 then
  begin
    FrmDm.DtsAdversarios.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_ADVER.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  sql := 'select count(*) from ES_RESUM where codadver = :CODIGO';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString := EdtCodigo.Text;
  FrmDm.QrGeral.Open;

  if FrmDm.QrGeral.Fields[0].AsInteger > 0 then
  begin
    Application.MessageBox
      ('Impossível excluir, pois existem jogos cadastrados contra este clube.',
      'ATENÇÃO', MB_OK + MB_ICONERROR);
  end
  else
  begin
    if (f_gerais.contadorRegistros('CA_JOGOS') > 0) and
      (EdtCodigo.Text = '00000') then
    begin
      Application.MessageBox('Impossível excluir! Não é possível excluir o seu'
        + #13 + 'clube se houver jogos cadastrados.', 'ATENÇÃO',
        MB_OK + MB_ICONERROR);
    end
    else
    begin
      if f_gerais.desejaRealizarAcao('excluir o registro?') then
      begin
        // deletar o escudo do clube
        f_gerais.deletarImagens(EdtEscudoAdver.Text);
        // deletar o registro do clube
        FrmDm.DtsAdversarios.DataSet.Delete;
        // restaurar bandeiras e estado dos botões
        estadoDosBotoesdeCadastro();
      end;
    end;
  end;
end;

procedure TCA_ADVER.fraBotoesBtnGravarClick(Sender: TObject);
var
  rival: String;
begin
  if f_gerais.verificarStringEmBranco(EdtNomeAdver.Text, 'NOME ADVERSÁRIO') then
    EdtNomeAdver.SetFocus
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtCidade.Text, 'CIDADE') then
      BtnLocCidadeClick(Self)
    else
    begin
      if f_gerais.verificarStringEmBranco(EdtEscudoAdver.Text, 'ESCUDO') then
        BtnEscolherFotoClick(Self)
      else
      begin
        CopyFile(PChar(NomeArquivo), PChar(caminho + FormatFloat('00000',
          StrToFloat(EdtCodigo.Text)) +
          ExtractFileExt(OpenLogo.FileName)), false);
        FrmDm.DtsAdversarios.DataSet.Post;
        if ChkRival.Checked then
          rival := '1'
        else
          rival := '0';
        f_gerais.atualizarRival(EdtCodigo.Text, rival);

        if NomeArquivoAnterior <> EdtEscudoAdver.Text then
          f_gerais.deletarImagens(NomeArquivoAnterior);

        estadoDosBotoesdeCadastro();
        FrmDm.DtsAdversarios.DataSet.Refresh;
      end;
    end;
  end;
end;

procedure TCA_ADVER.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsAdversarios.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_ADVER', 'codadver'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ADVER.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'CA_ADVER';
  h_clubes.ShowModal;
end;

procedure TCA_ADVER.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsAdversarios.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ADVER.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsAdversarios.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ADVER.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsAdversarios.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ADVER.fraCidades1BtnLocCidadeClick(Sender: TObject);
begin
  fraCidades.formulario := 'CA_ADVER';
  fraCidades.BtnLocCidadeClick(Self);
end;

procedure TCA_ADVER.ImgLogoAdverDblClick(Sender: TObject);
var
  consultaAdversario: String;
begin
  if (EdtNomeAdver.Text <> EmptyStr) then
  begin
    consultaAdversario := 'https://www.google.com.br/search?q=' + EdtNomeAdver.Text +
      ' ' + fraCidades.LblPais.Caption + ' ' + 'escudo' +
      '&biw=1280&bih=899&source=lnms&tbm=isch&sa=X&ei=gbamVNP6N4enNr79g5gI&ved=0CAYQ_AUoAQ';

    ShellExecute(Handle, 'open', PChar(consultaAdversario), '', '', 1);
    ImgLogoAdver.Hint :=
      'Clique duplo neste espaço para buscar o escudo do time na internet';
    ImgLogoAdver.ShowHint := True;
    ImgLogoAdver.DragCursor := crHandPoint;
  end
  else
  begin
    ImgLogoAdver.ShowHint := False;
    ImgLogoAdver.DragCursor := crDefault;
  end;
end;

procedure TCA_ADVER.ImgLogoAdverMouseEnter(Sender: TObject);
begin
  if (EdtNomeAdver.Text <> EmptyStr) then
  begin
    ImgLogoAdver.Hint :=
      'Clique duplo neste espaço para buscar o escudo do time na internet';
    ImgLogoAdver.ShowHint := True;
    ImgLogoAdver.DragCursor := crHandPoint;
  end;
end;

procedure TCA_ADVER.ImgLogoAdverMouseLeave(Sender: TObject);
begin
    ImgLogoAdver.ShowHint := False;
    ImgLogoAdver.DragCursor := crDefault;
end;

procedure TCA_ADVER.MnCadastrarClick(Sender: TObject);
begin
  fraBotoesBtnIncluirClick(Self);
end;

procedure TCA_ADVER.MnEditarClick(Sender: TObject);
begin
  fraBotoesBtnEditarClick(Self);
end;

procedure TCA_ADVER.MnExcluirClick(Sender: TObject);
begin
  fraBotoesBtnExcluirClick(Self);
end;

procedure TCA_ADVER.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self)
  else
    CA_ADVER.Close;
end;

procedure TCA_ADVER.BtnEscolherFotoClick(Sender: TObject);
begin
  NomeArquivoAnterior := EdtEscudoAdver.Text;
  if OpenLogo.Execute then
  begin
    NomeArquivo := OpenLogo.FileName;
    f_gerais.buscaImagem(ImgLogoAdver, NomeArquivo);
    EdtEscudoAdver.Text :=
      PChar(caminho + FormatFloat('00000', StrToFloat(EdtCodigo.Text)) +
      ExtractFileExt(OpenLogo.FileName));
  end;
end;

procedure TCA_ADVER.BtnLocCidadeClick(Sender: TObject);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaCidade(h_cidades.DbGridCidades, 'TODOS');
  h_cidades.identificacao := 'CA_ADVER';
  h_cidades.ShowModal;
end;

procedure TCA_ADVER.BtnRelatorioClick(Sender: TObject);
begin
  frmSelRelatorioAdversario.ShowModal;
end;

procedure TCA_ADVER.CbMeuTimeClick(Sender: TObject);
begin
  if FrmDm.DtsAdversarios.DataSet.State in [dsInsert, dsEdit] then
  begin
    if CbMeuTime.Checked then
    begin
      if f_gerais.contRegComUmParametro('ca_adver', 'codadver', '0') > 0 then
      begin
        Application.MessageBox
          ('Você já definiu o seu time, não é possível marcar mais de um time como Meu Time',
          'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
        CbMeuTime.Checked := false;
      end
      else
        EdtCodigo.Text := '0';
    end
    else
    begin
      if FrmDm.DtsAdversarios.DataSet.State in [dsInsert] then
        EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_ADVER', 'codadver'));
    end;
  end;

end;

procedure TCA_ADVER.EdtNomeAdverEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_ADVER.EdtNomeAdverExit(Sender: TObject);
begin
  if FrmDm.DtsAdversarios.DataSet.State in [dsInsert] then
  begin
    if f_gerais.verificaExistenciaNome('ca_adver', EdtNomeAdver.Text) then
      Application.MessageBox('Já existe um adversário cadastrado com esse nome',
        'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end;
  f_gerais.MudaCor('Sai', Sender);
end;

end.
