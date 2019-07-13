unit pesquisajogadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls;

type
  Th_jogadores = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridJogadores: TDBGrid;
    BtnSelecionar: TBitBtn;
    GroupBox3: TGroupBox;
    CbOpcao: TCheckBox;
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DbGridJogadoresDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure DbGridJogadoresDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CbOpcaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_jogadores: Th_jogadores;
  cont, i: Integer;
  msg, codjogador: String;

implementation

{$R *.dfm}

uses funcoes, module, jogadores, telapadraojogos, selecionarano,
  fichaindividual, pesquisaarbitros, r_vitimasdegolsdojogador;

procedure Th_jogadores.BtnSelecionarClick(Sender: TObject);
begin
  DbGridJogadoresDblClick(Self);
end;

procedure Th_jogadores.CbOpcaoClick(Sender: TObject);
begin
  if CbOpcao.Checked then
  begin
    f_gerais.tecnico := 'TECNICO';
    f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  end
  else begin
    f_gerais.tecnico := '';
    f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');
  end;
end;

procedure Th_jogadores.DbGridJogadoresDblClick(Sender: TObject);
var
  j1, j2: String;
  ok: boolean;
begin
  if CbOpcao.Checked then
    f_gerais.tecnico := 'TECNICO'
  else
    f_gerais.tecnico := '';

  codjogador := DbGridJogadores.Columns[0].Field.AsString;

  // ==========================================================================
  // Pesquisa quando acionada pelo cadastro de jogadores
  // ==========================================================================
  if identificacao = 'CA_JOGAD' then
  begin
    FrmDm.TblJogadores.First;

    while FrmDm.TblJogadorescodjogador.AsInteger <> DbGridJogadores.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblJogadores.Next;
    end;
    CA_JOGAD.estadoDosBotoesdeCadastro();
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Adversário vs Jogador
  // ==========================================================================
  if identificacao = 'MnAdversario5' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '11';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(a.j), sum(a.v), sum(a.e), sum(a.d), sum(a.gp), sum(a.gc), sum(a.sg) '
      + 'from ( ' +
      'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, es_titul e ' + 'where e.codjogo = r.codjogo ' +
      'and r.codadver = ' + r_jogospadrao.codauxiliar1 + ' and e.codjogador = '
      + codjogador + ' union ' +
      'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, es_reser e ' + 'where e.codjogo = r.codjogo ' +
      'and r.codadver = ' + r_jogospadrao.codauxiliar1 + ' and e.codjogador = '
      + codjogador + ' ) as a';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O jogador selecionado não atuou em nenhuma' + #13 +
        'oportunidade contra o adversário em questão';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
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
      sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.publico from('
        + 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
        'and j.codadvermand = ' + r_jogospadrao.codauxiliar1 +
        ' and e.codjogador = ' + codjogador + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
        'and j.codadvervisit = ' + r_jogospadrao.codauxiliar1 +
        ' and e.codjogador = ' + codjogador + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
        'and j.codadvermand = ' + r_jogospadrao.codauxiliar1 +
        ' and e.codjogador = ' + codjogador + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
        'and j.codadvervisit = ' + r_jogospadrao.codauxiliar1 +
        ' and e.codjogador = ' + codjogador + ' ) as a ' +
        'order by a.data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := codjogador;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'Adversário: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1)) + ' / Jogador/Técnico: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        codjogador));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime,
        r_jogospadrao.codauxiliar1);
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados contra: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando pelos 15 mais - quem mais atuou com tecnicos
  // ==========================================================================

  if identificacao = 'MnTecnicos' then
  begin

    ok := f_gerais.verificaTecnico(codjogador);

    if ok then
    begin
      sql := 'select jog, nome, sum(total) from ( ' +
        'select j2.codjogador jog, c.nome nome, count(j2.codjogador) total ' +
        'from ca_jogos j, es_titul j1, es_titul j2, ca_jogad c ' +
        'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
        'and j2.codjogador = c.codjogador ' + 'and j1.codjogador = ' +
        codjogador + ' and j2.codjogador <> ' + codjogador +
        ' group by j2.codjogador, c.nome ' + 'union all ' +
        'select j2.codjogador jog, c.nome nome, count(j2.codjogador) total ' +
        'from ca_jogos j, es_titul j1, es_reser j2, ca_jogad c ' +
        'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
        'and j2.codjogador = c.codjogador ' + 'and j1.codjogador = ' +
        codjogador + ' group by j2.codjogador, c.nome ' + ') as a ' +
        'group by a.jog, a.nome ' +
        'order by sum(a.total) desc, a.jog ' + 'limit 15 offset 0';

      f_gerais.codigosaux := codjogador;
      f_gerais.preencherOsDezMais(sql, 11);
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogadores / Jogos de 1 jogador
  // ==========================================================================
  if identificacao = 'MnJogadores1' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '13';

    msg := 'lista completa de jogos?' + #13 +
      'Se desejar lista de jogos por ano, clique em NÃO';
    if f_gerais.desejaRealizarAcao(msg) then
    begin
      // contar a quantidade de registros retornados na pesquisa
      sql := 'select sum(a.j) j, sum(a.v) v, sum(a.e) e, sum(a.d) d, sum(a.gp) gp, sum(a.gc) gc, sum(a.sg) sg from( '
        + 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
        + 'from es_titul e, es_resum r ' + 'where e.codjogo = r.codjogo ' +
        'and e.codjogador = ' + codjogador + ' union ' +
        'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
        + 'from es_reser e, es_resum r ' + 'where e.codjogo = r.codjogo ' +
        'and e.codjogador = ' + codjogador + ' ) as a';

      FrmDm.QrContador.Close;
      FrmDm.QrContador.sql.Clear;
      FrmDm.QrContador.sql.Add(sql);
      FrmDm.QrContador.Open;
      FrmDm.QrContador.First;

      if FrmDm.QrContador.Fields[0].AsInteger = 0 then
      begin
        msg := 'O jogador selecionado ainda não atuou em nenhuma' + #13 +
          'oportunidade pelo seu time';
        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
          MB_OK + MB_ICONINFORMATION);
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
        sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
          + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
          'and e.codjogador = ' + codjogador + ' union ' +
          'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
          + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
          'and e.codjogador = ' + codjogador + ' order by data desc ' +
          'limit :LIMITE offset :CORTE';

        // função para preencher a tela padrão com os resultados da sql acima
        f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

        r_jogospadrao.codauxiliar1 := codjogador;
        r_jogospadrao.codauxiliar2 := EmptyStr;
        // títulos e descrição do relatório
        r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
        r_jogospadrao.LblDescricao2.Caption := 'Pelo: ' +
          AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
          codjogador));
        // buscar escudo do seu time
        f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
        // definir título do formulário
        r_jogospadrao.Caption := 'Seleção de jogos disputados pelo: ' +
          f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador', codjogador);
        // mostara a consulta finalizada
        r_jogospadrao.ShowModal;
      end;
    end // fim lista completa
    else
    begin
      r_jogospadrao.codauxiliar1 := codjogador;
      f_gerais.codigosaux := codjogador;
      f_gerais.anocompeticao := 'MnJogadores1';
      h_anos.identificacao := 'MnJogadores1';
      h_anos.ShowModal;
    end; // fim lista por ano
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogadores / Jogadores vs Jogadores (cont.)
  // ==========================================================================

  if identificacao = 'MnJogadores2' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '14';
    r_jogospadrao.codauxiliar1 := codjogador;
    h_jogadores.Close;
  end;

  if identificacao = 'MnJogadores2a' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '14';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(a.j) j, sum(a.v) v, sum(a.e) e, sum(a.d) d, sum(a.gp) gp, sum(a.gc) gc, sum(a.sg) sg from( '
      + 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, es_titul j1, es_titul j2 ' +
      'where r.codjogo = j1.codjogo ' + 'and r.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + codjogador + ' union ' +
      'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, es_reser j1, es_reser j2 ' +
      'where r.codjogo = j1.codjogo ' + 'and r.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + codjogador + ' union ' +
      'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, es_titul j1, es_reser j2 ' +
      'where r.codjogo = j1.codjogo ' + 'and r.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + codjogador + ' union ' +
      'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, es_reser j1, es_titul j2 ' +
      'where r.codjogo = j1.codjogo ' + 'and r.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + codjogador + ' ) as a';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad',
        'codjogador', r_jogospadrao.codauxiliar1)) + ' não atuou em nenhum' +
        #13 + 'jogo junto com o ' + AnsiUpperCase(f_gerais.buscarNome('nome',
        'ca_jogad', 'codjogador', codjogador));
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
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
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_titul j1, es_titul j2 ' +
        'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
        'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and j2.codjogador = ' + codjogador + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_reser j1, es_reser j2 ' +
        'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
        'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and j2.codjogador = ' + codjogador + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_titul j1, es_reser j2 ' +
        'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
        'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and j2.codjogador = ' + codjogador + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_reser j1, es_titul j2 ' +
        'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
        'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and j2.codjogador = ' + codjogador + ' order by data desc ' +
        'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := codjogador;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'Pelo: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        r_jogospadrao.codauxiliar1)) + ' e ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        codjogador));
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados pelo: ' +
        f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        r_jogospadrao.codauxiliar1) + ' e ' + f_gerais.buscarNome('nome',
        'ca_jogad', 'codjogador', codjogador);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa jogos/gols de um jogador por adversário
  // ==========================================================================
  if identificacao = 'MnJogadores5' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '25';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(j), sum(gols) from( ' +
      'select sum(r.j) j, sum(e.gols) gols ' +
      'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      codjogador + ' and r.codadver = ' + r_jogospadrao.codauxiliar1 +
      ' and e.gols > 0 ' + 'union ' + 'select sum(r.j) j, sum(e.gols) gols ' +
      'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      codjogador + ' and r.codadver = ' + r_jogospadrao.codauxiliar1 +
      ' and e.gols > 0 ' + ') as a';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O jogador selecionado não marcou nenhum' + #13 +
        'gol contra o(a) ' + f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1);
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
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
      r_jogospadrao.LblDescricao3.Caption := 'Totais: ' +
        FrmDm.QrContador.Fields[0].AsString + ' jogo(s) / ' +
        FrmDm.QrContador.Fields[1].AsString + ' gol(s)';

      // limpar o combobox das páginas e acrescentar os números de páginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
        + 'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
        + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
        'and j.codadvermand = am.codadver ' +
        'and j.codadvervisit = av.codadver ' +
        'and j.codestadio = es.codestadio ' +
        'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
        codjogador + ' and r.codadver = ' + r_jogospadrao.codauxiliar1 +
        ' and e.gols > 0 ' + 'union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
        + 'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
        + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
        'and j.codadvermand = am.codadver ' +
        'and j.codadvervisit = av.codadver ' +
        'and j.codestadio = es.codestadio ' +
        'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
        codjogador + ' and r.codadver = ' + r_jogospadrao.codauxiliar1 +
        ' and e.gols > 0 ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := codjogador;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'GOLS DE UM JOGADOR CONTRA O(A) ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1));
      r_jogospadrao.LblDescricao2.Caption :=
        'Somente partidas em que o jogador fez 1 ou mais gols';
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime,
        r_jogospadrao.codauxiliar1);
      // definir título do formulário
      r_jogospadrao.Caption := 'Gols em jogos disputados contra: ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa jogos/gols de um jogador contra rivais
  // ==========================================================================
  if identificacao = 'MnJogadores9' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '34';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(j), sum(gols) from( ' +
      'select sum(r.j) j, sum(e.gols) gols ' +
      'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      codjogador + ' and r.codadver in ( ' + r_jogospadrao.codauxiliar1 + ' ) '
      + ' and e.gols > 0 ' + 'union ' + 'select sum(r.j) j, sum(e.gols) gols ' +
      'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      codjogador + ' and r.codadver in ( ' + r_jogospadrao.codauxiliar1 + ' ) '
      + ' and e.gols > 0 ' + ') as a';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O jogador selecionado não marcou nenhum' + #13 +
        'gol contra seus rivais';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
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
      r_jogospadrao.LblDescricao3.Caption := 'Totais: ' +
        FrmDm.QrContador.Fields[0].AsString + ' jogo(s) / ' +
        FrmDm.QrContador.Fields[1].AsString + ' gol(s)';

      // limpar o combobox das páginas e acrescentar os números de páginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
        + 'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
        + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
        'and j.codadvermand = am.codadver ' +
        'and j.codadvervisit = av.codadver ' +
        'and j.codestadio = es.codestadio ' +
        'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
        codjogador + ' and r.codadver in ( ' + r_jogospadrao.codauxiliar1 +
        ' ) ' + ' and e.gols > 0 ' + 'union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
        + 'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
        + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
        'and j.codadvermand = am.codadver ' +
        'and j.codadvervisit = av.codadver ' +
        'and j.codestadio = es.codestadio ' +
        'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
        codjogador + ' and r.codadver in ( ' + r_jogospadrao.codauxiliar1 +
        ' ) ' + ' and e.gols > 0 ' + 'order by data desc ' +
        'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := codjogador;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'GOLS DO ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        codjogador)) + ' CONTRA SEUS RIVAIS';
      r_jogospadrao.LblDescricao2.Caption :=
        'Somente partidas em que o jogador fez 1 ou mais gols';
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Gols em jogos disputados contra seus rivais';
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Quantidade de gols por jogo
  // ==========================================================================
  if identificacao = 'MnJogadores10' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '35';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(j), sum(gols) from( ' +
      ' select sum(r.j) j, sum(e.gols) gols ' +
      ' from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + ' where e.codjogo = j.codjogo ' + ' and j.codjogo = r.codjogo ' +
      ' and j.codadvermand = am.codadver ' +
      ' and j.codadvervisit = av.codadver ' +
      ' and j.codestadio = es.codestadio ' +
      ' and j.codcompeticao = c.codcompeticao ' + ' and e.codjogador = ' +
      codjogador + ' and e.gols > 0 ' + ' union ' +
      ' select sum(r.j) j, sum(e.gols) gols ' +
      ' from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + ' where e.codjogo = j.codjogo ' + ' and j.codjogo = r.codjogo ' +
      ' and j.codadvermand = am.codadver ' +
      ' and j.codadvervisit = av.codadver ' +
      ' and j.codestadio = es.codestadio ' +
      ' and j.codcompeticao = c.codcompeticao ' + ' and e.codjogador =  ' +
      codjogador + ' and e.gols > 0 ' + ' ) as a';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O jogador selecionado não marcou nenhum' + #13 +
        'gol pelo seu time';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
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
      r_jogospadrao.LblDescricao3.Caption := 'Totais: ' +
        FrmDm.QrContador.Fields[0].AsString + ' jogo(s) / ' +
        FrmDm.QrContador.Fields[1].AsString + ' gol(s)';

      // limpar o combobox das páginas e acrescentar os números de páginas atuais
      r_jogospadrao.CbxPagina.Clear;
      for i := 1 to cont do
      begin
        r_jogospadrao.CbxPagina.Items.Add(IntToStr(i));
      end;
      r_jogospadrao.CbxPagina.ItemIndex := 0;

      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
        + ' from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
        + ' where e.codjogo = j.codjogo ' + ' and j.codjogo = r.codjogo ' +
        ' and j.codadvermand = am.codadver ' +
        ' and j.codadvervisit = av.codadver ' +
        ' and j.codestadio = es.codestadio ' +
        ' and j.codcompeticao = c.codcompeticao ' + ' and e.codjogador = ' +
        codjogador + ' and e.gols > 0 ' + ' union ' +
        ' select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
        + ' from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
        + ' where e.codjogo = j.codjogo ' + ' and j.codjogo = r.codjogo ' +
        ' and j.codadvermand = am.codadver ' +
        ' and j.codadvervisit = av.codadver ' +
        ' and j.codestadio = es.codestadio ' +
        ' and j.codcompeticao = c.codcompeticao ' + ' and e.codjogador = ' +
        codjogador + ' and e.gols > 0 ' + ' order by gols desc, data desc ' +
        ' limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codjogador;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'QUANTIDADE DE GOLS DO ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        codjogador)) + ' EM ORDEM DECRESCENTE';
      r_jogospadrao.LblDescricao2.Caption :=
        'Somente partidas em que o jogador fez 1 ou mais gols';
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Gols em jogos disputados pelo seu time';
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa - ficha indivudal do jogador e/ou técnico
  // ==========================================================================
  if (identificacao = 'MnJogadores4') then
  begin
    f_gerais.preencherFichaIndividual(StrToInt(codjogador));
  end;
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');

  // ==========================================================================
  // Pesquisa - Maiores vítimas (clubes) de um jogador
  // ==========================================================================
  if (identificacao = 'MnJogadores6') then
  begin
    // trazer informações reduzidas do jogador
    f_gerais.InfReduzidaJogador(codjogador, r_vitimas.ImgNacionalidade,
      r_vitimas.ImgFotoJogador, r_vitimas.LblApelido, r_vitimas.LblNomeCompleto,
      r_vitimas.LblPeriodo, r_vitimas.LblPosicao);

    sql := 'select a.codadver, sum(a.j) j, sum(a.gols) g, round(sum(a.gols)/sum(a.j),2) mg from ( '
      + 'select r.codadver, sum(r.j) j, sum(e.gols) gols, round(sum(e.gols)/sum(r.j),2) mg '
      + 'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      codjogador + ' and e.gols > 0 ' + 'group by codadver ' + 'union all ' +
      'select r.codadver, sum(r.j) j, sum(e.gols) gols, round(sum(e.gols)/sum(r.j),2) mg '
      + 'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      codjogador + ' and e.gols > 0 ' + 'group by codadver ' + ')as a ' +
      'group by codadver ' + 'order by g desc, mg desc, j ' +
      'limit 20 offset 0';

    FrmDm.QrEstatisticas.Close;
    FrmDm.QrEstatisticas.sql.Clear;
    FrmDm.QrEstatisticas.sql.Add(sql);
    FrmDm.QrEstatisticas.Open;
    FrmDm.QrEstatisticas.First;

    for i := 1 to 20 do
    begin
      if not(FrmDm.QrEstatisticas.Eof) then
      begin
        (r_vitimas.FindComponent('LblClube' + IntToStr(i)) as TLabel).Caption :=
          AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
          FrmDm.QrEstatisticas.Fields[0].AsString));

        (r_vitimas.FindComponent('LblGols' + IntToStr(i)) as TLabel).Caption :=
          FrmDm.QrEstatisticas.Fields[2].AsString + ' gol(s) / ' +
          FrmDm.QrEstatisticas.Fields[1].AsString + ' jogo(s) - Média: ' +
          FormatFloat('#,##0.#0', FrmDm.QrEstatisticas.Fields[3].AsFloat);

        f_gerais.buscaImagemPorCodigo
          ((r_vitimas.FindComponent('ImgEscudo' + IntToStr(i)) as TImage),
          FrmDm.QrEstatisticas.Fields[0].AsString);
      end
      else
      begin
        (r_vitimas.FindComponent('LblClube' + IntToStr(i)) as TLabel).Caption
          := EmptyStr;

        (r_vitimas.FindComponent('LblGols' + IntToStr(i)) as TLabel).Caption
          := EmptyStr;

        f_gerais.buscaImagemPorCodigo
          ((r_vitimas.FindComponent('ImgEscudo' + IntToStr(i))
          as TImage), '-1');
      end;
      FrmDm.QrEstatisticas.Next;
    end;

    // totais
    sql := 'select sum(a.j), sum(a.gols), round(sum(a.gols)/sum(a.j),2) mg from ( '
      + 'select sum(e.v+e.e+e.d) j, sum(e.gols) gols, round(sum(e.gols)/sum(e.v+e.e+e.d),2) mg '
      + 'from es_titul e ' + 'where e.codjogador = ' + codjogador + ' union all ' +
      'select sum(e.v+e.e+e.d) j, sum(e.gols) gols, round(sum(e.gols)/sum(e.v+e.e+e.d),2) mg '
      + 'from es_reser e ' + 'where e.codjogador = ' + codjogador + ' ) as a';

    FrmDm.QrEstatisticas.Close;
    FrmDm.QrEstatisticas.sql.Clear;
    FrmDm.QrEstatisticas.sql.Add(sql);
    FrmDm.QrEstatisticas.Open;

    r_vitimas.LblGolsTotal.Caption := 'Gols: ' + FrmDm.QrEstatisticas.Fields
      [1].AsString;
    r_vitimas.LblJogosTotal.Caption := 'Jogos: ' + FrmDm.QrEstatisticas.Fields
      [0].AsString;
    r_vitimas.LblMediaTotal.Caption := 'Média: ' + FormatFloat('#,##0.#0',
      FrmDm.QrEstatisticas.Fields[2].AsFloat);

    r_vitimas.Caption := 'Maiores vítimas do ' +
      AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
      codjogador));

    r_vitimas.ShowModal;
  end;

  if identificacao = 'CA_JOGAD' then
  begin
    h_jogadores.Close;
  end;

end;

procedure Th_jogadores.DbGridJogadoresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_jogadores.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, EdtPesquisa.Text);
end;

procedure Th_jogadores.FormActivate(Sender: TObject);
begin

  // preencher grid da pesquisa de Jogadores
  f_gerais.pesquisajogadores(h_jogadores.DbGridJogadores, 'TODOS');

  FrmDm.TblJogadores.Refresh;
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_jogadores.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      // ações quando pressionar ESC
      begin
        h_jogadores.Close;
      end;
    VK_RETURN:
      // ações quando pressionar ENTER
      begin
        BtnSelecionarClick(Self);
      end;
  end;
end;

end.
