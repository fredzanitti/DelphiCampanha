unit jogos;

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
  ShellApi, Vcl.Grids, Vcl.DBGrids, frameBotoesMenuPadrao;

type
  TCA_JOGOS = class(TForm)
    EdtCodVisitante: TDBEdit;
    EdtCodMandante: TDBEdit;
    EdtCodArbitro: TDBEdit;
    EdtCodFase: TDBEdit;
    EdtQtdeGolContra: TDBEdit;
    EdtWo: TDBEdit;
    EdtVideo: TDBEdit;
    EdtCodTatica: TDBEdit;
    EdtCodEstadio: TDBEdit;
    EdtCodCompeticao: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    GroupBox3: TGroupBox;
    EdtCodigo: TDBEdit;
    GroupBox4: TGroupBox;
    BtnJogador: TBitBtn;
    DbGridTitulares: TDBGrid;
    BtnEditaTitular: TBitBtn;
    GroupBox5: TGroupBox;
    DbGridReservas: TDBGrid;
    BtnSubstituicao: TBitBtn;
    CbEscalacoDisp: TCheckBox;
    BtnExcluirJogadores: TBitBtn;
    BtnExcluirReservas: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    LblCidade: TLabel;
    LblPais: TLabel;
    ImgBandPaisAdver: TImage;
    ImgUfAdver: TImage;
    LblUf: TLabel;
    Label19: TLabel;
    LblNomeEstadio: TLabel;
    EdtData: TDBEdit;
    DtData: TDateTimePicker;
    EdtHora: TDBEdit;
    BtnEstadio: TBitBtn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    ImgLogoMandante: TImage;
    ImgLogoVisitante: TImage;
    Label20: TLabel;
    Label21: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    EdtPlacarMandante: TDBEdit;
    EdtPlacarVisitante: TDBEdit;
    StaticText1: TStaticText;
    EdtPenaltyMandante: TDBEdit;
    EdtPenaltyVisitante: TDBEdit;
    BtnCompeticao: TBitBtn;
    EdtCompeticao: TEdit;
    EdtMandante: TEdit;
    EdtVisitante: TEdit;
    BtnAdversario: TBitBtn;
    BtnInverter: TBitBtn;
    EdtPublico: TDBEdit;
    EdtArbitro: TEdit;
    BtnArbitro: TBitBtn;
    CbxTatica: TDBLookupComboBox;
    EdtFase: TEdit;
    BtnFase: TBitBtn;
    GroupBox6: TGroupBox;
    BtnUniforme: TBitBtn;
    EdtCodUniforme: TDBEdit;
    EdtNomeUniforme: TEdit;
    ImgUniforme: TImage;
    fraBotoes: TfraBotoes;
    cbPortaoFechado: TDBCheckBox;
    BtnTempoGols: TBitBtn;
    btnVisualizarSumula: TBitBtn;
    procedure BtnEstadioClick(Sender: TObject);
    procedure BtnCompeticaoClick(Sender: TObject);
    procedure DtDataChange(Sender: TObject);
    procedure BtnAdversarioClick(Sender: TObject);
    procedure BtnInverterClick(Sender: TObject);
    procedure BtnArbitroClick(Sender: TObject);
    procedure BtnFaseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MnSairClick(Sender: TObject);
    procedure BtnInverterExit(Sender: TObject);
    procedure BtnJogadorClick(Sender: TObject);
    procedure DbGridTitularesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbGridReservasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnSubstituicaoClick(Sender: TObject);
    procedure BtnExcluirJogadoresClick(Sender: TObject);
    procedure BtnExcluirReservasClick(Sender: TObject);
    procedure BtnEditaTitularClick(Sender: TObject);
    procedure CbEscalacoDispClick(Sender: TObject);
    procedure EdtDataExit(Sender: TObject);
    procedure EdtDataEnter(Sender: TObject);
    procedure EdtHoraEnter(Sender: TObject);
    procedure EdtHoraExit(Sender: TObject);
    procedure EdtPublicoEnter(Sender: TObject);
    procedure EdtPublicoExit(Sender: TObject);
    procedure CbxTaticaEnter(Sender: TObject);
    procedure CbxTaticaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnUniformeClick(Sender: TObject);
    procedure EdtPlacarMandanteEnter(Sender: TObject);
    procedure EdtPlacarMandanteExit(Sender: TObject);
    procedure EdtPlacarVisitanteExit(Sender: TObject);
    procedure EdtPlacarVisitanteEnter(Sender: TObject);
    procedure EdtPenaltyMandanteEnter(Sender: TObject);
    procedure EdtPenaltyMandanteExit(Sender: TObject);
    procedure EdtPenaltyVisitanteExit(Sender: TObject);
    procedure EdtPenaltyVisitanteEnter(Sender: TObject);
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
    procedure FormActivate(Sender: TObject);
    procedure cbPortaoFechadoClick(Sender: TObject);
    procedure BtnTempoGolsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVisualizarSumulaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Acessou: boolean;
    procedure estadoDosBotoesdeCadastro();
    procedure estadoDosBotoesdeJogadores();
  end;

