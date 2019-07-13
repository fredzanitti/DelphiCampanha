unit pesquisaclubes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  Th_clubes = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridClubes: TDBGrid;
    BtnSelecionar: TBitBtn;
    BtnIncluir: TBitBtn;
    ImgClube: TImage;
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridClubesDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure DbGridClubesCellClick(Column: TColumn);
    procedure DbGridClubesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridClubesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_clubes: Th_clubes;
  sql: String;

implementation

{$R *.dfm}

uses funcoes, module, adversarios, jogos, telapadraojogos, pesquisaestadios,
  selecionarano, selecionaperiodo, pesquisajogadoresativos, pesquisajogadores,
  pesquisacompeticao, frequenciaplacar, relatartilheirosporadver,
  estatisticasgerais, UProgresso;

procedure Th_clubes.BtnIncluirClick(Sender: TObject);
begin
  CA_ADVER.ShowModal;
end;

procedure Th_clubes.BtnSelecionarClick(Sender: TObject);
begin
  DbGridClubesDblClick(self);
end;

procedure Th_clubes.DbGridClubesCellClick(Column: TColumn);
begin
  f_gerais.buscaImagem(ImgClube, f_gerais.buscarNome('escudo', 'CA_ADVER',
    'codadver', DbGridClubes.Columns[0].Field.AsString));
end;

procedure Th_clubes.DbGridClubesDblClick(Sender: TObject);
var
  i, j, max, cont: Integer;
  codtime: String;
