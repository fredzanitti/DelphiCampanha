program CampanhaAnoaAno;

uses
  Vcl.Forms,
  SysUtils,
  Dialogs,
  Winapi.Windows,
  adversarios in 'adversarios.pas' {CA_ADVER},
  module in 'module.pas' {FrmDm: TDataModule},
  funcoes in 'funcoes.pas' {f_gerais},
  pesquisacidades in 'pesquisacidades.pas' {h_cidades},
  pesquisaclubes in 'pesquisaclubes.pas' {h_clubes},
  jogadores in 'jogadores.pas' {CA_JOGAD},
  selecionarfoto in 'selecionarfoto.pas' {h_editafoto},
  pesquisajogadores in 'pesquisajogadores.pas' {h_jogadores},
  estadios in 'estadios.pas' {CA_ESTAD},
  pesquisaestadios in 'pesquisaestadios.pas' {h_estadios},
  home in 'home.pas' {FrmPrincipal},
  arbitros in 'arbitros.pas' {CA_ARBIT},
  pesquisaarbitros in 'pesquisaarbitros.pas' {h_arbitros},
  titulos in 'titulos.pas' {ES_TITULOS},
  pesquisatitulos in 'pesquisatitulos.pas' {h_titulos},
  fases in 'fases.pas' {CA_FASE},
  h_fase in 'h_fase.pas' {h_fases},
  competicao in 'competicao.pas' {CA_COMPE},
  pesquisacompeticao in 'pesquisacompeticao.pas' {h_competicao},
  jogos in 'jogos.pas' {CA_JOGOS},
  pesquisajogadoresativos in 'pesquisajogadoresativos.pas' {h_jogadoresativos},
  reservas in 'reservas.pas' {h_substituicoes},
  edtiarescalacao in 'edtiarescalacao.pas' {h_editaescalacao},
  pesquisajogos in 'pesquisajogos.pas' {h_jogos},
  tatica in 'tatica.pas' {CA_TATIC},
  liberarjogador in 'liberarjogador.pas' {h_liberarjogador},
  telapadraojogos in 'telapadraojogos.pas' {r_jogospadrao},
  selecionarano in 'selecionarano.pas' {h_anos},
  selecionaperiodo in 'selecionaperiodo.pas' {h_periodo},
  selecionauf in 'selecionauf.pas' {h_uf},
  selecionapais in 'selecionapais.pas' {h_pais},
  selecionaplacar in 'selecionaplacar.pas' {h_placar},
  frequenciaplacar in 'frequenciaplacar.pas' {h_freqplacar},
  geraljogadores in 'geraljogadores.pas' {r_geraljogador},
  fichaindividual in 'fichaindividual.pas' {h_fichaindividual},
  sumula in 'sumula.pas' {r_sumula},
  r_vitimasdegolsdojogador in 'r_vitimasdegolsdojogador.pas' {r_vitimas},
  relatartilheirosporadver in 'relatartilheirosporadver.pas' {r_artilheirosporadver},
  fichareduzida in 'fichareduzida.pas' {r_fichareduzida},
  cidades in 'cidades.pas' {CA_CIDAD},
  dezmais in 'dezmais.pas' {r_dezmais},
  estatisticasgerais in 'estatisticasgerais.pas' {r_estgerais},
  campanhageral in 'campanhageral.pas' {r_campanhageral},
  relacaotitulos in 'relacaotitulos.pas' {r_titulos},
  splash in 'splash.pas' {FrmSplash},
  login in 'login.pas' {h_login},
  usuario in 'usuario.pas' {CA_USER},
  informacao in 'informacao.pas' {h_informacao},
  backup in 'backup.pas' {FrmBackup},
  restore in 'restore.pas' {FrmRestore},
  patrocinadores in 'patrocinadores.pas' {CA_PATROC},
  fornecedor in 'fornecedor.pas' {CA_FORNEC},
  uniformes in 'uniformes.pas' {CA_UNIFORMES},
  pesquisauniformes in 'pesquisauniformes.pas' {h_uniformes},
  pesquisapatrocinador in 'pesquisapatrocinador.pas' {h_patrocinador},
  pesquisafornecedor in 'pesquisafornecedor.pas' {h_fornecedor},
  h_mes in 'h_mes.pas' {h_meses},
  informacodigojogo in 'informacodigojogo.pas' {h_codjogo},
  aniversariantes in 'aniversariantes.pas' {r_aniversariantes},
  framePesquisaCidades in 'framePesquisaCidades.pas' {fraCidades: TFrame},
  frameBotoesMenuPadrao in 'frameBotoesMenuPadrao.pas' {fraBotoes: TFrame},
  UProgresso in 'UProgresso.pas' {frmProgresso},
  relTodosJogadores in 'relTodosJogadores.pas' {frmRelJogador},
  frameSelecionarJogador in 'frameSelecionarJogador.pas' {fraSelJogador: TFrame},
  frameSelecionarPosicao in 'frameSelecionarPosicao.pas' {fraSelPosicao: TFrame},
  SelRelatorioJogador in 'SelRelatorioJogador.pas' {frmSelRelatorioJogador},
  relTodosJogadoresComFoto in 'relTodosJogadoresComFoto.pas' {frmRelJogadorComFoto},
  frameSelecionarClube in 'frameSelecionarClube.pas' {fraSelecionarClube: TFrame},
  SelRelatorioAdversario in 'SelRelatorioAdversario.pas' {frmSelRelatorioAdversario},
  relTodosClubes in 'relTodosClubes.pas' {frmRelAdversarios},
  frameSelecionarNacionalidade in 'frameSelecionarNacionalidade.pas' {fraSelNacionalidade: TFrame},
  frameSelecionarEstado in 'frameSelecionarEstado.pas' {fraSelUf: TFrame},
  frameSelecionarAno in 'frameSelecionarAno.pas' {fraSelecionarAno: TFrame},
  carreirajogador in 'carreirajogador.pas' {frmCarreiraJogador},
  frameSelecionarAnoCompleto in 'frameSelecionarAnoCompleto.pas' {fraSelAnoCompleto: TFrame},
  frameSelecionarClubeCompleto in 'frameSelecionarClubeCompleto.pas' {fraSelClubeCompleto: TFrame},
  relCarreiraJogador in 'relCarreiraJogador.pas' {frmRelCarreiraJogador},
  UGerenciadorJogos in 'UGerenciadorJogos.pas' {frmGerenciadorJogos},
  frameGrafico in 'frameGrafico.pas' {fraGrafico: TFrame};