var
  CA_JOGOS: TCA_JOGOS;
  msg: String;

implementation

{$R *.dfm}

uses module, pesquisaestadios, funcoes, pesquisacompeticao, pesquisaclubes,
  pesquisaarbitros, h_fase, pesquisajogadoresativos, reservas, home,
  pesquisajogos, pesquisauniformes, golsdapartida;

procedure TCA_JOGOS.BtnAdversarioClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'CA_JOGOS';
  h_clubes.ShowModal;
end;

procedure TCA_JOGOS.BtnArbitroClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaArbitro(h_arbitros.DbGridArbitro, 'TODOS');
  h_arbitros.identificacao := 'CA_JOGOS';
  h_arbitros.ShowModal;
end;

procedure TCA_JOGOS.BtnCompeticaoClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisacompeticao(h_competicao.DbGridCompeticao, 'TODOS');
  h_competicao.identificacao := 'CA_JOGOS';
  h_competicao.ShowModal;
end;

procedure TCA_JOGOS.BtnEditaTitularClick(Sender: TObject);
begin
  f_gerais.limpaTelaEditaEscalacao();
  f_gerais.preencherTelaEdtiaEscalacao('T', EdtCodigo.Text);
end;

procedure TCA_JOGOS.BtnEstadioClick(Sender: TObject);
begin
  // preencher grid da pesquisa
  f_gerais.pesquisaEstadio(h_estadios.DbGridEstadio, 'TODOS');
  h_estadios.identificacao := 'CA_JOGOS';
  h_estadios.ShowModal;
end;

procedure TCA_JOGOS.BtnExcluirJogadoresClick(Sender: TObject);
begin
  if f_gerais.desejaRealizarAcao('excluir TODOS os titulares e reservas') then
  begin
    f_gerais.deletarTitularesOuReservas('ES_TITUL', EdtCodigo.Text);
    f_gerais.deletarTitularesOuReservas('ES_RESER', EdtCodigo.Text);
    // preencher jogadores titulares e reservas
    f_gerais.preencherGridTitulares(DbGridTitulares, EdtCodigo.Text);
    f_gerais.preencherGridReservas(DbGridReservas, EdtCodigo.Text);
  end;
  estadoDosBotoesdeJogadores();
end;

procedure TCA_JOGOS.BtnExcluirReservasClick(Sender: TObject);
begin
  if f_gerais.desejaRealizarAcao('excluir TODOS os reservas') then
  begin
    f_gerais.deletarTitularesOuReservas('ES_RESER', EdtCodigo.Text);
    // preencher jogadores titulares e reservas
    f_gerais.preencherGridReservas(DbGridReservas, EdtCodigo.Text);
  end;
  estadoDosBotoesdeJogadores();
end;

procedure TCA_JOGOS.BtnFaseClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaFase(h_fases.DbGridFase, 'TODOS');
  h_fases.identificacao := 'CA_JOGOS';
  h_fases.ShowModal;
end;

procedure TCA_JOGOS.BtnInverterClick(Sender: TObject);
var
  troca: String;
begin
  troca := EdtCodVisitante.Text;
  EdtCodVisitante.Text := EdtCodMandante.Text;
  EdtCodMandante.Text := troca;

  f_gerais.buscaImagemPorCodigo(ImgLogoMandante, EdtCodMandante.Text);
  f_gerais.buscaImagemPorCodigo(ImgLogoVisitante, EdtCodVisitante.Text);
  EdtMandante.Text := AnsiUpperCase(f_gerais.buscarNome('nome', 'CA_ADVER',
    'codadver', EdtCodMandante.Text));
  EdtVisitante.Text := AnsiUpperCase(f_gerais.buscarNome('nome', 'CA_ADVER',
    'codadver', EdtCodVisitante.Text));
end;

procedure TCA_JOGOS.BtnInverterExit(Sender: TObject);
begin
  EdtPlacarMandante.SetFocus;
end;

