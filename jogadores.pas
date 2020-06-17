unit jogadores;

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
  ShellApi, framePesquisaCidades, frameBotoesMenuPadrao, frxClass,
  SelRelatorioJogador, System.Actions, Vcl.ActnList;

type
  TCA_JOGAD = class(TForm)
    Label4: TLabel;
    EdtFoto: TDBEdit;
    Label6: TLabel;
    EdtCidade: TDBEdit;
    Label7: TLabel;
    EdtSituacao: TDBEdit;
    Label8: TLabel;
    EdtPosicao: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    OpenFoto: TOpenPictureDialog;
    BtnEscolherFoto: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ImgFoto: TImage;
    EdtCodigo: TDBEdit;
    EdtNome: TDBEdit;
    EdtNomeCompleto: TDBEdit;
    EdtDtNasc: TDBEdit;
    Data: TDateTimePicker;
    CbxPosicao: TDBLookupComboBox;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    BtnClonar: TBitBtn;
    fraCidades: TfraCidades;
    fraBotoes: TfraBotoes;
    ChkSituacao: TDBCheckBox;
    BtnExcel: TBitBtn;
    QrExcel: TFDQuery;
    BtnRelatorio: TBitBtn;
    btnCarreira: TBitBtn;
    btnIndividual: TBitBtn;
    ppmJogador: TPopupMenu;
    mitPesquisarFoto: TMenuItem;
    mitAbrirFichaIndividual: TMenuItem;
    mitCadastroCarreira: TMenuItem;
    actJogadores: TActionList;
    actBuscarFotoInternet: TAction;
    actAbrirFichaIndividual: TAction;
    actCadastrarCarreira: TAction;
    procedure FormActivate(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure BtnLocCidadeClick(Sender: TObject);
    procedure BtnEscolherFotoClick(Sender: TObject);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ImgFotoDblClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
    procedure EdtNomeCompletoEnter(Sender: TObject);
    procedure EdtNomeCompletoExit(Sender: TObject);
    procedure CbxPosicaoExit(Sender: TObject);
    procedure CbxPosicaoEnter(Sender: TObject);
    procedure EdtDtNascEnter(Sender: TObject);
    procedure EdtDtNascExit(Sender: TObject);
    procedure BtnClonarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fraCidades1BtnLocCidadeClick(Sender: TObject);
    procedure fraBotoes1BtnPrimeiroClick(Sender: TObject);
    procedure fraBotoes1BtnAnteriorClick(Sender: TObject);
    procedure fraBotoes1BtnProximoClick(Sender: TObject);
    procedure fraBotoes1BtnUltimoClick(Sender: TObject);
    procedure fraBotoes1BtnIncluirClick(Sender: TObject);
    procedure fraBotoes1BtnEditarClick(Sender: TObject);
    procedure fraBotoes1BtnExcluirClick(Sender: TObject);
    procedure fraBotoes1BtnGravarClick(Sender: TObject);
    procedure fraBotoes1BtnCancelarClick(Sender: TObject);
    procedure fraBotoesBtnPesquisarClick(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure BtnRelatorioClick(Sender: TObject);
    procedure btnCarreiraClick(Sender: TObject);
    procedure btnIndividualClick(Sender: TObject);
    procedure ImgFotoMouseEnter(Sender: TObject);
    procedure ImgFotoMouseLeave(Sender: TObject);
    procedure mitPesquisarFotoClick(Sender: TObject);
    procedure mitAbrirFichaIndividualClick(Sender: TObject);
    procedure mitCadastroCarreiraClick(Sender: TObject);
    procedure actBuscarFotoInternetExecute(Sender: TObject);
    procedure actAbrirFichaIndividualExecute(Sender: TObject);
    procedure actCadastrarCarreiraExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_JOGAD: TCA_JOGAD;
  NomeArquivo, NomeArquivoAnterior, caminhoIndisp: String;

implementation

{$R *.dfm}

uses module, funcoes, pesquisacidades, selecionarfoto, pesquisajogadores, home,
  reservas, jogos, pesquisajogadoresativos, relTodosJogadores, carreirajogador;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_JOGAD.btnIndividualClick(Sender: TObject);
begin
  actAbrirFichaIndividual.Execute;
end;

procedure TCA_JOGAD.actAbrirFichaIndividualExecute(Sender: TObject);
begin
  f_gerais.preencherFichaIndividual(FrmDm.TblJogadorescodjogador.AsInteger);
end;

procedure TCA_JOGAD.actBuscarFotoInternetExecute(Sender: TObject);
var
  consultaJogador: String;
begin
  if (EdtNome.Text <> EmptyStr) or (EdtNomeCompleto.Text <> EmptyStr) then
  begin
    consultaJogador := 'https://www.google.com.br/search?q=' + EdtNome.Text +
      ' ' + EdtNomeCompleto.Text + ' ' + f_gerais.buscarNome('nome', 'ca_adver',
      'codadver', '0') +
      '&biw=1280&bih=899&source=lnms&tbm=isch&sa=X&ei=gbamVNP6N4enNr79g5gI&ved=0CAYQ_AUoAQ';

    ShellExecute(Handle, 'open', PChar(consultaJogador), '', '', 1);
    ImgFoto.Hint :=
      'Clique duplo neste espaço para buscar a foto do jogador na internet';
    ImgFoto.ShowHint := True;
    ImgFoto.DragCursor := crHandPoint;
  end
  else
  begin
    ImgFoto.ShowHint := False;
    ImgFoto.DragCursor := crDefault;
  end;
end;

procedure TCA_JOGAD.actCadastrarCarreiraExecute(Sender: TObject);
begin
  frmCarreiraJogador.LblApelido.Caption := AnsiUpperCase(EdtNome.Text) + ' ( ' +
    CbxPosicao.Text + ' )';
  frmCarreiraJogador.codigoJogador := StrToInt(EdtCodigo.Text);
  frmCarreiraJogador.ShowModal;
end;

procedure TCA_JOGAD.btnCarreiraClick(Sender: TObject);
begin
  actCadastrarCarreira.Execute;
end;

procedure TCA_JOGAD.BtnClonarClick(Sender: TObject);
var
  nome, nomecompleto, foto, dtnasc, codcidade, codposicao: String;
begin
  nome := EdtNome.Text;
  nomecompleto := EdtNomeCompleto.Text;
  foto := EdtFoto.Text;
  dtnasc := EdtDtNasc.Text;
  codcidade := EdtCidade.Text;
  codposicao := EdtPosicao.Text;

  fraBotoes1BtnIncluirClick(Self);

  EdtNome.Text := nome;
  EdtNomeCompleto.Text := nomecompleto;
  EdtFoto.Text := foto;
  EdtDtNasc.Text := dtnasc;
  EdtCidade.Text := codcidade;
  EdtSituacao.Text := '0';
  EdtPosicao.Text := codposicao;
  CbxPosicao.DataSource.DataSet.FieldByName('codposicao').AsInteger :=
    StrToInt(EdtPosicao.Text);

  // buscar foto do jogador
  f_gerais.buscaImagemJogador(ImgFoto, foto);

  // buscar bandeiras do Pais e UF
  f_gerais.buscaBandeiras(fraCidades.ImgBandPaisAdver, fraCidades.ImgUfAdver,
    codcidade, fraCidades.LblCidade, fraCidades.LblPais, fraCidades.LblUf);

end;

procedure TCA_JOGAD.BtnEscolherFotoClick(Sender: TObject);
begin
  NomeArquivoAnterior := EdtFoto.Text;
  if OpenFoto.Execute then
  begin
    h_editafoto.ImgSelecionada.Picture.LoadFromFile(OpenFoto.FileName);
    if (h_editafoto.ImgSelecionada.Width > 1024) and
      (h_editafoto.ImgSelecionada.Height > 768) then
      h_editafoto.ImgSelecionada.Stretch := True
    else
      h_editafoto.ImgSelecionada.Stretch := False;
    h_editafoto.ShowModal;
  end;
end;

procedure TCA_JOGAD.BtnExcelClick(Sender: TObject);
begin
  // EXPORTAR PARA EXCEL
  QrExcel.Close;
  QrExcel.Open;
  f_gerais.gerarExcel(QrExcel);
end;

procedure TCA_JOGAD.BtnLocCidadeClick(Sender: TObject);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaCidade(h_cidades.DbGridCidades, 'TODOS');
  h_cidades.identificacao := 'CA_JOGAD';
  h_cidades.ShowModal;
end;

procedure TCA_JOGAD.BtnRelatorioClick(Sender: TObject);
begin
  frmSelRelatorioJogador.ShowModal;
end;

procedure TCA_JOGAD.CbxPosicaoEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGAD.CbxPosicaoExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGAD.DataChange(Sender: TObject);
begin
  EdtDtNasc.Text := DateToStr(Data.Date);
end;

procedure TCA_JOGAD.EdtDtNascEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGAD.EdtDtNascExit(Sender: TObject);
var
  erro: boolean;
begin
  f_gerais.MudaCor('Sai', Sender);
  EdtDtNasc.Text := f_gerais.retornaData(EdtDtNasc.Text);
end;

procedure TCA_JOGAD.EdtNomeCompletoEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGAD.EdtNomeCompletoExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGAD.EdtNomeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGAD.EdtNomeExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGAD.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.DtsJogadores.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsJogadores.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := True;
    MnEditar.Enabled := True;
    MnExcluir.Enabled := True;
    BtnEscolherFoto.Enabled := False;
    BtnClonar.Enabled := True;
    BtnExcel.Enabled := True;
    BtnRelatorio.Enabled := True;
    btnCarreira.Enabled := True;
    btnIndividual.Enabled := True;
    fraCidades.BtnLocCidade.Enabled := False;
    // demais componentes
    EdtNome.Enabled := False;
    EdtNomeCompleto.Enabled := False;
    Data.Enabled := False;
    CbxPosicao.Enabled := False;
    ChkSituacao.Enabled := False;
    EdtDtNasc.Enabled := False;

  end;

  if FrmDm.DtsJogadores.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    MnCadastrar.Enabled := False;
    MnEditar.Enabled := False;
    MnExcluir.Enabled := False;
    BtnEscolherFoto.Enabled := True;
    BtnClonar.Enabled := False;
    BtnExcel.Enabled := False;
    BtnRelatorio.Enabled := False;
    btnCarreira.Enabled := False;
    btnIndividual.Enabled := False;
    fraCidades.BtnLocCidade.Enabled := True;
    // demais componentes
    EdtNome.Enabled := True;
    EdtNome.SetFocus;
    EdtNomeCompleto.Enabled := True;
    Data.Enabled := True;
    CbxPosicao.Enabled := True;
    ChkSituacao.Enabled := True;
    EdtDtNasc.Enabled := True;
  end;

  // buscar foto do jogador
  f_gerais.buscaImagemJogador(ImgFoto, EdtFoto.Text);

  // buscar bandeiras do Pais e UF
  f_gerais.buscaBandeiras(fraCidades.ImgBandPaisAdver, fraCidades.ImgUfAdver,
    EdtCidade.Text, fraCidades.LblCidade, fraCidades.LblPais, fraCidades.LblUf);

end;

procedure TCA_JOGAD.FormActivate(Sender: TObject);
begin
  caminhoIndisp :=
    'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Imagens\indisponivel.jpg';
  estadoDosBotoesdeCadastro();
  if f_gerais.contadorRegistros('ca_jogad') = 0 then
  begin
    fraCidades.LblCidade.Caption := EmptyStr;
    fraCidades.LblPais.Caption := EmptyStr;
    fraCidades.LblUf.Caption := EmptyStr;
  end;
end;

procedure TCA_JOGAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  f_gerais.infIniciais(FrmPrincipal.LblTemp, FrmPrincipal.LblJogos,
    FrmPrincipal.LblJogad, FrmPrincipal.LblTecn);
end;

procedure TCA_JOGAD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoes1BtnIncluirClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsJogadores.DataSet.State in [dsInsert, dsEdit] then
          fraBotoes1BtnCancelarClick(Self)
        else
          MnSairClick(Self);
      end;
    VK_RETURN:
      begin
        fraBotoes1BtnGravarClick(Self);
      end;

  end;
end;

procedure TCA_JOGAD.fraBotoes1BtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsJogadores.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGAD.fraBotoes1BtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsJogadores.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGAD.fraBotoes1BtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_JOGAD') > 0 then
  begin
    FrmDm.DtsJogadores.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_JOGAD.fraBotoes1BtnExcluirClick(Sender: TObject);
begin
  sql := 'select sum(a.n) from (' + 'select count(*) n ' +
    'from ES_TITUL t, CA_JOGAD c ' + 'where t.codjogador = c.codjogador ' +
    'and c.codjogador = :CODIGO ' + 'union all ' + 'select count(*) n ' +
    'from CA_JOGAD c, ES_RESER r ' + 'where r.codjogador = c.codjogador ' +
    'and c.codjogador = :CODIGO ' + ') as a';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString := EdtCodigo.Text;
  FrmDm.QrGeral.Open;

  if FrmDm.QrGeral.Fields[0].AsInteger > 0 then
  begin
    Application.MessageBox
      ('Impossível excluir, pois existem jogos em que este jogador atuou.',
      'ATENÇÃO', MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar a foto do jogador
      if (EdtFoto.Text <> caminhoIndisp) then
        f_gerais.deletarImagens(EdtFoto.Text);

      // deletar o registro do clube
      FrmDm.DtsJogadores.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_JOGAD.fraBotoes1BtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtNome.Text, 'NOME DO JOGADOR') then
    EdtNome.SetFocus
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtCidade.Text, 'CIDADE') then
      BtnLocCidadeClick(Self)
    else
    begin
      if f_gerais.verificarStringEmBranco(CbxPosicao.Text, 'POSIÇAO') then
        CbxPosicao.SetFocus
      else
      begin
        if EdtFoto.Text = EmptyStr then
          EdtFoto.Text :=
            'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Imagens\indisponivel.jpg';

        // copiar foto para pasta de fotos dos jogadores
        CopyFile(PChar(NomeArquivo), PChar(caminho + FormatFloat('00000',
          StrToFloat(EdtCodigo.Text)) +
          ExtractFileExt(OpenFoto.FileName)), False);
        FrmDm.DtsJogadores.DataSet.Post;

        // exibir a foto se existir, caso não exista exibe o padrão "Foto Indisponível"
        if (FrmDm.DtsJogadores.DataSet.State in [dsEdit]) and
          (NomeArquivoAnterior <> EdtFoto.Text) and
          (EdtFoto.Text <> 'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Imagens\indisponivel.jpg')
        then
          f_gerais.deletarImagens(NomeArquivoAnterior);

        if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
        begin
          // preencher grid dos jogadores disponiveis para substituir os titulares
          f_gerais.jogadoresDisponiveis(h_substituicoes.DbGridDisponiveis,
            CA_JOGOS.EdtCodigo.Text, CA_JOGAD.Name, EmptyStr);

          // preencher grid da pesquisa de clubes
          f_gerais.pesquisajogadoresativos
            (h_jogadoresativos.DbGridAtivo, 'TODOS');
        end;

        estadoDosBotoesdeCadastro();
        FrmDm.DtsJogadores.DataSet.Refresh;
      end;
    end;
  end;
end;

procedure TCA_JOGAD.fraBotoes1BtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsJogadores.DataSet.Append;
  EdtSituacao.Text := '0';
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_JOGAD', 'codjogador'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGAD.fraBotoes1BtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsJogadores.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGAD.fraBotoes1BtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsJogadores.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGAD.fraBotoes1BtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsJogadores.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGAD.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS', 0);
  h_jogadores.identificacao := 'CA_JOGAD';
  h_jogadores.ShowModal;