{$R *.res}
const
  cTtempo = 2000;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TCA_ESTAD, CA_ESTAD);
  Application.CreateForm(TCA_ADVER, CA_ADVER);
  Application.CreateForm(TCA_JOGAD, CA_JOGAD);
  Application.CreateForm(TFrmDm, FrmDm);
  Application.CreateForm(Tf_gerais, f_gerais);
  Application.CreateForm(Th_cidades, h_cidades);
  Application.CreateForm(Th_clubes, h_clubes);
  Application.CreateForm(Th_editafoto, h_editafoto);
  Application.CreateForm(Th_jogadores, h_jogadores);
  Application.CreateForm(Th_estadios, h_estadios);
  Application.CreateForm(TCA_ARBIT, CA_ARBIT);
  Application.CreateForm(Th_arbitros, h_arbitros);
  Application.CreateForm(TES_TITULOS, ES_TITULOS);
  Application.CreateForm(Th_titulos, h_titulos);
  Application.CreateForm(TCA_FASE, CA_FASE);
  Application.CreateForm(Th_fases, h_fases);
  Application.CreateForm(TCA_COMPE, CA_COMPE);
  Application.CreateForm(Th_competicao, h_competicao);
  Application.CreateForm(TCA_JOGOS, CA_JOGOS);
  Application.CreateForm(Th_jogadoresativos, h_jogadoresativos);
  Application.CreateForm(Th_substituicoes, h_substituicoes);
  Application.CreateForm(Th_editaescalacao, h_editaescalacao);
  Application.CreateForm(Th_jogos, h_jogos);
  Application.CreateForm(TCA_TATIC, CA_TATIC);
  Application.CreateForm(Th_liberarjogador, h_liberarjogador);
  Application.CreateForm(Tr_jogospadrao, r_jogospadrao);
  Application.CreateForm(Th_anos, h_anos);
  Application.CreateForm(Th_periodo, h_periodo);
  Application.CreateForm(Th_uf, h_uf);
  Application.CreateForm(Th_pais, h_pais);
  Application.CreateForm(Th_placar, h_placar);
  Application.CreateForm(Th_freqplacar, h_freqplacar);
  Application.CreateForm(Tr_geraljogador, r_geraljogador);
  Application.CreateForm(Th_fichaindividual, h_fichaindividual);
  Application.CreateForm(Tr_sumula, r_sumula);
  Application.CreateForm(Tr_vitimas, r_vitimas);
  Application.CreateForm(Tr_artilheirosporadver, r_artilheirosporadver);
  Application.CreateForm(Tr_fichareduzida, r_fichareduzida);
  Application.CreateForm(TCA_CIDAD, CA_CIDAD);
  Application.CreateForm(Tr_dezmais, r_dezmais);
  Application.CreateForm(Tr_estgerais, r_estgerais);
  Application.CreateForm(Tr_campanhageral, r_campanhageral);
  Application.CreateForm(Tr_titulos, r_titulos);
  Application.CreateForm(TFrmSplash, FrmSplash);
  Application.CreateForm(Th_login, h_login);
  Application.CreateForm(TCA_USER, CA_USER);
  Application.CreateForm(Th_informacao, h_informacao);
  Application.CreateForm(TFrmBackup, FrmBackup);
  Application.CreateForm(TFrmRestore, FrmRestore);
  Application.CreateForm(TCA_PATROC, CA_PATROC);
  Application.CreateForm(TCA_FORNEC, CA_FORNEC);
  Application.CreateForm(TCA_UNIFORMES, CA_UNIFORMES);
  Application.CreateForm(Th_uniformes, h_uniformes);
  Application.CreateForm(Th_patrocinador, h_patrocinador);
  Application.CreateForm(Th_fornecedor, h_fornecedor);
  Application.CreateForm(Th_meses, h_meses);
  Application.CreateForm(Th_codjogo, h_codjogo);
  Application.CreateForm(Tr_aniversariantes, r_aniversariantes);
  Application.CreateForm(TfrmProgresso, frmProgresso);
  Application.CreateForm(TfrmRelJogador, frmRelJogador);
  Application.CreateForm(TfrmSelRelatorioJogador, frmSelRelatorioJogador);
  Application.CreateForm(TfrmRelJogadorComFoto, frmRelJogadorComFoto);
  Application.CreateForm(TfrmSelRelatorioAdversario, frmSelRelatorioAdversario);
  Application.CreateForm(TfrmRelAdversarios, frmRelAdversarios);
  Application.CreateForm(TfrmCarreiraJogador, frmCarreiraJogador);
  Application.CreateForm(TfrmRelCarreiraJogador, frmRelCarreiraJogador);
  Application.CreateForm(TfrmGerenciadorJogos, frmGerenciadorJogos);
  // Tela de Splash
  FrmSplash.Show;
  FrmSplash.Refresh;
  Sleep(cTtempo);
  FrmSplash.Destroy;
  FrmSplash := nil;

  // Tela de Login
  h_login := Th_login.Create(Application);
  h_login.ShowModal;
  FreeAndNil(h_login);

  Application.Run;

end.