procedure TCA_JOGOS.BtnJogadorClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtData.Text, 'DATA') then
    EdtData.SetFocus
  else
  begin
    if (f_gerais.verificarStringEmBranco(EdtPlacarMandante.Text, 'PLACAR')) or
      (f_gerais.verificarStringEmBranco(EdtPlacarVisitante.Text, 'PLACAR')) then
      Exit
    else
    begin
      if f_gerais.contRegComUmParametro('es_titul', 'codjogo', EdtCodigo.Text) > 0
      then
      begin
        msg := 'O time titular já está escalado!' + #13 +
          'Caso queira alterar dados como gols ou cartões, clique no botão' +
          #13 + 'EDITAR TIME TITULAR.' + #13 +
          'Caso deseje alterar a escalação titular, deve-se' + #13 +
          'excluir os jogadores atuais e cadastrá-las novamente';
        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
          MB_OK + MB_ICONEXCLAMATION);
      end
      else
      begin
        // preencher grid da pesquisa de clubes
        f_gerais.pesquisajogadoresativos(h_jogadoresativos.DbGridAtivo, 'TODOS');
        f_gerais.limpaTelaJogadoresNosJogos(12);
        h_jogadoresativos.ShowModal;
      end;
    end;
  end;

end;

procedure TCA_JOGOS.BtnSubstituicaoClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtData.Text, 'DATA') then
    EdtData.SetFocus
  else
  begin
    if (f_gerais.verificarStringEmBranco(EdtPlacarMandante.Text, 'PLACAR')) or
      (f_gerais.verificarStringEmBranco(EdtPlacarVisitante.Text, 'PLACAR')) then
      EdtMandante.SetFocus
    else
    begin
      if f_gerais.contRegComUmParametro('es_reser', 'codjogo', EdtCodigo.Text) > 0
      then
      begin
        h_substituicoes.CodigoJogo := StrToInt(EdtCodigo.Text);
        {
        msg := 'Já existem substituições realizadas para este jogo!' + #13 +
          'Caso queira alterar dados como gols ou cartões, clique no botão' +
          #13 + 'EDITAR SUBSTITUIÇÕES.' + #13 +
          'Caso deseje alterar jogadores que entraram, deve-se' + #13 +
          'excluir as alterações e cadastrá-las novamente';
        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
          MB_OK + MB_ICONEXCLAMATION);}
      end;
      f_gerais.jogadoresASubstituir(h_substituicoes.DbGridAsubstituir,
        EdtCodigo.Text);
      f_gerais.jogadoresDisponiveis(h_substituicoes.DbGridDisponiveis,
        EdtCodigo.Text, CA_JOGOS.Name, EmptyStr);
      f_gerais.limpaTelaJogadoresNosJogos(11);
      h_substituicoes.ShowModal;
    end;
  end;
end;

procedure TCA_JOGOS.BtnTempoGolsClick(Sender: TObject);
begin
  frmGolsdaPartida := TfrmGolsdaPartida.Create(Self);
  frmGolsdaPartida.CodigoJogo := StrToInt(EdtCodigo.Text);
  frmGolsdaPartida.LimparCampos;
  frmGolsdaPartida.ShowModal;
  Acessou := True;
end;

procedure TCA_JOGOS.BtnUniformeClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaUniforme(h_uniformes.DbGridUniforme, 'TODOS');
  h_uniformes.identificacao := 'CA_JOGOS';
  h_uniformes.ShowModal;
end;

procedure TCA_JOGOS.btnVisualizarSumulaClick(Sender: TObject);

begin
  f_gerais.preencherSumula(EdtCodigo.Text);
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGOS.CbEscalacoDispClick(Sender: TObject);
begin
  if CbEscalacoDisp.Checked then
  begin
    BtnJogador.Enabled := false;
    BtnEditaTitular.Enabled := false;
    BtnExcluirJogadores.Enabled := false;
    BtnSubstituicao.Enabled := false;
    BtnExcluirReservas.Enabled := false;
    EdtWo.Text := '1';
  end
  else
  begin
    BtnJogador.Enabled := true;
    BtnEditaTitular.Enabled := true;
    BtnExcluirJogadores.Enabled := true;
    BtnSubstituicao.Enabled := true;
    BtnExcluirReservas.Enabled := true;
    EdtWo.Text := '0';
  end;
end;

procedure TCA_JOGOS.cbPortaoFechadoClick(Sender: TObject);
begin
  if cbPortaoFechado.Checked then
  begin
      EdtPublico.Text := '0';
      EdtPublico.Enabled := false;
  end
  else
  begin
      EdtPublico.Text := EmptyStr;
      EdtPublico.Enabled := true;
  end;
end;

