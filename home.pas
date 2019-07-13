unit home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Shellapi, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, VclTee.TeeGDIPlus, VclTee.TeEngine,
  VclTee.TeeProcs, VclTee.Chart, VclTee.DBChart, VclTee.Series, frameGrafico;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    MnCadastro: TMenuItem;
    MnClubes: TMenuItem;
    MnJogadores: TMenuItem;
    MnEstadios: TMenuItem;
    BtnCadJogos: TBitBtn;
    BtnCadTitulos: TBitBtn;
    BtnCadEstadios: TBitBtn;
    BtnCadJogadores: TBitBtn;
    BtnCadClubes: TBitBtn;
    BtnCadArbitros: TBitBtn;
    LblAcoes: TLabel;
    MnArbitros: TMenuItem;
    MnTitulos: TMenuItem;
    MnJogos: TMenuItem;
    MnTatica: TMenuItem;
    MnSair: TMenuItem;
    Label2: TLabel;
    LblVersao: TLabel;
    MnFases: TMenuItem;
    MnCompeticao: TMenuItem;
    MnRelatorios: TMenuItem;
    MnEditar: TMenuItem;
    MnBloquear: TMenuItem;
    MnLiberar: TMenuItem;
    MnLiberarAno: TMenuItem;
    MnGoleadas: TMenuItem;
    MnGoleadas1: TMenuItem;
    MnGoleadas2: TMenuItem;
    MnGoleadas3: TMenuItem;
    MnGoleadas4: TMenuItem;
    MnPublico: TMenuItem;
    MnRelJogos: TMenuItem;
    MnRivais: TMenuItem;
    MnRelAdversarios: TMenuItem;
    MnAdversario1: TMenuItem;
    MnAdversario2: TMenuItem;
    MnAdversarios3: TMenuItem;
    MnAdversario4: TMenuItem;
    MnAdversario5: TMenuItem;
    MnAdversario6: TMenuItem;
    MnRelJogadores: TMenuItem;
    MnJogadores1: TMenuItem;
    MnJogadores2: TMenuItem;
    MnJogosAno: TMenuItem;
    MnJogosArbitro: TMenuItem;
    MnJogosCampeonato: TMenuItem;
    MnJogosCampeonato1: TMenuItem;
    MnJogosCampeonato2: TMenuItem;
    MnAdversario7: TMenuItem;
    MnJogosEstadio: TMenuItem;
    MnJogosUf: TMenuItem;
    MnJogosPais: TMenuItem;
    MnJogosPeriodo: TMenuItem;
    MnPlacar: TMenuItem;
    MnPlacarFreq: TMenuItem;
    MnFreq1: TMenuItem;
    MnFreq2: TMenuItem;
    MnFreq3: TMenuItem;
    MnJogadores3: TMenuItem;
    MnJogadores4: TMenuItem;
    MnJogadores5: TMenuItem;
    LblCodigo: TLabel;
    LblDataLocal: TLabel;
    ImgVisitante: TImage;
    LblPlacarVisit: TLabel;
    LblVs: TLabel;
    LblPlacarMand: TLabel;
    ImgMandante: TImage;
    ShUltimoJogo: TShape;
    LblTitulo: TLabel;
    MnJogadores6: TMenuItem;
    MnJogadores7: TMenuItem;
    MnJogadores8: TMenuItem;
    MnCidades: TMenuItem;
    MnDezMais: TMenuItem;
    Os10Mais1: TMenuItem;
    Os10Mais2: TMenuItem;
    Os10Mais3: TMenuItem;
    Os10Mais4: TMenuItem;
    Os10Mais5: TMenuItem;
    Os10Mais6: TMenuItem;
    MnEstGerais: TMenuItem;
    MnCampanha: TMenuItem;
    N1: TMenuItem;
    MnRelTitulos: TMenuItem;
    Shape7: TShape;
    LblTemp: TLabel;
    Label10: TLabel;
    Shape1: TShape;
    LblJogos: TLabel;
    Label4: TLabel;
    LblJogad: TLabel;
    Label6: TLabel;
    LblTecn: TLabel;
    Label8: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Timer1: TTimer;
    StbSistema: TStatusBar;
    MnUsuario: TMenuItem;
    BalloonHint1: TBalloonHint;
    MnAjuda: TMenuItem;
    MnSobre: TMenuItem;
    MnBackup: TMenuItem;
    MnRestore: TMenuItem;
    BtnBackup: TBitBtn;
    LblUltimoBackup: TLabel;
    BasedeDados1: TMenuItem;
    Os10Mais7: TMenuItem;
    MnPatroc: TMenuItem;
    Fornecedores1: TMenuItem;
    MnUniformes: TMenuItem;
    DtsQrAux: TDataSource;
    QrAux: TFDQuery;
    PorCamisa1: TMenuItem;
    MnPublicoMenor: TMenuItem;
    Mn10UltimosJogos: TMenuItem;
    Goleirosquemaisatuaram1: TMenuItem;
    Maioresartilheiroscontrarivais1: TMenuItem;
    Maioresgoleadasaplicadasemrivais1: TMenuItem;
    Maioresgoleadassofridasporrivais1: TMenuItem;
    MnJogadores9: TMenuItem;
    MnJogadores10: TMenuItem;
    MnFornec: TMenuItem;
    Shape10: TShape;
    Shape11: TShape;
    MnMesAno: TMenuItem;
    MnJogosPatroc: TMenuItem;
    BtnUniformes: TBitBtn;
    MnCodJogo: TMenuItem;
    MnHattricks: TMenuItem;
    MnJogadores11: TMenuItem;
    MnJogosComTecnico: TMenuItem;
    Maioreszagueirosartilheiros1: TMenuItem;
    Pblicos1: TMenuItem;
    MnPublicoMaiorAno: TMenuItem;
    MnPublicoMenorAno: TMenuItem;
    MnAtualizar: TMenuItem;
    Gerenciadordejogos1: TMenuItem;
    N2: TMenuItem;
    fraGrafico: TfraGrafico;
    procedure FormActivate(Sender: TObject);
    procedure MnClubesClick(Sender: TObject);
    procedure MnJogadoresClick(Sender: TObject);
    procedure MnEstadiosClick(Sender: TObject);
    procedure BtnCadJogosMouseEnter(Sender: TObject);
    procedure BtnCadJogosMouseLeave(Sender: TObject);
    procedure BtnCadTitulosMouseEnter(Sender: TObject);
    procedure BtnCadTitulosMouseLeave(Sender: TObject);
    procedure BtnCadEstadiosMouseEnter(Sender: TObject);
    procedure BtnCadEstadiosMouseLeave(Sender: TObject);
    procedure BtnCadJogadoresMouseLeave(Sender: TObject);
    procedure BtnCadJogadoresMouseEnter(Sender: TObject);
    procedure BtnCadClubesMouseEnter(Sender: TObject);
    procedure BtnCadClubesMouseLeave(Sender: TObject);
    procedure BtnCadArbitrosMouseLeave(Sender: TObject);
    procedure BtnCadArbitrosMouseEnter(Sender: TObject);
    procedure BtnCadEstadiosClick(Sender: TObject);
    procedure BtnCadJogadoresClick(Sender: TObject);
    procedure BtnCadClubesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MnSairClick(Sender: TObject);
    procedure MnArbitrosClick(Sender: TObject);
    procedure BtnCadArbitrosClick(Sender: TObject);
    procedure MnTitulosClick(Sender: TObject);
    procedure BtnCadTitulosClick(Sender: TObject);
    procedure MnFasesClick(Sender: TObject);
    procedure MnCompeticaoClick(Sender: TObject);
    procedure MnJogosClick(Sender: TObject);
    procedure BtnCadJogosClick(Sender: TObject);
    procedure MnTaticaClick(Sender: TObject);
    procedure MnBloquearClick(Sender: TObject);
    procedure MnLiberarClick(Sender: TObject);
    procedure MnLiberarAnoClick(Sender: TObject);
    procedure MnGoleadas1Click(Sender: TObject);
    procedure MnGoleadas2Click(Sender: TObject);
    procedure MnGoleadas3Click(Sender: TObject);
    procedure MnGoleadas4Click(Sender: TObject);
    procedure MnPublicoClick(Sender: TObject);
    procedure MnRivaisClick(Sender: TObject);
    procedure MnAdversario1Click(Sender: TObject);
    procedure MnAdversario2Click(Sender: TObject);
    procedure MnAdversarios3Click(Sender: TObject);
    procedure MnAdversario4Click(Sender: TObject);
    procedure MnAdversario5Click(Sender: TObject);
    procedure MnUltimosJogosClick(Sender: TObject);
    procedure MnAdversario6Click(Sender: TObject);
    procedure MnJogadores1Click(Sender: TObject);
    procedure MnJogadores2Click(Sender: TObject);
    procedure MnJogosAnoClick(Sender: TObject);
    procedure MnJogosArbitroClick(Sender: TObject);
    procedure MnJogosCampeonato1Click(Sender: TObject);
    procedure MnJogosCampeonato2Click(Sender: TObject);
    procedure MnAdversario7Click(Sender: TObject);
    procedure MnJogosEstadioClick(Sender: TObject);
    procedure MnJogosUfClick(Sender: TObject);
    procedure MnJogosPaisClick(Sender: TObject);
    procedure MnJogosPeriodoClick(Sender: TObject);
    procedure MnPlacarClick(Sender: TObject);
    procedure MnFreq1Click(Sender: TObject);
    procedure MnFreq2Click(Sender: TObject);
    procedure MnFreq3Click(Sender: TObject);
    procedure MnJogadores3Click(Sender: TObject);
    procedure MnJogadores4Click(Sender: TObject);
    procedure MnJogadores5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure LblDataLocalClick(Sender: TObject);
    procedure MnJogadores6Click(Sender: TObject);
    procedure MnJogadores7Click(Sender: TObject);
    procedure MnJogadores8Click(Sender: TObject);
    procedure MnCidadesClick(Sender: TObject);
    procedure Os10Mais1Click(Sender: TObject);
    procedure Os10Mais2Click(Sender: TObject);
    procedure Os10Mais3Click(Sender: TObject);
    procedure Os10Mais4Click(Sender: TObject);
    procedure Os10Mais5Click(Sender: TObject);
    procedure Os10Mais6Click(Sender: TObject);
    procedure MnEstGeraisClick(Sender: TObject);
    procedure MnCampanhaClick(Sender: TObject);
    procedure MnRelTitulosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure MnUsuarioClick(Sender: TObject);
    procedure MnSobreClick(Sender: TObject);
    procedure MnBackupClick(Sender: TObject);
    procedure BtnBackupClick(Sender: TObject);
    procedure BtnBackupMouseEnter(Sender: TObject);
    procedure BtnBackupMouseLeave(Sender: TObject);
    procedure MnRestoreClick(Sender: TObject);
    procedure Os10Mais7Click(Sender: TObject);
    procedure MnPatrocClick(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure MnUniformesClick(Sender: TObject);
    procedure PorCamisa1Click(Sender: TObject);
    procedure MnPublicoMenorClick(Sender: TObject);
    procedure Mn10UltimosJogosClick(Sender: TObject);
    procedure Goleirosquemaisatuaram1Click(Sender: TObject);
    procedure Maioresartilheiroscontrarivais1Click(Sender: TObject);
    procedure Maioresgoleadasaplicadasemrivais1Click(Sender: TObject);
    procedure Maioresgoleadassofridasporrivais1Click(Sender: TObject);
    procedure MnJogadores9Click(Sender: TObject);
    procedure MnJogadores10Click(Sender: TObject);
    procedure MnFornecClick(Sender: TObject);
    procedure MnMesAnoClick(Sender: TObject);
    procedure MnJogosPatrocClick(Sender: TObject);
    procedure BtnUniformesClick(Sender: TObject);
    procedure BtnUniformesMouseEnter(Sender: TObject);
    procedure BtnUniformesMouseLeave(Sender: TObject);
    procedure MnCodJogoClick(Sender: TObject);
    procedure MnHattricksClick(Sender: TObject);
    procedure MnJogadores11Click(Sender: TObject);
    procedure MnJogosComTecnicoClick(Sender: TObject);
    procedure Maioreszagueirosartilheiros1Click(Sender: TObject);
    procedure MnPublicoMaiorAnoClick(Sender: TObject);
    procedure MnPublicoMenorAnoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MnAtualizarClick(Sender: TObject);
    procedure Gerenciadordejogos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InformacoesIniciais;

  var
    indicador: String;
    codigousuario: integer;
  end;

var
  FrmPrincipal: TFrmPrincipal;
  sql, msg: String;
  i, cont: integer;

implementation

{$R *.dfm}

uses module, adversarios, estadios, jogadores, funcoes, arbitros, titulos,
  fases, competicao, jogos, tatica, liberarjogador, telapadraojogos,
  pesquisaclubes, selecionarano, selecionaperiodo, pesquisajogadores,
  pesquisaarbitros, pesquisacompeticao, pesquisaestadios, selecionauf,
  selecionapais, selecionaplacar, frequenciaplacar, geraljogadores,
  r_vitimasdegolsdojogador, pesquisacidades, estatisticasgerais, campanhageral,
  relacaotitulos, usuario, informacao, backup, restore, splash, patrocinadores,
  fornecedor, uniformes, pesquisauniformes, pesquisafornecedor, h_mes,
  pesquisapatrocinador, informacodigojogo, UGerenciadorJogos;

procedure TFrmPrincipal.InformacoesIniciais;
begin
  if f_gerais.contadorRegistros('ca_uniformes') = 0 then
  // insere o valor 0 - Nenhum na tabela de uniformes
  // se nao houver nenhum registro na tabela ou
  // se houver registro mas o valor minimo não for zero
  begin
    sql := 'insert into ca_uniformes values (0, :DESC, null)';

    QrAux.Close;
    QrAux.sql.Clear;
    QrAux.sql.Add(sql);
    QrAux.Params.ParamByName('DESC').AsString := 'Nenhum';
    QrAux.ExecSQL;
  end
  else
  begin
    sql := 'select min(coduniforme) from ca_uniformes';
    QrAux.Close;
    QrAux.sql.Clear;
    QrAux.sql.Add(sql);
    QrAux.Open;

    if QrAux.Fields[0].AsInteger <> 0 then
    begin
      sql := 'insert into ca_uniformes values (0, :DESC, null)';

      QrAux.Close;
      QrAux.sql.Clear;
      QrAux.sql.Add(sql);
      QrAux.Params.ParamByName('DESC').AsString := 'Nenhum';
      QrAux.ExecSQL;
    end;

  end;

  if indicador = 'S' then
  // esse indicador serve para testar se o usuário efetuou o login ou não
  // S quer dizer que ele colocou usuário e senha e logou normalmente
  // N quer dizer que ele não logou, fechou o form ou cancelou a entrada
  begin
    f_gerais.captionForm(FrmPrincipal);
    f_gerais.ultimoJogo(LblCodigo, LblDataLocal, LblPlacarMand, LblPlacarVisit,
      ImgMandante, ImgVisitante);

    f_gerais.testaUsuario(codigousuario);

    if (f_gerais.contadorRegistros('ca_jogad') = 0) and
      (StrToInt(f_gerais.buscarNome('perfil', 'ca_user', 'codusuario',
      IntToStr(codigousuario))) = 0) then
      MnEditar.Enabled := false
    else
      MnEditar.Enabled := True;

    if (f_gerais.contadorRegistros('ca_jogos') = 0) then
    begin
      MnRelatorios.Enabled := false;
      MnTitulos.Enabled := false;
      BtnCadTitulos.Enabled := false;
      ImgMandante.Visible := false;
      ImgVisitante.Visible := false;
      LblPlacarVisit.Visible := false;
      LblPlacarMand.Visible := false;
      LblDataLocal.Visible := false;
      LblVs.Visible := false;
      LblTitulo.Visible := false;
      ShUltimoJogo.Visible := false;
    end
    else
    begin
      MnRelatorios.Enabled := True;
      MnTitulos.Enabled := True;
      BtnCadTitulos.Enabled := True;
      ImgMandante.Visible := True;
      ImgVisitante.Visible := True;
      LblPlacarVisit.Visible := True;
      LblPlacarMand.Visible := True;
      LblDataLocal.Visible := True;
      LblVs.Visible := True;
      LblTitulo.Visible := True;
      ShUltimoJogo.Visible := True;
    end;

    if (f_gerais.contadorRegistros('ca_jogad') = 0) or
      (f_gerais.contadorRegistros('ca_adver') = 0) or
      (f_gerais.contadorRegistros('ca_compe') = 0) or
      (f_gerais.contadorRegistros('ca_estad') = 0) or
      (f_gerais.contadorRegistros('ca_arbit') = 0) or
      (f_gerais.contadorRegistros('ca_tatic') = 0) or
      (StrToInt(f_gerais.buscarNome('perfil', 'ca_user', 'nome',
      StbSistema.Panels[3].Text)) = 1) then
    begin
      MnJogos.Enabled := false;
      MnBackup.Enabled := false;
      BtnCadJogos.Enabled := false;
      BtnBackup.Enabled := false;
    end
    else
    begin
      MnJogos.Enabled := True;
      MnBackup.Enabled := True;
      BtnCadJogos.Enabled := True;
      BtnBackup.Enabled := True;
    end;

    f_gerais.infIniciais(LblTemp, LblJogos, LblJogad, LblTecn);
    fraGrafico.PreencherGrafico(StrToInt(LblCodigo.Caption));
  end;
end;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  f_gerais.preencherSumula(LblCodigo.Caption);
end;

procedure TFrmPrincipal.BtnBackupClick(Sender: TObject);
begin
  MnBackupClick(Self);
end;

procedure TFrmPrincipal.BtnBackupMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'BACKUP DA BASE DE DADOS';
end;

procedure TFrmPrincipal.BtnBackupMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.BtnCadArbitrosClick(Sender: TObject);
begin
  MnArbitrosClick(Self);
end;

procedure TFrmPrincipal.BtnCadArbitrosMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'CADASTRO DE ÁRBITROS';
end;

procedure TFrmPrincipal.BtnCadArbitrosMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.BtnCadClubesClick(Sender: TObject);
begin
  MnClubesClick(Self);
end;

procedure TFrmPrincipal.BtnCadClubesMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'CADASTRO DE CLUBES';
end;

procedure TFrmPrincipal.BtnCadClubesMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.BtnCadEstadiosClick(Sender: TObject);
begin
  MnEstadiosClick(Self);
end;

procedure TFrmPrincipal.BtnCadEstadiosMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'CADASTRO DE ESTÁDIOS';
end;

procedure TFrmPrincipal.BtnCadEstadiosMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.BtnCadJogadoresClick(Sender: TObject);
begin
  MnJogadoresClick(Self);
end;

procedure TFrmPrincipal.BtnCadJogadoresMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'CADASTRO DE JOGADORES';
end;

procedure TFrmPrincipal.BtnCadJogadoresMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.BtnCadJogosClick(Sender: TObject);
begin
  MnJogosClick(Self);
end;

procedure TFrmPrincipal.BtnCadJogosMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'CADASTRO DE JOGOS';
end;

procedure TFrmPrincipal.BtnCadJogosMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.BtnCadTitulosClick(Sender: TObject);
begin
  MnTitulosClick(Self);
end;

procedure TFrmPrincipal.BtnCadTitulosMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'CADASTRO DE TÍTULOS';
end;

procedure TFrmPrincipal.BtnCadTitulosMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.BtnUniformesClick(Sender: TObject);
begin
  MnUniformesClick(Self);
end;

procedure TFrmPrincipal.BtnUniformesMouseEnter(Sender: TObject);
begin
  LblAcoes.Caption := 'CADASTRO DE UNIFORMES';
end;

procedure TFrmPrincipal.BtnUniformesMouseLeave(Sender: TObject);
begin
  LblAcoes.Caption := EmptyStr;
end;

procedure TFrmPrincipal.PorCamisa1Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaUniforme(h_uniformes.DbGridUniforme, 'TODOS');
  h_uniformes.identificacao := 'MnCamisas';
  h_uniformes.ShowModal;
end;

procedure TFrmPrincipal.MnJogosPatrocClick(Sender: TObject);
begin
  // preencher grid da pesquisa de patrocinadores
  f_gerais.pesquisaPatroc(h_patrocinador.DbGridPatroc, 'TODOS');
  h_patrocinador.identificacao := 'MnJogosPatroc';
  h_patrocinador.ShowModal;
end;

procedure TFrmPrincipal.MnMesAnoClick(Sender: TObject);
begin
  h_meses.origem := 'MnMesAno';
  h_meses.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores10Click(Sender: TObject);
begin
  r_jogospadrao.numerorelatorio := '35';
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  h_jogadores.identificacao := 'MnJogadores10';
  h_jogadores.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores11Click(Sender: TObject);
begin
  sql := 'select ca_jogad.codjogador, ca_jogad.nome, ca_jogad.dtnasc ' +
    'from ca_jogad ' + 'where month(ca_jogad.dtnasc) = month(now()) ' +
    'and day(ca_jogad.dtnasc) = day(now()) ' +
    'and ca_jogad.dtnasc != :DATAPADRAO ' + 'order by ca_jogad.dtnasc desc ' +
    'limit 14 offset 0';

  f_gerais.preencherAniversariantes(sql);
end;

procedure TFrmPrincipal.Mn10UltimosJogosClick(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '31';

  sql := 'select sum(a.j), sum(a.v), sum(a.e), sum(a.d), sum(a.gp), sum(a.gc), sum(a.sg) '
    + 'from ( ' +
    'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
    + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
    'group by j.data ' + 'order by j.data desc ' + 'limit 10 ' + ') as a';

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  if FrmDm.QrContador.Fields[0].AsInteger = 0 then
  begin
    msg := 'Seu time ainda nao jogou esse ano!';
    Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin

    // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
    // e dividir por 10 truncando o resultado, assim teremos a quantidade de
    // páginas a ser exibida.
    if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
    else
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

    r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
    f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

    // limpar o combobox das páginas e acrescentar os números de páginas atuais
    r_jogospadrao.CbxPagina.Clear;
    for i := 1 to cont do
    begin
      r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
    end;
    r_jogospadrao.CbxPagina.ItemIndex := 0;

    // agora faremos a pesquisa com retorno dos resultados para serem
    // arpesentados na tela padrão
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos order by data desc ' + 'limit :LIMITE offset :CORTE';

    // função para preencher a tela padrão com os resultados da sql acima
    f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

    // títulos e descrição do relatório
    r_jogospadrao.LblDescricao1.Caption := 'ÚLTIMOS 10 JOGOS DISPUTADOS';
    r_jogospadrao.LblDescricao2.Caption :=
      'Considerando todos os jogos cadastrados';
    // buscar escudo do seu time
    f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
    // definir título do formulário
    r_jogospadrao.Caption := 'Últimos 10 jogos disputados: ' +
      f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0');
    // mostara a consulta finalizada
    r_jogospadrao.ShowModal;
  end;
end;

procedure TFrmPrincipal.MnAdversario1Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnAdversario1';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnAdversario2Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnAdversario2';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnAdversario4Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnAdversario4';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnAdversario5Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnAdversario5';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnAdversario6Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnAdversario6';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnAdversario7Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnAdversario7';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnAdversarios3Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  f_gerais.anocompeticao := 'MnAdversario3';
  h_clubes.identificacao := 'MnAdversario3';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnArbitrosClick(Sender: TObject);
begin
  CA_ARBIT.ShowModal;
end;

procedure TFrmPrincipal.MnAtualizarClick(Sender: TObject);
begin
  InformacoesIniciais;
end;

procedure TFrmPrincipal.MnBackupClick(Sender: TObject);
begin
  FrmBackup.MemScript.Clear;
  FrmBackup.MemScript.Visible := false;
  FrmBackup.ShowModal;
end;

procedure TFrmPrincipal.MnBloquearClick(Sender: TObject);
begin
  f_gerais.atualizaSituacaoGeral(1);
end;

procedure TFrmPrincipal.MnCampanhaClick(Sender: TObject);
begin
  f_gerais.anocompeticao := 'estatisticasporano';
  f_gerais.preencherCbxAnos(r_campanhageral.CbxAnos);
  f_gerais.preencherGridsCampanhaGeral(r_campanhageral.CbxAnos.Text);
  r_campanhageral.Caption := 'CAMPANHA GERAL POR ANO - ' +
    r_campanhageral.CbxAnos.Text;
  f_gerais.buscaImagemPorCodigo(r_campanhageral.ImgSeutime, '0');
  r_jogospadrao.numerorelatorio := '28';
  r_jogospadrao.codauxiliar1 := r_campanhageral.CbxAnos.Text;
  r_campanhageral.ShowModal;
end;

procedure TFrmPrincipal.MnCidadesClick(Sender: TObject);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaCidade(h_cidades.DbGridCidades, 'TODOS');
  h_cidades.ShowModal;
end;

procedure TFrmPrincipal.MnClubesClick(Sender: TObject);
begin
  CA_ADVER.ShowModal;
end;

procedure TFrmPrincipal.MnCodJogoClick(Sender: TObject);
begin
  h_codjogo.ShowModal;
end;

procedure TFrmPrincipal.MnCompeticaoClick(Sender: TObject);
begin
  CA_COMPE.ShowModal;
end;

procedure TFrmPrincipal.MnEstadiosClick(Sender: TObject);
begin
  CA_ESTAD.ShowModal;
end;

procedure TFrmPrincipal.MnEstGeraisClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnEstGerais';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnFasesClick(Sender: TObject);
begin
  CA_FASE.ShowModal;
end;

procedure TFrmPrincipal.MnFornecClick(Sender: TObject);
begin
  // preencher grid da pesquisa de fornecedores
  f_gerais.pesquisaFornec(h_fornecedor.DbGridFornec, 'TODOS');
  h_fornecedor.identificacao := 'MnFornec';
  h_fornecedor.ShowModal;
end;

procedure TFrmPrincipal.MnGoleadas1Click(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '1';

  // contar a quantidade de registros retornados na pesquisa
  sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
    + 'from es_resum r ' + 'where sg >= 3';

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  if FrmDm.QrContador.Fields[0].AsInteger = 0 then
  begin
    msg := 'Seu time ainda não aplicou nenhuma goleada ' + #13 +
      'em seus adversários!';
    Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin

    // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
    // e dividir por 10 truncando o resultado, assim teremos a quantidade de
    // páginas a ser exibida.
    if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
    else
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

    r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
    f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

    // limpar o combobox das páginas e acrescentar os números de páginas atuais
    r_jogospadrao.CbxPagina.Clear;
    for i := 1 to cont do
    begin
      r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
    end;
    r_jogospadrao.CbxPagina.ItemIndex := 0;

    // agora faremos a pesquisa com retorno dos resultados para serem
    // arpesentados na tela padrão
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 saldo, placar1 golspro '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar1-placar2 >= 3 ' + 'union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 saldo, placar2 golspro '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar2-placar1 >= 3 ' +
      'order by saldo desc, golspro desc, data desc ' +
      'limit :LIMITE offset :CORTE';

    // função para preencher a tela padrão com os resultados da sql acima
    f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

    // títulos e descrição do relatório
    r_jogospadrao.LblDescricao1.Caption := 'MAIORES GOLEADAS APLICADAS';
    r_jogospadrao.LblDescricao2.Caption := 'POR 3 GOLS OU MAIS DE DIFERENÇA';
    // buscar escudo do seu time
    f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
    // definir título do formulário
    r_jogospadrao.Caption := 'Maiores Goleadas Aplicadas: ' +
      f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0');
    // mostara a consulta finalizada
    r_jogospadrao.ShowModal;
  end;

end;

procedure TFrmPrincipal.MnGoleadas2Click(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '2';

  // contar a quantidade de registros retornados na pesquisa
  sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
    + 'from es_resum r ' + 'where sg <= -3';

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  if FrmDm.QrContador.Fields[0].AsInteger = 0 then
  begin
    msg := 'Seu time ainda não sofreu nenhuma goleada ' + #13 +
      'de seus adversários!';
    Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin

    // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
    // e dividir por 10 truncando o resultado, assim teremos a quantidade de
    // páginas a ser exibida.
    if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
    else
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

    r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
    f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

    // limpar o combobox das páginas e acrescentar os números de páginas atuais
    r_jogospadrao.CbxPagina.Clear;
    for i := 1 to cont do
    begin
      r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
    end;
    r_jogospadrao.CbxPagina.ItemIndex := 0;

    // agora faremos a pesquisa com retorno dos resultados para serem
    // arpesentados na tela padrão
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as ADVER '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar2-placar1 >= 3 ' + 'union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as ADVER '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar1-placar2 >= 3 ' + 'order by saldo, adver desc, data desc ' +
      'limit :LIMITE offset :CORTE';

    // função para preencher a tela padrão com os resultados da sql acima
    f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

    // títulos e descrição do relatório
    r_jogospadrao.LblDescricao1.Caption := 'MAIORES GOLEADAS SOFRIDAS';
    r_jogospadrao.LblDescricao2.Caption := 'POR 3 GOLS OU MAIS DE DIFERENÇA';
    // buscar escudo do seu time
    f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
    // definir título do formulário
    r_jogospadrao.Caption := 'Maiores Goleadas Sofridas: ' +
      f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0');
    // mostara a consulta finalizada
    r_jogospadrao.ShowModal;
  end;
end;

procedure TFrmPrincipal.MnGoleadas3Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnGoleadas3';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnGoleadas4Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnGoleadas4';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.FormActivate(Sender: TObject);
begin
  InformacoesIniciais;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Application.MessageBox('Deseja realmente sair do sistema?', 'ATENÇÃO',
    36) = 7 then
    Action := caNone
    // nenhuma ação será executada ou seja não fechará o form.
  else
    Application.Terminate;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      FrmPrincipal.Close;
    VK_F5:
      BtnCadJogosClick(Self);
    VK_F6:
      BtnCadClubesClick(Self);
    VK_F7:
      BtnCadJogadoresClick(Self);
    VK_F8:
      BtnCadEstadiosClick(Self);
  end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  InformacoesIniciais;
end;

procedure TFrmPrincipal.Fornecedores1Click(Sender: TObject);
begin
  CA_FORNEC.ShowModal;
end;

procedure TFrmPrincipal.LblDataLocalClick(Sender: TObject);
begin
  f_gerais.preencherSumula(LblCodigo.Caption);
end;

procedure TFrmPrincipal.MnFreq1Click(Sender: TObject);
begin
  h_freqplacar.preencheListBox();
  h_freqplacar.LblTitulo.Caption := 'FREQUÊNCIA DE PLACARES - GERAL';
  h_freqplacar.ShowModal;
end;

procedure TFrmPrincipal.MnFreq2Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnFreq2';
  h_clubes.ShowModal;
  h_freqplacar.ShowModal;
end;

procedure TFrmPrincipal.MnFreq3Click(Sender: TObject);
begin
  f_gerais.anocompeticao := 'MnFreq3';
  h_anos.identificacao := 'MnFreq3';
  h_anos.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores1Click(Sender: TObject);
begin
  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  h_jogadores.identificacao := 'MnJogadores1';
  h_jogadores.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores2Click(Sender: TObject);
begin
  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  h_jogadores.identificacao := 'MnJogadores2';
  Application.MessageBox('Selecione o 1º Jogador ou Técnico', 'SELEÇAO',
    MB_OK + MB_ICONINFORMATION);
  h_jogadores.ShowModal;
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  h_jogadores.identificacao := 'MnJogadores2a';
  Application.MessageBox('Selecione o 2º Jogador ou Técnico', 'SELEÇAO',
    MB_OK + MB_ICONINFORMATION);
  h_jogadores.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores3Click(Sender: TObject);
begin
  f_gerais.anocompeticao := 'EstatisticasGeraisJogador';
  f_gerais.preencherCbxAnos(r_geraljogador.CbxAnos);
  f_gerais.preencherEstatisticasGeraisJogadores
    (r_geraljogador.DbGridEstatisticas, r_geraljogador.CbxAnos.Text, 'G');
  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(r_geraljogador.DbGridEstatisticas.Columns[0]
    .Field.AsString, r_geraljogador.ImgNacionalidade,
    r_geraljogador.ImgFotoJogador, r_geraljogador.LblApelido,
    r_geraljogador.LblNomeCompleto, r_geraljogador.LblPeriodo,
    r_geraljogador.LblPosicao);
  r_geraljogador.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores4Click(Sender: TObject);
begin
  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  h_jogadores.identificacao := 'MnJogadores4';
  h_jogadores.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores5Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnJogadores5';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores6Click(Sender: TObject);
begin
  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  h_jogadores.identificacao := 'MnJogadores6';
  h_jogadores.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores7Click(Sender: TObject);
begin
  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'MnAdversario8';
  h_clubes.ShowModal;
end;

procedure TFrmPrincipal.MnJogadores8Click(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '26';

  // contar a quantidade de registros retornados na pesquisa
  sql := 'select sum(j), sum(v), sum(e), sum(d), sum(gp), sum(gc), sum(sg) ' +
    'from ( ' +
    'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
    + 'from ca_jogos j, es_titul e, es_resum r ' +
    'where j.codjogo = e.codjogo ' + 'and j.codjogo = r.codjogo ' +
    'and e.gols >= 3 ' + 'union ' +
    'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
    + 'from ca_jogos j, es_reser e, es_resum r ' +
    'where j.codjogo = e.codjogo ' + 'and j.codjogo = r.codjogo ' +
    'and e.gols >= 3 ' + ') as a';

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  if FrmDm.QrContador.Fields[0].AsInteger = 0 then
  begin
    msg := 'Nenhum jogador marcou 3 gols ou mais eu uma única partida!';
    Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin

    // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
    // e dividir por 10 truncando o resultado, assim teremos a quantidade de
    // páginas a ser exibida.
    if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
    else
      cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

    r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
    f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

    // limpar o combobox das páginas e acrescentar os números de páginas atuais
    r_jogospadrao.CbxPagina.Clear;
    for i := 1 to cont do
    begin
      r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
    end;
    r_jogospadrao.CbxPagina.ItemIndex := 0;

    // agora faremos a pesquisa com retorno dos resultados para serem
    // arpesentados na tela padrão
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, gols, codjogador '
      + 'from ( ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
      + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
      'and e.gols >= 3 ' + 'union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
      + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
      'and e.gols >= 3 ' + ') as a ' + 'order by gols desc, data desc ' +
      'limit :LIMITE offset :CORTE';

    // função para preencher a tela padrão com os resultados da sql acima
    f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

    // títulos e descrição do relatório
    r_jogospadrao.LblDescricao1.Caption := 'MAIORES ARTILHEIROS POR JOGO';
    r_jogospadrao.LblDescricao2.Caption :=
      'que marcaram 3 gols ou mais em uma mesma partida';
    // buscar escudo do seu time
    f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
    // definir título do formulário
    r_jogospadrao.Caption := 'Maiores Artilheiros por Jogo';
    // mostara a consulta finalizada
    r_jogospadrao.ShowModal;
  end;
end;

procedure TFrmPrincipal.MnJogadores9Click(Sender: TObject);
var
  codigos: String;
begin
  // preencher grid da pesquisa de Jogadores
  codigos := f_gerais.retornaCodigosRivais();

  if codigos = EmptyStr then
  begin
    msg := 'Não há rivais cadastrados no sistema!';
    Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    r_jogospadrao.numerorelatorio := '34';
    r_jogospadrao.codauxiliar1 := f_gerais.retornaCodigosRivais();
    f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
    h_jogadores.identificacao := 'MnJogadores9';
    h_jogadores.ShowModal;
  end;
end;

procedure TFrmPrincipal.MnJogadoresClick(Sender: TObject);
begin
  CA_JOGAD.ShowModal;
end;

procedure TFrmPrincipal.MnJogosAnoClick(Sender: TObject);
begin
  f_gerais.anocompeticao := 'MnJogosAno';
  h_anos.identificacao := 'MnJogosAno';
  h_anos.ShowModal;
end;

procedure TFrmPrincipal.MnJogosArbitroClick(Sender: TObject);
begin
  // preencher grid da pesquisa de arbitros
  f_gerais.pesquisaArbitro(h_arbitros.DbGridArbitro, 'TODOS');
  h_arbitros.identificacao := 'MnJogosArbitro';
  h_arbitros.ShowModal;
end;

procedure TFrmPrincipal.MnJogosClick(Sender: TObject);
begin
  if not f_gerais.verifJogParaCadastroJogos() then
  begin
    CA_JOGOS.ShowModal;
  end;
end;

procedure TFrmPrincipal.MnJogosEstadioClick(Sender: TObject);
begin
  // preencher grid da pesquisa de estádios
  f_gerais.pesquisaEstadio(h_estadios.DbGridEstadio, 'TODOS');
  h_estadios.identificacao := 'MnJogosEstadio';
  h_estadios.ShowModal;
end;

procedure TFrmPrincipal.MnJogosPaisClick(Sender: TObject);
begin
  h_pais.identificacao := 'MnJogosPais';
  h_pais.ShowModal;
end;

procedure TFrmPrincipal.MnJogosPeriodoClick(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '23';
  h_periodo.identificacao := 'MnJogosPeriodo';
  h_periodo.ShowModal;
end;

procedure TFrmPrincipal.MnJogosUfClick(Sender: TObject);
begin
  h_uf.identificacao := 'MnJogosUf';
  h_uf.ShowModal;
end;

procedure TFrmPrincipal.MnLiberarAnoClick(Sender: TObject);
begin
  f_gerais.liberaJogadores('TODOS');
  h_liberarjogador.ShowModal;
end;

procedure TFrmPrincipal.MnLiberarClick(Sender: TObject);
begin
  f_gerais.atualizaSituacaoGeral(0);
end;

procedure TFrmPrincipal.MnPatrocClick(Sender: TObject);
begin
  CA_PATROC.ShowModal;
end;

procedure TFrmPrincipal.MnPlacarClick(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '24';
  f_gerais.buscaImagemPorCodigo(h_placar.ImgEscudoSeutime, '0');
  h_placar.identificacao := 'MnPlacar';
  h_placar.ShowModal;
end;

procedure TFrmPrincipal.MnPublicoClick(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '5';

  // contar a quantidade de registros retornados na pesquisa
  sql := 'select count(*) from ca_jogos where publico > 0';

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
  // e dividir por 10 truncando o resultado, assim teremos a quantidade de
  // páginas a ser exibida.
  if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
    cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
  else
    cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

  r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
  r_jogospadrao.LblDescricao3.Caption := EmptyStr;

  // limpar o combobox das páginas e acrescentar os números de páginas atuais
  r_jogospadrao.CbxPagina.Clear;
  for i := 1 to cont do
  begin
    r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
  end;
  r_jogospadrao.CbxPagina.ItemIndex := 0;

  // agora faremos a pesquisa com retorno dos resultados para serem
  // arpesentados na tela padrão
  sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
    + 'from ca_jogos where publico > 0 order by publico desc ' +
    'limit :LIMITE offset :CORTE';

  // função para preencher a tela padrão com os resultados da sql acima
  f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

  // títulos e descrição do relatório
  r_jogospadrao.LblDescricao1.Caption := 'MAIORES PÚBLICOS';
  r_jogospadrao.LblDescricao2.Caption :=
    'Considerando todos os jogos cadastrados';
  // buscar escudo do seu time
  f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
  // definir título do formulário
  r_jogospadrao.Caption := 'Maiores Públicos: ' + f_gerais.buscarNome('nome',
    'ca_adver', 'codadver', '0');
  // mostara a consulta finalizada
  r_jogospadrao.ShowModal;
end;

procedure TFrmPrincipal.MnPublicoMaiorAnoClick(Sender: TObject);
begin
  f_gerais.anocompeticao := 'MnPublicoMaiorAno';
  h_anos.identificacao := 'MnPublicoMaiorAno';
  h_anos.ShowModal;
end;

procedure TFrmPrincipal.MnPublicoMenorAnoClick(Sender: TObject);
begin
  f_gerais.anocompeticao := 'MnPublicoMenorAno';
  h_anos.identificacao := 'MnPublicoMenorAno';
  h_anos.ShowModal;
end;

procedure TFrmPrincipal.MnPublicoMenorClick(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '30';

  // contar a quantidade de registros retornados na pesquisa
  sql := 'select count(*) from ca_jogos where publico > 0';

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
  // e dividir por 10 truncando o resultado, assim teremos a quantidade de
  // páginas a ser exibida.
  if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
    cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
  else
    cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

  r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
  r_jogospadrao.LblDescricao3.Caption := EmptyStr;

  // limpar o combobox das páginas e acrescentar os números de páginas atuais
  r_jogospadrao.CbxPagina.Clear;
  for i := 1 to cont do
  begin
    r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
  end;
  r_jogospadrao.CbxPagina.ItemIndex := 0;

  // agora faremos a pesquisa com retorno dos resultados para serem
  // arpesentados na tela padrão
  sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
    + 'from ca_jogos where publico > 0 order by publico ' +
    'limit :LIMITE offset :CORTE';

  // função para preencher a tela padrão com os resultados da sql acima
  f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

  // títulos e descrição do relatório
  r_jogospadrao.LblDescricao1.Caption := 'MENORES PÚBLICOS';
  r_jogospadrao.LblDescricao2.Caption :=
    'Considerando todos os jogos cadastrados';
  // buscar escudo do seu time
  f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
  // definir título do formulário
  r_jogospadrao.Caption := 'Menores Públicos: ' + f_gerais.buscarNome('nome',
    'ca_adver', 'codadver', '0');
  // mostara a consulta finalizada
  r_jogospadrao.ShowModal;
end;

procedure TFrmPrincipal.MnRelTitulosClick(Sender: TObject);
begin
  r_titulos.LblTitNacional.Caption := EmptyStr;
  r_titulos.LblTitInter.Caption := EmptyStr;
  r_titulos.Caption := 'TÍTULOS CONQUISTADOS PELO ' +
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0'));
  f_gerais.relacaotitulos('N', r_titulos.LblTitNacional);
  f_gerais.relacaotitulos('I', r_titulos.LblTitInter);

  sql := 'select max(j.data) ' + 'from es_titulos t, ca_jogos j ' +
    'where t.ano = extract(year from j.data) ' +
    'and t.codcompeticao = j.codcompeticao ' +
    'and t.ano = (select max(ano) from es_titulos)';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Open;

  if f_gerais.idadeAtual(FrmDm.QrGeral.Fields[0].AsDateTime, now) <> EmptyStr
  then
    r_titulos.LblTempo.Caption := 'O ' + f_gerais.buscarNome('nome', 'ca_adver',
      'codadver', '0') + ' está há ' + f_gerais.idadeAtual
      (FrmDm.QrGeral.Fields[0].AsDateTime, now) + 'sem conquistar um título!'
  else
    r_titulos.LblTempo.Caption := 'Último título conquistado hoje!';

  f_gerais.buscaImagemPorCodigo(r_titulos.ImgEscudoSeutime, '0');
  f_gerais.qtdeDeTitulos(r_titulos.LblQtdeTitulos, r_titulos.LblUltimoTitulo);

  r_titulos.ShowModal;
end;

procedure TFrmPrincipal.MnRestoreClick(Sender: TObject);
begin
  FrmRestore.MemScript.Clear;
  FrmRestore.MemScript.Visible := false;
  FrmRestore.ShowModal;
end;

procedure TFrmPrincipal.MnRivaisClick(Sender: TObject);
begin
  f_gerais.anocompeticao := 'MnRivais';
  h_anos.identificacao := 'MnRivais';
  h_anos.ShowModal;
end;

procedure TFrmPrincipal.MnSairClick(Sender: TObject);
begin
  FrmPrincipal.Close;
end;

procedure TFrmPrincipal.MnSobreClick(Sender: TObject);
begin
  h_informacao.ShowModal;
end;

procedure TFrmPrincipal.MnTaticaClick(Sender: TObject);
begin
  CA_TATIC.ShowModal;
end;

procedure TFrmPrincipal.MnTitulosClick(Sender: TObject);
begin
  ES_TITULOS.ShowModal;
end;

procedure TFrmPrincipal.MnUltimosJogosClick(Sender: TObject);
begin
  // guardar o número do forumlário na label
  r_jogospadrao.numerorelatorio := '12';

  // contar a quantidade de registros retornados na pesquisa
  sql := 'select count(*) from ca_jogos where publico > 0';

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
  // e dividir por 10 truncando o resultado, assim teremos a quantidade de
  // páginas a ser exibida.
  if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
    cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
  else
    cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

  r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
  r_jogospadrao.LblDescricao3.Caption := EmptyStr;

  // limpar o combobox das páginas e acrescentar os números de páginas atuais
  r_jogospadrao.CbxPagina.Clear;
  for i := 1 to cont do
  begin
    r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
  end;
  r_jogospadrao.CbxPagina.ItemIndex := 0;

  // agora faremos a pesquisa com retorno dos resultados para serem
  // arpesentados na tela padrão
  sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
    + 'from ca_jogos where publico > 0 order by publico desc ' +
    'limit :LIMITE offset :CORTE';

  // função para preencher a tela padrão com os resultados da sql acima
  f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

  // títulos e descrição do relatório
  r_jogospadrao.LblDescricao1.Caption := 'MAIORES PÚBLICOS';
  r_jogospadrao.LblDescricao2.Caption :=
    'Considerando todos os jogos cadastrados';
  // buscar escudo do seu time
  f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
  // definir título do formulário
  r_jogospadrao.Caption := 'Maiores Públicos: ' + f_gerais.buscarNome('nome',
    'ca_adver', 'codadver', '0');
  // mostara a consulta finalizada
  r_jogospadrao.ShowModal;
end;

procedure TFrmPrincipal.MnUsuarioClick(Sender: TObject);
begin
  CA_USER.ShowModal;
end;

procedure TFrmPrincipal.Os10Mais1Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(gols) from( ' +
    'select e.codjogador, j.nome, sum(e.gols) gols ' +
    'from es_titul e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'group by e.codjogador, j.nome ' + 'union ' +
    'select e.codjogador, j.nome, sum(e.gols) gols ' +
    'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'group by e.codjogador, j.nome ' + ') as a ' + 'group by codjogador, nome '
    + 'order by 3 desc ' + 'limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 1);
end;

procedure TFrmPrincipal.Os10Mais2Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(gols), ano from( ' +
    'select e.ano, e.codjogador, j.nome, sum(e.gols) gols ' +
    'from es_titul e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'group by e.ano, e.codjogador, j.nome ' + 'having gols > 0 ' + 'union ' +
    'select e.ano, e.codjogador, j.nome, sum(e.gols) gols ' +
    'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'group by e.ano, e.codjogador, j.nome ' + 'having gols > 0 ' + ') as a ' +
    'group by ano, codjogador, nome ' + 'order by 3 desc, 4 desc, 2 ' +
    'limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 2);
end;

procedure TFrmPrincipal.Os10Mais3Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(jogos) from( ' +
    'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_titul e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao not in (6, 9) ' + 'group by e.codjogador, j.nome ' +
    'union ' + 'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao not in (6, 9) ' + 'group by e.codjogador, j.nome ' +
    ') as a ' + 'group by codjogador, nome ' + 'order by 3 desc ' +
    'limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 3);
end;

procedure TFrmPrincipal.Os10Mais4Click(Sender: TObject);
begin
  // Excluir o codigo de jogador 574 pois pertence a um grupo que
  // treinava o Fluminense em décadas passadas
  sql := 'select codjogador, nome, sum(jogos) from( ' +
    'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_titul e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao = 6 ' + 'and j.codjogador not in (574) ' +
    'group by e.codjogador, j.nome ' + 'union ' +
    'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao = 6 ' + 'and j.codjogador not in (574) ' +
    'group by e.codjogador, j.nome ' + ') as a ' + 'group by codjogador, nome '
    + 'order by 3 desc ' + 'limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 4);
end;

procedure TFrmPrincipal.Os10Mais5Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(ca+cv), sum(ca), sum(cv) from( ' +
    'select e.codjogador, j.nome, sum(e.camarelo) ca, sum(e.cvermelho) cv ' +
    'from es_titul e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'group by e.codjogador, j.nome ' + 'union ' +
    'select e.codjogador, j.nome, sum(e.camarelo) ca, sum(e.cvermelho) cv ' +
    'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'group by e.codjogador, j.nome ' + ') as a ' + 'group by codjogador, nome '
    + 'order by 3 desc, 5 desc, 4 desc ' + 'limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 5);
end;

procedure TFrmPrincipal.Os10Mais6Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(jogos) from( ' +
    'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_titul e, ca_jogad j, ca_cidad c, ca_pais p ' +
    'where e.codjogador = j.codjogador ' + 'and j.codcidade = c.codcidade ' +
    'and c.codpais = p.codpais ' + 'and p.sigla not in ("BRA") ' +
    'and j.codposicao not in (6) ' + 'group by e.codjogador, j.nome ' + 'union '
    + 'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_reser e, ca_jogad j, ca_cidad c, ca_pais p ' +
    'where e.codjogador = j.codjogador ' + 'and j.codcidade = c.codcidade ' +
    'and c.codpais = p.codpais ' + 'and p.sigla not in ("BRA") ' +
    'and j.codposicao not in (6) ' + 'group by e.codjogador, j.nome ' +
    ') as a ' + 'group by codjogador, nome ' + 'order by 3 desc ' +
    'limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 6);
end;

procedure TFrmPrincipal.Os10Mais7Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(gols)' +
    ' from( select e.codjogador, j.nome, sum(e.gols) gols' +
    ' from es_titul e, ca_jogad j, ca_cidad c, ca_pais p' +
    ' where e.codjogador = j.codjogador' + ' and j.codcidade = c.codcidade' +
    ' and c.codpais = p.codpais' + ' and p.sigla not in ("BRA")' +
    ' and j.codposicao not in (6)' + ' group by e.codjogador, j.nome' + ' union'
    + ' select e.codjogador, j.nome, sum(e.gols) gols' +
    ' from es_reser e, ca_jogad j, ca_cidad c, ca_pais p' +
    ' where e.codjogador = j.codjogador' + ' and j.codcidade = c.codcidade' +
    ' and c.codpais = p.codpais' + ' and p.sigla not in ("BRA")' +
    ' and j.codposicao not in (6)' + ' group by e.codjogador, j.nome ) as a' +
    ' group by codjogador, nome' + ' order by 3 desc limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 7);
end;

procedure TFrmPrincipal.Gerenciadordejogos1Click(Sender: TObject);
begin
  frmGerenciadorJogos.SelecionarJogos;
  frmGerenciadorJogos.ShowModal;
end;

procedure TFrmPrincipal.Goleirosquemaisatuaram1Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(jogos) from( ' +
    'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_titul e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao = 2 ' + 'group by e.codjogador, j.nome ' + 'union ' +
    'select e.codjogador, j.nome, count(*) jogos ' +
    'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao = 2 ' + 'group by e.codjogador, j.nome ' + ') as a ' +
    'group by codjogador, nome ' + 'order by 3 desc ' + 'limit 15 offset 0 ';

  f_gerais.preencherOsDezMais(sql, 8);
end;

procedure TFrmPrincipal.Maioresartilheiroscontrarivais1Click(Sender: TObject);
begin
  if f_gerais.contadorRegistros('ca_rival') > 0 then
  begin

    sql := 'select codjogador, nome, sum(gols) ' +
      'from( select e.codjogador, j.nome, sum(e.gols) gols ' +
      'from es_titul e, ca_jogad j, ca_cidad c, ca_pais p, es_resum r, ca_rival ri '
      + 'where e.codjogador = j.codjogador ' + 'and j.codcidade = c.codcidade '
      + 'and c.codpais = p.codpais ' + 'and e.codjogo = r.codjogo ' +
      'and r.codadver = ri.codadver ' + 'and j.codposicao not in (6) ' +
      'group by e.codjogador, j.nome ' + 'union ' +
      'select e.codjogador, j.nome, sum(e.gols) gols ' +
      'from es_reser e, ca_jogad j, ca_cidad c, ca_pais p, es_resum r, ca_rival ri '
      + 'where e.codjogador = j.codjogador ' + 'and j.codcidade = c.codcidade '
      + 'and c.codpais = p.codpais ' + 'and e.codjogo = r.codjogo ' +
      'and r.codadver = ri.codadver ' + 'and j.codposicao not in (6) ' +
      'group by e.codjogador, j.nome ' + ') as a ' +
      'group by codjogador, nome ' + 'order by 3 desc limit 15 offset 0 ';

    f_gerais.preencherOsDezMais(sql, 9);
  end
  else
    Application.MessageBox(PChar('Não há nenhum clube cadastrado como rival!'),
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
end;

procedure TFrmPrincipal.MnHattricksClick(Sender: TObject);
begin
  sql := 'select c, j, qtde from( ' +
    'select e.codjogador c, jg.nome j, count(r.j) qtde ' +
    'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c, ca_jogad jg '
    + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
    'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver ' +
    'and j.codestadio = es.codestadio ' +
    'and j.codcompeticao = c.codcompeticao ' +
    'and e.codjogador = jg.codjogador ' + 'and e.gols > 2 ' +
    'group by e.codjogador, jg.nome ' + 'union ' +
    'select e.codjogador c, jg.nome j, count(r.j) qtde ' +
    'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c,  ca_jogad jg '
    + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
    'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver ' +
    'and j.codestadio = es.codestadio ' +
    'and j.codcompeticao = c.codcompeticao ' +
    'and e.codjogador = jg.codjogador ' + 'and e.gols > 2 ' +
    'group by e.codjogador, j.codjogo ) as a ' + 'order by qtde desc, j ' +
    'limit 15 offset 0 ';

  f_gerais.preencherOsDezMais(sql, 10);
end;

procedure TFrmPrincipal.MnJogosComTecnicoClick(Sender: TObject);
begin
  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  h_jogadores.identificacao := 'MnTecnicos';
  h_jogadores.ShowModal;
end;

procedure TFrmPrincipal.Maioreszagueirosartilheiros1Click(Sender: TObject);
begin
  sql := 'select codjogador, nome, sum(gols) from( ' +
    'select e.codjogador, j.nome, sum(e.gols) gols ' +
    'from es_titul e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao = 8 ' + 'group by e.codjogador, j.nome ' + 'union ' +
    'select e.codjogador, j.nome, sum(e.gols) gols ' +
    'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
    'and j.codposicao = 8 ' + 'group by e.codjogador, j.nome ' + ') as a ' +
    'group by codjogador, nome ' + 'order by 3 desc ' + 'limit 15 offset 0';

  f_gerais.preencherOsDezMais(sql, 12);
end;

procedure TFrmPrincipal.Maioresgoleadasaplicadasemrivais1Click(Sender: TObject);
begin
  if f_gerais.contadorRegistros('ca_rival') > 0 then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '32';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r ' + 'where sg >= 3 ' +
      'and codadver in (select codadver from ca_rival) ';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Seu time ainda não aplicou nenhuma goleada ' + #13 +
        'em seus rivais!';
      Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // páginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das páginas e acrescentar os números de páginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 saldo, placar1 golspro '
        + 'from ca_jogos ' + 'where codadvermand = 0 ' +
        'and placar1-placar2 >= 3 ' +
        'and codadvervisit in (select codadver from ca_rival) ' + 'union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 saldo, placar2 golspro '
        + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
        'and placar2-placar1 >= 3 ' +
        'and codadvermand in (select codadver from ca_rival) ' +
        'order by saldo desc, golspro desc, data desc ' +
        'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption :=
        'MAIORES GOLEADAS APLICADAS EM RIVAIS:';
      r_jogospadrao.LblDescricao2.Caption :=
        AnsiUpperCase(f_gerais.retornaNomesRivais()) +
        ' - POR 3 GOLS OU MAIS DE DIFERENÇA';
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Maiores Goleadas Aplicadas: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0');
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end
  else
    Application.MessageBox(PChar('Não há nenhum clube cadastrado como rival!'),
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
end;

procedure TFrmPrincipal.Maioresgoleadassofridasporrivais1Click(Sender: TObject);
begin
  if f_gerais.contadorRegistros('ca_rival') > 0 then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '33';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r ' + 'where sg <= -3 ' +
      'and codadver in (select codadver from ca_rival) ';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Seu time ainda não sofreu nenhuma goleada ' + #13 +
        'de seus rivais!';
      Application.MessageBox(PChar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as páginas são mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // páginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das páginas e acrescentar os números de páginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as ADVER '
        + 'from ca_jogos ' + 'where codadvermand = 0 ' +
        'and placar2-placar1 >= 3 ' +
        'and codadvervisit in (select codadver from ca_rival) ' + 'union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as ADVER '
        + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
        'and placar1-placar2 >= 3 ' +
        'and codadvermand in (select codadver from ca_rival) ' +
        'order by saldo, adver desc, data desc ' +
        'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption :=
        'MAIORES GOLEADAS SOFRIDAS POR RIVAIS:';
      r_jogospadrao.LblDescricao2.Caption :=
        AnsiUpperCase(f_gerais.retornaNomesRivais()) +
        ' - POR 3 GOLS OU MAIS DE DIFERENÇA';
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Maiores Goleadas Sofridas por rivais: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0');
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end
  else
    Application.MessageBox(PChar('Não há nenhum clube cadastrado como rival!'),
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StbSistema.Panels[1].Text := timetostr(time);
  StbSistema.Panels[0].Text :=
    FormatDateTime('dddd", "dd" de "mmmm" de "yyyy', date);
  Timer1.Interval := 1000;
end;

procedure TFrmPrincipal.MnUniformesClick(Sender: TObject);
begin
  CA_UNIFORMES.ShowModal;
end;

procedure TFrmPrincipal.MnJogosCampeonato1Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisacompeticao(h_competicao.DbGridCompeticao, 'TODOS');
  h_competicao.identificacao := 'MnJogosCampeonato1';
  h_competicao.ShowModal;
end;

procedure TFrmPrincipal.MnJogosCampeonato2Click(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisacompeticao(h_competicao.DbGridCompeticao, 'TODOS');
  h_competicao.identificacao := 'MnJogosCampeonato2';
  h_competicao.ShowModal;
end;

end.