end;

procedure TCA_JOGAD.fraCidades1BtnLocCidadeClick(Sender: TObject);
begin
  fraCidades.formulario := 'CA_JOGAD';
  fraCidades.BtnLocCidadeClick(Self);
end;

procedure TCA_JOGAD.ImgFotoDblClick(Sender: TObject);
begin
   actBuscarFotoInternet.Execute;
end;

procedure TCA_JOGAD.ImgFotoMouseEnter(Sender: TObject);
begin
  if (EdtNome.Text <> EmptyStr) or (EdtNomeCompleto.Text <> EmptyStr) then
  begin
    ImgFoto.Hint :=
      'Clique duplo neste espaço para buscar a foto do jogador na internet';
    ImgFoto.ShowHint := True;
    ImgFoto.DragCursor := crHandPoint;
  end;
end;

procedure TCA_JOGAD.ImgFotoMouseLeave(Sender: TObject);
begin
  ImgFoto.ShowHint := False;
  ImgFoto.DragCursor := crDefault;
end;

procedure TCA_JOGAD.mitAbrirFichaIndividualClick(Sender: TObject);
begin
  actAbrirFichaIndividual.Execute;
end;

procedure TCA_JOGAD.mitCadastroCarreiraClick(Sender: TObject);
begin
  actCadastrarCarreira.Execute;
end;

procedure TCA_JOGAD.mitPesquisarFotoClick(Sender: TObject);
begin
  actBuscarFotoInternet.Execute;
end;

procedure TCA_JOGAD.MnCadastrarClick(Sender: TObject);
begin
  fraBotoes1BtnIncluirClick(Self);
end;

procedure TCA_JOGAD.MnEditarClick(Sender: TObject);
begin
  fraBotoes1BtnEditarClick(Self);
end;

procedure TCA_JOGAD.MnExcluirClick(Sender: TObject);
begin
  fraBotoes1BtnExcluirClick(Self);
end;

procedure TCA_JOGAD.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsJogadores.DataSet.State in [dsInsert, dsEdit] then
    fraBotoes1BtnCancelarClick(Self)
  else
    CA_JOGAD.Close;
end;

end.