procedure TCA_JOGOS.CbxTaticaEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.CbxTaticaExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGOS.DbGridReservasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TStringGrid(DbGridReservas).RowCount - 1) < 12 then
    // Se tiver menos de 12 linhas
    ShowScrollBar(DbGridReservas.Handle, SB_VERT, false);
  // Remove barra Vertical
end;

procedure TCA_JOGOS.DbGridTitularesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TStringGrid(DbGridTitulares).RowCount - 1) < 13 then
    // Se tiver menos de 13 linhas
    ShowScrollBar(DbGridTitulares.Handle, SB_VERT, false);
  // Remove barra Vertical
end;

procedure TCA_JOGOS.DtDataChange(Sender: TObject);
begin
  EdtData.Text := DateToStr(DtData.Date);
end;

procedure TCA_JOGOS.EdtDataEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.EdtDataExit(Sender: TObject);
var
  ano, anoatual: Integer;
  erro: boolean;
begin

  try
    StrToDateTime(EdtData.Text);
    erro := false;
  except
    erro := true;
  end;

  if not erro then
  begin
    if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
    begin
      ano := StrToInt(copy(EdtData.Text, 7, 4));
      anoatual := StrToInt(FormatDateTime('yyyy', Date));
      if ano < anoatual then
      begin
        sql := 'select codjogo + 1 from ca_jogos a ' +
          'where not exists (select codjogo from ca_jogos b where b.codjogo = a.codjogo + 1) '
          + 'order by codjogo ' + 'limit 1 offset 0';

        FrmDm.QrContador.Close;
        FrmDm.QrContador.sql.Clear;
        FrmDm.QrContador.sql.Add(sql);
        FrmDm.QrContador.Open;

        EdtCodigo.Text := FrmDm.QrContador.Fields[0].AsString;
      end;
    end;
  end;
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGOS.EdtHoraEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.EdtHoraExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGOS.EdtPenaltyMandanteEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.EdtPenaltyMandanteExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGOS.EdtPenaltyVisitanteEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.EdtPenaltyVisitanteExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGOS.EdtPlacarMandanteEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.EdtPlacarMandanteExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGOS.EdtPlacarVisitanteEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.EdtPlacarVisitanteExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_JOGOS.EdtPublicoEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_JOGOS.EdtPublicoExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
  if EdtPublico.Text = EmptyStr then
    EdtPublico.Text := '0';
end;

procedure TCA_JOGOS.FormActivate(Sender: TObject);
begin
  fraBotoesBtnUltimoClick(Self);
end;

procedure TCA_JOGOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // f_gerais.infIniciais(FrmPrincipal.LblTemp, FrmPrincipal.LblJogos,
  // FrmPrincipal.LblJogad, FrmPrincipal.LblTecn);
  FrmPrincipal.InformacoesIniciais;
end;

procedure TCA_JOGOS.FormCreate(Sender: TObject);
begin
  Acessou := False;
end;

procedure TCA_JOGOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoesBtnIncluirClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsJogos.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          MnSairClick(Self);
      end;
    VK_RETURN:
      begin
        fraBotoesBtnGravarClick(Self);
      end;

  end;
end;

procedure TCA_JOGOS.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsJogos.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGOS.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
  begin
    f_gerais.deletarTitularesOuReservas('ES_TITUL', EdtCodigo.Text);
    f_gerais.deletarTitularesOuReservas('ES_RESER', EdtCodigo.Text);
  end;
  FrmDm.DtsJogos.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGOS.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_JOGOS') > 0 then
  begin
    FrmDm.DtsJogos.DataSet.Edit;
    estadoDosBotoesdeCadastro();
    if f_gerais.contRegComUmParametro('es_reser', 'codjogo', EdtCodigo.Text) = 0
    then
      BtnExcluirReservas.Enabled := false
    else
      BtnExcluirReservas.Enabled := true;
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_JOGOS.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  if f_gerais.desejaRealizarAcao('excluir o registro?') then
  begin
    // deletar o registro do clube
    f_gerais.deletarRegistroComParametro('ES_RESUM', 'codjogo', EdtCodigo.Text);
    f_gerais.deletarRegistroComParametro('ES_GOLS', 'codjogo', EdtCodigo.Text);
    f_gerais.deletarTitularesOuReservas('ES_TITUL', EdtCodigo.Text);
    f_gerais.deletarTitularesOuReservas('ES_RESER', EdtCodigo.Text);

    FrmDm.DtsJogos.DataSet.Delete;
    // restaurar bandeiras e estado dos botões
    estadoDosBotoesdeCadastro();
  end;
end;

procedure TCA_JOGOS.fraBotoesBtnGravarClick(Sender: TObject);
var
  j, v, e, d, gp, gc, sg, codigoadver, codigojogo, golsdojogo: Integer;
  golsTitular, golsReserva, total: Integer;
  ano, mes, dia: Word;
  msg: String;