begin
  codtime := DbGridClubes.Columns[0].Field.AsString;

  // ==========================================================================
  // pesquisa quando acionado pelo cadastro de advers�rios
  // ==========================================================================
  if identificacao = 'CA_ADVER' then
  begin
    FrmDm.TblAdversarios.First;
    while FrmDm.TblAdversarioscodadver.AsInteger <> DbGridClubes.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblAdversarios.Next;
    end;
    CA_ADVER.estadoDosBotoesdeCadastro();
  end;

  // ==========================================================================
  // pesquisa quando acionado pelo cadastro de jogos
  // ==========================================================================
  if identificacao = 'CA_JOGOS' then
  begin
    CA_JOGOS.EdtCodMandante.Text := '0';
    CA_JOGOS.EdtCodVisitante.Text := DbGridClubes.Columns[0].Field.AsString;
    f_gerais.buscaImagemPorCodigo(CA_JOGOS.ImgLogoMandante, '0');
    f_gerais.buscaImagemPorCodigo(CA_JOGOS.ImgLogoVisitante,
      CA_JOGOS.EdtCodVisitante.Text);
    CA_JOGOS.EdtMandante.Text :=
      AnsiUpperCase(f_gerais.buscarNome('nome', 'CA_ADVER', 'codadver',
      CA_JOGOS.EdtCodMandante.Text));
    CA_JOGOS.EdtVisitante.Text :=
      AnsiUpperCase(f_gerais.buscarNome('nome', 'CA_ADVER', 'codadver',
      CA_JOGOS.EdtCodVisitante.Text));
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Menu Gerais/Maiores goleadas aplicadas em advers�rio
  // ==========================================================================
  if identificacao = 'MnGoleadas3' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '3';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(j), sum(v), sum(e), sum(d), sum(gp), sum(gc), sum(sg) ' +
      'from es_resum ' + 'where sg >= 3 ' + 'and codadver = ' + codtime;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Seu time ainda n�o aplicou nenhuma goleada ' + #13 +
        'neste advers�rios!';
      Application.MessageBox(Pchar(msg), 'ATEN��O', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as p�ginas s�o mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // p�ginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das p�ginas e acrescentar os n�meros de p�ginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padr�o
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 saldo, placar1 golspro '
        + 'from ca_jogos ' + 'where codadvermand = 0 ' +
        'and placar1-placar2 >= 3 ' + 'and codadvervisit = ' + codtime +
        ' union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 saldo, placar2 golspro '
        + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
        'and placar2-placar1 >= 3 ' + 'and codadvermand = ' + codtime +
        ' order by saldo desc, golspro desc, data desc ' +
        'limit :LIMITE offset :CORTE';

      // fun��o para preencher a tela padr�o com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codtime;
      // t�tulos e descri��o do relat�rio
      r_jogospadrao.LblDescricao1.Caption :=
        'MAIORES GOLEADAS APLICADAS EM ADVERS�RIOS';
      r_jogospadrao.LblDescricao2.Caption := 'POR 3 GOLS OU MAIS DE DIFEREN�A';
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, codtime);
      // definir t�tulo do formul�rio
      r_jogospadrao.Caption := 'Maiores Goleadas Aplicadas em Advers�rios: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver', codtime);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Menu Gerais/Maiores goleadas sofridas por advers�rio
  // ==========================================================================
  if identificacao = 'MnGoleadas4' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '4';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r ' + 'where sg <= -3 ' + 'and codadver = ' + codtime;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Seu time ainda n�o sofreu nenhuma goleada ' + #13 +
        'para este advers�rio!';
      Application.MessageBox(Pchar(msg), 'ATEN��O', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as p�ginas s�o mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // p�ginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das p�ginas e acrescentar os n�meros de p�ginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padr�o
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 saldo, placar1 golspro '
        + 'from ca_jogos ' + 'where codadvermand = 0 ' +
        'and placar2-placar1 >= 3 ' + 'and codadvervisit = ' + codtime +
        ' union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 saldo, placar2 golspro '
        + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
        'and placar1-placar2 >= 3 ' + 'and codadvermand = ' + codtime +
        ' order by saldo desc, golspro desc, data desc ' +
        'limit :LIMITE offset :CORTE';

      // fun��o para preencher a tela padr�o com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codtime;
      // t�tulos e descri��o do relat�rio
      r_jogospadrao.LblDescricao1.Caption :=
        'MAIORES GOLEADAS SOFRIDAS POR ADVERS�RIOS';
      r_jogospadrao.LblDescricao2.Caption := 'POR 3 GOLS OU MAIS DE DIFEREN�A';
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, codtime);
      // definir t�tulo do formul�rio
      r_jogospadrao.Caption := 'Maiores Goleadas Sofridas por Advers�rios: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver', codtime);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Por Um Advers�rio
  // ==========================================================================
  if identificacao = 'MnAdversario1' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '7';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(j), sum(v), sum(e), sum(d), sum(gp), sum(gc), sum(sg) ' +
      'from es_resum ' + 'where codadver = ' + codtime;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'N�o h� jogos cadastrados contra o advers�rio selecionado';
      Application.MessageBox(Pchar(msg), 'ATEN��O', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as p�ginas s�o mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // p�ginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das p�ginas e acrescentar os n�meros de p�ginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padr�o
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codadvermand = ' + codtime + ' union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codadvervisit = ' + codtime +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // fun��o para preencher a tela padr�o com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codtime;
      // t�tulos e descri��o do relat�rio
      r_jogospadrao.LblDescricao1.Caption := 'SELE��O DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'Advers�rio: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        codtime));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, codtime);
      // definir t�tulo do formul�rio
      r_jogospadrao.Caption := 'Sele��o de jogos disputados contra: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver', codtime);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Adversario em est�dio
  // ==========================================================================
  if identificacao = 'MnAdversario2' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '8';
    r_jogospadrao.codauxiliar1 := codtime;
    f_gerais.pesquisaEstadio(h_estadios.DbGridEstadio, 'TODOS');
    h_estadios.identificacao := 'MnAdversario2';
    h_estadios.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Adversario por Ano
  // ==========================================================================
  if identificacao = 'MnAdversario3' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '9';
    r_jogospadrao.codauxiliar1 := codtime;
    f_gerais.codigosaux := codtime;
    h_anos.identificacao := 'MnAdversario3';
    h_anos.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Adversario por Per�odo
  // ==========================================================================
  if identificacao = 'MnAdversario4' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '10';
    r_jogospadrao.codauxiliar1 := codtime;
    h_periodo.identificacao := 'MnAdversario4';
    h_periodo.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Advers�rio vs Jogador/T�cnico
  // ==========================================================================
  if identificacao = 'MnAdversario5' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '11';
    f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
    r_jogospadrao.codauxiliar1 := codtime;
    h_jogadores.identificacao := 'MnAdversario5';
    h_jogadores.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Advers�rio Ultimos 10 jogos contra
  // ==========================================================================
  if identificacao = 'MnAdversario6' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '12';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(a.j), sum(a.v), sum(a.e), sum(a.d), sum(a.gp), sum(a.gc), sum(a.sg) from( '
      + 'select j, v, e, d, gp, gc, sg ' + 'from ca_jogos j, es_resum r ' +
      'where j.codjogo = r.codjogo ' + 'and r.codadver = ' + codtime +
      ' order by j.data desc ' + 'limit 10 offset 0 ' + ') as a';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'N�o h� jogos cadastrados contra o advers�rio selecionado';
      Application.MessageBox(Pchar(msg), 'ATEN��O', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin

      // as p�ginas s�o mostradas de 10 em 10, por isso pegar o total de registros
      // e dividir por 10 truncando o resultado, assim teremos a quantidade de
      // p�ginas a ser exibida.
      if (FrmDm.QrContador.Fields[0].AsInteger mod 10) = 0 then
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10)
      else
        cont := Trunc(FrmDm.QrContador.Fields[0].AsInteger / 10) + 1;

      r_jogospadrao.LblTotalReg.Caption := IntToStr(cont);
      f_gerais.determinaVEDRelatorios(FrmDm.QrContador);

      // limpar o combobox das p�ginas e acrescentar os n�meros de p�ginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padr�o
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
        'and r.codadver = ' + codtime + ' order by j.data desc ' +
        'limit :LIMITE offset :CORTE';

      // fun��o para preencher a tela padr�o com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codtime;
      // t�tulos e descri��o do relat�rio
      r_jogospadrao.LblDescricao1.Caption := '�LTIMOS 10 JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'Advers�rio: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        codtime));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, codtime);
      // definir t�tulo do formul�rio
      r_jogospadrao.Caption := '�ltimos 10 jogos disputados contra: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver', codtime);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Adversario em campeonatos
  // ==========================================================================
  if identificacao = 'MnAdversario7' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '19';
    r_jogospadrao.codauxiliar1 := codtime;
    f_gerais.pesquisacompeticao(h_competicao.DbGridCompeticao, 'TODOS');
    h_competicao.identificacao := 'MnAdversario7';
    h_competicao.ShowModal;
  end;

  // ==========================================================================
  // Rela��o de artilheiros por advers�rio (ex.: seleciona Botafogo e o sistema
  // apresentar� todos os jogadores que fizeram gols no Botafogo
  // ==========================================================================
  if (identificacao = 'MnAdversario8') then
  begin
    r_artilheirosporadver.codtime := codtime;
    f_gerais.preencherEstJogadoresPorAdversario(codtime, 'G');
    r_artilheirosporadver.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa de jogos/gols de um jogador por advers�rio
  // ==========================================================================
  if identificacao = 'MnJogadores5' then
  begin
    // guardar o n�mero do foruml�rio na label
    r_jogospadrao.numerorelatorio := '25';
    r_jogospadrao.codauxiliar1 := codtime;
    f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
    h_jogadores.identificacao := 'MnJogadores5';
    h_jogadores.ShowModal;
  end;

  // ==========================================================================
  // Frequ�nica de Placar por advers�rios
  // ==========================================================================

  if identificacao = 'MnEstGerais' then
  begin
    sql := 'select count(*) from ca_jogos ' + 'where (codadvermand = ' + codtime
      + ' or codadvervisit = ' + codtime + ')';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
      Application.MessageBox('N�o h� jogos cadastrados contra esse advers�rio',
        'ATEN��O', MB_OK + MB_ICONINFORMATION)
    else
    begin

      // guardar o n�mero do foruml�rio na label
      r_jogospadrao.numerorelatorio := '27';
      r_jogospadrao.codauxiliar1 := codtime;

      r_estgerais.LblSequencia1.Caption :=
        f_gerais.sequencias(r_estgerais.LblDtIniSeq1, r_estgerais.LblDtFimSeq1,
        codtime, 1, 1);
      r_estgerais.LblSequencia2.Caption :=
        f_gerais.sequencias(r_estgerais.LblDtIniSeq2, r_estgerais.LblDtFimSeq2,
        codtime, 2, 1);
      r_estgerais.LblSequencia3.Caption :=
        f_gerais.sequencias(r_estgerais.LblDtIniSeq3, r_estgerais.LblDtFimSeq3,
        codtime, 3, 1);
      r_estgerais.LblSequencia4.Caption :=
        f_gerais.sequencias(r_estgerais.LblDtIniSeq4, r_estgerais.LblDtFimSeq4,
        codtime, 4, 1);

      f_gerais.buscaImagemPorCodigo(r_estgerais.ImgSeutime, '0');
      f_gerais.buscaImagemPorCodigo(r_estgerais.ImgAdver, codtime);
      r_estgerais.LblTimeMand.Caption :=
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0'));
      r_estgerais.LblTimeVisit.Caption :=
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        codtime));

      // ultimo jogo, vitoria e derrota, melhor, pior resultado e estatiscas
      // por campeonato
      f_gerais.melhorPiorResultado(codtime);
      f_gerais.estPeriodoSemPerderSemGanhar(codtime);

      r_estgerais.ShowModal;
    end;
  end;

  // ==========================================================================
  // Frequ�nica de Placar por advers�rios
  // ==========================================================================
  if identificacao = 'MnFreq2' then
  begin

    h_freqplacar.LtFavor.Clear;
    h_freqplacar.LtContra.Clear;
    h_freqplacar.LtGeral.Clear;

    // placar m�ximo
    sql := 'select max(a.ma), min(mi) from( ' +
      'select max(placar1) ma, min(placar1) mi ' + 'from ca_jogos ' + 'union ' +
      'select max(placar2) ma, min(placar2) mi ' + 'from ca_jogos ' + ') as a';

    h_freqplacar.QrEst.Close;
    h_freqplacar.QrEst.sql.Clear;
    h_freqplacar.QrEst.sql.Add(sql);
    h_freqplacar.QrEst.Open;
    max := h_freqplacar.QrEst.Fields[0].AsInteger;

    // geral
    // Modifica o cursor para ampulheta
    Screen.Cursor := crHourGlass;
    // Cria o formul�rio de progresso
    frmProgresso := TfrmProgresso.Create(self);
    // Define o m�nimo da barra de progresso
    frmProgresso.gauProgresso.MinValue := 0;
    // Define o m�ximo da barra de progresso como o n�mero total de itens no listview
    frmProgresso.gauProgresso.MaxValue := h_freqplacar.QrEst.RecordCount;
    // Zera a barra de progresso
    frmProgresso.gauProgresso.Progress := 0;
    // Exibe o formul�rio de progresso
    frmProgresso.Show;
    // Informa que a planilha est� sendo criada
    frmProgresso.lblMensagem.Caption := 'Processando informa��es - Geral...';
    // Atualiza o label para exibir a mensagem para o usu�rio
    frmProgresso.lblMensagem.Update;
    for i := 0 to max do
    begin
      // Processa as mensagens do sistema operacional
      Application.ProcessMessages;
      // Progresso percentual
      frmProgresso.gauProgresso.Progress := i;
      for j := i to max do
      begin
        sql := 'select count(*) ' + 'from ca_jogos j, es_resum r ' +
          'where j.codjogo = r.codjogo ' + 'and r.codadver = ' + codtime +
          ' and ((j.placar1 = ' + IntToStr(i) + ' and j.placar2 = ' +
          IntToStr(j) + ') or (j.placar1 = ' + IntToStr(j) + ' and j.placar2 = '
          + IntToStr(i) + '))';

        h_freqplacar.QrEst.Close;
        h_freqplacar.QrEst.sql.Clear;
        h_freqplacar.QrEst.sql.Add(sql);
        h_freqplacar.QrEst.Open;

        if h_freqplacar.QrEst.Fields[0].AsInteger > 0 then
        begin
          if h_freqplacar.QrEst.Fields[0].AsInteger = 1 then
          begin
            h_freqplacar.LtGeral.Items.Add('  ' + IntToStr(j) + 'x' +
              IntToStr(i) + ' - ' + h_freqplacar.QrEst.Fields[0].AsString
              + ' vez');
          end
          else
          begin
            h_freqplacar.LtGeral.Items.Add('  ' + IntToStr(j) + 'x' +
              IntToStr(i) + ' - ' + h_freqplacar.QrEst.Fields[0].AsString +
              ' vezes');
          end;
        end;
      end;
    end;
    // Libera o formul�rio de progresso da mem�ria
    if Assigned(frmProgresso) then
      frmProgresso.Free;
    // Atribui o cursor salvo no come�o do m�todo
    Screen.Cursor := crDefault;

    // a favor
    // Modifica o cursor para ampulheta
    Screen.Cursor := crHourGlass;
    // Cria o formul�rio de progresso
    frmProgresso := TfrmProgresso.Create(self);
    // Define o m�nimo da barra de progresso
    frmProgresso.gauProgresso.MinValue := 0;
    // Define o m�ximo da barra de progresso como o n�mero total de itens no listview
    frmProgresso.gauProgresso.MaxValue := h_freqplacar.QrEst.RecordCount;
    // Zera a barra de progresso
    frmProgresso.gauProgresso.Progress := 0;
    // Exibe o formul�rio de progresso
    frmProgresso.Show;
    // Informa que a planilha est� sendo criada
    frmProgresso.lblMensagem.Caption := 'Processando informa��es - A Favor...';
    // Atualiza o label para exibir a mensagem para o usu�rio
    frmProgresso.lblMensagem.Update;
    for i := 0 to max do
    begin
      // Processa as mensagens do sistema operacional
      Application.ProcessMessages;
      // Progresso percentual
      frmProgresso.gauProgresso.Progress := i;
      for j := i to max do
      begin
        sql := 'select count(*) ' + 'from ca_jogos j, es_resum r ' +
          'where j.codjogo = r.codjogo ' + 'and r.codadver = ' + codtime +
          ' and r.sg >= 0 ' + 'and ((j.placar1 = ' + IntToStr(i) +
          ' and j.placar2 = ' + IntToStr(j) + ') or (j.placar1 = ' + IntToStr(j)
          + ' and j.placar2 = ' + IntToStr(i) + ')) ' + 'and r.sg >=0';

        h_freqplacar.QrEst.Close;
        h_freqplacar.QrEst.sql.Clear;
        h_freqplacar.QrEst.sql.Add(sql);
        h_freqplacar.QrEst.Open;

        if h_freqplacar.QrEst.Fields[0].AsInteger > 0 then
        begin
          if h_freqplacar.QrEst.Fields[0].AsInteger = 1 then
          begin
            h_freqplacar.LtFavor.Items.Add('  ' + IntToStr(j) + 'x' +
              IntToStr(i) + ' - ' + h_freqplacar.QrEst.Fields[0].AsString
              + ' vez');
          end
          else
          begin
            h_freqplacar.LtFavor.Items.Add('  ' + IntToStr(j) + 'x' +
              IntToStr(i) + ' - ' + h_freqplacar.QrEst.Fields[0].AsString +
              ' vezes');
          end;
        end;
      end;
    end;
    // Libera o formul�rio de progresso da mem�ria
    if Assigned(frmProgresso) then
      frmProgresso.Free;
    // Atribui o cursor salvo no come�o do m�todo
    Screen.Cursor := crDefault;

    // contra
    // Modifica o cursor para ampulheta
    Screen.Cursor := crHourGlass;
    // Cria o formul�rio de progresso
    frmProgresso := TfrmProgresso.Create(self);
    // Define o m�nimo da barra de progresso
    frmProgresso.gauProgresso.MinValue := 0;
    // Define o m�ximo da barra de progresso como o n�mero total de itens no listview
    frmProgresso.gauProgresso.MaxValue := h_freqplacar.QrEst.RecordCount;
    // Zera a barra de progresso
    frmProgresso.gauProgresso.Progress := 0;
    // Exibe o formul�rio de progresso
    frmProgresso.Show;
    // Informa que a planilha est� sendo criada
    frmProgresso.lblMensagem.Caption := 'Processando informa��es - Contra...';
    // Atualiza o label para exibir a mensagem para o usu�rio
    frmProgresso.lblMensagem.Update;
    for i := 0 to max do
    begin
      // Processa as mensagens do sistema operacional
      Application.ProcessMessages;
      // Progresso percentual
      frmProgresso.gauProgresso.Progress := i;
      for j := i to max do
      begin
        sql := 'select count(*) ' + 'from ca_jogos j, es_resum r ' +
          'where j.codjogo = r.codjogo ' + 'and r.codadver = ' + codtime +
          ' and r.sg < 0 ' + 'and ((j.placar1 = ' + IntToStr(i) +
          ' and j.placar2 = ' + IntToStr(j) + ') or (j.placar1 = ' + IntToStr(j)
          + ' and j.placar2 = ' + IntToStr(i) + ')) ' + 'and r.sg <0';

        h_freqplacar.QrEst.Close;
        h_freqplacar.QrEst.sql.Clear;
        h_freqplacar.QrEst.sql.Add(sql);
        h_freqplacar.QrEst.Open;

        if h_freqplacar.QrEst.Fields[0].AsInteger > 0 then
        begin
          if h_freqplacar.QrEst.Fields[0].AsInteger = 1 then
          begin
            h_freqplacar.LtContra.Items.Add('  ' + IntToStr(j) + 'x' +
              IntToStr(i) + ' - ' + h_freqplacar.QrEst.Fields[0].AsString
              + ' vez');
          end
          else
          begin
            h_freqplacar.LtContra.Items.Add('  ' + IntToStr(j) + 'x' +
              IntToStr(i) + ' - ' + h_freqplacar.QrEst.Fields[0].AsString +
              ' vezes');
          end;
        end;
      end;
    end;
    // Libera o formul�rio de progresso da mem�ria
    if Assigned(frmProgresso) then
      frmProgresso.Free;
    // Atribui o cursor salvo no come�o do m�todo
    Screen.Cursor := crDefault;
  end;
  h_freqplacar.LblTitulo.Caption := 'FREQU�NCIA DE PLACARES - ' +
    AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver', codtime));
  h_clubes.Close;
end;

procedure Th_clubes.DbGridClubesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_clubes.DbGridClubesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  f_gerais.buscaImagem(ImgClube, f_gerais.buscarNome('escudo', 'CA_ADVER',
    'codadver', DbGridClubes.Columns[0].Field.AsString));
end;

procedure Th_clubes.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaclubes(DbGridClubes, EdtPesquisa.Text);
  f_gerais.buscaImagem(ImgClube, f_gerais.buscarNome('escudo', 'CA_ADVER',
    'codadver', DbGridClubes.Columns[0].Field.AsString));
end;

procedure Th_clubes.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
  f_gerais.buscaImagem(ImgClube, f_gerais.buscarNome('escudo', 'CA_ADVER',
    'codadver', DbGridClubes.Columns[0].Field.AsString));
end;

procedure Th_clubes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // a��es quando pressionar ESC
      begin
        h_clubes.Close;
      end;
    VK_RETURN: // a��es quando pressionar ENTER
      begin
        BtnSelecionarClick(self);
      end;
  end;
end;

end.
