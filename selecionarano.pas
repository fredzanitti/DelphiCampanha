unit selecionarano;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls;

type
  Th_anos = class(TForm)
    BtnGravar: TBitBtn;
    Shape1: TShape;
    Shape2: TShape;
    CbxAnos: TComboBox;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;

  end;

var
  h_anos: Th_anos;
  msg: String;

implementation

{$R *.dfm}

uses module, funcoes, telapadraojogos, frequenciaplacar, UProgresso;

procedure Th_anos.BtnGravarClick(Sender: TObject);
var
  i, j, cont, max: integer;
  naoachoujogos: boolean;
begin

  naoachoujogos := false;

  // ==========================================================================
  // Pesquisa quando acionada pelo Públicos / Maiores públicos
  // ==========================================================================
  if identificacao = 'MnPublicoMaiorAno' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '39';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select count(*) from ca_jogos where publico > 0 ' +
      'and year(ca_jogos.data) = ' + CbxAnos.Text;

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
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, '
      + 'codcompeticao, publico from ca_jogos where publico > 0 ' +
      'and year(ca_jogos.data) = ' + CbxAnos.Text + ' order by publico desc ' +
      'limit :LIMITE offset :CORTE';

    // função para preencher a tela padrão com os resultados da sql acima
    f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

    r_jogospadrao.codauxiliar1 := CbxAnos.Text;

    // títulos e descrição do relatório
    r_jogospadrao.LblDescricao1.Caption :=
      'MAIORES PÚBLICOS REFERENTE AO ANO DE ' + CbxAnos.Text;
    r_jogospadrao.LblDescricao2.Caption :=
      'Considerando todos os jogos cadastrados e com públicos maiores que 0';
    // buscar escudo do seu time
    f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
    // definir título do formulário
    r_jogospadrao.Caption := 'Maiores Públicos: ' + f_gerais.buscarNome('nome',
      'ca_adver', 'codadver', '0');
    // mostara a consulta finalizada
    r_jogospadrao.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Públicos / Maiores públicos
  // ==========================================================================
  if identificacao = 'MnPublicoMenorAno' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '40';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select count(*) from ca_jogos where publico > 0 ' +
      'and year(ca_jogos.data) = ' + CbxAnos.Text;

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
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, '
      + 'codcompeticao, publico from ca_jogos where publico > 0 ' +
      'and year(ca_jogos.data) = ' + CbxAnos.Text + ' order by publico ' +
      'limit :LIMITE offset :CORTE';

    // função para preencher a tela padrão com os resultados da sql acima
    f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

    r_jogospadrao.codauxiliar1 := CbxAnos.Text;

    // títulos e descrição do relatório
    r_jogospadrao.LblDescricao1.Caption :=
      'MENORES PÚBLICOS REFERENTE AO ANO DE ' + CbxAnos.Text;
    r_jogospadrao.LblDescricao2.Caption :=
      'Considerando todos os jogos cadastrados e com públicos maiores que 0';
    // buscar escudo do seu time
    f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
    // definir título do formulário
    r_jogospadrao.Caption := 'Menores Públicos: ' + f_gerais.buscarNome('nome',
      'ca_adver', 'codadver', '0');
    // mostara a consulta finalizada
    r_jogospadrao.ShowModal;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Por Um Adversário
  // ==========================================================================
  if identificacao = 'MnRivais' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '6';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(j), sum(v), sum(e), sum(d), sum(gp), sum(gc), sum(sg) ' +
      'from es_resum ' +
      'where codadver in (select codadver from ca_adver where rival = 1) ' +
      'and ano = ' + CbxAnos.Text;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Não há nenhum rival cadastrado ou ' + #13 +
        'não existem jogos contra rivais cadastrados';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      naoachoujogos := true;
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
        + 'from ca_jogos ' +
        'where codadvermand in (select codadver from ca_adver where rival = 1) '
        + 'and extract(year from data) = ' + CbxAnos.Text + ' union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' +
        'where codadvervisit in (select codadver from ca_adver where rival = 1) '
        + 'and extract(year from data) = ' + CbxAnos.Text +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := CbxAnos.Text;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS CONTRA RIVAIS: ' +
        AnsiUpperCase(f_gerais.retornaNomesRivais());
      r_jogospadrao.LblDescricao2.Caption := 'Ano selecionado: ' + CbxAnos.Text;
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Jogos contra rivais:  ' +
        f_gerais.retornaNomesRivais();
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Adversário por ano
  // ==========================================================================

  if identificacao = 'MnAdversario3' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '9';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r ' + 'where r.codadver = ' + r_jogospadrao.codauxiliar1
      + ' and r.ano = ' + CbxAnos.Text;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Não há nenhum jogo cadastrado ' + #13 +
        'contra este adversário no ano selecionado';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      naoachoujogos := true;
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
        + 'from ca_jogos ' + 'where codadvermand = ' +
        r_jogospadrao.codauxiliar1 + ' and extract(year from data) = ' +
        CbxAnos.Text + ' union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codadvervisit = ' +
        r_jogospadrao.codauxiliar1 + ' and extract(year from data) = ' +
        CbxAnos.Text + ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := CbxAnos.Text;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS CONTRA: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1));
      r_jogospadrao.LblDescricao2.Caption := 'Ano selecionado: ' + CbxAnos.Text;
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Jogos contra rivais:  ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  if identificacao = 'MnJogadores1' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '13';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(a.j) j, sum(a.v) v, sum(a.e) e, sum(a.d) d, sum(a.gp) gp, sum(a.gc) gc, sum(a.sg) sg from( '
      + 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_titul e, es_resum r ' + 'where e.codjogo = r.codjogo ' +
      'and e.codjogador = ' + r_jogospadrao.codauxiliar1 + ' and r.ano = ' +
      CbxAnos.Text + ' union ' +
      'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_reser e, es_resum r ' + 'where e.codjogo = r.codjogo ' +
      'and e.codjogador = ' + r_jogospadrao.codauxiliar1 + ' and r.ano = ' +
      CbxAnos.Text + ' ) as a';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad',
        'codjogador', r_jogospadrao.codauxiliar1)) + ' não atuou em nenhuma' +
        #13 + 'oportunidade pelo seu time no ano de ' + CbxAnos.Text;
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      naoachoujogos := true;
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
        'and e.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and extract(year from j.data) = ' + CbxAnos.Text + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
        'and e.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and extract(year from j.data) = ' + CbxAnos.Text +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := CbxAnos.Text;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'Pelo: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        r_jogospadrao.codauxiliar1)) + ' no ano de ' + CbxAnos.Text;
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados pelo: ' +
        f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        r_jogospadrao.codauxiliar1) + '(' + CbxAnos.Text + ')';
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  if identificacao = 'MnJogosAno' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '15';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r ' + 'where r.ano = :ANOSEL';

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Params.ParamByName('ANOSEL').AsString := CbxAnos.Text;
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver',
        'codadver', '0')) + ' não atuou nenhuma vez no ano de ' + CbxAnos.Text;
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      naoachoujogos := true;
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
        + 'from ca_jogos j ' + 'where extract(year from j.data) = ' +
        CbxAnos.Text + ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := CbxAnos.Text;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'SELEÇÃO DE JOGOS DISPUTADOS';
      r_jogospadrao.LblDescricao2.Caption := 'Pelo: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        r_jogospadrao.codauxiliar1)) + ' no ano de ' + CbxAnos.Text;
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Seleção de jogos disputados pelo: ' +
        f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
        r_jogospadrao.codauxiliar1) + '(' + CbxAnos.Text + ')';
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Campeonatos por Ano
  // ==========================================================================

  if identificacao = 'MnJogosCampeonato2' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '18';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      'and j.codcompeticao = ' + r_jogospadrao.codauxiliar1 +
      ' and extract(year from j.data) = ' + CbxAnos.Text;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O  ' + f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0') +
        ' não disputou nenhuma partida pelo(a) ' + f_gerais.buscarNome('nome',
        'ca_compe', 'codcompeticao', r_jogospadrao.codauxiliar1) + #13 +
        'no ano de ' + CbxAnos.Text;
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      naoachoujogos := true;
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
        + 'from ca_jogos j ' + 'where codcompeticao = ' +
        r_jogospadrao.codauxiliar1 + ' and extract(year from j.data) = ' +
        CbxAnos.Text + ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar2 := CbxAnos.Text;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS DISPUTADOS EM ' +
        CbxAnos.Text;
      r_jogospadrao.LblDescricao2.Caption := 'Pelo(a) ' +
        f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao',
        r_jogospadrao.codauxiliar1);
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Jogos Por Campeonato, ano de ' + CbxAnos.Text;
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;

  // ==========================================================================
  // Frequênica de Placar por ano
  // ==========================================================================
  if identificacao = 'MnFreq3' then
  begin

    sql := 'select count(*) from es_resum ' + 'where ano = ' + CbxAnos.Text;

    h_freqplacar.QrEst.Close;
    h_freqplacar.QrEst.sql.Clear;
    h_freqplacar.QrEst.sql.Add(sql);
    h_freqplacar.QrEst.Open;

    if h_freqplacar.QrEst.Fields[0].AsInteger = 0 then
    begin
      msg := 'Não há nenhum jogo cadastrado no ano de ' + CbxAnos.Text;
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      naoachoujogos := true;
    end
    else
    begin

      h_freqplacar.LblTitulo.Caption := 'FREQUÊNCIA DE PLACARES - ANO ' +
        CbxAnos.Text;

      h_freqplacar.LtFavor.Clear;
      h_freqplacar.LtContra.Clear;
      h_freqplacar.LtGeral.Clear;

      // placar máximo
      sql := 'select max(a.ma), min(mi) from( ' +
        'select max(placar1) ma, min(placar1) mi ' + 'from ca_jogos ' + 'union '
        + 'select max(placar2) ma, min(placar2) mi ' + 'from ca_jogos '
        + ') as a';

      h_freqplacar.QrEst.Close;
      h_freqplacar.QrEst.sql.Clear;
      h_freqplacar.QrEst.sql.Add(sql);
      h_freqplacar.QrEst.Open;
      max := h_freqplacar.QrEst.Fields[0].AsInteger;

      // geral
      // Modifica o cursor para ampulheta
      Screen.Cursor := crHourGlass;
      // Cria o formulário de progresso
      frmProgresso := TfrmProgresso.Create(Self);
      // Define o mínimo da barra de progresso
      frmProgresso.gauProgresso.MinValue := 0;
      // Define o máximo da barra de progresso como o número total de itens no listview
      frmProgresso.gauProgresso.MaxValue := h_freqplacar.QrEst.RecordCount;
      // Zera a barra de progresso
      frmProgresso.gauProgresso.Progress := 0;
      // Exibe o formulário de progresso
      frmProgresso.Show;
      // Informa que a planilha está sendo criada
      frmProgresso.lblMensagem.Caption := 'Processando informações - Geral...';
      // Atualiza o label para exibir a mensagem para o usuário
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
            'where j.codjogo = r.codjogo ' + 'and r.ano = ' + CbxAnos.Text +
            ' and ((j.placar1 = ' + IntToStr(i) + ' and j.placar2 = ' +
            IntToStr(j) + ') or (j.placar1 = ' + IntToStr(j) +
            ' and j.placar2 = ' + IntToStr(i) + '))';

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
      // Libera o formulário de progresso da memória
      if Assigned(frmProgresso) then
        frmProgresso.Free;
      // Atribui o cursor salvo no começo do método
      Screen.Cursor := crDefault;

      // a favor
      // Modifica o cursor para ampulheta
      Screen.Cursor := crHourGlass;
      // Cria o formulário de progresso
      frmProgresso := TfrmProgresso.Create(Self);
      // Define o mínimo da barra de progresso
      frmProgresso.gauProgresso.MinValue := 0;
      // Define o máximo da barra de progresso como o número total de itens no listview
      frmProgresso.gauProgresso.MaxValue := h_freqplacar.QrEst.RecordCount;
      // Zera a barra de progresso
      frmProgresso.gauProgresso.Progress := 0;
      // Exibe o formulário de progresso
      frmProgresso.Show;
      // Informa que a planilha está sendo criada
      frmProgresso.lblMensagem.Caption :=
        'Processando informações - A Favor...';
      // Atualiza o label para exibir a mensagem para o usuário
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
            'where j.codjogo = r.codjogo ' + 'and r.ano = ' + CbxAnos.Text +
            ' and r.sg >= 0 ' + 'and ((j.placar1 = ' + IntToStr(i) +
            ' and j.placar2 = ' + IntToStr(j) + ') or (j.placar1 = ' +
            IntToStr(j) + ' and j.placar2 = ' + IntToStr(i) + ')) ' +
            'and r.sg >=0';

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
      // Libera o formulário de progresso da memória
      if Assigned(frmProgresso) then
        frmProgresso.Free;
      // Atribui o cursor salvo no começo do método
      Screen.Cursor := crDefault;

      // contra
      // Modifica o cursor para ampulheta
      Screen.Cursor := crHourGlass;
      // Cria o formulário de progresso
      frmProgresso := TfrmProgresso.Create(Self);
      // Define o mínimo da barra de progresso
      frmProgresso.gauProgresso.MinValue := 0;
      // Define o máximo da barra de progresso como o número total de itens no listview
      frmProgresso.gauProgresso.MaxValue := h_freqplacar.QrEst.RecordCount;
      // Zera a barra de progresso
      frmProgresso.gauProgresso.Progress := 0;
      // Exibe o formulário de progresso
      frmProgresso.Show;
      // Informa que a planilha está sendo criada
      frmProgresso.lblMensagem.Caption := 'Processando informações - Contra...';
      // Atualiza o label para exibir a mensagem para o usuário
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
            'where j.codjogo = r.codjogo ' + 'and r.ano = ' + CbxAnos.Text +
            ' and r.sg < 0 ' + 'and ((j.placar1 = ' + IntToStr(i) +
            ' and j.placar2 = ' + IntToStr(j) + ') or (j.placar1 = ' +
            IntToStr(j) + ' and j.placar2 = ' + IntToStr(i) + ')) ' +
            'and r.sg <0';

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
      // Libera o formulário de progresso da memória
      if Assigned(frmProgresso) then
        frmProgresso.Free;
      // Atribui o cursor salvo no começo do método
      Screen.Cursor := crDefault;
      h_freqplacar.ShowModal;
    end;
  end;

  if not naoachoujogos then
  begin
    // h_anos.Close;
  end;
end;

procedure Th_anos.FormActivate(Sender: TObject);
begin
  f_gerais.preencherCbxAnos(CbxAnos);
  CbxAnos.SetFocus;
end;

procedure Th_anos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_anos.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

end.