begin
  if EdtData.Text = '  /  /    ' then
  begin
    msg := 'A informação da data da realização do jogo é OBRIGATÓRIA.';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    DtDataChange(Self);
  end
  else
  begin
    if EdtCodUniforme.Text = EmptyStr then
    begin
      msg := 'A informação do uniforme utilizado é OBRIGATÓRIA.';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      BtnUniforme.SetFocus;
    end
    else
    begin
      if (f_gerais.verificarStringEmBranco(EdtPlacarMandante.Text, 'PLACAR')) or
        (f_gerais.verificarStringEmBranco(EdtPlacarVisitante.Text, 'PLACAR'))
      then
        EdtPlacarMandante.SetFocus
      else
      begin
        if f_gerais.verificarStringEmBranco(EdtCodEstadio.Text, 'ESTÁDIO') then
        begin
          msg := 'Caso não tenha informação do nome do estádio, selecione' + #13
            + 'o estádio padrão NÃO DISPONIVEL na lista de estádios.';
          Application.MessageBox(Pchar(msg), 'ATENÇÃO',
            MB_OK + MB_ICONINFORMATION);
          BtnEstadioClick(Self);
        end
        else
        begin
          if (f_gerais.verificarStringEmBranco(EdtCodMandante.Text, 'CLUBES'))
            or (f_gerais.verificarStringEmBranco(EdtCodVisitante.Text, 'CLUBES'))
          then
            BtnAdversarioClick(Self)
          else
          begin
            if f_gerais.verificarStringEmBranco(EdtCodEstadio.Text, 'ARBITRO')
            then
            begin
              msg := 'Caso não tenha informação do nome do árbitro, selecione' +
                #13 + 'o árbitro padrão NÃO DISPONIVEL na lista de árbitros.';
              Application.MessageBox(Pchar(msg), 'ATENÇÃO',
                MB_OK + MB_ICONINFORMATION);
              BtnArbitroClick(Self);
            end
            else
            begin
              if f_gerais.verificarStringEmBranco(EdtCodCompeticao.Text,
                'COMPETIÇÃO') then
                BtnCompeticaoClick(Self)
              else
              begin
                if f_gerais.verificarStringEmBranco(EdtCodFase.Text, 'FASE')
                then
                  BtnFaseClick(Self)
                else
                begin
                  if (f_gerais.contRegComUmParametro('es_titul', 'codjogo',
                    EdtCodigo.Text) < 12) and (CbEscalacoDisp.Checked = false)
                  then
                    Application.MessageBox('Jogadores não escalados!',
                      'ATENÇÃO', MB_OK + MB_ICONINFORMATION)
                  else
                  begin
                    if f_gerais.verificarStringEmBranco(EdtCodTatica.Text,
                      'TÁTICA') then
                      CbxTatica.SetFocus
                    else
                    begin // finalmente postar os dados do jogo
                      if (EdtPenaltyMandante.Text = EmptyStr) and
                        (EdtPenaltyVisitante.Text = EmptyStr) then
                      begin
                        EdtPenaltyMandante.Text := '0';
                        EdtPenaltyVisitante.Text := '0';
                      end;
                      EdtWo.Text := '0';

                      // determinação do gol contra
                      if EdtCodMandante.Text = '0' then
                        golsdojogo := StrToInt(EdtPlacarMandante.Text)
                      else
                        golsdojogo := StrToInt(EdtPlacarVisitante.Text);

                      // gols dos titulares
                      sql := 'select sum(gols) from es_titul ' +
                        'where codjogo = :CODIGO ';

                      FrmDm.QrEstatisticas.Close;
                      FrmDm.QrEstatisticas.sql.Clear;
                      FrmDm.QrEstatisticas.sql.Add(sql);
                      FrmDm.QrEstatisticas.Params.ParamByName('CODIGO')
                        .AsInteger := StrToInt(EdtCodigo.Text);
                      FrmDm.QrEstatisticas.Open;

                      golsTitular := FrmDm.QrEstatisticas.Fields[0].AsInteger;

                      // gols dos titulares
                      sql := 'select sum(gols) from es_reser ' +
                        'where codjogo = :CODIGO ';

                      FrmDm.QrEstatisticas.Close;
                      FrmDm.QrEstatisticas.sql.Clear;
                      FrmDm.QrEstatisticas.sql.Add(sql);
                      FrmDm.QrEstatisticas.Params.ParamByName('CODIGO')
                        .AsInteger := StrToInt(EdtCodigo.Text);
                      FrmDm.QrEstatisticas.Open;

                      golsReserva := FrmDm.QrEstatisticas.Fields[0].AsInteger;

                      // total de gols na partida
                      total := golsTitular + golsReserva;

                      if ((total < golsdojogo) and
                        (CbEscalacoDisp.Checked = false)) then
                      begin
                        msg := 'A quantidade de gols atribuído aos jogadores ' +
                          #13 + 'é menor que a quantidade de gols marcados.' +
                          #13 + 'A diferença será cadastrada como GOL CONTRA.';
                        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
                          MB_OK + MB_ICONINFORMATION);
                        EdtQtdeGolContra.Text := IntToStr(golsdojogo - total);
                      end
                      else
                        EdtQtdeGolContra.Text := '0';

                      { GRAVAR TABELA ES_RESUM ==================== }
                      // buscar dados
                      // buscar vitórias, empates ou derrotas
                      if f_gerais.determinarVED() = 'V' then
                      begin
                        v := 1;
                        e := 0;
                        d := 0;
                      end
                      else
                      begin
                        if f_gerais.determinarVED() = 'E' then
                        begin
                          v := 0;
                          e := 1;
                          d := 0;
                        end
                        else
                        begin
                          v := 0;
                          e := 0;
                          d := 1;
                        end;
                      end; // v, e, d
                      j := v + e + d; // jogos
                      DecodeDate(StrToDate(EdtData.Text), ano, mes, dia); // ano
                      if EdtCodMandante.Text = '0' then
                      begin
                        codigoadver := StrToInt(EdtCodVisitante.Text);
                        gp := StrToInt(EdtPlacarMandante.Text);
                        gc := StrToInt(EdtPlacarVisitante.Text);
                        sg := gp - gc;
                      end
                      else
                      begin
                        codigoadver := StrToInt(EdtCodMandante.Text);
                        // codadver
                        gp := StrToInt(EdtPlacarVisitante.Text); // gp
                        gc := StrToInt(EdtPlacarMandante.Text); // gc
                        sg := gp - gc; // sg
                      end;

                      codigojogo := StrToInt(EdtCodigo.Text); // codjogo

                      if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
                      begin
                        sql := 'insert into ES_RESUM values (' +
                          ':CODJOGO, :CODADVER, :J, :V, :E, :D, :GP, :GC, :SG, :ANO)';

                        FrmDm.QrGeral.Close;
                        FrmDm.QrGeral.sql.Clear;
                        FrmDm.QrGeral.sql.Add(sql);
                        FrmDm.QrGeral.Params.ParamByName('CODJOGO').AsInteger :=
                          codigojogo;
                        FrmDm.QrGeral.Params.ParamByName('CODADVER').AsInteger
                          := codigoadver;
                        FrmDm.QrGeral.Params.ParamByName('J').AsInteger := j;
                        FrmDm.QrGeral.Params.ParamByName('V').AsInteger := v;
                        FrmDm.QrGeral.Params.ParamByName('E').AsInteger := e;
                        FrmDm.QrGeral.Params.ParamByName('D').AsInteger := d;
                        FrmDm.QrGeral.Params.ParamByName('GP').AsInteger := gp;
                        FrmDm.QrGeral.Params.ParamByName('GC').AsInteger := gc;
                        FrmDm.QrGeral.Params.ParamByName('SG').AsInteger := sg;
                        FrmDm.QrGeral.Params.ParamByName('ANO')
                          .AsInteger := ano;
                        FrmDm.QrGeral.ExecSQL;
                      end
                      else
                      begin
                        if FrmDm.DtsJogos.DataSet.State in [dsEdit] then
                        begin
                          sql := 'update ES_RESUM ' +
                            'set codadver = :CODADVER, j = :J, v = :V, e = :E, d = :D, gp =:GP, gc =:GC, sg = :SG, ano = :ANO '
                            + 'where codjogo = :CODJOGO ';

                          FrmDm.QrGeral.Close;
                          FrmDm.QrGeral.sql.Clear;
                          FrmDm.QrGeral.sql.Add(sql);
                          FrmDm.QrGeral.Params.ParamByName('CODJOGO').AsInteger
                            := codigojogo;
                          FrmDm.QrGeral.Params.ParamByName('CODADVER').AsInteger
                            := codigoadver;
                          FrmDm.QrGeral.Params.ParamByName('J').AsInteger := j;
                          FrmDm.QrGeral.Params.ParamByName('V').AsInteger := v;
                          FrmDm.QrGeral.Params.ParamByName('E').AsInteger := e;
                          FrmDm.QrGeral.Params.ParamByName('D').AsInteger := d;
                          FrmDm.QrGeral.Params.ParamByName('GP')
                            .AsInteger := gp;
                          FrmDm.QrGeral.Params.ParamByName('GC')
                            .AsInteger := gc;
                          FrmDm.QrGeral.Params.ParamByName('SG')
                            .AsInteger := sg;
                          FrmDm.QrGeral.Params.ParamByName('ANO')
                            .AsInteger := ano;
                          FrmDm.QrGeral.ExecSQL;
                        end;
                      end;

                      sql := 'update ES_TITUL ' + 'set ano = :ANO ' +
                        'where codjogo = :CODJOGO';
                      FrmDm.QrGeral.Close;
                      FrmDm.QrGeral.sql.Clear;
                      FrmDm.QrGeral.sql.Add(sql);
                      FrmDm.QrGeral.Params.ParamByName('CODJOGO').AsInteger :=
                        codigojogo;
                      FrmDm.QrGeral.Params.ParamByName('ANO').AsInteger := ano;
                      FrmDm.QrGeral.ExecSQL;

                      sql := 'update ES_RESER ' + 'set ano = :ANO ' +
                        'where codjogo = :CODJOGO';
                      FrmDm.QrGeral.Close;
                      FrmDm.QrGeral.sql.Clear;
                      FrmDm.QrGeral.sql.Add(sql);
                      FrmDm.QrGeral.Params.ParamByName('CODJOGO').AsInteger :=
                        codigojogo;
                      FrmDm.QrGeral.Params.ParamByName('ANO').AsInteger := ano;
                      FrmDm.QrGeral.ExecSQL;

                      if Acessou then
                      begin
                          frmGolsdaPartida.Free;
                          Acessou := False;
                      end;

                      { GRAVAR TABELA CA_JOGOS ==================== }
                      FrmDm.DtsJogos.DataSet.Post;

                      estadoDosBotoesdeCadastro();
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;

end;

procedure TCA_JOGOS.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsJogos.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_JOGOS', 'codjogo'));
  cbPortaoFechado.Checked := False;
  estadoDosBotoesdeCadastro();
  EdtData.SetFocus;
end;

procedure TCA_JOGOS.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de jogos
  f_gerais.pesquisajogos(h_jogos.DbGridJogos, EmptyStr, EmptyStr);
  h_jogos.ShowModal;
end;

procedure TCA_JOGOS.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsJogos.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGOS.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsJogos.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGOS.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsJogos.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_JOGOS.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsJogos.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self)
  else
    f_gerais.ultimoJogo(FrmPrincipal.LblCodigo, FrmPrincipal.LblDataLocal,
      FrmPrincipal.LblPlacarMand, FrmPrincipal.LblPlacarVisit,
      FrmPrincipal.ImgMandante, FrmPrincipal.ImgVisitante);
  CA_JOGOS.Close;
end;

procedure TCA_JOGOS.estadoDosBotoesdeJogadores();
begin
  if f_gerais.contRegComUmParametro('es_titul', 'codjogo',
    CA_JOGOS.EdtCodigo.Text) = 0 then
  begin
    BtnEditaTitular.Enabled := false;
    BtnExcluirJogadores.Enabled := false;
    BtnSubstituicao.Enabled := false;
  end
  else
  begin
    BtnEditaTitular.Enabled := true;
    BtnExcluirJogadores.Enabled := true;
    BtnSubstituicao.Enabled := true;
  end;

  if f_gerais.contRegComUmParametro('es_reser', 'codjogo',
    CA_JOGOS.EdtCodigo.Text) = 0 then
    BtnExcluirReservas.Enabled := false
  else
    BtnExcluirReservas.Enabled := true;
end;

procedure TCA_JOGOS.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.DtsJogos.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsJogos.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := true;
    MnEditar.Enabled := true;
    MnExcluir.Enabled := true;
    BtnEstadio.Enabled := false;
    BtnAdversario.Enabled := false;
    BtnInverter.Enabled := false;
    BtnCompeticao.Enabled := false;
    BtnTempoGols.Enabled := False;
    BtnArbitro.Enabled := false;
    BtnFase.Enabled := false;
    BtnJogador.Enabled := false;
    BtnEditaTitular.Enabled := false;
    BtnSubstituicao.Enabled := false;
    BtnExcluirJogadores.Enabled := false;
    BtnExcluirReservas.Enabled := false;
    BtnUniforme.Enabled := false;
    btnVisualizarSumula.Enabled := True;

    // demais componentes
    EdtData.Enabled := false;
    DtData.Enabled := false;
    EdtHora.Enabled := false;
    CbxTatica.Enabled := false;
    EdtPublico.Enabled := false;
    cbPortaoFechado.Enabled := false;
    EdtPlacarMandante.Enabled := false;
    EdtPlacarVisitante.Enabled := false;
    EdtPenaltyMandante.Enabled := false;
    EdtPenaltyVisitante.Enabled := false;
    CbEscalacoDisp.Enabled := false;

    LblNomeEstadio.Caption := '';
    LblCidade.Caption := '';
    LblPais.Caption := '';
    LblUf.Caption := '';

    // checar se escalação está disponível
    if EdtCodigo.Text = EmptyStr then
       CbEscalacoDisp.Checked := false
    else
    begin
      if f_gerais.contRegComUmParametro('ES_TITUL', 'codjogo', EdtCodigo.Text) = 0
      then
        CbEscalacoDisp.Checked := true
      else
        CbEscalacoDisp.Checked := false;
    end;

  end;

  if FrmDm.DtsJogos.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    MnCadastrar.Enabled := false;
    MnEditar.Enabled := false;
    MnExcluir.Enabled := false;
    BtnEstadio.Enabled := true;
    BtnAdversario.Enabled := true;
    BtnInverter.Enabled := true;
    BtnCompeticao.Enabled := true;
    BtnTempoGols.Enabled := true;
    BtnArbitro.Enabled := true;
    BtnFase.Enabled := true;
    BtnJogador.Enabled := true;
    BtnEditaTitular.Enabled := true;
    BtnSubstituicao.Enabled := true;
    BtnExcluirJogadores.Enabled := true;
    BtnExcluirReservas.Enabled := true;
    BtnUniforme.Enabled := true;
    btnVisualizarSumula.Enabled := False;

    // demais componentes
    EdtData.Enabled := true;
    DtData.Enabled := true;
    EdtHora.Enabled := true;
    EdtPublico.Enabled := true;
    cbPortaoFechado.Enabled := true;
    CbxTatica.Enabled := true;
    EdtPlacarMandante.Enabled := true;
    EdtPlacarVisitante.Enabled := true;
    EdtPenaltyMandante.Enabled := true;
    EdtPenaltyVisitante.Enabled := true;
    EdtMandante.Clear;
    EdtVisitante.Clear;
    CbEscalacoDisp.Checked := false;
    CbEscalacoDisp.Enabled := true;

    estadoDosBotoesdeJogadores();
  end;

  if f_gerais.contadorRegistros('CA_JOGOS') > 0 then
  begin
    // escudos e nome dos clubes
    if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
    begin
      ImgLogoMandante.Picture.Graphic := nil;
      ImgLogoVisitante.Picture.Graphic := nil;
      ImgUniforme.Picture.Graphic := nil;
    end
    else
    begin
      // logo e nome dos clubes
      f_gerais.buscaImagemPorCodigo(ImgLogoMandante, EdtCodMandante.Text);
      f_gerais.buscaImagemPorCodigo(ImgLogoVisitante, EdtCodVisitante.Text);
      EdtMandante.Text := AnsiUpperCase(f_gerais.buscarNome('nome', 'CA_ADVER',
        'codadver', EdtCodMandante.Text));
      EdtVisitante.Text := AnsiUpperCase(f_gerais.buscarNome('nome', 'CA_ADVER',
        'codadver', EdtCodVisitante.Text));

      EdtNomeUniforme.Text := f_gerais.buscarNome('descricao', 'CA_UNIFORMES',
        'coduniforme', EdtCodUniforme.Text);
      f_gerais.buscaImagem(ImgUniforme, f_gerais.buscarNome('foto_uniforme',
        'CA_UNIFORMES', 'coduniforme', EdtCodUniforme.Text));
    end;
    // informacoes de fase, arbitro e competicao
    f_gerais.buscaInformacoesJogo(EdtCompeticao, EdtArbitro, EdtFase,
      EdtCodCompeticao, EdtCodArbitro, EdtCodFase);

    // informações do local do jogo
    f_gerais.buscaBandeirasJogos(ImgBandPaisAdver, ImgUfAdver,
      EdtCodEstadio.Text, LblCidade, LblPais, LblUf, LblNomeEstadio);

    // Limpar edts que não sejam TDBEdit
    if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
    begin
      EdtCompeticao.Clear;
      EdtArbitro.Clear;
      EdtFase.Clear;
      EdtNomeUniforme.Clear;
    end;
  end;
  // preencher jogadores titulares e reservas
  f_gerais.preencherGridTitulares(DbGridTitulares, EdtCodigo.Text);
  f_gerais.preencherGridReservas(DbGridReservas, EdtCodigo.Text);
end;

end.
