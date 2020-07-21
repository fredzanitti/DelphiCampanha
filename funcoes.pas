unit funcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids, Vcl.StdCtrls,
  jpeg, UProgresso, SHDocVw, ActiveX, ComObj,
  DateUtils, IdHashMessageDigest, DBXJSON, Character,
  IdCoder, IdCoder3to4, IdCoderMIME, XSBuiltIns, ComCtrls;

type
  Tf_gerais = class(TForm)
    QrFunctions: TFDQuery;
    DtsQrFunctions: TDataSource;
    QrTitulares: TFDQuery;
    DtsQrTitulares: TDataSource;
    QrReservas: TFDQuery;
    DtsQrReservas: TDataSource;
    QrSubst: TFDQuery;
    DtsQrSubst: TDataSource;
    QrDisponivel: TFDQuery;
    DtsQrDisponivel: TDataSource;
    QrCidades: TFDQuery;
    DtsQrCidades: TDataSource;
    QrUltimo: TFDQuery;
    DtsQrUltimo: TDataSource;
    QrEditaEscalacao: TFDQuery;
    DtsQrEditaEscalacao: TDataSource;
    QrEstat: TFDQuery;
    DtsQrEstat: TDataSource;
    QrSumula: TFDQuery;
    DtsQrSumula: TDataSource;
    QrSequencias: TFDQuery;
    DtsQrSequencias: TDataSource;
    QrMelhorPior: TFDQuery;
    DtsQrMelhorPior: TDataSource;
    QrEstat2: TFDQuery;
    DtsQrEstat2: TDataSource;
    QrEstat3: TFDQuery;
    DtsQrEstat3: TDataSource;
    QrEstat4: TFDQuery;
    DtsQrEstat4: TDataSource;
    QrEstat1: TFDQuery;
    DtsQrEstat1: TDataSource;
    QrContador: TFDQuery;
    DtsQrContador: TDataSource;
    QrTitulos: TFDQuery;
    DtsQrTitulos: TDataSource;
    QrData: TFDQuery;
    DtsQrData: TDataSource;
    QrNome: TFDQuery;
    DtsQrNome: TDataSource;
    QrEstGerais: TFDQuery;
    DtsQrEstGerais: TDataSource;
    QrRivais: TFDQuery;
    DtsQrRivais: TDataSource;
    QrTotais: TFDQuery;
    DtsQrTotais: TDataSource;
    qryGolsJogo: TFDQuery;
    qryGolsJogonome: TWideStringField;
    qryGolsJogotempoTipo: TWideStringField;
    qryMinutosGolsPorJogador: TFDQuery;
    qryMinutosGolsPorJogadortempoTipo: TWideStringField;

  private
    { Private declarations }
  public
    { Public declarations }
    CodigoJogo: Integer;

  const
    cImagemPadrao =
      'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Imagens\indisponivel.jpg';

  var
    anocompeticao, codcompeticao, codigosaux, versao, tecnico: String;

    { *
      ========================================================================
      Procedures
      ========================================================================
      * }
    procedure buscaImagem(objeto: TImage; caminho: string);
    procedure buscaImagemJogador(objeto: TImage; caminho: string);
    procedure buscaImagemPorCodigo(objeto: TImage; codigoTime, anoJogo: string);
    procedure buscaBandJogador(objeto: TImage; codjogador: string);
    procedure buscaBandPaisPorCodCidade(bandpais: TImage; codcidade: String);
    procedure buscaBandeiras(bandpais, banduf: TImage; codcidade: String;
      cid, pais, uf: TLabel);
    procedure buscaBandeirasJogos(bandpais, banduf: TImage; codestadio: String;
      cid, pais, uf, estadio: TLabel);
    procedure buscaInformacoesJogo(competicao, arbitro, fase: TEdit;
      codcomp, codarb, codfase: TDBEdit);
    procedure pesquisaCidade(grid: TDBGrid; partenome: String);
    procedure pesquisaClubes(grid: TDBGrid; partenome: String);
    procedure pesquisaEstadio(grid: TDBGrid; partenome: String);
    procedure pesquisaArbitro(grid: TDBGrid; partenome: String);
    procedure pesquisaJogos(grid: TDBGrid; dtini, dtfim: String);
    procedure pesquisaJogosPorNumero(grid: TDBGrid; numero: String);
    procedure pesquisaCompeticao(grid: TDBGrid; partenome: String);
    procedure pesquisaJogadores(grid: TDBGrid; partenome: String;
      CodigoJogo: Integer);
    procedure pesquisaJogadoresAtivos(grid: TDBGrid; partenome: String);
    procedure pesquisaTitulos(grid: TDBGrid; partenome: String);
    procedure pesquisaFase(grid: TDBGrid; partenome: String);
    procedure pesquisaUniforme(grid: TDBGrid; partenome: String);
    procedure pesquisaPatroc(grid: TDBGrid; partenome: String);
    procedure pesquisaFornec(grid: TDBGrid; partenome: String);
    procedure deletarImagens(caminho: String);
    procedure cortarFoto(ObCortado, ObOriginal: TImage; areaCorte: TShape);
    procedure ultimoJogo(codigo, Data, placarmand, placarvisit: TLabel;
      mand, visit: TImage);
    procedure captionForm(formulario: TForm);
    procedure limpaTelaJogadoresNosJogos(limite: Integer);
    procedure limpaTelaEditaEscalacao();
    procedure preencherGridTitulares(titulares: TDBGrid; codigodojogo: String);
    procedure preencherGridReservas(reservas: TDBGrid; codigodojogo: String);
    procedure preencherTelaEdtiaEscalacao(TitOuRes, codigodojogo: String);
    procedure deletarTitularesOuReservas(tabela, codigodojogo: String);
    procedure deletarRegistroComParametro(tabela, campo, chave: String);
    procedure deletarReservas(codigodojogo, codigodojogador: String);
    procedure jogadoresASubstituir(grid: TDBGrid; codigodojogo: String);
    procedure jogadoresDisponiveis(grid: TDBGrid;
      codigodojogo, nomeform, nomejogador: String);
    procedure liberaJogadores(ano: String);
    procedure atualizaSituacao(situacao: Integer);
    procedure atualizaSituacaoGeral(situacao: Integer);
    procedure preenchimentoTelaPadraoJogos(sqlcode: String; corte: Integer;
      limite: Integer);
    procedure preencherCbxAnos(anos: TComboBox);
    procedure preencherComboUf(ufs: TComboBox);
    procedure preencherComboPais(paises: TComboBox);
    procedure preencherComboUfSilgaNome(estados: TComboBox);
    procedure determinaVEDRelatorios(query: TFDQuery);
    procedure preencherEstatisticasGeraisJogadores(grid: TDBGrid;
      ano, ordem: String);
    procedure preencherEstJogadoresPorAdversario(codigoTime, ordem: String);
    procedure InfReduzidaJogador(codjogador: String; bandeira, foto: TImage;
      apelido, nomecompleto, periodo, posicao: TLabel);
    procedure preencherFichaIndividual(codjogador: Integer);
    procedure preencherSumula(codjogo: String);
    procedure preencherOsDezMais(sql: String; codRelatorio: Integer);
    procedure preencherAniversariantes(sql: String);
    procedure relPeriodoEstGerais(dtini, dtfim: String; relat: Integer);
    procedure melhorPiorResultado(codigodotime: String);
    procedure melhorPiorResultadoGeral(ano: String);
    procedure preencherGridsCampanhaGeral(ano: String);
    procedure relacaoTitulos(tipo: String; descricao: TLabel);
    procedure atualizarRival(codadver, erival: String);
    procedure infIniciais(qttemp, qtjogos, qtjogad, qttecn: TLabel);
    procedure MudaCor(Evento: String; Componente: TObject);
    procedure qtdeDeTitulos(titulos, descultimotit: TLabel);
    procedure testaUsuario(cod: Integer);
    procedure ultimoBackup(tempo: TLabel);
    procedure preencherPatrocinios(Data: string);
    procedure estPeriodoSemPerderSemGanhar(codigodotime: String);
    procedure gerarExcel(query: TFDQuery);

    { *
      ========================================================================
      Functions
      ========================================================================
      * }
    function verificarStringEmBranco(texto, campo: String): boolean;
    function verifJogParaCadastroJogos(): boolean;
    function contadorRegistros(tabela: String): Integer;
    function maiorCodigo(pk: string; tabela: String): Integer;
    function contRegComUmParametro(tabela, campo, chaveprocurada
      : String): Integer;
    function novoCodigo(tabela, codigo: String): Integer;
    function desejaRealizarAcao(textoinf: string): boolean;
    function buscarNome(retorno, tabela, pk, codigo: String): String;
    function determinarVED(): String;
    function sqlJogosPadrao(nroRelatorio: String): String;
    function verificaExistenciaNome(tabela, nome: String): boolean;
    function retornarCidadeUfPais(codcidade: String): String;
    function periodoJogador(codjogador: String): String;
    function sequencias(dti, dtf: TLabel; Param: String;
      indice, relat: Integer): String;
    function idadeAtual(DataIni, DataFim: TDateTime): string;
    function criptografarSenha(pwd: string): Integer;
    function retornaNomeCompeticao(codigo: Integer): String;
    function retornaNomeTimePorCodigo(codigo: Integer): string;
    function validaNomeUsuario(texto: TDBEdit): boolean;
    function retornaNomesRivais(): String;
    function retornaData(Data: string): string;
    function retornaCodigosRivais(): String;
    function Mascara(edt: string; str: string): string;
    function verificaTecnico(codjogador: String): boolean;
    function RemoveAcento(const pText: string): string;
    function InsereAspasSimples(texto: string): string;
    function retornarGolsPorMinutoPorJogador(codjogo,
      codjogador: Integer): String;
    function ExtrairAnoDataDoJogo(CodigoJogo: string): string;
  end;

var
  f_gerais: Tf_gerais;
  sql: String;

implementation

{$R *.dfm}

uses module, pesquisaJogadoresAtivos, reservas, edtiarescalacao, jogos,
  liberarjogador, telapadraojogos, geraljogadores, fichaindividual, competicao,
  sumula, dezmais, estatisticasgerais, campanhageral, relacaoTitulos, home,
  pesquisaClubes, relatartilheirosporadver, aniversariantes, shellapi,
  relSumula;

{
  =======================================================
  Função para envolver um texto entre aspas
  =======================================================
}
function Tf_gerais.InsereAspasSimples(texto: string): string;
var
  campo: String;
begin
  campo := #39 + StringReplace(Trim(texto), #39, #39 + #39,
    [rfReplaceAll]) + #39;
  Result := campo;
end;

{
  =======================================================
  Função para remover caracteres especiais e acentos
  =======================================================
}
function Tf_gerais.RemoveAcento(const pText: string): string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := UpperCase(string(USAscii20127(pText)));
end;

{
  =======================================================
  Função para máscara para formatar o Edit,
  esta função aceita apenas números, ideal para CPF,
  CNJP, data, telefone, cep
  Ex: Mascara(Edit1.Text, '99.999.999/9999-99');
  =======================================================
}

function Tf_gerais.Mascara(edt: string; str: string): string;
var
  i: Integer;
begin
  for i := 1 to Length(edt) do
  begin
    if (str[i] = '9') and not(edt[i] in ['0' .. '9']) and
      (Length(edt) = Length(str) + 1) then
      delete(edt, i, 1);
    if (str[i] <> '9') and (edt[i] in ['0' .. '9']) then
      insert(str[i], edt, i);
  end;
  Result := edt;

end;

procedure Tf_gerais.gerarExcel(query: TFDQuery);
{
  =======================================================
  Procedure para gerar arquivos Excel dos relatórios
  =======================================================
}
var
  Excel: Variant;
  Linha, Work, ValorI, i: Integer;
  MascaraData: string;
  hWnd: Cardinal;

begin
  if not query.IsEmpty then
  begin
    frmProgresso := TfrmProgresso.Create(frmProgresso);
    frmProgresso.lblMensagem.Caption := 'Aguarde, gerando o arquivo .xls...';
    frmProgresso.aniProgresso.Active := true;
    frmProgresso.Show;
    frmProgresso.gauProgresso.MaxValue := query.RecordCount;
    frmProgresso.gauProgresso.MinValue := 0;
    query.First;

    Excel := CreateOleObject('Excel.Application');
    Excel.Caption := ' ';
    Excel.Visible := false;
    Excel.Workbooks.Add;
    Linha := 1;
    Work := 1;
    Excel.Workbooks[1].Sheets[1].Range['D1'].HorizontalAlignment := 2;
    Excel.Workbooks[1].Sheets[1].Range['G1'].HorizontalAlignment := 2;
    Excel.Workbooks[1].Sheets[1].Range['A1', 'Z1'].font.bold := true; // Negrito
    for i := 0 to query.FieldCount - 1 do
      Excel.Workbooks[1].Sheets[1].Cells[Linha, i + 1] :=
        query.Fields[i].DisplayName;
    Linha := 2;

    While not query.Eof do
    Begin
      for i := 0 to query.FieldCount - 1 do
        if query.Fields[i].IsNull then
          Excel.Workbooks[1].Sheets[1].Cells[Linha, i + 1] := ''
        else
        begin
          Excel.Workbooks[1].Sheets[1].Cells[Linha, i + 1] :=
            query.Fields[i].AsString;
          Excel.Workbooks[1].Sheets[1].Cells[Linha, i + 1].ColumnWidth :=
            query.Fields[i].DisplayWidth;
          Excel.Workbooks[1].Sheets[1].Cells[Linha, i + 1]
            .HorizontalAlignment := 2;
        end;
      frmProgresso.gauProgresso.Progress :=
        frmProgresso.gauProgresso.Progress + 1;
      query.Next;
      Linha := Linha + 1;
    end;
    Excel.Visible := true;
    { Busca a tela do excel para exibir na frente das demais telas }
    hWnd := FindWindow('XLMAIN', nil);
    if hWnd <> 0 then
      SetForegroundWindow(hWnd);
  end;
  frmProgresso.Close;
end;

function Tf_gerais.retornaNomesRivais(): String;
{
  =======================================================
  Função para retonar os nomes dos clubes cadastrados
  como rivais no cadastro de clubes.
  =======================================================
}
var
  Nomes: String;
  i, tot: Integer;
begin
  tot := contadorRegistros('ca_rival');
  i := 1;
  if tot > 0 then
  begin
    sql := 'select ca_adver.nome ' + 'from ca_rival, ca_adver ' +
      'where ca_rival.codadver = ca_adver.codadver ' +
      'order by ca_adver.nome ';

    QrRivais.Close;
    QrRivais.sql.Clear;
    QrRivais.sql.Add(sql);
    QrRivais.Open;
    QrRivais.First;

    while not(QrRivais.Eof) do
    begin
      if i + 1 < tot then
        Nomes := Nomes + QrRivais.Fields[0].AsString + ', '
      else
      begin
        if i < tot then
          Nomes := Nomes + QrRivais.Fields[0].AsString + ' e '
        else
          Nomes := Nomes + QrRivais.Fields[0].AsString;
      end;
      QrRivais.Next;
      i := i + 1;
    end;

    Result := Nomes;
  end
  else
    Result := '';

end;

function Tf_gerais.retornaData(Data: string): string;
{
  =======================================================
  Função para retonar data '01/01/1900' se o campo
  data for branco ou contiver a string '  /  /    '
  =======================================================
}
var
  erro: boolean;
begin
  erro := false;
  if (Data = '  /  /    ') or (Data = ' ') then
    erro := true;

  if erro then
    Result := '01/01/1900'
  else
    Result := Data;
end;

function Tf_gerais.retornaCodigosRivais(): String;
{
  =======================================================
  Função para retonar os nomes dos clubes cadastrados
  como rivais no cadastro de clubes.
  =======================================================
}
var
  Codigos: String;
  i, tot: Integer;
begin
  tot := contadorRegistros('ca_rival');
  i := 1;
  if tot > 0 then
  begin
    sql := 'select ca_adver.codadver ' + 'from ca_rival, ca_adver ' +
      'where ca_rival.codadver = ca_adver.codadver ' +
      'order by ca_adver.codadver ';

    QrRivais.Close;
    QrRivais.sql.Clear;
    QrRivais.sql.Add(sql);
    QrRivais.Open;
    QrRivais.First;

    while not(QrRivais.Eof) do
    begin
      if i + 1 < tot then
        Codigos := Codigos + QrRivais.Fields[0].AsString + ', '
      else
      begin
        if i < tot then
          Codigos := Codigos + QrRivais.Fields[0].AsString + ', '
        else
          Codigos := Codigos + QrRivais.Fields[0].AsString;
      end;
      QrRivais.Next;
      i := i + 1;
    end;

    Result := Codigos;
  end
  else
    Result := '';

end;

procedure Tf_gerais.preencherEstJogadoresPorAdversario(codigoTime: string;
  ordem: string);
{
  =======================================================
  Preencher artilheiros por adversário
  A variável ordem assumirá os seguintes valores, todos
  por ordem decrescente:
  G - Ordena o grid por gols marcados
  M - Ordena o grid por média de gols
  J - Ordena o grid por jogos disputados
  =======================================================
}
begin
  sql := 'select a.codjogador, a.abreviatura, a.nome, sum(a.j) j, sum(a.gols) g, round(sum(a.gols)/sum(a.j),2) mg '
    + 'from ( ' +
    'select e.codjogador, p.abreviatura, jg.nome, sum(r.j) j, sum(e.gols) gols, round(sum(e.gols)/sum(r.j),2) mg '
    + 'from es_titul e, ca_jogos j, ca_posic p, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c, ca_jogad jg '
    + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
    'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver ' +
    'and j.codestadio = es.codestadio ' +
    'and j.codcompeticao = c.codcompeticao ' +
    'and jg.codposicao = p.codposicao ' + 'and e.codjogador = jg.codjogador ' +
    'and r.codadver = ' + codigoTime + ' and e.gols > 0 ' +
    'group by codjogador, abreviatura, nome ' + 'union all ' +
    'select e.codjogador, p.abreviatura, jg.nome, sum(r.j) j, sum(e.gols) gols, round(sum(e.gols)/sum(r.j),2) mge '
    + 'from es_reser e, ca_jogos j, ca_posic p, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c, ca_jogad jg '
    + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
    'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver ' +
    'and j.codestadio = es.codestadio ' +
    'and j.codcompeticao = c.codcompeticao ' +
    'and jg.codposicao = p.codposicao ' + 'and e.codjogador = jg.codjogador ' +
    'and r.codadver = ' + codigoTime + ' and e.gols > 0 ' +
    'group by codjogador, abreviatura, nome ' + ')as a ' +
    'group by codjogador, abreviatura, nome ';

  if ordem = 'G' then
    sql := sql + 'order by g desc, mg desc, j desc ' + 'limit 32 offset 0'
  else
  begin
    if ordem = 'M' then
      sql := sql + 'order by mg desc, g desc, j desc ' + 'limit 32 offset 0'
    else
    begin
      if ordem = 'J' then
        sql := sql + 'order by j desc, g desc, mg desc ' + 'limit 32 offset 0';
    end;
  end;

  FrmDm.QrEstatisticas.Close;
  FrmDm.QrEstatisticas.sql.Clear;
  FrmDm.QrEstatisticas.sql.Add(sql);
  FrmDm.QrEstatisticas.Open;
  FrmDm.QrEstatisticas.First;

  r_artilheirosporadver.DbGridArtClube.DataSource := FrmDm.DtsQrEstatisticas;

  // buscar logo do adversário
  f_gerais.buscaImagemPorCodigo(r_artilheirosporadver.ImgLogoAdver,
    codigoTime, '0');

  // buscar bandeiras do Pais e UF
  f_gerais.buscaBandeiras(r_artilheirosporadver.ImgBandPaisAdver,
    r_artilheirosporadver.ImgUfAdver, f_gerais.buscarNome('codcidade',
    'ca_adver', 'codadver', codigoTime), r_artilheirosporadver.LblCidade,
    r_artilheirosporadver.LblPais, r_artilheirosporadver.LblUf);
end;

procedure Tf_gerais.preencherEstatisticasGeraisJogadores(grid: TDBGrid;
  ano, ordem: String);
{
  =======================================================
  Preencher estatísticas gerais dos jogadores
  A variável ordem assumirá os seguintes valores, todos
  por ordem decrescente:
  G - Ordena o grid por gols marcados
  M - Ordena o grid por média de gols
  J - Ordena o grid por jogos disputados
  A - Ordena o grid por cartões amarelos
  V - Ordena o grid por cartões vermelhos
  =======================================================
}
begin
  sql := 'select a.codjogador, a.abreviatura, a.nome, sum(a.v+a.e+a.d) j, sum(a.gols) g, round(sum(a.gols)/sum(a.v+a.e+a.d),2) mgp, sum(a.camarelo) ca, sum(a.cvermelho) cv '
    + 'from( ' +
    'select j.codjogador, p.abreviatura, j.nome, sum(e.v) v, sum(e.e) e, sum(e.d) d, sum(e.gols) gols, sum(e.camarelo) camarelo, sum(e.cvermelho) cvermelho '
    + 'from es_titul e, ca_jogad j, ca_jogos jg, ca_posic p ' +
    'where e.codjogador = j.codjogador ' + 'and e.codjogo = jg.codjogo ' +
    'and j.codposicao = p.codposicao ' + 'and extract(year from jg.data) = ' +
    ano + ' and p.codposicao not in (6, 9) ' +
    'group by j.codjogador, p.abreviatura, j.nome ' + 'union ' +
    'select j.codjogador, p.abreviatura, j.nome, sum(e.v) v, sum(e.e) e, sum(e.d) d, sum(e.gols) gols, sum(e.camarelo) camarelo, sum(e.cvermelho) cvermelho '
    + 'from es_reser e, ca_jogad j, ca_jogos jg, ca_posic p ' +
    'where e.codjogador = j.codjogador ' + 'and e.codjogo = jg.codjogo ' +
    'and j.codposicao = p.codposicao ' + 'and extract(year from jg.data) = ' +
    ano + ' and p.codposicao not in (6, 9) ' +
    'group by j.codjogador, p.abreviatura, j.nome ' + ') as a ' +
    'group by a.codjogador, a.abreviatura, a.nome ';

  if ordem = 'G' then
    sql := sql + 'order by g desc, mgp desc, j desc, cv, ca'
  else
  begin
    if ordem = 'M' then
      sql := sql + 'order by mgp desc, g desc, j desc, cv, ca'
    else
    begin
      if ordem = 'J' then
        sql := sql + 'order by j desc, g desc, mgp desc, cv, ca'
      else
      begin
        if ordem = 'A' then
          sql := sql + 'order by ca desc, cv desc, j desc, g desc, mgp desc'
        else
        begin
          if ordem = 'V' then
            sql := sql + 'order by cv desc, ca desc, j desc, g desc, mgp desc';
        end;
      end;
    end;
  end;

  QrEstat.Close;
  QrEstat.sql.Clear;
  QrEstat.sql.Add(sql);
  QrEstat.Open;

  grid.DataSource := DtsQrEstat;
end;

{
  =======================================================
  Buscar Período do jogador
  =======================================================
}

function Tf_gerais.periodoJogador(codjogador: String): String;
begin
  sql := 'select min(a.mi), max(a.ma) from ( ' +
    'select min(ano) mi, max(ano) ma ' + 'from es_titul ' +
    'where codjogador = ' + codjogador + ' union all ' +
    'select min(ano) mi, max(ano) ma ' + 'from es_reser  ' +
    'where codjogador = ' + codjogador + ') as a';

  QrEstat4.Close;
  QrEstat4.sql.Clear;
  QrEstat4.sql.Add(sql);
  QrEstat4.Open;

  if QrEstat4.Fields[0].AsInteger = QrEstat4.Fields[1].AsInteger then
    Result := QrEstat4.Fields[0].AsString
  else
    Result := QrEstat4.Fields[0].AsString + '-' + QrEstat4.Fields[1].AsString;
end;

procedure Tf_gerais.preencherPatrocinios(Data: string);
var
  patroc, fornec: string;
  {
    =======================================================
    Preencher patrocinadores
    =======================================================
  }
begin
  sql := 'select logo_patroc, nomepatroc, codcidade from CA_PATROC ' +
    'where dt_inicio <= :DTINI and dt_fim >= :DTFIM';

  QrData.Close;
  QrData.sql.Clear;
  QrData.sql.Add(sql);
  QrData.Params.ParamByName('DTINI').AsDate := StrToDate(Data);
  QrData.Params.ParamByName('DTFIM').AsDate := StrToDate(Data);
  QrData.Open;

  f_gerais.buscaImagem(r_sumula.ImgPatroc, QrData.Fields[0].AsString);
  f_gerais.buscaBandPaisPorCodCidade(r_sumula.ImgBandPatroc,
    QrData.Fields[2].AsString);
  patroc := QrData.Fields[0].AsString;
  r_sumula.ImgPatroc.Hint := QrData.Fields[1].AsString;
  r_sumula.ImgPatroc.ShowHint := true;

  // Fornecedor de material esportivo
  sql := 'select logo_fornec, nomefornec, codcidade from CA_FORNEC ' +
    'where dt_inicio <= :DTINI and dt_fim >= :DTFIM';

  QrData.Close;
  QrData.sql.Clear;
  QrData.sql.Add(sql);
  QrData.Params.ParamByName('DTINI').AsDate := StrToDate(Data);
  QrData.Params.ParamByName('DTFIM').AsDate := StrToDate(Data);
  QrData.Open;

  f_gerais.buscaImagem(r_sumula.ImgFornec, QrData.Fields[0].AsString);
  f_gerais.buscaBandPaisPorCodCidade(r_sumula.ImgBandFornec,
    QrData.Fields[2].AsString);
  fornec := QrData.Fields[0].AsString;
  r_sumula.ImgFornec.Hint := QrData.Fields[1].AsString;
  r_sumula.ImgFornec.ShowHint := true;

  if (patroc = EmptyStr) and (fornec = EmptyStr) then
    r_sumula.GbxPatrocinios.Visible := false
  else
    r_sumula.GbxPatrocinios.Visible := true;
end;

procedure Tf_gerais.InfReduzidaJogador(codjogador: String;
  bandeira, foto: TImage; apelido, nomecompleto, periodo, posicao: TLabel);
{
  =======================================================
  Preencher ficha reduzida
  =======================================================
}
begin

  if not(codjogador = EmptyStr) then
  begin

    periodo.Caption := periodoJogador(codjogador);

    buscaImagemJogador(foto, buscarNome('foto', 'ca_jogad', 'codjogador',
      codjogador));

    apelido.Caption := AnsiUpperCase(buscarNome('nome', 'ca_jogad',
      'codjogador', codjogador));

    nomecompleto.Caption := buscarNome('nomecompleto', 'ca_jogad', 'codjogador',
      codjogador);

    posicao.Caption := buscarNome('descricao', 'ca_posic', 'codposicao',
      buscarNome('codposicao', 'ca_jogad', 'codjogador', codjogador));

    buscaImagem(bandeira, buscarNome('bandeira', 'ca_pais', 'codpais',
      buscarNome('codpais', 'ca_cidad', 'codcidade', buscarNome('codcidade',
      'ca_jogad', 'codjogador', codjogador))));
  end;

end;

procedure Tf_gerais.estPeriodoSemPerderSemGanhar(codigodotime: String);
var
  contvit, contder: Integer;
  seuTime, Adversario: String;
  {
    =============================================================
    Estatisticas de quanto tempo o seu time não perde e não ganha
    =============================================================
  }
begin

  sql := 'select a.PST, a.PAD, a.data from ( ' +
    ' select codjogo, data, codadvermand, placar1 as PAD, placar2 as PST, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar1 as GOLSPRO '
    + ' from ca_jogos ' + ' where codadvermand = ' + codigodotime +
     ' union all ' +
    ' select codjogo, data, codadvermand, placar2 as PAD, placar1 as PST, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar2 as GOLSPRO '
    + ' from ca_jogos ' + ' where codadvervisit = ' + codigodotime +
     ' order by 2 desc ' + ' ) as a ';

  QrEstGerais.Close;
  QrEstGerais.sql.Clear;
  QrEstGerais.sql.Add(sql);
  QrEstGerais.Open();
  QrEstGerais.First;

  contder := 0;
  contvit := 0;
  seuTime := AnsiUpperCase(buscarNome('nome', 'ca_adver', 'codadver', '0'));
  Adversario := AnsiUpperCase(buscarNome('nome', 'ca_adver', 'codadver',
    codigodotime));

  // em caso de derrota ou empate
  while (QrEstGerais.Fields[0].AsInteger <= QrEstGerais.Fields[1].AsInteger) and
    (not QrEstGerais.Eof) do
  begin
    contder := contder + 1;
    QrEstGerais.Next;
  end;

  QrEstGerais.First;
  // em caso de vitória ou empate
  while (QrEstGerais.Fields[0].AsInteger >= QrEstGerais.Fields[1].AsInteger) and
    (not QrEstGerais.Eof) do
  begin
    contvit := contvit + 1;
    QrEstGerais.Next;
  end;

  if contder > contvit then
  begin
    if contder = 1 then
      r_estgerais.LblResumo.Caption := 'O ' + seuTime + ' não vence o ' +
        Adversario + ' há ' + IntToStr(contder) + ' jogo.'
    else
      r_estgerais.LblResumo.Caption := 'O ' + seuTime + ' não vence o ' +
        Adversario + ' há ' + IntToStr(contder) + ' jogos.';
  end
  else
  begin
    if contvit = 1 then
      r_estgerais.LblResumo.Caption := 'O ' + seuTime + ' não perde para o ' +
        Adversario + ' há ' + IntToStr(contvit) + ' jogo.'
    else
      r_estgerais.LblResumo.Caption := 'O ' + seuTime + ' não perde para o ' +
        Adversario + ' há ' + IntToStr(contvit) + ' jogos.';
  end;

end;

{
  =======================================================
  Determina V,E,D,GP,GC,SG nos relatóiros de jogos padrão
  =======================================================
}

procedure Tf_gerais.determinaVEDRelatorios(query: TFDQuery);
begin
  r_jogospadrao.LblDescricao3.Caption := 'Estatísticas Gerais: ' + query.Fields
    [0].AsString + ' J, ' + query.Fields[1].AsString + ' V, ' + query.Fields[2]
    .AsString + ' E, ' + query.Fields[3].AsString + ' D, ' +
    FormatFloat('###,##0', query.Fields[4].AsFloat) + ' GP, ' +
    FormatFloat('###,##0', query.Fields[5].AsFloat) + ' GC, ' +
    FormatFloat('###,##0', query.Fields[6].AsFloat) + ' SG';
end;

procedure Tf_gerais.buscaImagem(objeto: TImage; caminho: string);
{
  =======================================================
  Buscar Imagens de um caminho definido
  Esta procedure recebe um objeto TImage e um caminho
  contendo o endereço completo de onde o arquivo de foto
  se encontra para ser mostrado no TImage recebido. A
  procedure testa se o caminho da imagem é valido e se a
  imagem existe, caso não encontrada o objeto recebe nil
  (ou seja, o TImage fica em branco).
  =======================================================
}
begin
  if FileExists(pchar(caminho)) then
    objeto.Picture.LoadFromFile(caminho)
  else
    objeto.Picture.Graphic := nil;
end;

procedure Tf_gerais.buscaBandJogador(objeto: TImage; codjogador: string);
{
  =======================================================
  Esta procedure tem como objetivo recuperar a bandeira
  referente a nacionalidade do jogador/técnico. Ela
  recebe um objeto TImage e o código do jogador e
  recupera o caminho da bandeira através de uma sentença
  SQL e mostra a imagem no TImage.
  =======================================================
}
begin
  sql := 'CALL sp_busca_bandeira_jogador (' + codjogador + ')';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;

  if FileExists(pchar(QrFunctions.Fields[0].AsString)) then
    objeto.Picture.LoadFromFile(QrFunctions.Fields[0].AsString)
  else
    objeto.Picture.Graphic := nil;
end;

function Tf_gerais.ExtrairAnoDataDoJogo(CodigoJogo: string): string;
var
  qryExtraiAno: TFDQuery;
begin
  sql := 'SELECT ca_jogos.temporada FROM ca_jogos WHERE ca_jogos.codjogo = ' +
    CodigoJogo;

  qryExtraiAno := TFDQuery.Create(nil);
  qryExtraiAno.Connection := FrmDm.BDMySQL;
  qryExtraiAno.Close;
  qryExtraiAno.sql.Clear;
  qryExtraiAno.sql.Add(sql);
  qryExtraiAno.Open;

  Result := qryExtraiAno.Fields[0].AsString;
end;

procedure Tf_gerais.buscaImagemPorCodigo(objeto: TImage;
  codigoTime, anoJogo: string);
{
  =======================================================
  Esta procedure busca a imagem do escudo do clube
  através do seu código único. Ela recebe um objeto
  TImage e o código do clube, recupera o caminho do
  escudo através de uma sentença SQL e mostra a imagem
  no TImage.
  =======================================================
}
begin
  sql := 'CALL sp_busca_escudo_clube (' + codigoTime + ',' + anoJogo + ')';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;

  if FileExists(pchar(QrFunctions.Fields[0].AsString)) then
    objeto.Picture.LoadFromFile(QrFunctions.Fields[0].AsString)
  else
    objeto.Picture.Graphic := nil;
end;

procedure Tf_gerais.buscaImagemJogador(objeto: TImage; caminho: string);
{
  =======================================================
  Faz a mesma função da procedure buscaImagem, porém se o
  caminho da imagem é inválido ou não existe, o TImage
  receberá uma imagem defaut ?Foto Indisponível?.
  =======================================================
}
begin
  if FileExists(pchar(caminho)) then
    objeto.Picture.LoadFromFile(caminho)
  else
    objeto.Picture.LoadFromFile(cImagemPadrao);
end;

{
  =======================================================
  Contador de registros de uma tabela
  =======================================================
}
function Tf_gerais.contadorRegistros(tabela: String): Integer;
begin
  sql := 'select count(*) from ' + tabela;

  QrContador.Close;
  QrContador.sql.Clear;
  QrContador.sql.Add(sql);
  QrContador.Open;

  Result := QrContador.Fields[0].AsInteger;
end;

{
  =======================================================
  Retorna código máximo de uma PK
  =======================================================
}
function Tf_gerais.maiorCodigo(pk: string; tabela: String): Integer;
begin
  sql := 'select max(' + pk + ') from ' + tabela;

  QrContador.Close;
  QrContador.sql.Clear;
  QrContador.sql.Add(sql);
  QrContador.Open;

  Result := QrContador.Fields[0].AsInteger;
end;

{
  =======================================================
  Contador de registros de uma tabela com um parametro
  =======================================================
}
function Tf_gerais.contRegComUmParametro(tabela, campo, chaveprocurada
  : String): Integer;
begin
  sql := 'select count(*) from ' + tabela + ' where ' + campo + ' = ' +
    chaveprocurada;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;

  Result := QrFunctions.Fields[0].AsInteger;
end;

procedure Tf_gerais.buscaBandeiras(bandpais, banduf: TImage; codcidade: String;
  cid, pais, uf: TLabel);
{
  =======================================================
  Buscar banderias do País e UF
  Esta procedure recupera as bandeiras do país e unidades
  de federação, bem como os nomes da cidade, país e
  unidade de federação (caso exista) através do código da
  cidade. Ela recebe dois objetos TImage e três labels,
  recupera os caminhos das bandeiras e os nomes e mostram
  em seus respectivos componentes.
  =======================================================
}
begin
  if codcidade = EmptyStr then
  begin
    bandpais.Picture.Graphic := nil;
    banduf.Picture.Graphic := nil;
    cid.Caption := '';
    pais.Caption := '';
    uf.Caption := '';
  end
  else
  begin
    // buscar bandeira do país/uf
    sql := 'CALL sp_busca_bandeira_pais (' + codcidade + ')';

    QrCidades.Close;
    QrCidades.sql.Clear;
    QrCidades.sql.Add(sql);
    QrCidades.Open;

    buscaImagem(bandpais, QrCidades.Fields[0].AsString);
    buscaImagem(banduf, QrCidades.Fields[1].AsString);
    cid.Caption := QrCidades.Fields[2].AsString;
    pais.Caption := AnsiUpperCase(QrCidades.Fields[3].AsString);
    if QrCidades.Fields[5].AsString = 'EX' then
    begin
      uf.Visible := false;
    end
    else
    begin
      uf.Caption := QrCidades.Fields[4].AsString + ' ( ' + QrCidades.Fields[5]
        .AsString + ' ) ';
      uf.Visible := true;
    end;
  end;
end;

procedure Tf_gerais.buscaBandPaisPorCodCidade(bandpais: TImage;
  codcidade: String);
{
  =======================================================
  Buscar banderias do País por codigo da cidade
  Esta procedure recupera a bandeira do país através do
  código da cidade. Ela recebe um objeto TImage e o
  código da cidade e recupera o caminho da bandeira
  através de uma sentença SQL e mostra a imagem no TImage
  =======================================================
}
begin
  if codcidade = EmptyStr then
  begin
    bandpais.Picture.Graphic := nil;
  end
  else
  begin
    // buscar bandeira do país/uf
    sql := 'CALL sp_busca_bandeira_pais (' + codcidade + ')';

    QrCidades.Close;
    QrCidades.sql.Clear;
    QrCidades.sql.Add(sql);
    QrCidades.Open;

    buscaImagem(bandpais, QrCidades.Fields[0].AsString);

  end;
end;

procedure Tf_gerais.buscaBandeirasJogos(bandpais, banduf: TImage;
  codestadio: String; cid, pais, uf, estadio: TLabel);
{
  =======================================================
  Buscar banderias do País e UF através do estádio
  Esta procedure recupera as bandeiras do país e unidades
  de federação, bem como os nomes da cidade, país e
  unidade de federação (caso exista) através do código do
  estádio. Ela recebe dois objetos TImage e três labels,
  recupera os caminhos das bandeiras e os nomes e mostram
  em seus respectivos componentes.
  =======================================================
}
begin
  if codestadio = EmptyStr then
  begin
    bandpais.Picture.Graphic := nil;
    banduf.Picture.Graphic := nil;
    cid.Caption := '';
    pais.Caption := '';
    uf.Caption := '';
    estadio.Caption := '';
  end
  else
  begin
    // buscar bandeira do país/uf
    sql := 'CALL sp_busca_bandeira_pais_estadio (' + codestadio + ')';

    QrCidades.Close;
    QrCidades.sql.Clear;
    QrCidades.sql.Add(sql);
    QrCidades.Open;

    buscaImagem(bandpais, QrCidades.Fields[0].AsString);
    buscaImagem(banduf, QrCidades.Fields[1].AsString);
    estadio.Caption := QrCidades.Fields[6].AsString;
    cid.Caption := QrCidades.Fields[2].AsString;
    pais.Caption := AnsiUpperCase(QrCidades.Fields[3].AsString);
    if QrCidades.Fields[5].AsString = 'EX' then
    begin
      uf.Visible := false;
    end
    else
    begin
      uf.Caption := QrCidades.Fields[4].AsString + ' ( ' + QrCidades.Fields[5]
        .AsString + ' ) ';
      uf.Visible := true;
    end;
  end;
end;

procedure Tf_gerais.pesquisaCidade(grid: TDBGrid; partenome: String);
{
  =======================================================
  preencher gride das cidades
  Esta procedure preenche o grid com as cidades que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
begin
  sql := 'CALL sp_pesquisa_cidade (''' + partenome + ''')';

  QrCidades.Close;
  QrCidades.sql.Clear;
  QrCidades.sql.Add(sql);
  QrCidades.Open;

  grid.DataSource := DtsQrCidades;
end;

{
  =======================================================
  Retorna próximo código válido para inserção de registro
  =======================================================
}
function Tf_gerais.novoCodigo(tabela, codigo: String): Integer;
var
  codauxiliar, i: Integer;
begin
  if tabela = 'CA_USER' then
    sql := 'select max(' + codigo + ') from ' + tabela +
      ' where codusuario not in (9999)'
  else
  begin
    sql := 'select max(' + codigo + ') from ' + tabela;
  end;
  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;

  Result := QrFunctions.Fields[0].AsInteger + 1;

end;

procedure Tf_gerais.pesquisaClubes(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar clubes na tabela CA_ADVER
  Esta procedure preenche o grid com os clubes que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
var
  qryPesquisarClube: TFDQuery;
  dtsPesquisarClube: TDataSource;
begin
  sql := 'CALL sp_pesquisa_clube (''' + partenome + ''')';

  qryPesquisarClube := TFDQuery.Create(nil);
  qryPesquisarClube.Connection := FrmDm.BDMySQL;
  dtsPesquisarClube := TDataSource.Create(nil);
  dtsPesquisarClube.DataSet := qryPesquisarClube;

  qryPesquisarClube.Close;
  qryPesquisarClube.sql.Clear;
  qryPesquisarClube.sql.Add(sql);
  qryPesquisarClube.Open;

  grid.DataSource := dtsPesquisarClube;
end;

{
  =======================================================
  Confirmarção para várias ações no sistema
  =======================================================
}

function Tf_gerais.desejaRealizarAcao(textoinf: string): boolean;
var
  msg: String;
begin
  msg := 'Deseja ' + textoinf;
  if Application.MessageBox(pchar(msg), 'ATENÇÃO', mb_yesno + MB_ICONQUESTION) = mryes
  then
    Result := true
  else
    Result := false;
end;

procedure Tf_gerais.deletarImagens(caminho: String);
{
  =======================================================
  Deletar imagem (foto, escudo, etc.)
  Esta procedure deleta fisicamente a imagem do caminho
  que é passado como parâmetro.
  =======================================================
}
begin
  if FileExists(caminho) then
    DeleteFile(caminho);
end;

{
  =======================================================
  Verificar String se está vazia (EmptyStr)
  =======================================================
}
function Tf_gerais.verificarStringEmBranco(texto, campo: String): boolean;
begin
  if texto = EmptyStr then
  begin
    Application.MessageBox(pchar('O campo ' + campo + ' não pode ser nulo!'),
      'ATENÇÃO', MB_OK + MB_ICONERROR);
    Result := true;
  end
  else
    Result := false;
end;

{
  =======================================================
  Verifica se há técnicos, pelos menos um goleiro e
  jogadores ativos (status = 0) para cadastrar um jogo
  =======================================================
}
function Tf_gerais.verifJogParaCadastroJogos(): boolean;
begin
  sql := 'select count(*) ' + 'from ca_jogad, ca_posic ' +
    'where ca_jogad.codposicao = ca_posic.codposicao ' +
    'and ca_posic.abreviatura = :POSICAO ' + 'and ca_jogad.situacao = 0';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('POSICAO').AsString := 'TEC';
  QrFunctions.Open;

  if QrFunctions.Fields[0].AsInteger = 0 then
  begin
    sql := 'select count(*) ' + 'from ca_jogad, ca_posic ' +
      'where ca_jogad.codposicao = ca_posic.codposicao ' +
      'and ca_posic.abreviatura = :POSICAO ' + 'and ca_jogad.situacao = 0';

    QrFunctions.Close;
    QrFunctions.sql.Clear;
    QrFunctions.sql.Add(sql);
    QrFunctions.Params.ParamByName('POSICAO').AsString := 'TEI';
    QrFunctions.Open;

    if QrFunctions.Fields[0].AsInteger = 0 then
    begin
      msg := 'Não há nenhum TÉCNICO cadastrado e/ou ativo!' + #13 +
        'Acesse o cadastro de jogadores/técnicos e cadastre ' + #13 +
        'ou ative um técnico.';
      Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      Result := true;
    end
    else
    begin
      Result := false;
    end;
  end
  else
  begin
    sql := 'select count(*) ' + 'from ca_jogad, ca_posic ' +
      'where ca_jogad.codposicao = ca_posic.codposicao ' +
      'and ca_posic.abreviatura = :POSICAO ' + 'and ca_jogad.situacao = 0';

    QrFunctions.Close;
    QrFunctions.sql.Clear;
    QrFunctions.sql.Add(sql);
    QrFunctions.Params.ParamByName('POSICAO').AsString := 'GOL';
    QrFunctions.Open;

    if QrFunctions.Fields[0].AsInteger = 0 then
    begin
      msg := 'Não há nenhum GOLEIRO cadastrado e/ou ativo!' + #13 +
        'Acesse o cadastro de jogadores/técnicos e cadastre ' + #13 +
        'ou ative um goleiro.';
      Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
      Result := true;
    end
    else
    begin
      Result := false;
    end
  end;

end;

{
  =======================================================
  Verifica se o profissional selecionado é um tecnico
  =======================================================
}

function Tf_gerais.verificaTecnico(codjogador: String): boolean;
begin
  sql := 'select p.codposicao from CA_JOGAD c, CA_POSIC p ' +
    'where c.codposicao = p.codposicao ' + 'and c.codjogador = ' + codjogador;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;

  if (QrFunctions.Fields[0].AsInteger <> 6) and
    (QrFunctions.Fields[0].AsInteger <> 9) then
  begin
    msg := 'O nome selecionado não é um TÉCNICO!' + #13 +
      'Por favor, selecione um técnico';
    Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    Result := false;
  end
  else
  begin
    Result := true;
  end;
end;

procedure Tf_gerais.cortarFoto(ObCortado, ObOriginal: TImage;
  areaCorte: TShape);
var
  Dest, Orig: TRect;
  Bmp: TBitmap;
  {
    =======================================================
    Cortar foto do jogador para o tamanho adequado
    Esta procedure corta a imagem importada para adequação
    de tamanho no quadro destinado a exibir a imagem da
    foto do jogador.
    =======================================================
  }
begin
  Orig.Left := areaCorte.Left - ObOriginal.Left;
  Orig.Top := areaCorte.Top - ObOriginal.Top;
  Orig.Right := Orig.Left + areaCorte.Width;
  Orig.Bottom := Orig.Top + areaCorte.Height;

  Dest.Left := 0;
  Dest.Top := 0;
  Dest.Right := areaCorte.Width;
  Dest.Bottom := areaCorte.Height;
  ObCortado.Picture.Bitmap.Width := areaCorte.Width;
  ObCortado.Picture.Bitmap.Height := areaCorte.Height;

  Bmp := TBitmap.Create;
  try
    Bmp.Width := ObOriginal.Width;
    Bmp.Height := ObOriginal.Height;
    if ObOriginal.Stretch then // esse tava sendo o seu problema
      Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.Width, Bmp.Height),
        ObOriginal.Picture.Graphic)
    else
      Bmp.Canvas.Draw(0, 0, ObOriginal.Picture.Graphic);

    ObCortado.Picture.Bitmap.Canvas.CopyRect(Dest, Bmp.Canvas, Orig);
  finally
    Bmp.Free;
  end;

end;

procedure Tf_gerais.pesquisaJogadores(grid: TDBGrid; partenome: String;
  CodigoJogo: Integer);
{
  =======================================================
  Pesquisar jogadores na tabela CA_JOGAD
  Esta procedure preenche o grid com os jogadores que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
begin
  sql := 'CALL sp_pesquisa_jogadores (''' + partenome + ''',''' + tecnico +
    ''',' + IntToStr(CodigoJogo) + ')';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;

  grid.DataSource := DtsQrFunctions;
end;

procedure Tf_gerais.pesquisaJogadoresAtivos(grid: TDBGrid; partenome: String);
{
  =======================================================
  Esta procedure preenche o grid com os jogadores ativos
  que correspondem ao filtro da pesquisa por parte do
  nome que é passado como parâmetro.
  =======================================================
}
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select j.codjogador, j.nome, p.abreviatura ' +
      'from ca_jogad j, ca_posic p ' + 'where j.codposicao = p.codposicao ' +
      'and j.situacao = 0 ' + 'order by nome';
  end
  else
  begin
    sql := 'select j.codjogador, j.nome, p.abreviatura ' +
      'from ca_jogad j, ca_posic p ' + 'where j.codposicao = p.codposicao ' +
      'and j.situacao = 0 ' + 'and j.nome like :PARTEDONOME ' + 'order by nome';
  end;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    QrFunctions.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  QrFunctions.Open;

  grid.DataSource := DtsQrFunctions;
end;

procedure Tf_gerais.pesquisaEstadio(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar estádios
  Esta procedure preenche o grid com os estádios que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
var
  qryPesquisarEstadio: TFDQuery;
  dtsPesquisarEstadio: TDataSource;
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select e.codestadio codigo, e.nome estadio, c.nome cidade, u.sigla uf, p.nome pais '
      + 'from CA_ESTAD e, CA_CIDAD c, CA_PAIS p, CA_UF u ' +
      'where c.codcidade = e.codcidade ' + 'and c.codpais = p.codpais ' +
      'and c.coduf = u.coduf ' + 'order by e.nome';
  end
  else
  begin
    sql := 'select e.codestadio codigo, e.nome estadio, c.nome cidade, u.sigla uf, p.nome pais '
      + 'from CA_ESTAD e, CA_CIDAD c, CA_PAIS p, CA_UF u ' +
      'where c.codcidade = e.codcidade ' + 'and c.codpais = p.codpais ' +
      'and c.coduf = u.coduf ' + 'and e.nome like :PARTEDONOME' +
      ' order by e.nome';
  end;

  qryPesquisarEstadio := TFDQuery.Create(nil);
  qryPesquisarEstadio.Connection := FrmDm.BDMySQL;
  dtsPesquisarEstadio := TDataSource.Create(nil);
  dtsPesquisarEstadio.DataSet := qryPesquisarEstadio;

  qryPesquisarEstadio.Close;
  qryPesquisarEstadio.sql.Clear;
  qryPesquisarEstadio.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    qryPesquisarEstadio.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  qryPesquisarEstadio.Open;

  grid.DataSource := dtsPesquisarEstadio;
end;

{
  =======================================================
  Buscar ultimo jogo cadastrado
  =======================================================
}
procedure Tf_gerais.ultimoJogo(codigo, Data, placarmand, placarvisit: TLabel;
  mand, visit: TImage);
begin
  sql := 'select j.codjogo, j.data, j.hora, am.codadver, j.placar1, ' +
    'av.codadver, j.placar2, e.nome estadio, co.nome competicao, ci.nome cidade, p.sigla siglap '
    + 'from CA_JOGOS j, CA_ADVER am, CA_ADVER av, CA_ESTAD e, CA_COMPE co, CA_CIDAD ci, CA_PAIS p '
    + 'where j.codadvermand = am.codadver ' +
    'and j.codadvervisit = av.codadver ' + 'and j.codestadio = e.codestadio ' +
    'and j.codcompeticao = co.codcompeticao ' +
    'and e.codcidade = ci.codcidade ' + 'and ci.codpais = p.codpais ' +
    'and j.data = (select max(CA_JOGOS.data) from CA_JOGOS)';

  QrUltimo.Close;
  QrUltimo.sql.Clear;
  QrUltimo.sql.Add(sql);
  QrUltimo.Open;

  codigo.Caption := QrUltimo.Fields[0].AsString;
  Data.Caption := FormatDateTime('dddd"," dd "de" mmmm "de" yyyy',
    QrUltimo.Fields[1].AsDateTime) + ', ' + QrUltimo.Fields[2].AsString + #13 +
    QrUltimo.Fields[7].AsString + ', ' + QrUltimo.Fields[9].AsString + '/' +
    QrUltimo.Fields[10].AsString + #13 + QrUltimo.Fields[8].AsString;
  placarmand.Caption := QrUltimo.Fields[4].AsString;
  placarvisit.Caption := QrUltimo.Fields[6].AsString;
  buscaImagemPorCodigo(mand, QrUltimo.Fields[3].AsString, f_gerais.ExtrairAnoDataDoJogo(QrUltimo.Fields[0].AsString));
  buscaImagemPorCodigo(visit, QrUltimo.Fields[5].AsString, f_gerais.ExtrairAnoDataDoJogo(QrUltimo.Fields[0].AsString));
end;

procedure Tf_gerais.captionForm(formulario: TForm);
{
  =======================================================
  Procedure para renomear o caption de um formulário. Ela
  recebe o formulário como parâmetro e retorna para o
  título do formulário a expressão ?CAMPANHA ANO A ANO ?
  Versão x.xx mês/ano?.
  =======================================================
}
begin
  sql := 'select a.nome time, c.nome cidade, p.sigla pais ' +
    'from CA_CIDAD c, CA_PAIS p, CA_UF u, CA_ADVER a ' +
    'where c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' +
    'and c.codcidade = a.codcidade ' + 'and a.codadver = 0 ';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;

  if QrFunctions.Fields[0].AsString = EmptyStr then
    formulario.Caption := 'CAMPANHA ANO A ANO - ' + versao
  else
  begin
    formulario.Caption := QrFunctions.Fields[0].AsString + ' ( ' +
      QrFunctions.Fields[1].AsString + '/' + QrFunctions.Fields[2]
      .AsString + ' )';
  end;
end;

procedure Tf_gerais.pesquisaArbitro(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar arbitros
  Esta procedure preenche o grid com os árbitros que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
var
  qryPesquisarArbitro: TFDQuery;
  dtsPesquisarArbitro: TDataSource;
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select * from CA_ARBIT order by nome';
  end
  else
  begin
    sql := 'select * from CA_ARBIT ' + 'where nome like :PARTEDONOME ' +
      'order by nome';
  end;

  qryPesquisarArbitro := TFDQuery.Create(nil);
  qryPesquisarArbitro.Connection := FrmDm.BDMySQL;
  dtsPesquisarArbitro := TDataSource.Create(nil);
  dtsPesquisarArbitro.DataSet := qryPesquisarArbitro;

  qryPesquisarArbitro.Close;
  qryPesquisarArbitro.sql.Clear;
  qryPesquisarArbitro.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    qryPesquisarArbitro.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  qryPesquisarArbitro.Open;

  grid.DataSource := dtsPesquisarArbitro;
end;

procedure Tf_gerais.pesquisaTitulos(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar títulos
  Esta procedure preenche o grid com os títulos que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select t.ano, c.nome torneio, c.codcompeticao ' +
      'from ES_TITULOS t, CA_COMPE c ' +
      'where t.codcompeticao = c.codcompeticao ' + 'order by t.ano, c.nome';
  end
  else
  begin
    sql := 'select t.ano, c.nome torneio, c.codcompeticao ' +
      'from ES_TITULOS t, CA_COMPE c ' +
      'where t.codcompeticao = c.codcompeticao ' +
      'and c.nome like :PARTEDONOME ' + 'order by t.ano, c.nome';
  end;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    QrFunctions.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  QrFunctions.Open;

  grid.DataSource := DtsQrFunctions;
end;

procedure Tf_gerais.pesquisaFase(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar fases
  Esta procedure preenche o grid com as fases que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select * from CA_FASE order by nome';
  end
  else
  begin
    sql := 'select * from CA_FASE ' + 'where nome like :PARTEDONOME ' +
      'order by nome';
  end;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    QrFunctions.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  QrFunctions.Open;

  grid.DataSource := DtsQrFunctions;
end;

procedure Tf_gerais.pesquisaUniforme(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar uniformes
  Esta procedure preenche o grid com os uniformes que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
var
  qryPesquisarCamisa: TFDQuery;
  dtsPesquisarCamisa: TDataSource;
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select * from CA_UNIFORMES order by descricao';
  end
  else
  begin
    sql := 'select * from CA_UNIFORMES ' + 'where descricao like :PARTEDONOME '
      + 'order by descricao';
  end;

  qryPesquisarCamisa := TFDQuery.Create(nil);
  qryPesquisarCamisa.Connection := FrmDm.BDMySQL;
  dtsPesquisarCamisa := TDataSource.Create(nil);
  dtsPesquisarCamisa.DataSet := qryPesquisarCamisa;

  qryPesquisarCamisa.Close;
  qryPesquisarCamisa.sql.Clear;
  qryPesquisarCamisa.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    qryPesquisarCamisa.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  qryPesquisarCamisa.Open;

  grid.DataSource := dtsPesquisarCamisa;
end;

procedure Tf_gerais.pesquisaPatroc(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar patrocinadores
  Esta procedure preenche o grid com os patrocinadores
  que correspondem ao filtro da pesquisa por parte do
  nome que é passado como parâmetro.
  =======================================================
}
var
  qryPesquisarPatroc: TFDQuery;
  dtsPesquisarPatroc: TDataSource;
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select f.codpatroc as codigo, f.nomepatroc as patrocinador, ' +
      'c.nome as cidade, p.nome as pais, u.sigla as uf ' +
      'from  CA_CIDAD c, CA_PAIS p, CA_UF u, CA_PATROC f ' +
      'where c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' +
      'and c.codcidade = f.codcidade ' +
      'order by f.nomepatroc, c.nome, p.nome, u.sigla';
  end
  else
  begin
    sql := 'select f.codpatroc as codigo, f.nomepatroc as patrocinador, ' +
      'c.nome as cidade, p.nome as pais, u.sigla as uf ' +
      'from  CA_CIDAD c, CA_PAIS p, CA_UF u, CA_PATROC f ' +
      'where c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' +
      'and c.codcidade = f.codcidade ' + 'and nomepatroc like :PARTEDONOME ' +
      'order by f.nomepatroc, c.nome, p.nome, u.sigla';

  end;

  qryPesquisarPatroc := TFDQuery.Create(nil);
  qryPesquisarPatroc.Connection := FrmDm.BDMySQL;
  dtsPesquisarPatroc := TDataSource.Create(nil);
  dtsPesquisarPatroc.DataSet := qryPesquisarPatroc;

  qryPesquisarPatroc.Close;
  qryPesquisarPatroc.sql.Clear;
  qryPesquisarPatroc.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    qryPesquisarPatroc.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  qryPesquisarPatroc.Open;

  grid.DataSource := dtsPesquisarPatroc;
end;

procedure Tf_gerais.pesquisaFornec(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar Fornecedores
  Esta procedure preenche o grid com os fornecedores
  que correspondem ao filtro da pesquisa por parte do
  nome que é passado como parâmetro.
  =======================================================
}
var
  qryPesquisarFornec: TFDQuery;
  dtsPesquisarFornec: TDataSource;
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select f.codfornec as codigo, f.nomefornec as fornecedor, ' +
      'c.nome as cidade, p.nome as pais, u.sigla as uf ' +
      'from  CA_CIDAD c, CA_PAIS p, CA_UF u, CA_FORNEC f ' +
      'where c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' +
      'and c.codcidade = f.codcidade ' +
      'order by f.nomefornec, c.nome, p.nome, u.sigla';
  end
  else
  begin
    sql := 'select f.codfornec as codigo, f.nomefornec as fornecedor, ' +
      'c.nome as cidade, p.nome as pais, u.sigla as uf ' +
      'from  CA_CIDAD c, CA_PAIS p, CA_UF u, CA_FORNEC f ' +
      'where c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' +
      'and c.codcidade = f.codcidade ' + 'and f.nomefornec like :PARTEDONOME ' +
      'order by f.nomefornec, c.nome, p.nome, u.sigla';

  end;
  qryPesquisarFornec := TFDQuery.Create(nil);
  qryPesquisarFornec.Connection := FrmDm.BDMySQL;
  dtsPesquisarFornec := TDataSource.Create(nil);
  dtsPesquisarFornec.DataSet := qryPesquisarFornec;

  qryPesquisarFornec.Close;
  qryPesquisarFornec.sql.Clear;
  qryPesquisarFornec.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    qryPesquisarFornec.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  qryPesquisarFornec.Open;

  grid.DataSource := dtsPesquisarFornec;
end;

procedure Tf_gerais.pesquisaCompeticao(grid: TDBGrid; partenome: String);
{
  =======================================================
  Pesquisar competição
  Esta procedure preenche o grid com as competições que
  correspondem ao filtro da pesquisa por parte do nome
  que é passado como parâmetro.
  =======================================================
}
var
  qryPesquisarCompeticao: TFDQuery;
  dtsPesquisarCompeticao: TDataSource;
begin
  if partenome = 'TODOS' then
  begin
    sql := 'select * from CA_COMPE order by nome';
  end
  else
  begin
    sql := 'select * from CA_COMPE ' + 'where nome like :PARTEDONOME ' +
      'order by nome';
  end;

  qryPesquisarCompeticao := TFDQuery.Create(nil);
  qryPesquisarCompeticao.Connection := FrmDm.BDMySQL;
  dtsPesquisarCompeticao := TDataSource.Create(nil);
  dtsPesquisarCompeticao.DataSet := qryPesquisarCompeticao;

  qryPesquisarCompeticao.Close;
  qryPesquisarCompeticao.sql.Clear;
  qryPesquisarCompeticao.sql.Add(sql);
  if partenome <> 'TODOS' then
  begin
    qryPesquisarCompeticao.Params.ParamByName('PARTEDONOME').AsString :=
      '%' + partenome + '%';
  end;
  qryPesquisarCompeticao.Open;

  grid.DataSource := dtsPesquisarCompeticao;
end;

{
  =======================================================
  Buscar nome ou descrição por um código
  =======================================================
}
function Tf_gerais.buscarNome(retorno, tabela, pk, codigo: String): String;
begin
  sql := 'select ' + retorno + ' from ' + tabela + ' where ' + pk + ' = :COD';

  QrNome.Close;
  QrNome.sql.Clear;
  QrNome.sql.Add(sql);
  QrNome.Params.ParamByName('COD').AsString := codigo;
  QrNome.Open;

  Result := QrNome.Fields[0].AsString;
end;

function Tf_gerais.verificaExistenciaNome(tabela, nome: String): boolean;
begin
  sql := 'select count(*) from ' + tabela + ' where nome = :TIME';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('TIME').AsString := nome;
  QrFunctions.Open;

  if QrFunctions.Fields[0].AsInteger = 0 then
    Result := false
  else
    Result := true;
end;

function Tf_gerais.retornaNomeTimePorCodigo(codigo: Integer): string;
{
  =======================================================
  Retorna Nome de um time cadastrado
  =======================================================
}
var
  qryNomeTime: TFDQuery;
begin
  sql := 'select nome from ca_adver where codadver = :COD';

  qryNomeTime := TFDQuery.Create(nil);
  qryNomeTime.Connection := FrmDm.BDMySQL;
  qryNomeTime.Close;
  qryNomeTime.sql.Clear;
  qryNomeTime.sql.Add(sql);
  qryNomeTime.Params.ParamByName('COD').AsInteger := codigo;
  qryNomeTime.Open;

  Result := qryNomeTime.Fields[0].AsString;

end;

function Tf_gerais.retornaNomeCompeticao(codigo: Integer): String;
{
  =======================================================
  Retorna Nome de uma Competição cadastrada
  =======================================================
}
begin
  sql := 'select nome from ca_compe where codcompeticao = :COD';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('COD').AsInteger := codigo;
  QrFunctions.Open;

  Result := QrFunctions.Fields[0].AsString;
end;

function Tf_gerais.validaNomeUsuario(texto: TDBEdit): boolean;
{
  =======================================================
  Retorna se o nome de usuário utiliza algum caractere
  especial (*,/-+ ) etc.
  =======================================================
}
var
  tamanho, i: Integer;
  encontrou: boolean;
  msg: String;
begin
  encontrou := false;
  tamanho := Length(texto.Text);
  for i := 1 to tamanho do
  begin
    if (copy(texto.Text, i, 1) = ' ') or (copy(texto.Text, i, 1) = '*') or
      (copy(texto.Text, i, 1) = '/') or (copy(texto.Text, i, 1) = '-') or
      (copy(texto.Text, i, 1) = '+') or (copy(texto.Text, i, 1) = '=') or
      (copy(texto.Text, i, 1) = '@') or (copy(texto.Text, i, 1) = '%') or
      (copy(texto.Text, i, 1) = '#') or (copy(texto.Text, i, 1) = '&') or
      (copy(texto.Text, i, 1) = '$') or (copy(texto.Text, i, 1) = ')') or
      (copy(texto.Text, i, 1) = '(') then
    begin
      encontrou := true;
    end;
  end;

  if encontrou then
  begin
    msg := 'O nome de usuário não pode conter caracteres ' + #13 +
      'especiais, tais como (@,#,$,%,+,-,/,espaço,(,), etc)';
    Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    Result := true
  end
  else
    Result := false;

end;

procedure Tf_gerais.buscaInformacoesJogo(competicao, arbitro, fase: TEdit;
  codcomp, codarb, codfase: TDBEdit);
{
  =======================================================
  Buscar nome da competicao, arbitro e fase
  Esta procedure preenche recupera os nomes da competição,
  do árbitro e da fase e preenche os edits passados como
  parâmetros através dos códigos informados.
  =======================================================
}
begin
  sql := 'select nome from ca_compe where codcompeticao = :CODIGO';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('CODIGO').AsString := codcomp.Text;
  QrFunctions.Open;

  competicao.Text := QrFunctions.Fields[0].AsString;

  sql := 'select nome from ca_arbit where codarbitro = :CODIGO';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('CODIGO').AsString := codarb.Text;
  QrFunctions.Open;

  arbitro.Text := QrFunctions.Fields[0].AsString;

  sql := 'select nome from ca_fase where codfase = :CODIGO';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('CODIGO').AsString := codfase.Text;
  QrFunctions.Open;

  fase.Text := QrFunctions.Fields[0].AsString;
end;

procedure Tf_gerais.limpaTelaJogadoresNosJogos(limite: Integer);
var
  i: Integer;
  {
    =======================================================
    Esta procedure limpa a tela da escalação dos jogadores
    quando excluímos um ou mais jogadores do time titular.
    =======================================================
  }
begin
  for i := 1 to limite do
  begin
    if limite = 12 then
    begin
      (h_jogadoresativos.FindComponent('LblCodigo' + IntToStr(i)) as TLabel)
        .Caption := '';
      (h_jogadoresativos.FindComponent('LblNome' + IntToStr(i)) as TLabel)
        .Caption := '';
      (h_jogadoresativos.FindComponent('LblSeq' + IntToStr(i)) as TLabel)
        .Caption := '0';
      (h_jogadoresativos.FindComponent('LblCodigo' + IntToStr(i)) as TLabel)
        .Visible := false;
      (h_jogadoresativos.FindComponent('LblNome' + IntToStr(i)) as TLabel)
        .Visible := false;
      (h_jogadoresativos.FindComponent('LblSeq' + IntToStr(i)) as TLabel)
        .Visible := false;
      if i < 12 then
      begin
        (h_jogadoresativos.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
          .ItemIndex := -1;
        (h_jogadoresativos.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
          .Visible := false;
      end;
      (h_jogadoresativos.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
        .Checked := false;
      (h_jogadoresativos.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
        .Checked := false;
      (h_jogadoresativos.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
        .Visible := false;
      (h_jogadoresativos.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
        .Visible := false;
    end // fim se limite = 12
    else
    begin
      if limite = 11 then
      begin
        (h_substituicoes.FindComponent('LblCodigo' + IntToStr(i)) as TLabel)
          .Caption := '';
        (h_substituicoes.FindComponent('LblNome' + IntToStr(i)) as TLabel)
          .Caption := '';
        (h_substituicoes.FindComponent('LblCodEntrou' + IntToStr(i)) as TLabel)
          .Caption := '';
        (h_substituicoes.FindComponent('LblEntrou' + IntToStr(i)) as TLabel)
          .Caption := '';
        (h_substituicoes.FindComponent('LblSeq' + IntToStr(i)) as TLabel)
          .Caption := '0';
        (h_substituicoes.FindComponent('LblCodigo' + IntToStr(i)) as TLabel)
          .Visible := false;
        (h_substituicoes.FindComponent('LblNome' + IntToStr(i)) as TLabel)
          .Visible := false;
        (h_substituicoes.FindComponent('LblCodEntrou' + IntToStr(i)) as TLabel)
          .Visible := false;
        (h_substituicoes.FindComponent('LblEntrou' + IntToStr(i)) as TLabel)
          .Visible := false;
        (h_substituicoes.FindComponent('LblSeq' + IntToStr(i)) as TLabel)
          .Visible := false;
        (h_substituicoes.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
          .ItemIndex := -1;
        (h_substituicoes.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
          .Checked := false;
        (h_substituicoes.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
          .Checked := false;
        (h_substituicoes.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
          .Visible := false;
        (h_substituicoes.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
          .Visible := false;
        (h_substituicoes.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
          .Visible := false;
      end;
    end; // fim se limite = 11
  end;
end;

procedure Tf_gerais.limpaTelaEditaEscalacao();
var
  i: Integer;
  {
    =======================================================
    Esta procedure limpa a tela das edições dos jogadores
    escalados para não deixar dados incorretos no ato da
    edição.
    =======================================================
  }
begin
  for i := 1 to 12 do
  begin
    // codigo do jogador
    (h_editaescalacao.FindComponent('LblCodigo' + IntToStr(i)) as TLabel)
      .Caption := EmptyStr;
    // nome do jogador
    (h_editaescalacao.FindComponent('LblNome' + IntToStr(i)) as TLabel).Caption
      := EmptyStr;
    // gols marcados
    if i < 12 then
      (h_editaescalacao.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
        .ItemIndex := -1;
    // cartão amarelo
    (h_editaescalacao.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
      .Checked := false;
    // cartão vermelho
    (h_editaescalacao.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
      .Checked := false;
  end;
end;

procedure Tf_gerais.preencherGridTitulares(titulares: TDBGrid;
  codigodojogo: String);
{
  =======================================================
  Preencher grid titulares
  Esta procedure preenche o grid dos jogadores titulares
  no cadastro de jogos levando em consideração o número
  do jogo que é passado como parâmetro.
  =======================================================
}
var
  qryTimeTitular: TFDQuery;
  dtsTimeTitular: TDataSource;
begin
  sql := 'select concat(j.nome," ( ",p.abreviatura," ) ") nome, e.gols, e.camarelo ca, e.cvermelho cv '
    + 'from CA_JOGAD j, ES_TITUL e, ca_posic P ' +
    'where j.codjogador = e.codjogador ' + 'and j.codposicao = p.codposicao ' +
    'and e.codjogo = :CODJOGO ' + 'order by e.coditem';

  qryTimeTitular := TFDQuery.Create(nil);
  qryTimeTitular.Connection := FrmDm.BDMySQL;
  dtsTimeTitular := TDataSource.Create(nil);
  dtsTimeTitular.DataSet := qryTimeTitular;

  qryTimeTitular.Close;
  qryTimeTitular.sql.Clear;
  qryTimeTitular.sql.Add(sql);
  qryTimeTitular.Params.ParamByName('CODJOGO').AsString := codigodojogo;
  qryTimeTitular.Open;

  titulares.DataSource := dtsTimeTitular;
end;

procedure Tf_gerais.preencherGridReservas(reservas: TDBGrid;
  codigodojogo: String);
{
  =======================================================
  Preencher grid reservas
  Esta procedure preenche o grid dos jogadores reservas
  no cadastro de jogos levando em consideração o número
  do jogo que é passado como parâmetro.
  =======================================================
}
var
  qryTimeReserva: TFDQuery;
  dtsTimeReserva: TDataSource;
begin
  sql := 'select concat(js.nome," ( ",ps.abreviatura," ) ") saiu, concat(je.nome," ( ",pe.abreviatura," ) ") entrou, '
    + 'r.gols, r.camarelo ca, r.cvermelho cv ' +
    'from es_reser r, ca_jogad je, ca_jogad js, ca_posic pe, ca_posic ps ' +
    'where r.codjogador = je.codjogador ' +
    'and r.codjogadorsaiu = js.codjogador ' +
    'and je.codposicao = pe.codposicao ' + 'and js.codposicao = ps.codposicao '
    + 'and codjogo = :CODJOGO ' + 'order by r.coditem';

  qryTimeReserva := TFDQuery.Create(nil);
  qryTimeReserva.Connection := FrmDm.BDMySQL;
  dtsTimeReserva := TDataSource.Create(nil);
  dtsTimeReserva.DataSet := qryTimeReserva;

  qryTimeReserva.Close;
  qryTimeReserva.sql.Clear;
  qryTimeReserva.sql.Add(sql);
  qryTimeReserva.Params.ParamByName('CODJOGO').AsString := codigodojogo;
  qryTimeReserva.Open;

  reservas.DataSource := dtsTimeReserva;
end;

procedure Tf_gerais.preencherTelaEdtiaEscalacao(TitOuRes, codigodojogo: String);
var
  i: Integer;
  {
    =======================================================
    Preencher tela de titulares e reservas para edição
    Quando escalamos um time e clicamos em Editar, abrirá
    uma nova tela para que a edição possa ser realizada
    (editar cartões e gols marcados). Esta procedure
    preenhce os dados com o time titular e as eventuais
    escalações para edição através do código do jogo.
    =======================================================
  }
begin
  h_editaescalacao.titoureser := TitOuRes;
  if TitOuRes = 'T' then
  begin
    sql := 'select j.codjogador, concat(j.nome," ( ",p.abreviatura," ) ") nome, e.gols, e.camarelo ca, e.cvermelho cv '
      + 'from CA_JOGAD j, ES_TITUL e, ca_posic p ' +
      'where j.codjogador = e.codjogador ' + 'and j.codposicao = p.codposicao '
      + 'and e.codjogo = :CODJOGO ' + 'order by e.coditem';

    h_editaescalacao.GroupBox1.Caption := 'ESCALAÇÃO DOS TITULARES';
    h_editaescalacao.Caption := 'Editar Dados dos Jogadores Titulares';
  end
  else
  begin
    sql := 'select j.codjogador, concat(j.nome," ( ",p.abreviatura," ) ") nome, e.gols, e.camarelo ca, e.cvermelho cv '
      + 'from CA_JOGAD j, ES_RESER e, ca_posic p ' +
      'where j.codjogador = e.codjogador ' + 'and j.codposicao = p.codposicao '
      + 'and e.codjogo = :CODJOGO ' + 'order by e.coditem';

    h_editaescalacao.GroupBox1.Caption := 'ESCALAÇÃO DOS RESERVAS';
    h_editaescalacao.Caption := 'Editar Dados dos Jogadores Reservas';
  end;

  QrEditaEscalacao.Close;
  QrEditaEscalacao.sql.Clear;
  QrEditaEscalacao.sql.Add(sql);
  QrEditaEscalacao.Params.ParamByName('CODJOGO').AsString := codigodojogo;
  QrEditaEscalacao.Open;
  QrEditaEscalacao.First;

  for i := 1 to 12 do
  begin
    if QrEditaEscalacao.Eof then
    begin
      // nome do jogador
      (h_editaescalacao.FindComponent('LblNome' + IntToStr(i)) as TLabel)
        .Visible := false;
      if i < 12 then
        // gols marcados
        (h_editaescalacao.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
          .Visible := false;
      // cartão amarelo
      (h_editaescalacao.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
        .Visible := false;
      // cartão vermelho
      (h_editaescalacao.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
        .Visible := false;
    end
    else
    begin
      // definição de visualização
      // nome do jogador
      (h_editaescalacao.FindComponent('LblNome' + IntToStr(i)) as TLabel)
        .Visible := true;
      if i < 12 then
        // gols marcados
        (h_editaescalacao.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
          .Visible := true;
      // cartão amarelo
      (h_editaescalacao.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
        .Visible := true;
      // cartão vermelho
      (h_editaescalacao.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
        .Visible := true;

      // exibição
      // codigo do jogador
      (h_editaescalacao.FindComponent('LblCodigo' + IntToStr(i)) as TLabel)
        .Caption := QrEditaEscalacao.Fields[0].AsString;

      // nome do jogador
      (h_editaescalacao.FindComponent('LblNome' + IntToStr(i)) as TLabel)
        .Caption := QrEditaEscalacao.Fields[1].AsString;

      if i < 12 then
      begin
        // gols marcados
        if QrEditaEscalacao.Fields[2].AsInteger = 0 then
          (h_editaescalacao.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
            .ItemIndex := -1
        else
          (h_editaescalacao.FindComponent('CbxGols' + IntToStr(i)) as TComboBox)
            .ItemIndex := QrEditaEscalacao.Fields[2].AsInteger;
      end;
      // cartão amarelo
      if QrEditaEscalacao.Fields[3].AsInteger = 0 then
        (h_editaescalacao.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
          .Checked := false
      else
        (h_editaescalacao.FindComponent('CbCa' + IntToStr(i)) as TCheckBox)
          .Checked := true;

      // cartão vermelho
      if QrEditaEscalacao.Fields[4].AsInteger = 0 then
        (h_editaescalacao.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
          .Checked := false
      else
        (h_editaescalacao.FindComponent('CbCv' + IntToStr(i)) as TCheckBox)
          .Checked := true;
    end;
    QrEditaEscalacao.Next;
  end;
  h_editaescalacao.ShowModal;
end;

procedure Tf_gerais.deletarTitularesOuReservas(tabela, codigodojogo: String);
{
  =======================================================
  Deleta todos os registros de jogadores e técnico
  cadastrado através do código do jogo, ou seja, os
  jogadores serão excluídos apenas do jogo em questão,
  seus registros da tablea CA_JOGAD permanecerão
  intactos.
  =======================================================
}
begin
  sql := 'delete from ' + tabela + ' where codjogo = :CODJOGO';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('CODJOGO').AsString := codigodojogo;
  QrFunctions.ExecSQL;

end;

procedure Tf_gerais.deletarReservas(codigodojogo, codigodojogador: String);
{
  =======================================================
  Deletar um registro das estatístcias de um jogador
  reserva
  =======================================================
}
begin
  sql := 'delete from es_reser where codjogo = :CODIGOJOGO and codjogador = :CODIGOJOGADOR';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('CODIGOJOGO').AsString := codigodojogo;
  QrFunctions.Params.ParamByName('CODIGOJOGADOR').AsString := codigodojogador;
  QrFunctions.ExecSQL;

end;

procedure Tf_gerais.jogadoresASubstituir(grid: TDBGrid; codigodojogo: String);
{
  =======================================================
  Lista em um grid todos os jogadores aptos a serem
  substituídos (somente jogadores que estejam escalados
  no time titular e que não sejam técnicos ou auxiliares
  técnicos.
  =======================================================
}
begin
  sql := 'select a.codjogador, a.nome, a.abreviatura, a.coditem from ( ' +
    'select j.codjogador, j.nome, p.abreviatura, e.coditem ' +
    'from es_titul e, ca_jogad j, ca_posic p ' +
    'where e.codjogador = j.codjogador ' + 'and j.codposicao = p.codposicao ' +
    'and e.codjogo = :CODJOGO ' + 'and j.codposicao not in (6, 9) ' + 'union ' +
    'select j.codjogador, j.nome, p.abreviatura, (e.coditem*20) ' +
    'from es_reser e, ca_jogad j, ca_posic p ' +
    'where e.codjogador = j.codjogador ' + 'and j.codposicao = p.codposicao ' +
    'and e.codjogo = :CODJOGO ' + 'and j.codposicao not in (6, 9) ' + ') as a '
    + 'order by a.coditem';

  QrSubst.Close;
  QrSubst.sql.Clear;
  QrSubst.sql.Add(sql);
  QrSubst.Params.ParamByName('CODJOGO').AsString := codigodojogo;
  QrSubst.Open;

  grid.DataSource := DtsQrSubst;

end;

procedure Tf_gerais.jogadoresDisponiveis(grid: TDBGrid;
  codigodojogo, nomeform, nomejogador: String);
{
  =======================================================
  Lista em um grid todos os jogadores aptos a substituir
  qualquer jogador titular (somente jogadores que não
  estejam escalados no time titular, que não sejam
  técnicos ou auxiliares técnicos e que tenham código de
  situação igual a 0, ou seja, não foram vendidos ou não
  estão aposentados).
  =======================================================
}
begin
  if nomeform = 'h_substituicoes' then
  begin
    sql := 'select j.codjogador, j.nome, p.abreviatura ' +
      'from ca_jogad j, ca_posic p ' + 'where j.codposicao = p.codposicao ' +
      'and j.codposicao not in (6, 9) ' + 'and j.situacao = 0 ' +
      'and j.codjogador not in ( ' + 'select a.codjogador from ( ' +
      'select j.codjogador ' + 'from es_titul e, ca_jogad j ' +
      'where e.codjogador = j.codjogador ' + 'and e.codjogo = :CODJOGO ' +
      'and j.codposicao not in (6, 9) ' + 'union ' + 'select j.codjogador ' +
      'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
      'and e.codjogo = :CODJOGO ' + 'and j.codposicao not in (6, 9) ' +
      ') as a ' + ') ' + ' and j.nome like :NOMEJOGADOR ' + 'order by nome';
  end
  else
  begin
    sql := 'select j.codjogador, j.nome, p.abreviatura ' +
      'from ca_jogad j, ca_posic p ' + 'where j.codposicao = p.codposicao ' +
      'and j.codposicao not in (6, 9) ' + 'and j.situacao = 0 ' +
      'and j.codjogador not in ( ' + 'select a.codjogador from ( ' +
      'select j.codjogador ' + 'from es_titul e, ca_jogad j ' +
      'where e.codjogador = j.codjogador ' + 'and e.codjogo = :CODJOGO ' +
      'and j.codposicao not in (6, 9) ' + 'union ' + 'select j.codjogador ' +
      'from es_reser e, ca_jogad j ' + 'where e.codjogador = j.codjogador ' +
      'and e.codjogo = :CODJOGO ' + 'and j.codposicao not in (6, 9) ' +
      ') as a ' + ') ' + 'order by nome';
  end;

  QrDisponivel.Close;
  QrDisponivel.sql.Clear;
  QrDisponivel.sql.Add(sql);
  if nomeform = 'h_substituicoes' then
    QrDisponivel.Params.ParamByName('NOMEJOGADOR').AsString :=
      '%' + nomejogador + '%';
  QrDisponivel.Params.ParamByName('CODJOGO').AsString := codigodojogo;
  QrDisponivel.Open;

  grid.DataSource := DtsQrDisponivel;

end;

procedure Tf_gerais.deletarRegistroComParametro(tabela, campo, chave: String);
{
  =======================================================
  Deletar um registro genérico, sendo:
  Tabela: tabela onde está o registro que se deseja excluir
  Campo: Chave primária que identifica o registro
  Chave: código do registro que se deseja excluir
  =======================================================
}
begin
  sql := 'delete from ' + tabela + ' where ' + campo + ' = ' + chave;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.ExecSQL;

end;

procedure Tf_gerais.pesquisaJogos(grid: TDBGrid; dtini, dtfim: String);
{
  =======================================================
  Pesquisar jogos
  Esta procedure preenche o grid com os jogos que
  correspondem ao filtro da pesquisa por intervalo de
  datas que é passado como parâmetro.
  =======================================================
}
begin
  if (dtini = EmptyStr) and (dtfim = EmptyStr) then
  begin
    sql := 'select j.codjogo, j.data, am.nome timec, j.placar1, j.placar2, ' +
      'av.nome timev, e.nome estadio, c.nome competicao ' +
      'from ca_jogos j, ca_adver am, ca_adver av, ca_estad e, ca_compe c ' +
      'where j.codadvermand = am.codadver ' +
      'and j.codadvervisit = av.codadver ' + 'and j.codestadio = e.codestadio '
      + 'and j.codcompeticao = c.codcompeticao ' + 'order by j.data';
  end
  else
  begin
    sql := 'select j.codjogo, j.data, am.nome timec, j.placar1, j.placar2, ' +
      'av.nome timev, e.nome estadio, c.nome competicao ' +
      'from ca_jogos j, ca_adver am, ca_adver av, ca_estad e, ca_compe c ' +
      'where j.codadvermand = am.codadver ' +
      'and j.codadvervisit = av.codadver ' +
      'and j.data between :DATAI and :DATAF ' +
      'and j.codestadio = e.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'order by j.data';
  end;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  if not(dtini = EmptyStr) then
  begin
    QrFunctions.Params.ParamByName('DATAI').AsDate := StrToDate(dtini);
    QrFunctions.Params.ParamByName('DATAF').AsDate := StrToDate(dtfim);
  end;
  QrFunctions.Open;

  grid.DataSource := DtsQrFunctions;
end;

procedure Tf_gerais.pesquisaJogosPorNumero(grid: TDBGrid; numero: String);
{
  =======================================================
  Pesquisar jogos
  Esta procedure preenche o grid com os jogos que
  correspondem ao filtro da pesquisa pelo seu número de
  identificação que é passado como parâmetro.
  =======================================================
}
begin
  sql := 'select j.codjogo, j.data, am.nome timec, j.placar1, j.placar2, ' +
    'av.nome timev, e.nome estadio, c.nome competicao ' +
    'from ca_jogos j, ca_adver am, ca_adver av, ca_estad e, ca_compe c ' +
    'where j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
    + 'and j.codjogo = :CODIGO ' + 'and j.codestadio = e.codestadio ' +
    'and j.codcompeticao = c.codcompeticao ' + 'order by j.data';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Params.ParamByName('CODIGO').AsInteger := StrToInt(numero);
  QrFunctions.Open;

  grid.DataSource := DtsQrFunctions;
end;

{
  =======================================================
  Determinar Vitória, Empate ou Derrota
  =======================================================
}

function Tf_gerais.determinarVED(): String;
var
  VED: String;
begin
  if (CA_JOGOS.EdtCodMandante.Text = '0') and
    (StrToInt(CA_JOGOS.EdtPlacarMandante.Text) >
    StrToInt(CA_JOGOS.EdtPlacarVisitante.Text)) then
  begin
    VED := 'V';
  end
  else
  begin
    if (CA_JOGOS.EdtCodMandante.Text = '0') and
      (StrToInt(CA_JOGOS.EdtPlacarMandante.Text)
      = StrToInt(CA_JOGOS.EdtPlacarVisitante.Text)) then
    begin
      VED := 'E';
    end
    else
    begin
      if (CA_JOGOS.EdtCodMandante.Text = '0') and
        (StrToInt(CA_JOGOS.EdtPlacarMandante.Text) <
        StrToInt(CA_JOGOS.EdtPlacarVisitante.Text)) then
      begin
        VED := 'D';
      end;
    end;
  end;

  // se o seu time for visitante
  if (CA_JOGOS.EdtCodVisitante.Text = '0') and
    (StrToInt(CA_JOGOS.EdtPlacarMandante.Text) >
    StrToInt(CA_JOGOS.EdtPlacarVisitante.Text)) then
  begin
    VED := 'D';
  end
  else
  begin
    if (CA_JOGOS.EdtCodVisitante.Text = '0') and
      (StrToInt(CA_JOGOS.EdtPlacarMandante.Text)
      = StrToInt(CA_JOGOS.EdtPlacarVisitante.Text)) then
    begin
      VED := 'E';
    end
    else
    begin
      if (CA_JOGOS.EdtCodVisitante.Text = '0') and
        (StrToInt(CA_JOGOS.EdtPlacarMandante.Text) <
        StrToInt(CA_JOGOS.EdtPlacarVisitante.Text)) then
      begin
        VED := 'V';
      end;
    end;
  end;
  Result := VED;
end;

procedure Tf_gerais.liberaJogadores(ano: String);
var
  Item: TListItem;
  {
    =======================================================
    Liberar jogadores
    =======================================================
  }
begin
  if ano = 'TODOS' then
  begin
    sql := 'select j.codjogador, concat(j.nome, " ( ", p.abreviatura, " )") nome '
      + 'from ca_jogad j, ca_posic p ' + 'where j.codposicao = p.codposicao ' +
      'and j.codjogador not in ( ' + 'select jt.codjogador codigo ' +
      'from ca_jogad jt, es_titul t ' + 'where jt.codjogador = t.codjogador ' +
      ') ' + 'and j.codjogador  not in ( ' + 'select jr.codjogador codigo ' +
      'from ca_jogad jr, es_reser r ' + 'where jr.codjogador = r.codjogador ' +
      ') ' + 'order by nome';
  end
  else
  begin
    sql := 'select j.codjogador, concat(j.nome, " ( ", p.abreviatura, " )") nome '
      + 'from ca_jogad j, ca_posic p ' + 'where j.codposicao = p.codposicao ' +
      'and (j.codjogador in ( ' + 'select jt.codjogador codigo ' +
      'from ca_jogad jt, es_titul t ' + 'where jt.codjogador = t.codjogador ' +
      'and jt.situacao = 1 ' + 'and t.ano = :ANOATUA ' + ') ' +
      'or j.codjogador  in ( ' + 'select jr.codjogador codigo ' +
      'from ca_jogad jr, es_reser r ' + 'where jr.codjogador = r.codjogador ' +
      'and jr.situacao = 1 ' + 'and r.ano = :ANOATUA ' + ')) ' +
      'order by nome';
  end;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  if ano <> 'TODOS' then
    QrFunctions.Params.ParamByName('ANOATUA').AsString := ano;
  QrFunctions.Open;

  h_liberarjogador.lsvJogadores.Items.Clear;
  try
    frmProgresso := TfrmProgresso.Create(Self);
    try
      frmProgresso.gauProgresso.MaxValue := QrFunctions.RecordCount;
      frmProgresso.gauProgresso.MinValue := 0;
      frmProgresso.gauProgresso.Progress := 0;
      frmProgresso.Show;
      frmProgresso.lblMensagem.Caption := 'Processando informações...';
      frmProgresso.lblMensagem.Update;

      // Carrega listview
      h_liberarjogador.lsvJogadores.Items.BeginUpdate;
      QrFunctions.First;
      while not QrFunctions.Eof do
      begin
        Application.ProcessMessages;
        frmProgresso.gauProgresso.Progress := i;

        Item := h_liberarjogador.lsvJogadores.Items.Add;
        Item.Caption := QrFunctions.Fields[0].AsString;
        Item.SubItems.Add(QrFunctions.Fields[1].AsString);
        QrFunctions.Next;
      end;
    finally
      if Assigned(frmProgresso) then
        frmProgresso.Free;
    end;
  finally
    h_liberarjogador.lsvJogadores.Items.EndUpdate;
  end;
  FrmDm.DtsJogadores.DataSet.Refresh;
end;

procedure Tf_gerais.atualizaSituacao(situacao: Integer);
var
  i: Integer;
begin
  for i := 0 to h_liberarjogador.lsvJogadores.Items.Count - 1 do
  begin
    if (h_liberarjogador.lsvJogadores.Items[i].Checked) then
    begin
      sql := 'update ca_jogad set situacao = :SIT where codjogador = :CODIGO';
      FrmDm.QrGeral.Close;
      FrmDm.QrGeral.sql.Clear;
      FrmDm.QrGeral.sql.Add(sql);
      FrmDm.QrGeral.Params.ParamByName('SIT').AsInteger := situacao;
      FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString :=
        h_liberarjogador.lsvJogadores.Items[i].Caption;

      FrmDm.QrGeral.ExecSQL;
    end;
  end;
  f_gerais.jogadoresASubstituir(h_substituicoes.DbGridAsubstituir,
    CA_JOGOS.EdtCodigo.Text);
  Application.MessageBox('Jogador(es) liberado(s) com sucesso!', 'ATENÇÃO',
    MB_OK + MB_ICONINFORMATION);
end;

procedure Tf_gerais.atualizaSituacaoGeral(situacao: Integer);
begin

  sql := 'update ca_jogad set situacao = :SIT';
  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('SIT').AsInteger := situacao;
  FrmDm.QrGeral.ExecSQL;

  if situacao = 0 then
    Application.MessageBox('Jogador(es) liberado(s) com sucesso!', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION)
  else
    Application.MessageBox('Jogador(es) bloqueado(s) com sucesso!', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION);
end;

procedure Tf_gerais.preenchimentoTelaPadraoJogos(sqlcode: String;
  corte: Integer; limite: Integer);
var
  i: Integer;
  {
    =======================================================
    Preencher jogos da tela padrão
    A sentença SQL é passada como padrão para atender aos
    diversos tipos de relatórios que usam essa tela.
    corte: é o limite para definir a mostragem de 10 jgoos
    em 10 jogos na tela padrão e permitir ir e vir entre
    as telas.
    =======================================================
  }
begin
  // EXPORTAR PARA EXCEL
  r_jogospadrao.QrExcel.Close;
  r_jogospadrao.QrExcel.sql.Clear;
  r_jogospadrao.QrExcel.sql.Add(sqlcode);
  r_jogospadrao.QrExcel.Params.ParamByName('CORTE').AsInteger := corte;
  r_jogospadrao.QrExcel.Params.ParamByName('LIMITE').AsInteger := 999999;

  QrEstat.Close;
  QrEstat.sql.Clear;
  QrEstat.sql.Add(sqlcode);
  QrEstat.Params.ParamByName('CORTE').AsInteger := corte;
  QrEstat.Params.ParamByName('LIMITE').AsInteger := limite;

  { JOGOS QUE DEPENDEM DE DATA PARA SEREM MOSTRADOS }
  if (r_jogospadrao.numerorelatorio = '10') or
    (r_jogospadrao.numerorelatorio = '23') or
    (r_jogospadrao.numerorelatorio = '27') or
    (r_jogospadrao.numerorelatorio = '28') or
    (r_jogospadrao.numerorelatorio = '36') or
    (r_jogospadrao.numerorelatorio = '37') or
    (r_jogospadrao.numerorelatorio = '38') then
  begin
    QrEstat.Params.ParamByName('DATAINI').AsDate :=
      StrToDate(r_jogospadrao.codauxiliar2);
    QrEstat.Params.ParamByName('DATAFIM').AsDate :=
      StrToDate(r_jogospadrao.codauxiliar3);
    r_jogospadrao.QrExcel.Params.ParamByName('DATAINI').AsDate :=
      StrToDate(r_jogospadrao.codauxiliar2);
    r_jogospadrao.QrExcel.Params.ParamByName('DATAFIM').AsDate :=
      StrToDate(r_jogospadrao.codauxiliar3);
  end;
  QrEstat.Open;
  QrEstat.First;
  r_jogospadrao.QrExcel.Open;

  for i := 1 to 10 do
  begin
    if not QrEstat.Eof then
    begin
      (r_jogospadrao.FindComponent('BtnSumula' + IntToStr(i)) as TBitBtn).Show;

      if i = 10 then
        (r_jogospadrao.FindComponent('BtnSumula' + IntToStr(i)) as TBitBtn).Hint
          := 'Visualizar súmula - Digite 0 no teclado numérico'
      else
        (r_jogospadrao.FindComponent('BtnSumula' + IntToStr(i)) as TBitBtn).Hint
          := 'Visualizar súmula - Digite ' + IntToStr(i) +
          ' no teclado numérico';

      (r_jogospadrao.FindComponent('LblData' + IntToStr(i)) as TLabel).Show;
      (r_jogospadrao.FindComponent('LblCodJogo' + IntToStr(i)) as TLabel)
        .Caption := QrEstat.Fields[0].AsString;
      (r_jogospadrao.FindComponent('LblData' + IntToStr(i)) as TLabel).Caption
        := QrEstat.Fields[1].AsString;
      (r_jogospadrao.FindComponent('LblMandante' + IntToStr(i)) as TLabel)
        .Caption := f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        QrEstat.Fields[2].AsString);
      (r_jogospadrao.FindComponent('LblPlacarMand' + IntToStr(i)) as TLabel)
        .Caption := QrEstat.Fields[3].AsString;
      (r_jogospadrao.FindComponent('LblPlacarVisit' + IntToStr(i)) as TLabel)
        .Caption := QrEstat.Fields[4].AsString;
      (r_jogospadrao.FindComponent('LblVisitante' + IntToStr(i)) as TLabel)
        .Caption := f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        QrEstat.Fields[5].AsString);
      (r_jogospadrao.FindComponent('LblX' + IntToStr(i)) as TLabel)
        .Caption := 'X';

      if (r_jogospadrao.numerorelatorio = '5') or
        (r_jogospadrao.numerorelatorio = '30') or
        (r_jogospadrao.numerorelatorio = '39') or
        (r_jogospadrao.numerorelatorio = '40') then
      begin
        (r_jogospadrao.FindComponent('LblEstadio' + IntToStr(i)) as TLabel)
          .Caption := f_gerais.buscarNome('nome', 'ca_estad', 'codestadio',
          QrEstat.Fields[6].AsString) + ' ( ' + FormatFloat('###,###',
          QrEstat.Fields[8].AsFloat) + ' )';
      end;

      if r_jogospadrao.numerorelatorio = '25' then
      begin
        (r_jogospadrao.FindComponent('LblEstadio' + IntToStr(i)) as TLabel)
          .Caption := f_gerais.buscarNome('nome', 'ca_estad', 'codestadio',
          QrEstat.Fields[6].AsString) + ' ( Gols: ' + QrEstat.Fields[8]
          .AsString + ' )';
      end;

      if (r_jogospadrao.numerorelatorio = '26') or
        (r_jogospadrao.numerorelatorio = '35') then
      begin
        (r_jogospadrao.FindComponent('LblEstadio' + IntToStr(i)) as TLabel)
          .Caption := f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
          QrEstat.Fields[9].AsString) + ' ( ' + QrEstat.Fields[8].AsString +
          ' gols )';
      end;

      if (r_jogospadrao.numerorelatorio <> '5') and
        (r_jogospadrao.numerorelatorio <> '25') and
        (r_jogospadrao.numerorelatorio <> '26') and
        (r_jogospadrao.numerorelatorio <> '30') and
        (r_jogospadrao.numerorelatorio <> '35') and
        (r_jogospadrao.numerorelatorio <> '39') and
        (r_jogospadrao.numerorelatorio <> '40') then
      begin
        (r_jogospadrao.FindComponent('LblEstadio' + IntToStr(i)) as TLabel)
          .Caption := f_gerais.buscarNome('nome', 'ca_estad', 'codestadio',
          QrEstat.Fields[6].AsString);
      end;

      // competição
      (r_jogospadrao.FindComponent('LblCompeticao' + IntToStr(i)) as TLabel)
        .Caption := f_gerais.buscarNome('nome', 'ca_compe', 'codcompeticao',
        QrEstat.Fields[7].AsString);
      // escudo mandante
      f_gerais.buscaImagemPorCodigo
        ((r_jogospadrao.FindComponent('ImgEscudoMand' + IntToStr(i)) as TImage),
        QrEstat.Fields[2].AsString,
        ExtrairAnoDataDoJogo((r_jogospadrao.FindComponent('LblCodJogo' +
        IntToStr(i)) as TLabel).Caption));
      // escudo visitante
      f_gerais.buscaImagemPorCodigo
        ((r_jogospadrao.FindComponent('ImgEscudoVisit' + IntToStr(i))
        as TImage), QrEstat.Fields[5].AsString,
        ExtrairAnoDataDoJogo((r_jogospadrao.FindComponent('LblCodJogo' +
        IntToStr(i)) as TLabel).Caption));
    end
    else
    begin
      (r_jogospadrao.FindComponent('BtnSumula' + IntToStr(i)) as TBitBtn).Hide;
      (r_jogospadrao.FindComponent('LblCodJogo' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;
      (r_jogospadrao.FindComponent('LblData' + IntToStr(i)) as TLabel).Caption
        := EmptyStr;
      (r_jogospadrao.FindComponent('LblData' + IntToStr(i)) as TLabel).Hide;
      (r_jogospadrao.FindComponent('LblMandante' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;
      (r_jogospadrao.FindComponent('LblPlacarMand' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;
      (r_jogospadrao.FindComponent('LblPlacarVisit' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;
      (r_jogospadrao.FindComponent('LblVisitante' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;
      (r_jogospadrao.FindComponent('LblX' + IntToStr(i)) as TLabel).Caption
        := EmptyStr;

      (r_jogospadrao.FindComponent('LblEstadio' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;
      (r_jogospadrao.FindComponent('LblCompeticao' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;

      (r_jogospadrao.FindComponent('ImgEscudoMand' + IntToStr(i)) as TImage)
        .Picture.Graphic := nil;
      (r_jogospadrao.FindComponent('ImgEscudoVisit' + IntToStr(i)) as TImage)
        .Picture.Graphic := nil;
    end;

    QrEstat.Next;
  end;
end;

{
  =======================================================
  Preencher combo dos anos
  =======================================================
}

procedure Tf_gerais.preencherCbxAnos(anos: TComboBox);
begin
  anos.Clear;

  if anocompeticao = 'MnJogosCampeonato2' then
  // se a seleção dos dados vier dos campeonatos por ano
  // então irá mostrar somente os anos em que o clube disputou o
  // campeonato selecionado.
  begin
    sql := 'select distinct temporada from ca_jogos ' +
      'where codcompeticao = ' + codcompeticao + ' order by 1 desc';
  end
  else
  begin
    if anocompeticao = 'MnJogadores1' then
    // aqui irá selecionar apenas os anos em que o jogador atuou pelo clube.
    begin
      sql := 'select distinct ca_jogos.temporada' +
        ' from ca_jogos, es_titul' +
        ' where ca_jogos.codjogo = es_titul.codjogo' +
        ' and es_titul.codjogador = ' + codigosaux + ' union' +
        ' select distinct ca_jogos.temporada' +
        ' from ca_jogos, es_reser' +
        ' where ca_jogos.codjogo = es_reser.codjogo' +
        ' and es_reser.codjogador = ' + codigosaux + ' order by 1 desc';
    end
    else
    begin
      if anocompeticao = 'MnAdversario3' then
      // aqui vai selecionar apenas os anos que o seu time enfrentou o
      // adversário selecionado
      begin
        sql := 'select distinct ca_jogos.temporada' +
          ' from ca_jogos' + ' where (ca_jogos.codadvermand = ' + codigosaux +
          ' or ca_jogos.codadvervisit = ' + codigosaux + ')';
      end
      else
      begin

        // aqui seleciona todos os anos disponíveis, de 1900 até o ano atual.
        sql := 'select ano from es_anos ' +
          'where ano between (select min(ano) from es_resum) ' +
          ' and (select max(ano) from es_resum)' + 'order by ano desc';
      end;
    end;

  end;

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;
  QrFunctions.First;

  if anocompeticao = 'estatisticasporano' then
    anos.Items.Add('Geral');

  while not QrFunctions.Eof do
  begin
    anos.Items.Add(QrFunctions.Fields[0].AsString);
    QrFunctions.Next;
  end;
  anos.ItemIndex := 0;
end;

{
  =======================================================
  Preencher combo com os estados do brasil
  =======================================================
}

procedure Tf_gerais.preencherComboUf(ufs: TComboBox);
begin
  ufs.Clear;

  sql := 'select sigla, nome from ca_uf order by sigla';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;
  QrFunctions.First;

  while not QrFunctions.Eof do
  begin
    ufs.Items.Add(QrFunctions.Fields[0].AsString);
    QrFunctions.Next;
  end;
  ufs.ItemIndex := 0;
  ufs.SetFocus;
end;

{
  =======================================================
  Preencher combo com dos paises
  =======================================================
}

procedure Tf_gerais.preencherComboPais(paises: TComboBox);
begin
  paises.Clear;

  sql := 'select sigla, nome from ca_pais order by nome';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;
  QrFunctions.First;

  while not QrFunctions.Eof do
  begin
    paises.Items.Add(QrFunctions.Fields[0].AsString + ' - ' + QrFunctions.Fields
      [1].AsString);
    QrFunctions.Next;
  end;
  paises.ItemIndex := 0;
  paises.SetFocus;
end;

{
  =======================================================
  Preencher combo com dos estados
  =======================================================
}

procedure Tf_gerais.preencherComboUfSilgaNome(estados: TComboBox);
begin
  estados.Clear;

  sql := 'select sigla, nome from ca_uf order by nome';

  QrFunctions.Close;
  QrFunctions.sql.Clear;
  QrFunctions.sql.Add(sql);
  QrFunctions.Open;
  QrFunctions.First;

  while not QrFunctions.Eof do
  begin
    estados.Items.Add(QrFunctions.Fields[0].AsString + ' - ' +
      QrFunctions.Fields[1].AsString);
    QrFunctions.Next;
  end;
  estados.ItemIndex := 0;
  estados.SetFocus;
end;

function Tf_gerais.sqlJogosPadrao(nroRelatorio: String): String;
begin

  { NUMERAÇÃO DOS RELATÓRIOS / DESCRIÇÃO
    01 - Goleadas / Maiores Goleadas Aplicadas
    02 - Goleadas / Maiores Goleadas Sofridas
    03 - Goleadas / Maiores Goleadas Aplicadas em Adversário
    04 - Goleadas / Maiores Goleadas Sofridas por Adversário
    05 - Maiores Públicos
    06 - Jogos / Contra Rivais
    07 - Seleção de jogos disputados contra um adversário
    08 - Seleção de jogos disputados contra um adversário num determinado estádio
    09 - Seleção de jogos disputados contra um adversário num ano
    10 - Seleção de jogos disputados contra um adversário por período
    11 - Seleção de jogos disputados contra um adversário vs Jogador/Tecnico
    12 - Seleção de jogos disputados contra um adversário 10 últimos jogos
    13 - Jogos de jogadores por ano (opcional)
    14 - Jogos de jogadores vs Jogadores
    15 - Jogos por ano
    16 - Jogos por árbitro
    17 - Jogos por campeonato
    18 - Jogos por Campeonato por Ano
    19 - Jogos por Adversários em Campeonatos
    20 - Jogos por Estádio
    21 - Jogos por Estado (UF)
    22 - Jogos por País
    23 - Jogos por período
    24 - Jogos por placar
    25 - Jogos/Gols de um jogador por adversário
    26 - Maiores artilheiros por jogo
    27 - Jogos por período proveniente da consulta de estatísticas gerais
    28 - Pesquisa por periodo vinda da campanha geral
    29 - Jogos por camisa
    30 - Menores públicos
    31 - Ultimos 10 jogos
    32 - Maiores goleadas aplicadas em rivais
    33 - Maiores goleadas sofridas por rivais
    34 - Jogos/Gols de um jogador contra rivais
    35 - Quantidade de gols por jogo
    36 - Jogos por fornecedores de material esportivo
    37 - Jogos por mês (ano sempre será o ano corrente)
    38 - Jogos por patrocinador
    39 - Maiores públicos por ano
    40 - Menores públicos por ano
    41 - Jogos por adversários em finais
  }

  if nroRelatorio = '1' then
  // Relatório 1 - maiores goleadas aplicadas
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 saldo, placar1 golspro '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar1-placar2 >= 3 ' + 'union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 saldo, placar2 golspro '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar2-placar1 >= 3 ' +
      'order by saldo desc, golspro desc, data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '2' then
  // Relatório 2 - maiores goleadas sofridas
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as ADVER '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar2-placar1 >= 3 ' + 'union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as ADVER '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar1-placar2 >= 3 ' + 'order by saldo, adver desc, data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '3' then
  // Relatório 3 - Maiores Goleadas Aplicadas em Adversário
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 saldo, placar1 golspro '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar1-placar2 >= 3 ' + 'and codadvervisit = ' +
      r_jogospadrao.codauxiliar1 + ' union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 saldo, placar2 golspro '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar2-placar1 >= 3 ' + 'and codadvermand = ' +
      r_jogospadrao.codauxiliar1 +
      ' order by saldo desc, golspro desc, data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '4' then
  // Relatório 4 - Maiores Goleadas Sofridas por Adversário
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 saldo, placar1 golspro '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar2-placar1 >= 3 ' + 'and codadvervisit = ' +
      r_jogospadrao.codauxiliar1 + ' union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 saldo, placar2 golspro '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar1-placar2 >= 3 ' + 'and codadvermand = ' +
      r_jogospadrao.codauxiliar1 +
      ' order by saldo desc, golspro desc, data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '5' then
  // Relatório 5 - Maiores públicos
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos where publico > 0 order by publico desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '6' then
  // Relatório 6 - Jogos contra os rivais
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' +
      'where codadvermand in (select codadver from ca_adver where rival = 1) ' +
      'and temporada = ' + r_jogospadrao.codauxiliar1 + ' union '
      + 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' +
      'where codadvervisit in (select codadver from ca_adver where rival = 1) '
      + 'and temporada = ' + r_jogospadrao.codauxiliar1 +
      ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '7' then
  // Relatório 7 - Seleção de jogos disputados contra um adversário
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvermand = ' + r_jogospadrao.codauxiliar1
      + ' union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvervisit = ' + r_jogospadrao.codauxiliar1
      + ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '8' then
  // Relatório 8 - Seleção de jogos disputados contra um adversário num determinado estádio
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where (codadvermand = ' + r_jogospadrao.codauxiliar1
      + ' or codadvervisit = ' + r_jogospadrao.codauxiliar1 + ' ) ' +
      'and codestadio = ' + r_jogospadrao.codauxiliar2 + ' order by data desc '
      + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '9' then
  // Relatório 9 - Seleção de jogos disputados contra um adversário num ano
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvermand = ' + r_jogospadrao.codauxiliar1
      + ' and temporada = ' + r_jogospadrao.codauxiliar2 +
      ' union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvervisit = ' + r_jogospadrao.codauxiliar1
      + ' and temporada = ' + r_jogospadrao.codauxiliar2 +
      ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '10' then
  // Relatório 10 - Seleção de jogos disputados contra um adversário por período
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvermand = ' + r_jogospadrao.codauxiliar1
      + ' and data between :DATAINI and :DATAFIM ' + 'union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvervisit = ' + r_jogospadrao.codauxiliar1
      + ' and data between :DATAINI and :DATAFIM ' + 'order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '11' then
  begin
    // Relatório 11 - Seleção de jogos disputados por um jogador contra um adversário
    sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.publico from( '
      + 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
      'and j.codadvermand = ' + r_jogospadrao.codauxiliar1 +
      ' and e.codjogador = ' + r_jogospadrao.codauxiliar2 + ' union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
      'and j.codadvervisit = ' + r_jogospadrao.codauxiliar1 +
      ' and e.codjogador = ' + r_jogospadrao.codauxiliar2 + ' union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
      'and j.codadvermand = ' + r_jogospadrao.codauxiliar1 +
      ' and e.codjogador = ' + r_jogospadrao.codauxiliar2 + ' union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
      'and j.codadvervisit = ' + r_jogospadrao.codauxiliar1 +
      ' and e.codjogador = ' + r_jogospadrao.codauxiliar2 + ' ) as a ' +
      'order by a.data desc ' + ' limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '12' then
  // Relatório 12 - ùltimos 10 jogos disputados contra adversário
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
      'and r.codadver = ' + r_jogospadrao.codauxiliar1 +
      ' order by j.data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '13' then
  // Relatório 13 - Jogos de jogadores por ano (opcional)
  begin
    if r_jogospadrao.codauxiliar2 = EmptyStr then
    begin
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
        'and e.codjogador = ' + r_jogospadrao.codauxiliar1 + ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
        'and e.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';
    end
    else
    begin
      sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
        'and e.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and j.temporada = ' + r_jogospadrao.codauxiliar2 +
        ' union ' +
        'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
        + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
        'and e.codjogador = ' + r_jogospadrao.codauxiliar1 +
        ' and j.temporada = ' + r_jogospadrao.codauxiliar2 +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';
    end;
  end;

  if nroRelatorio = '14' then
  // Relatório 14 - Jogos de jogadores vs jogadores
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_titul j1, es_titul j2 ' +
      'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + r_jogospadrao.codauxiliar2 + ' union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_reser j1, es_reser j2 ' +
      'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + r_jogospadrao.codauxiliar2 + ' union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_titul j1, es_reser j2 ' +
      'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + r_jogospadrao.codauxiliar2 + ' union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, es_reser j1, es_titul j2 ' +
      'where j.codjogo = j1.codjogo ' + 'and j.codjogo = j2.codjogo ' +
      'and j1.codjogador = ' + r_jogospadrao.codauxiliar1 +
      ' and j2.codjogador = ' + r_jogospadrao.codauxiliar2 +
      ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '15' then
  // Relatório 15 - Jogos por ano
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j ' + 'where j.temporada = ' +
      r_jogospadrao.codauxiliar1 + ' order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '16' then
  // Relatório 16 - Jogos por arbitro
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j ' + 'where codarbitro = ' + r_jogospadrao.codauxiliar1
      + ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '17' then
  // Relatório 17 - Jogos por campeonato
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j ' + 'where codcompeticao = ' +
      r_jogospadrao.codauxiliar1 + ' order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '18' then
  // Relatório 18 - Jogos por campeonato por ano
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j ' + 'where codcompeticao = ' +
      r_jogospadrao.codauxiliar1 + ' and j.temporada = ' +
      r_jogospadrao.codauxiliar2 + ' order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '19' then
  // Relatório 19 - Jogos por adversário em campeonatos
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j ' + 'where codcompeticao = ' +
      r_jogospadrao.codauxiliar2 + ' and (j.codadvermand = ' +
      r_jogospadrao.codauxiliar1 + ' or j.codadvervisit = ' +
      r_jogospadrao.codauxiliar1 + ') ' + 'order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '20' then
  // Relatório 20 - Jogos por estádio
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codestadio = ' + r_jogospadrao.codauxiliar1 +
      ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '21' then
  // Relatório 21 - Jogos contra todos os clubes de um estado
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, ca_adver a, ca_cidad c, ca_pais p, ca_uf u ' +
      'where (j.codadvermand = a.codadver or j.codadvervisit = codadver) ' +
      'and a.codcidade = c.codcidade ' + 'and a.codadver <> 0 ' +
      'and c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' + 'and u.coduf = '
      + r_jogospadrao.codauxiliar1 + ' order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '22' then
  // Relatório 22 - Jogos contra todos os clubes de um país
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j, ca_adver a, ca_cidad c, ca_pais p, ca_uf u ' +
      'where (j.codadvermand = a.codadver or j.codadvervisit = codadver) ' +
      'and a.codcidade = c.codcidade ' + 'and c.codpais = p.codpais ' +
      'and c.coduf = u.coduf ' + 'and p.codpais = ' + r_jogospadrao.codauxiliar1
      + ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '23' then
  // Relatório 23 - Jogos por período
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where data between :DATAINI and :DATAFIM ' +
      'order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '24' then
  // Relatório 24 - Jogos por placar
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvermand = "0" ' + 'and placar1 = ' +
      r_jogospadrao.codauxiliar1 + ' and placar2 = ' +
      r_jogospadrao.codauxiliar2 + ' union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvervisit = "0" ' + 'and placar1 = ' +
      r_jogospadrao.codauxiliar2 + ' and placar2 = ' +
      r_jogospadrao.codauxiliar1 + ' order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '25' then
  // Relatório 25 - gols de um jogador por adversário
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
      + 'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      r_jogospadrao.codauxiliar2 + ' and r.codadver = ' +
      r_jogospadrao.codauxiliar1 + ' and e.gols > 0 ' + 'union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
      + 'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      r_jogospadrao.codauxiliar2 + ' and r.codadver = ' +
      r_jogospadrao.codauxiliar1 + ' and e.gols > 0 ' +
      'limit :LIMITE offset :CORTE';

  end;

  if nroRelatorio = '26' then
  // Relatório 26 - Maiores artilheiros por jogo
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, gols, codjogador '
      + 'from ( ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
      + 'from ca_jogos j, es_titul e ' + 'where j.codjogo = e.codjogo ' +
      'and e.gols >= 3 ' + 'union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
      + 'from ca_jogos j, es_reser e ' + 'where j.codjogo = e.codjogo ' +
      'and e.gols >= 3 ' + ') as a ' + 'order by gols desc, data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '27' then
  // Relatório 27 - Pesquisa por periodo vinda das estatisticas gerais
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvermand = ' + r_jogospadrao.codauxiliar1
      + ' and data between :DATAINI and :DATAFIM ' + 'union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvervisit = ' + r_jogospadrao.codauxiliar1
      + ' and data between :DATAINI and :DATAFIM ' + 'order by data desc ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '28' then
  // Relatório 28 - Pesquisa por periodo vinda da campanha geral
  begin
    if r_jogospadrao.codauxiliar1 = 'Geral' then
    begin
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where data between :DATAINI and :DATAFIM ' +
        'order by data desc ' + 'limit :LIMITE offset :CORTE';
    end
    else
    begin
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where temporada = ' +
        r_jogospadrao.codauxiliar1 + ' and data between :DATAINI and :DATAFIM '
        + 'order by data desc ' + 'limit :LIMITE offset :CORTE';
    end;
  end;

  if nroRelatorio = '29' then
  // Relatório 29 - Jogos por camisa
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, j.publico '
      + 'from ca_jogos j ' + 'where coduniforme = ' + r_jogospadrao.codauxiliar1
      + ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '30' then
  // Relatório 30 - Menores públicos
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos where publico > 0 order by publico ' +
      'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '31' then
  // Relatório 31 - Últimos 10 jogos disputados
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '32' then
  // Relatório 32 - maiores goleadas aplicadas em rivais
  begin
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
  end;

  if nroRelatorio = '33' then
  // Relatório 33 - maiores goleadas sofridas por rivais
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as ADVER '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar2-placar1 >= 3 ' +
      'and codadvervisit in (select codadver from ca_rival) ' + 'union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as ADVER '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar1-placar2 >= 3 ' +
      'and codadvermand in (select codadver from ca_rival) ' +
      'order by saldo, adver desc, data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '34' then
  // Relatório 34 - gols de um jogador contra rivais
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
      + 'from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      r_jogospadrao.codauxiliar2 + ' and r.codadver in ( ' +
      r_jogospadrao.codauxiliar1 + ' ) and e.gols > 0 ' + 'union ' +
      'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols '
      + 'from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + 'where e.codjogo = j.codjogo ' + 'and j.codjogo = r.codjogo ' +
      'and j.codadvermand = am.codadver ' + 'and j.codadvervisit = av.codadver '
      + 'and j.codestadio = es.codestadio ' +
      'and j.codcompeticao = c.codcompeticao ' + 'and e.codjogador = ' +
      r_jogospadrao.codauxiliar2 + ' and r.codadver in ( ' +
      r_jogospadrao.codauxiliar1 + ' ) and e.gols > 0 ' + 'order by data desc '
      + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '35' then
  // Relatório 35 - quantidade de gols por jogo em ordem decrescente
  begin
    sql := 'select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
      + ' from es_titul e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + ' where e.codjogo = j.codjogo ' + ' and j.codjogo = r.codjogo ' +
      ' and j.codadvermand = am.codadver ' +
      ' and j.codadvervisit = av.codadver ' +
      ' and j.codestadio = es.codestadio ' +
      ' and j.codcompeticao = c.codcompeticao ' + ' and e.codjogador = ' +
      r_jogospadrao.codauxiliar1 + ' and e.gols > 0 ' + ' union ' +
      ' select j.codjogo, j.data, j.codadvermand, j.placar1, j.placar2, j.codadvervisit, j.codestadio, j.codcompeticao, e.gols, e.codjogador '
      + ' from es_reser e, ca_jogos j, es_resum r, ca_adver am, ca_adver av, ca_estad es, ca_compe c '
      + ' where e.codjogo = j.codjogo ' + ' and j.codjogo = r.codjogo ' +
      ' and j.codadvermand = am.codadver ' +
      ' and j.codadvervisit = av.codadver ' +
      ' and j.codestadio = es.codestadio ' +
      ' and j.codcompeticao = c.codcompeticao ' + ' and e.codjogador = ' +
      r_jogospadrao.codauxiliar1 + ' and e.gols > 0 ' +
      ' order by gols desc, data desc ' + ' limit :LIMITE offset :CORTE';
  end;

  if (nroRelatorio = '36') or (nroRelatorio = '37') or (nroRelatorio = '38')
  then
  // Relatório 36 - Jogos por fornecedor de material esportivo
  // Relatório 37 - Jogos por mês (ano sempre o será o ano corrente)
  // Relatório 38 - Jogos por patrocinador
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where data between :DATAINI and :DATAFIM ' +
      'order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '39' then
  // Relatório 39 - Maiores públicos por ano
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, '
      + 'codcompeticao, publico from ca_jogos where publico > 0 ' +
      'and ca_jogos.temporada = ' + r_jogospadrao.codauxiliar1 +
      ' order by publico desc ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '40' then
  // Relatório 40 - Menores públicos por ano
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, '
      + 'codcompeticao, publico from ca_jogos where publico > 0 ' +
      'and ca_jogos.temporada = ' + r_jogospadrao.codauxiliar1 +
      ' order by publico ' + 'limit :LIMITE offset :CORTE';
  end;

  if nroRelatorio = '41' then
  // Relatório 41 - Jogos por adversários em finais
  begin
    sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvermand = ' + r_jogospadrao.codauxiliar1 + ' and codfase = 15 '
      + ' union ' +
      'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
      + 'from ca_jogos ' + 'where codadvervisit = ' + r_jogospadrao.codauxiliar1 + ' and codfase = 15 '
      + ' order by data desc ' + 'limit :LIMITE offset :CORTE';
  end;

  Result := sql;
end;

procedure Tf_gerais.preencherFichaIndividual(codjogador: Integer);
{
  =======================================================
  Preencher ficha individual
  =======================================================
}
begin
  h_fichaindividual.codigojogador := codjogador;
  sql := 'select sum(a.total) ' + 'from( ' + 'select count(*) total ' +
    'from es_titul ' + 'where codjogador = ' + IntToStr(codjogador) + ' union '
    + 'select count(*) total ' + 'from es_reser ' + 'where codjogador = ' +
    IntToStr(codjogador) + ') as a';

  QrTitulares.Close;
  QrTitulares.sql.Clear;
  QrTitulares.sql.Add(sql);
  QrTitulares.Open;

  if QrTitulares.Fields[0].AsInteger = 0 then
  begin
    msg := 'Esse jogador nunca disputou um jogo pelo ' +
      buscarNome('nome', 'ca_adver', 'codadver', '0');
    Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin

    // buscar foto do jogador
    f_gerais.buscaImagemJogador(h_fichaindividual.ImgFoto,
      buscarNome('foto', 'ca_jogad', 'codjogador', IntToStr(codjogador)));

    // buscar bandeiras do Pais e UF
    f_gerais.buscaBandeiras(h_fichaindividual.ImgBandPaisAdver,
      h_fichaindividual.ImgUfAdver, buscarNome('codcidade', 'ca_jogad',
      'codjogador', IntToStr(codjogador)), h_fichaindividual.LblCidade,
      h_fichaindividual.LblPais, h_fichaindividual.LblUf);

    // dados do jogador (nome, nomecompleto, dtnasc
    h_fichaindividual.LblNome.Caption :=
      AnsiUpperCase(buscarNome('nome', 'ca_jogad', 'codjogador',
      IntToStr(codjogador)));
    h_fichaindividual.LblNomeCompleto.Caption :=
      buscarNome('nomecompleto', 'ca_jogad', 'codjogador',
      IntToStr(codjogador));
    h_fichaindividual.LblDtNasc.Caption := 'Nascimento: ' +
      buscarNome('dtnasc', 'ca_jogad', 'codjogador', IntToStr(codjogador));

    // posição
    h_fichaindividual.LblPosicao.Caption :=
      AnsiUpperCase(buscarNome('descricao', 'ca_posic', 'codposicao',
      buscarNome('codposicao', 'ca_jogad', 'codjogador',
      IntToStr(codjogador))));

    sql := 'select ano, sum(v+e+d) j, sum(v) v, sum(e) e, sum(d) d, sum(g) g, round(sum(g)/sum(v+e+d),2) mgp, sum(ca) ca, sum(cv) cv, concat(round(((sum(v)*3 + sum(e))/(sum(v+e+d) * 3))*100,1),"%") apr '
      + 'from ( ' +
      'select ano, sum(v) v, sum(e) e, sum(d) d, sum(gols) g, sum(camarelo) ca, sum(cvermelho) cv '
      + 'from es_titul ' + 'where codjogador = ' + IntToStr(codjogador) +
      ' group by ano ' + 'union all ' +
      'select ano, sum(v) v, sum(e) e, sum(d) d, sum(gols) g, sum(camarelo) ca, sum(cvermelho) cv '
      + 'from es_reser ' + 'where codjogador = ' + IntToStr(codjogador) +
      ' group by ano ' + ') as a ' + 'group by ano desc';

    QrEstat.Close;
    QrEstat.sql.Clear;
    QrEstat.sql.Add(sql);
    QrEstat.Open;
    h_fichaindividual.DbGridEstatisticas.DataSource := DtsQrEstat;

    sql := 'select sum(v+e+d) j, sum(v) v, sum(e) e, sum(d) d, sum(g) g, round(sum(g)/sum(v+e+d),2) mgp, sum(ca) ca, sum(cv) cv, concat(round(((sum(v)*3 + sum(e))/(sum(v+e+d) * 3))*100,1),"%") apr '
      + 'from ( ' +
      'select sum(v) v, sum(e) e, sum(d) d, sum(gols) g, sum(camarelo) ca, sum(cvermelho) cv '
      + 'from es_titul ' + 'where codjogador = ' + IntToStr(codjogador) +
      ' union all ' +
      'select sum(v) v, sum(e) e, sum(d) d, sum(gols) g, sum(camarelo) ca, sum(cvermelho) cv '
      + 'from es_reser ' + 'where codjogador = ' + IntToStr(codjogador) +
      ' ) as a';

    QrUltimo.Close;
    QrUltimo.sql.Clear;
    QrUltimo.sql.Add(sql);
    QrUltimo.Open;
    h_fichaindividual.DbGridTotais.DataSource := DtsQrUltimo;

    if buscarNome('codposicao', 'ca_jogad', 'codjogador', IntToStr(codjogador))
      = '6' then
    begin
      h_fichaindividual.LblTituloJogosComoTit.Caption := EmptyStr;
      h_fichaindividual.LblJogosTitular.Caption := EmptyStr;
    end
    else
    begin
      h_fichaindividual.LblTituloJogosComoTit.Caption :=
        'Partidas como titular:';

      // jogos como titular
      sql := 'select count(*) from es_titul where codjogador = ' +
        IntToStr(codjogador);
      QrTitulares.Close;
      QrTitulares.sql.Clear;
      QrTitulares.sql.Add(sql);
      QrTitulares.Open;
      if QrTitulares.Fields[0].AsInteger = 0 then
        h_fichaindividual.LblJogosTitular.Caption := 'Nenhuma'
      else
      begin
        if QrTitulares.Fields[0].AsInteger = 1 then
          h_fichaindividual.LblJogosTitular.Caption := QrTitulares.Fields[0]
            .AsString + ' jogo'
        else
          h_fichaindividual.LblJogosTitular.Caption := QrTitulares.Fields[0]
            .AsString + ' jogos';
      end;
    end;

    // ultimo jogo
    sql := 'select a.codjogo, concat(a.mand," ",a.placar1,"x",a.placar2," ", a.visit), a.data '
      + 'from( ' +
      'select j.codjogo, j.data, am.nome mand, j.placar1, j.placar2, av.nome visit '
      + 'from es_titul t, ca_jogos j, ca_adver am, ca_adver av ' +
      'where t.codjogo = j.codjogo ' + 'and j.codadvermand = am.codadver ' +
      'and j.codadvervisit = av.codadver ' + 'and t.codjogador = ' +
      IntToStr(codjogador) + ' union ' +
      'select j.codjogo, j.data, am.nome mand, j.placar1, j.placar2, av.nome visit '
      + 'from es_reser t, ca_jogos j, ca_adver am, ca_adver av ' +
      'where t.codjogo = j.codjogo ' + 'and j.codadvermand = am.codadver ' +
      'and j.codadvervisit = av.codadver ' + 'and t.codjogador = ' +
      IntToStr(codjogador) + ') as a ' + ' order by data desc ' +
      'limit 1 offset 0 ';

    QrTitulares.Close;
    QrTitulares.sql.Clear;
    QrTitulares.sql.Add(sql);
    QrTitulares.Open;

    h_fichaindividual.LblCodJogoUltimo.Caption := QrTitulares.Fields[0]
      .AsString;
    h_fichaindividual.LblUltimoJogo.Caption := QrTitulares.Fields[2].AsString +
      ' - ' + QrTitulares.Fields[1].AsString;

    h_fichaindividual.LblIdadeUltimoJogo.Caption :=
      f_gerais.idadeAtual(StrToDateTime(f_gerais.buscarNome('dtnasc',
      'ca_jogad', 'codjogador', IntToStr(codjogador))),
      QrTitulares.Fields[2].AsDateTime);

    // estreia
    sql := 'select a.codjogo, concat(a.mand," ",a.placar1,"x",a.placar2," ", a.visit), a.data '
      + 'from( ' +
      'select j.codjogo, j.data, am.nome mand, j.placar1, j.placar2, av.nome visit '
      + 'from es_titul t, ca_jogos j, ca_adver am, ca_adver av ' +
      'where t.codjogo = j.codjogo ' + 'and j.codadvermand = am.codadver ' +
      'and j.codadvervisit = av.codadver ' + 'and t.codjogador = ' +
      IntToStr(codjogador) + ' union ' +
      'select j.codjogo, j.data, am.nome mand, j.placar1, j.placar2, av.nome visit '
      + 'from es_reser t, ca_jogos j, ca_adver am, ca_adver av ' +
      'where t.codjogo = j.codjogo ' + 'and j.codadvermand = am.codadver ' +
      'and j.codadvervisit = av.codadver ' + 'and t.codjogador = ' +
      IntToStr(codjogador) + ') as a ' + ' order by data ' +
      'limit 1 offset 0 ';

    QrTitulares.Close;
    QrTitulares.sql.Clear;
    QrTitulares.sql.Add(sql);
    QrTitulares.Open;

    h_fichaindividual.LblCodJogoEstreia.Caption := QrTitulares.Fields
      [0].AsString;
    h_fichaindividual.LblEstreia.Caption := QrTitulares.Fields[2].AsString +
      ' - ' + QrTitulares.Fields[1].AsString;

    h_fichaindividual.LblIdadeEstreia.Caption :=
      f_gerais.idadeAtual(StrToDateTime(f_gerais.buscarNome('dtnasc',
      'ca_jogad', 'codjogador', IntToStr(codjogador))),
      QrTitulares.Fields[2].AsDateTime);

    h_fichaindividual.ShowModal;
  end;
end;

procedure Tf_gerais.preencherSumula(codjogo: String);
var
  i, z, m, a, x: Integer;
  aux: String;
  patroc, fornec, gols: String;
  {
    =======================================================
    Preencher súmula
    =======================================================
  }
begin
  sql := 'select codcompeticao, codadvermand, placar1, penalty1, penalty2, ' +
    'placar2, codadvervisit, data, hora, codestadio, publico, codarbitro, codtatica, contra, codfase, coduniforme, portaofechado '
    + 'from ca_jogos ' + 'where codjogo = ' + codjogo;

  QrSumula.Close;
  QrSumula.sql.Clear;
  QrSumula.sql.Add(sql);
  QrSumula.Open;

  // nome da competição
  r_sumula.LblCampeonato.Caption :=
    AnsiUpperCase(buscarNome('nome', 'ca_compe', 'codcompeticao',
    QrSumula.Fields[0].AsString) + ' - ' + buscarNome('nome', 'ca_fase',
    'codfase', QrSumula.Fields[14].AsString) + ' ( JOGO Nº ' + codjogo + ' )');

  // nome dos clubes
  r_sumula.LblNomeMandante.Caption :=
    AnsiUpperCase(buscarNome('nome', 'ca_adver', 'codadver',
    QrSumula.Fields[1].AsString));
  r_sumula.LblNomeVisitante.Caption :=
    AnsiUpperCase(buscarNome('nome', 'ca_adver', 'codadver',
    QrSumula.Fields[6].AsString));
  r_sumula.LblCidadeMandante.Caption :=
    retornarCidadeUfPais(buscarNome('codcidade', 'ca_adver', 'codadver',
    QrSumula.Fields[1].AsString));
  r_sumula.LblCidadeVisitante.Caption :=
    retornarCidadeUfPais(buscarNome('codcidade', 'ca_adver', 'codadver',
    QrSumula.Fields[6].AsString));

  // escudo dos clubes
  buscaImagemPorCodigo(r_sumula.ImgMandante, QrSumula.Fields[1].AsString,
    f_gerais.ExtrairAnoDataDoJogo(codjogo));
  buscaImagemPorCodigo(r_sumula.ImgVisitante, QrSumula.Fields[6].AsString,
    f_gerais.ExtrairAnoDataDoJogo(codjogo));

  // uniforme
  if QrSumula.Fields[15].AsInteger = 0 then
    r_sumula.GbxUniformes.Visible := false
  else
  begin
    f_gerais.buscaImagem(r_sumula.ImgUniforme,
      f_gerais.buscarNome('foto_uniforme', 'ca_uniformes', 'coduniforme',
      QrSumula.Fields[15].AsString));
    r_sumula.ImgUniforme.Hint := AnsiUpperCase(f_gerais.buscarNome('descricao',
      'ca_uniformes', 'coduniforme', QrSumula.Fields[15].AsString));
    r_sumula.ImgUniforme.ShowHint := true;
    r_sumula.GbxUniformes.Visible := true;
  end;

  // árbitro
  r_sumula.LblArbitro.Caption := 'Árbitro: ' + buscarNome('nome', 'ca_arbit',
    'codarbitro', QrSumula.Fields[11].AsString);

  // gols do jogo
  gols := EmptyStr;
  if qryGolsJogo.Active then
    qryGolsJogo.Close;
  qryGolsJogo.Params.ParamByName('CodigoJogo').DataType := ftInteger;
  qryGolsJogo.Params.ParamByName('CodigoJogo').Value := StrToInt(codjogo);
  qryGolsJogo.Open;
  qryGolsJogo.First;
  if not qryGolsJogo.IsEmpty then
  begin
    while not qryGolsJogo.Eof do
    begin
      gols := gols + qryGolsJogonome.Value + qryGolsJogotempoTipo.Value;
      qryGolsJogo.Next;
    end;
    r_sumula.lblGolsPartida.Caption := gols;
    r_sumula.imgGols.Visible := True;
    r_sumula.lblGolsPartida.Visible := True;
  end
  else
  begin
    r_sumula.imgGols.Visible := False;
    r_sumula.lblGolsPartida.Visible := False;
  end;

  // placar do jogo (e penaltis)
  r_sumula.LblPlacarMandante.Caption := QrSumula.Fields[2].AsString;
  r_sumula.LblPlacarVisitante.Caption := QrSumula.Fields[5].AsString;
  // penaltis
  if QrSumula.Fields[3].AsInteger = QrSumula.Fields[4].AsInteger then
  begin
    r_sumula.LblPenaltiMandante.Caption := EmptyStr;
    r_sumula.LblPenaltiVisitante.Caption := EmptyStr;
  end
  else
  begin
    r_sumula.LblPenaltiMandante.Caption := '(' + QrSumula.Fields[3]
      .AsString + ')';
    r_sumula.LblPenaltiVisitante.Caption := '(' + QrSumula.Fields[4]
      .AsString + ')';
  end;

  // data e hora
  if QrSumula.Fields[8].AsString = EmptyStr then
    r_sumula.LblDataEHora.Caption := 'Data: ' +
      FormatDateTime('dddd"," dd "de" mmmm "de" yyyy',
      QrSumula.Fields[7].AsDateTime)
  else
    r_sumula.LblDataEHora.Caption := 'Data: ' +
      FormatDateTime('dddd"," dd "de" mmmm "de" yyyy',
      QrSumula.Fields[7].AsDateTime) + ', ' + QrSumula.Fields[8].AsString;

  // Patrocinador e fornecedor

  preencherPatrocinios(QrSumula.Fields[7].AsString);

  // estadio
  if QrSumula.Fields[10].AsInteger > 0 then
  begin
    r_sumula.LblLocalEPublico.Caption := buscarNome('nome', 'ca_estad',
      'codestadio', QrSumula.Fields[9].AsString) + ', ' +
      retornarCidadeUfPais(buscarNome('codcidade', 'ca_estad', 'codestadio',
      QrSumula.Fields[9].AsString)) + ' - Público: ' + FormatFloat('###,###',
      QrSumula.Fields[10].AsFloat) + ' torcedores';
  end
  else
  begin
    if QrSumula.Fields[16].AsString = 'N' then
    begin
      r_sumula.LblLocalEPublico.Caption := buscarNome('nome', 'ca_estad',
        'codestadio', QrSumula.Fields[9].AsString) + ', ' +
        retornarCidadeUfPais(buscarNome('codcidade', 'ca_estad', 'codestadio',
        QrSumula.Fields[9].AsString)) + ' - Público: Não Informado';
    end
    else
    begin
      r_sumula.LblLocalEPublico.Caption := buscarNome('nome', 'ca_estad',
        'codestadio', QrSumula.Fields[9].AsString) + ', ' +
        retornarCidadeUfPais(buscarNome('codcidade', 'ca_estad', 'codestadio',
        QrSumula.Fields[9].AsString)) + ' - Público: 0, Portões Fechados';
    end;
  end;

  // esquema tático
  r_sumula.LblEsquema.Caption := 'Esquema: ' + buscarNome('esquema', 'ca_tatic',
    'codtatica', QrSumula.Fields[12].AsString);

  z := StrToInt(copy(buscarNome('esquema', 'ca_tatic', 'codtatica',
    QrSumula.Fields[12].AsString), 1, 1));
  m := StrToInt(copy(buscarNome('esquema', 'ca_tatic', 'codtatica',
    QrSumula.Fields[12].AsString), 3, 1));
  a := StrToInt(copy(buscarNome('esquema', 'ca_tatic', 'codtatica',
    QrSumula.Fields[12].AsString), 5, 1));

  // colorir esquema tático
  for i := 1 to z do
  begin
    (r_sumula.FindComponent('shtatica' + IntToStr(i + 1)) as TShape).Brush.Color
      := clScrollBar;
  end;
  for i := 1 to m do
  begin
    (r_sumula.FindComponent('shtatica' + IntToStr(i + z + 1)) as TShape)
      .Brush.Color := cl3DDkShadow;
  end;
  for i := 1 to a do
  begin
    (r_sumula.FindComponent('shtatica' + IntToStr(i + m + z + 1)) as TShape)
      .Brush.Color := clScrollBar;
  end;

  // jogadores titulares
  sql := 'select e.codjogador, e.camarelo, e.cvermelho, e.gols, p.bandeira ' +
    'from ca_jogos j, es_titul e, ca_jogad jg, ca_cidad c, ca_pais p ' +
    'where j.codjogo = e.codjogo ' + 'and e.codjogador = jg.codjogador ' +
    'and jg.codcidade = c.codcidade ' + 'and c.codpais = p.codpais ' +
    'and j.codjogo = ' + codjogo + ' order by e.coditem ';

  QrTitulares.Close;
  QrTitulares.sql.Clear;
  QrTitulares.sql.Add(sql);
  QrTitulares.Open;
  QrTitulares.First;

  for i := 1 to 12 do
  begin
    // codigo do jogador
    (r_sumula.FindComponent('LblCod' + IntToStr(i)) as TLabel).Caption :=
      QrTitulares.Fields[0].AsString;
    // gravar codigo da posicao do jogador
    aux := buscarNome('codposicao', 'ca_jogad', 'codjogador',
      QrTitulares.Fields[0].AsString);

    // nome do jogador
    (r_sumula.FindComponent('LblNome' + IntToStr(i)) as TLabel).Caption :=
      '[ ' + buscarNome('abreviatura', 'ca_posic', 'codposicao', aux) + ' ] ' +
      buscarNome('nome', 'ca_jogad', 'codjogador',
      QrTitulares.Fields[0].AsString);

    // bandeira da nacionalidade do jogador
    buscaBandJogador((r_sumula.FindComponent('ImgBandJog' + IntToStr(i))
      as TImage), QrTitulares.Fields[0].AsString);

    // cartão vermelho
    if QrTitulares.Fields[2].AsInteger = 0 then
    begin
      // cartão amarelo
      if QrTitulares.Fields[1].AsInteger = 0 then
      begin
        (r_sumula.FindComponent('ShCa' + IntToStr(i)) as TShape)
          .Visible := false;
      end
      else
      begin
        (r_sumula.FindComponent('ShCa' + IntToStr(i)) as TShape).Brush.Color
          := clYellow;
        (r_sumula.FindComponent('ShCa' + IntToStr(i)) as TShape).Pen.Color
          := clOlive;
        (r_sumula.FindComponent('ShCa' + IntToStr(i)) as TShape)
          .Visible := true;
      end;
    end
    else
    begin
      (r_sumula.FindComponent('ShCa' + IntToStr(i)) as TShape)
        .Brush.Color := clRed;
      (r_sumula.FindComponent('ShCa' + IntToStr(i)) as TShape).Pen.Color
        := clMaroon;
      (r_sumula.FindComponent('ShCa' + IntToStr(i)) as TShape).Visible := true;
    end;
    if i < 12 then
    begin
      // gols
      if QrTitulares.Fields[3].AsInteger = 0 then
        (r_sumula.FindComponent('ImgBola' + IntToStr(i)) as TImage)
          .Visible := false
      else
      begin
        (r_sumula.FindComponent('ImgBola' + IntToStr(i)) as TImage)
          .Visible := true;
        (r_sumula.FindComponent('ImgBola' + IntToStr(i)) as TImage).Hint :=
          retornarGolsPorMinutoPorJogador(StrToInt(codjogo),
          QrTitulares.Fields[0].AsInteger);
        (r_sumula.FindComponent('ImgBola' + IntToStr(i)) as TImage)
          .ShowHint := true;
      end;
      // quantidade de gols
      if QrTitulares.Fields[3].AsInteger > 1 then
      begin
        (r_sumula.FindComponent('LblGol' + IntToStr(i)) as TLabel)
          .Visible := true;
        (r_sumula.FindComponent('LblGol' + IntToStr(i)) as TLabel).Caption :=
          '(' + QrTitulares.Fields[3].AsString + ')';
      end
      else
        (r_sumula.FindComponent('LblGol' + IntToStr(i)) as TLabel)
          .Visible := false;
    end;
    QrTitulares.Next;
  end;

  // jogadores RESERVAS
  sql := 'select e.codjogador, e.camarelo, e.cvermelho, e.gols, e.codjogadorsaiu, p.bandeira '
    + 'from ca_jogos j, es_reser e, ca_jogad jg, ca_cidad c, ca_pais p ' +
    'where j.codjogo = e.codjogo ' + 'and e.codjogador = jg.codjogador ' +
    'and jg.codcidade = c.codcidade ' + 'and c.codpais = p.codpais ' +
    'and j.codjogo = ' + codjogo + ' order by e.coditem ';

  QrReservas.Close;
  QrReservas.sql.Clear;
  QrReservas.sql.Add(sql);
  QrReservas.Open;
  QrReservas.First;

  for i := 1 to 11 do
  begin
    // codigo do jogador
    (r_sumula.FindComponent('LblCodEntrou' + IntToStr(i)) as TLabel).Caption :=
      QrReservas.Fields[0].AsString;
    // gravar codigo da posicao do jogador
    aux := buscarNome('codposicao', 'ca_jogad', 'codjogador',
      QrReservas.Fields[0].AsString);

    // nome do jogador
    if not(QrReservas.Eof) then
    begin
      (r_sumula.FindComponent('LblEntrou' + IntToStr(i)) as TLabel).Caption :=
        '[ ' + buscarNome('abreviatura', 'ca_posic', 'codposicao', aux) + ' ] '
        + buscarNome('nome', 'ca_jogad', 'codjogador',
        QrReservas.Fields[0].AsString);
      (r_sumula.FindComponent('LblEntrou' + IntToStr(i)) as TLabel)
        .Visible := true;

      (r_sumula.FindComponent('LblSaiu' + IntToStr(i)) as TLabel).Caption :=
        buscarNome('nome', 'ca_jogad', 'codjogador',
        QrReservas.Fields[4].AsString);
      (r_sumula.FindComponent('LblSaiu' + IntToStr(i)) as TLabel)
        .Visible := true;

      // cartão vermelho
      if QrReservas.Fields[2].AsInteger = 0 then
      begin
        // cartão amarelo
        if QrReservas.Fields[1].AsInteger = 0 then
        begin
          (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape)
            .Visible := false;
        end
        else
        begin
          (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape)
            .Brush.Color := clYellow;
          (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape)
            .Pen.Color := clOlive;
          (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape)
            .Visible := true;
        end;
      end
      else
      begin
        (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape)
          .Brush.Color := clRed;
        (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape).Pen.Color
          := clMaroon;
        (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape)
          .Visible := true;
      end;

      // gols
      if (QrReservas.Fields[3].AsInteger = 0) or QrReservas.Eof then
      begin
        (r_sumula.FindComponent('ImgBolaEntrou' + IntToStr(i)) as TImage)
          .Visible := false;
      end
      else
      begin
        (r_sumula.FindComponent('ImgBolaEntrou' + IntToStr(i)) as TImage)
          .Visible := true;
        (r_sumula.FindComponent('ImgBolaEntrou' + IntToStr(i)) as TImage).Hint
          := retornarGolsPorMinutoPorJogador(StrToInt(codjogo),
          QrReservas.Fields[0].AsInteger);
        (r_sumula.FindComponent('ImgBolaEntrou' + IntToStr(i)) as TImage)
          .ShowHint := true;
      end;

      // quantidade de gols
      if (QrReservas.Fields[3].AsInteger <= 1) or QrReservas.Eof then
      begin
        (r_sumula.FindComponent('LblGolsEntrou' + IntToStr(i)) as TLabel)
          .Visible := false;
      end
      else
      begin
        (r_sumula.FindComponent('LblGolsEntrou' + IntToStr(i)) as TLabel)
          .Visible := true;
        (r_sumula.FindComponent('LblGolsEntrou' + IntToStr(i)) as TLabel)
          .Caption := '(' + QrReservas.Fields[3].AsString + ')';
      end;
    end
    else
    begin
      (r_sumula.FindComponent('LblEntrou' + IntToStr(i)) as TLabel)
        .Visible := false;
      (r_sumula.FindComponent('LblEntrou' + IntToStr(i)) as TLabel).Caption
        := EmptyStr;
      (r_sumula.FindComponent('LblSaiu' + IntToStr(i)) as TLabel)
        .Visible := false;
      (r_sumula.FindComponent('ShCaEntrou' + IntToStr(i)) as TShape)
        .Visible := false;
      (r_sumula.FindComponent('LblGolsEntrou' + IntToStr(i)) as TLabel)
        .Visible := false;
      (r_sumula.FindComponent('ImgBolaEntrou' + IntToStr(i)) as TImage)
        .Visible := false;
    end;

    QrReservas.Next;
  end;

  r_sumula.ShowModal;
end;

{
  ======================================================================
  Retornar minutos dos gols de cada jogador
  ======================================================================
}

function Tf_gerais.retornarGolsPorMinutoPorJogador(codjogo,
  codjogador: Integer): String;
var
  gols: string;
begin
  gols := EmptyStr;
  if qryMinutosGolsPorJogador.Active then
    qryMinutosGolsPorJogador.Close;
  qryMinutosGolsPorJogador.Params.ParamByName('CodigoJogo').DataType :=
    ftInteger;
  qryMinutosGolsPorJogador.Params.ParamByName('CodigoJogador').DataType :=
    ftInteger;
  qryMinutosGolsPorJogador.Params.ParamByName('CodigoJogo').Value := codjogo;
  qryMinutosGolsPorJogador.Params.ParamByName('CodigoJogador').Value :=
    codjogador;
  qryMinutosGolsPorJogador.Open;
  qryMinutosGolsPorJogador.First;
  while not qryMinutosGolsPorJogador.Eof do
  begin
    if gols = EmptyStr then
      gols := qryMinutosGolsPorJogadortempoTipo.Value
    else
      gols := gols + ', ' + qryMinutosGolsPorJogadortempoTipo.Value;
    qryMinutosGolsPorJogador.Next;
  end;
  Result := gols;
end;

{
  ======================================================================
  Retornar Cidade/UF/Pais - formato: Rio de Janeiro (RJ), Brasil
  ======================================================================
}

function Tf_gerais.retornarCidadeUfPais(codcidade: String): String;
begin
  sql := 'select c.nome, p.nome, u.sigla ' +
    'from ca_cidad c, ca_pais p, ca_uf u ' + 'where c.codpais = p.codpais ' +
    'and c.coduf = u.coduf ' + 'and c.codcidade = ' + codcidade;

  QrCidades.Close;
  QrCidades.sql.Clear;
  QrCidades.sql.Add(sql);
  QrCidades.Open;

  if QrCidades.Fields[2].AsString = 'EX' then
  begin
    Result := QrCidades.Fields[0].AsString + ' - ' + QrCidades.Fields
      [1].AsString;
  end
  else
  begin
    Result := QrCidades.Fields[0].AsString + ' (' + QrCidades.Fields[2].AsString
      + ') - ' + QrCidades.Fields[1].AsString;
  end;
end;

procedure Tf_gerais.preencherAniversariantes(sql: String);
var
  i: Integer;
begin
  QrEstat.Close;
  QrEstat.sql.Clear;
  QrEstat.sql.Add(sql);
  QrEstat.Params.ParamByName('DATAPADRAO').AsString := '1900-01-01';
  QrEstat.Open;
  QrEstat.First;

  if QrEstat.IsEmpty then
  begin
    msg := 'Não há nenhum jogador ou técnico cadastrado ' + #13 +
      'que esteja fazendo aniversário nesta data!';
    Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    for i := 2 to 15 do
    begin
      if QrEstat.Eof then
      begin
        (r_aniversariantes.FindComponent('LblNome' + IntToStr(i)) as TLabel)
          .Visible := false;
        (r_aniversariantes.FindComponent('LblPeriodo' + IntToStr(i)) as TLabel)
          .Visible := false;
        (r_aniversariantes.FindComponent('ImgBandNac' + IntToStr(i)) as TImage)
          .Visible := false;
      end
      else
      begin
        (r_aniversariantes.FindComponent('LblNome' + IntToStr(i)) as TLabel)
          .Visible := true;
        (r_aniversariantes.FindComponent('LblPeriodo' + IntToStr(i)) as TLabel)
          .Visible := true;
        (r_aniversariantes.FindComponent('ImgBandNac' + IntToStr(i)) as TImage)
          .Visible := true;

        (r_aniversariantes.FindComponent('LblCodigo' + IntToStr(i)) as TLabel)
          .Caption := QrEstat.Fields[0].AsString;
        (r_aniversariantes.FindComponent('LblNome' + IntToStr(i)) as TLabel)
          .Caption := AnsiUpperCase(QrEstat.Fields[1].AsString);
        (r_aniversariantes.FindComponent('LblPeriodo' + IntToStr(i)) as TLabel)
          .Caption := QrEstat.Fields[2].AsString;
        f_gerais.buscaBandJogador
          ((r_aniversariantes.FindComponent('ImgBandNac' + IntToStr(i))
          as TImage), QrEstat.Fields[0].AsString);
      end;
      QrEstat.Next;
    end;

    r_aniversariantes.ShowModal;
  end;

end;

procedure Tf_gerais.preencherOsDezMais(sql: String; codRelatorio: Integer);
var
  i: Integer;
begin
  {
    ======================================================================
    Preencher os 15 Mais
    ======================================================================
    Relatórios
    1 - Mairoes Artilheiros
    2 - Mairoes Artilheiros Por Ano
    3 - Jogadores que mais atuaram
    4 - Técnicos que mais atuaram
    5 - Jogadores mais indisciplinados
    6 - Estrangeiros que mais atuaram
    7 - Estrangeiros que mais marcaram
    8 - Goleiros que mais atuaram
    9 - Maiores Artilheiros contra Rivais
    10- Jogadores com mais hattriks marcados
    11- Jogadroes que mais atuaram com técnicos
    12- Maiores zagueiros artilheiros
    13- Maiores artilheiros em finais
    ======================================================================
  }

  QrEstat.Close;
  QrEstat.sql.Clear;
  QrEstat.sql.Add(sql);
  QrEstat.Open;
  QrEstat.First;

  // trazer informações reduzidas do jogador
  f_gerais.InfReduzidaJogador(QrEstat.Fields[0].AsString,
    r_dezmais.ImgNacionalidade, r_dezmais.ImgFotoJogador, r_dezmais.LblApelido,
    r_dezmais.LblNomeCompleto, r_dezmais.LblPeriodo, r_dezmais.LblPosicao);

  case codRelatorio of
    1:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Gols: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'MAIORES ARTILHEIROS GERAL';
      end;
    2:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Ano: ' + QrEstat.Fields[3]
          .AsString + ' / Gols: ' + QrEstat.Fields[2].AsString;
        r_dezmais.LblTitulos.Caption := 'MAIORES ARTILHEIROS POR ANO';
      end;
    3:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Jogos: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'JOGADORES QUE MAIS ATUARAM';
      end;
    4:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Jogos: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'TÉCNICOS QUE MAIS TREINARAM';
      end;
    5:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Total: ' + QrEstat.Fields[2]
          .AsString + ' / Amarelos: ' + QrEstat.Fields[3].AsString +
          ' / Vermelhos: ' + QrEstat.Fields[4].AsString;
        r_dezmais.LblTitulos.Caption := 'JOGADORES MAIS INDISCIPLINADOS';
      end;
    6:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Jogos: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'ESTRANGEIROS QUE MAIS ATUARAM';
      end;
    7:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Gols: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'MAIORES ARTILHEIROS ESTRANGEIROS';
      end;
    8:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Jogos: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'GOLEIROS QUE MAIS ATUARAM';
      end;
    9:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Gols: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'MAIORES ARTILHEIROS CONTRA RIVAIS: ' +
          AnsiUpperCase(retornaNomesRivais());
      end;
    10:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Hattriks: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'JOGADORES QUE MARCARAM MAIS HATTRICKS';
      end;
    11:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Jogos: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption :=
          'JOGADORES QUE MAIS ATUARAM COM O TÉCNICO ' +
          AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_jogad', 'codjogador',
          f_gerais.codigosaux));
      end;
    12:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Gols: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'MAIORES ZAGUEIROS ARTILHEIROS';
      end;
    13:
      begin
        r_dezmais.LblEstatistica1.Caption := 'Gols: ' + QrEstat.Fields
          [2].AsString;
        r_dezmais.LblTitulos.Caption := 'MAIORES ARTILHEIROS EM FINAIS';
      end;
  end; // fim do case

  QrEstat.Next;

  for i := 2 to 15 do
  begin
    (r_dezmais.FindComponent('LblCodigo' + IntToStr(i)) as TLabel).Caption :=
      QrEstat.Fields[0].AsString;
    (r_dezmais.FindComponent('LblNome' + IntToStr(i)) as TLabel).Caption :=
      AnsiUpperCase(QrEstat.Fields[1].AsString);
    (r_dezmais.FindComponent('LblPeriodo' + IntToStr(i)) as TLabel).Caption :=
      periodoJogador(QrEstat.Fields[0].AsString);
    f_gerais.buscaBandJogador
      ((r_dezmais.FindComponent('ImgBandNac' + IntToStr(i)) as TImage),
      QrEstat.Fields[0].AsString);

    case codRelatorio of
      1:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Gols';
        end;
      2:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[3].AsString + ' / ' + QrEstat.Fields
            [2].AsString;
          r_dezmais.LblTitEst.Caption := 'Ano/Gols';
        end;
      3:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Jogos';
        end;
      4:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Jogos';
        end;
      5:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := 'Total: ' + QrEstat.Fields[2].AsString + ' / ' +
            QrEstat.Fields[3].AsString + 'A / ' + QrEstat.Fields[4]
            .AsString + 'V';
          r_dezmais.LblTitEst.Caption := 'Cartões T/A/V';
        end;
      6:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Jogos';
        end;
      7:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Gols';
        end;
      8:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Jogos';
        end;
      9:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Gols';
        end;
      10:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Hattricks';
        end;
      11:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Jogos';
        end;
      12:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Gols';
        end;
      13:
        begin
          (r_dezmais.FindComponent('LblEstatistica' + IntToStr(i)) as TLabel)
            .Caption := QrEstat.Fields[2].AsString;
          r_dezmais.LblTitEst.Caption := 'Gols';
        end;
    end; // fim do case
    QrEstat.Next;
  end; // end for
  r_dezmais.ShowModal;
end;

procedure Tf_gerais.preencherGridsCampanhaGeral(ano: String);
{
  ======================================================================
  Preencher grids da campanha geral
  ======================================================================
}
begin
  if ano = 'Geral' then
  begin
    sql := 'select c.nome, (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, '
      + 'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r, ca_compe c ' +
      'where j.codjogo = r.codjogo ' + 'and j.codcompeticao = c.codcompeticao '
      + ' group by j.codcompeticao ' + 'order by 2 desc';
  end
  else
  begin
    sql := 'select c.nome, (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, '
      + 'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r, ca_compe c ' +
      'where j.codjogo = r.codjogo ' + 'and j.codcompeticao = c.codcompeticao '
      + 'and r.ano = ' + ano + ' group by j.codcompeticao ' + 'order by 2 desc';
  end;

  QrEstat1.Close;
  QrEstat1.sql.Clear;
  QrEstat1.sql.Add(sql);
  QrEstat1.Open;

  r_campanhageral.DbGridEstatisticas.DataSource := DtsQrEstat1;

  if ano = 'Geral' then
  begin
    sql := 'select (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, ' +
      'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ';
  end
  else
  begin
    sql := 'select (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, ' +
      'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
      'and r.ano = ' + ano;
  end;

  QrEstat2.Close;
  QrEstat2.sql.Clear;
  QrEstat2.sql.Add(sql);
  QrEstat2.Open;

  r_campanhageral.DbGridGeral.DataSource := DtsQrEstat2;

  if ano = 'Geral' then
  begin
    sql := 'select (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, ' +
      'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
      'and j.codadvermand = 0 ';
  end
  else
  begin
    sql := 'select (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, ' +
      'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
      'and j.codadvermand = 0 ' + 'and r.ano = ' + ano;
  end;

  QrEstat3.Close;
  QrEstat3.sql.Clear;
  QrEstat3.sql.Add(sql);
  QrEstat3.Open;

  r_campanhageral.DbGridCasa.DataSource := DtsQrEstat3;

  if ano = 'Geral' then
  begin
    sql := 'select (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, ' +
      'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
      'and j.codadvervisit = 0 ';
  end
  else
  begin
    sql := 'select (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, ' +
      'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
      'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
      + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
      'and j.codadvervisit = 0 ' + 'and r.ano = ' + ano;
  end;

  QrEstat4.Close;
  QrEstat4.sql.Clear;
  QrEstat4.sql.Add(sql);
  QrEstat4.Open;

  r_campanhageral.DbGridFora.DataSource := DtsQrEstat4;

  r_campanhageral.LblSequencia1.Caption :=
    f_gerais.sequencias(r_campanhageral.LblDtIniSeq1,
    r_campanhageral.LblDtFimSeq1, ano, 1, 2);
  r_campanhageral.LblSequencia2.Caption :=
    f_gerais.sequencias(r_campanhageral.LblDtIniSeq2,
    r_campanhageral.LblDtFimSeq2, ano, 2, 2);
  r_campanhageral.LblSequencia3.Caption :=
    f_gerais.sequencias(r_campanhageral.LblDtIniSeq3,
    r_campanhageral.LblDtFimSeq3, ano, 3, 2);
  r_campanhageral.LblSequencia4.Caption :=
    f_gerais.sequencias(r_campanhageral.LblDtIniSeq4,
    r_campanhageral.LblDtFimSeq4, ano, 4, 2);

  f_gerais.melhorPiorResultadoGeral(ano);

end;

{
  ======================================================================
  Melhor Pior Resultado Geral
  ======================================================================
}
procedure Tf_gerais.melhorPiorResultadoGeral(ano: String);
var
  i: Integer;
begin
  // melhor resultado
  if ano = 'Geral' then
  begin
    sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
      + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar2 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar2 >= placar1 ' + ' union ' +
      'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar1 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar2 <= placar1 ) as a ' + 'order by 9 desc, 10 desc, 2 desc ' +
      'limit 3 offset 0';
  end
  else
  begin
    sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
      + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar2 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar2 >= placar1 ' + 'and temporada = ' + ano +
      ' union ' +
      'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar1 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' + 'and placar2 <= placar1 '
      + 'and temporada = ' + ano + ' ) as a ' +
      'order by 9 desc, 10 desc, 2 desc ' + 'limit 3 offset 0';
  end;

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open();
  QrMelhorPior.First;

  for i := 1 to 3 do
  begin
    if not(QrMelhorPior.Eof) then
    begin
      (r_campanhageral.FindComponent('LblMelhorResult' + IntToStr(i)) as TLabel)
        .Caption := QrMelhorPior.Fields[1].AsString + ' - ' +
        buscarNome('nome', 'ca_adver', 'codadver',
        QrMelhorPior.Fields[2].AsString) + ' ' + QrMelhorPior.Fields[3].AsString
        + 'x' + QrMelhorPior.Fields[4].AsString + ' ' +
        buscarNome('nome', 'ca_adver', 'codadver',
        QrMelhorPior.Fields[5].AsString);
      (r_campanhageral.FindComponent('LblCodMelhorResult' + IntToStr(i))
        as TLabel).Caption := QrMelhorPior.Fields[0].AsString;
    end
    else
    begin
      (r_campanhageral.FindComponent('LblMelhorResult' + IntToStr(i)) as TLabel)
        .Caption := EmptyStr;
      (r_campanhageral.FindComponent('LblCodMelhorResult' + IntToStr(i))
        as TLabel).Caption := EmptyStr;
    end;
    QrMelhorPior.Next
  end;

  // pior resultado
  if ano = 'Geral' then
  begin
    sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
      + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar2 <= placar1 ' + ' union ' +
      'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' +
      'and placar2 >= placar1 ) as a ' + 'order by 9 desc, 10 desc, 2 desc ' +
      'limit 3 offset 0';
  end
  else
  begin
    sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
      + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
      'and placar2 <= placar1 ' + 'and temporada = ' + ano +
      ' union ' +
      'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as GOLSPRO '
      + 'from ca_jogos ' + 'where codadvermand = 0 ' + 'and placar2 >= placar1 '
      + 'and temporada = ' + ano + ' ) as a ' +
      'order by 9 desc, 10 desc, 2 desc ' + 'limit 3 offset 0';
  end;

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open;
  QrMelhorPior.First;

  for i := 1 to 3 do
  begin
    if not(QrMelhorPior.Eof) then
    begin
      (r_campanhageral.FindComponent('LblPiorResultado' + IntToStr(i))
        as TLabel).Caption := QrMelhorPior.Fields[1].AsString + ' - ' +
        buscarNome('nome', 'ca_adver', 'codadver',
        QrMelhorPior.Fields[2].AsString) + ' ' + QrMelhorPior.Fields[3].AsString
        + 'x' + QrMelhorPior.Fields[4].AsString + ' ' +
        buscarNome('nome', 'ca_adver', 'codadver',
        QrMelhorPior.Fields[5].AsString);
      (r_campanhageral.FindComponent('LblCodPiorResultado' + IntToStr(i))
        as TLabel).Caption := QrMelhorPior.Fields[0].AsString;
    end
    else
    begin
      (r_campanhageral.FindComponent('LblPiorResultado' + IntToStr(i))
        as TLabel).Caption := EmptyStr;
      (r_campanhageral.FindComponent('LblCodPiorResultado' + IntToStr(i))
        as TLabel).Caption := EmptyStr;
    end;
    QrMelhorPior.Next
  end;

end;

{
  ======================================================================
  Ultima vitória, derrota, ultimo jogo, melhor e pior resultado
  ======================================================================
}
procedure Tf_gerais.melhorPiorResultado(codigodotime: String);
var
  contador: Integer;
begin

  // ultimo jogo
  sql := 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar1 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvermand = ' + codigodotime + ' union ' +
    'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar2 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvervisit = ' + codigodotime +
    ' order by 2 desc ' + 'limit 1 offset 0 ';

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open();

  r_estgerais.LblUltimoJogo1.Caption := QrMelhorPior.Fields[1].AsString + ' - '
    + buscarNome('nome', 'ca_adver', 'codadver',
    QrMelhorPior.Fields[2].AsString) + ' ' + QrMelhorPior.Fields[3].AsString +
    'x' + QrMelhorPior.Fields[4].AsString + ' ' + buscarNome('nome', 'ca_adver',
    'codadver', QrMelhorPior.Fields[5].AsString);
  r_estgerais.LblUltimoJogo2.Caption := QrMelhorPior.Fields[0].AsString;

  // melhor resultado
  sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
    + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar2 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvermand = ' + codigodotime +
    ' and placar2 >= placar1 ' + 'union ' +
    'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar1 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvervisit = ' + codigodotime +
    ' and placar2 <= placar1 ' + ') as a ' + 'order by 9 desc, 10 desc, 2 desc '
    + 'limit 1 offset 0';

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open();

  if QrMelhorPior.Fields[0].AsString = EmptyStr then
  begin
    r_estgerais.LblMelhorResult1.Caption := 'Não houve';
  end
  else
  begin
    r_estgerais.LblMelhorResult1.Caption := QrMelhorPior.Fields[1].AsString +
      ' - ' + buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[2].AsString) + ' ' + QrMelhorPior.Fields[3].AsString +
      'x' + QrMelhorPior.Fields[4].AsString + ' ' +
      buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[5].AsString);
    r_estgerais.LblMelhorResult2.Caption := QrMelhorPior.Fields[0].AsString;
  end;

  // pior resultado
  sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
    + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvermand = ' + codigodotime +
    ' and placar2 <= placar1 ' + 'union ' +
    'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvervisit = ' + codigodotime +
    ' and placar2 >= placar1 ' + ') as a ' + 'order by 9 desc, 10 desc, 2 desc '
    + 'limit 1 offset 0';

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open();

  if QrMelhorPior.Fields[0].AsString = EmptyStr then
  begin
    r_estgerais.LblPiorResultado1.Caption := 'Não houve';
    r_estgerais.LblPiorResultado2.Caption := '0';
  end
  else
  begin
    r_estgerais.LblPiorResultado1.Caption := QrMelhorPior.Fields[1].AsString +
      ' - ' + buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[2].AsString) + ' ' + QrMelhorPior.Fields[3].AsString +
      'x' + QrMelhorPior.Fields[4].AsString + ' ' +
      buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[5].AsString);
    r_estgerais.LblPiorResultado2.Caption := QrMelhorPior.Fields[0].AsString;
  end;

  // ultima vitória
  sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
    + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar2 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvermand = ' + codigodotime +
    ' and placar2 > placar1 ' + 'union ' +
    'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar1 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvervisit = ' + codigodotime +
    ' and placar2 < placar1 ' + ') as a ' + 'order by 2 desc ' +
    'limit 1 offset 0';

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open();

  if QrMelhorPior.Fields[0].AsString = EmptyStr then
  begin
    r_estgerais.LblUltimaVit1.Caption := 'Não houve';
    r_estgerais.LblUltimaVit2.Caption := '0';
  end
  else
  begin
    r_estgerais.LblUltimaVit1.Caption := QrMelhorPior.Fields[1].AsString + ' - '
      + buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[2].AsString) + ' ' + QrMelhorPior.Fields[3].AsString +
      'x' + QrMelhorPior.Fields[4].AsString + ' ' +
      buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[5].AsString);
    r_estgerais.LblUltimaVit2.Caption := QrMelhorPior.Fields[0].AsString;
  end;

  // ultima derrota
  sql := 'select a.codjogo, a.data, a.codadvermand, a.placar1, a.placar2, a.codadvervisit, a.codestadio, a.codcompeticao, a.SALDO, a.GOLSPRO from ( '
    + 'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar1-placar2 as SALDO, placar2 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvermand = ' + codigodotime +
    ' and placar2 < placar1 ' + 'union ' +
    'select Codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, placar2-placar1 as SALDO, placar1 as GOLSPRO '
    + 'from ca_jogos ' + 'where codadvervisit = ' + codigodotime +
    ' and placar2 > placar1 ' + ') as a ' + 'order by 2 desc ' +
    'limit 1 offset 0';

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open();

  if QrMelhorPior.Fields[0].AsString = EmptyStr then
  begin
    r_estgerais.LblUltimaDerrota1.Caption := 'Não houve';
    r_estgerais.LblUltimaDerrota2.Caption := '0';
  end
  else
  begin
    r_estgerais.LblUltimaDerrota1.Caption := QrMelhorPior.Fields[1].AsString +
      ' - ' + buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[2].AsString) + ' ' + QrMelhorPior.Fields[3].AsString +
      'x' + QrMelhorPior.Fields[4].AsString + ' ' +
      buscarNome('nome', 'ca_adver', 'codadver',
      QrMelhorPior.Fields[5].AsString);
    r_estgerais.LblUltimaDerrota2.Caption := QrMelhorPior.Fields[0].AsString;
  end;

  // estatisticas gerais por campeonato
  sql := 'select c.nome, (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, '
    + 'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
    'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%"'
    + ') apr ' + 'from ca_jogos j, es_resum r, ca_compe c ' +
    'where j.codjogo = r.codjogo ' + 'and j.codcompeticao = c.codcompeticao ' +
    'and (j.codadvermand = ' + codigodotime + ' or j.codadvervisit = ' +
    codigodotime + ') ' + 'group by j.codcompeticao ' + 'order by 2 desc';

  QrMelhorPior.Close;
  QrMelhorPior.sql.Clear;
  QrMelhorPior.sql.Add(sql);
  QrMelhorPior.Open();

  r_estgerais.DbGridEstatisticas.DataSource := DtsQrMelhorPior;

  sql := 'select (sum(r.v)+sum(r.e)+sum(r.d)) j, sum(r.v) v, sum(r.e) e, ' +
    'sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, (sum(gp)-sum(gc)) sg, ' +
    'concat(round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum(r.d))*3)) * 100,2),"%") apr '
    + 'from ca_jogos j, es_resum r ' + 'where j.codjogo = r.codjogo ' +
    'and (j.codadvermand = ' + codigodotime + ' or j.codadvervisit = ' +
    codigodotime + ')';

  QrTotais.Close;
  QrTotais.sql.Clear;
  QrTotais.sql.Add(sql);
  QrTotais.Open();

  r_estgerais.DbGridTotais.DataSource := DtsQrTotais;

end;

{
  ======================================================================
  Sequencias
  Param = recebe o código do adversário ou o ano
  Obs.:
  Índices
  1 - Maior sequencia de vitórias
  2 - Maior sequencia invicta
  3 - Maior sequencia de derrotas
  4 - Maior sequencia sem vencer
  Relatório
  1 - Adversários
  2 - Ano
  ======================================================================
}

function Tf_gerais.sequencias(dti, dtf: TLabel; Param: String;
  indice, relat: Integer): String;
var
  qtde, maior: Integer;
  dtini1, dtfim1, dtaux: String;
begin
  if relat = 1 then // adversários
  begin
    sql := 'select data, codadvermand m, placar1 pm, placar2 pv, codadvervisit v '
      + 'from ca_jogos ' + 'where codadvervisit = ' + Param + ' union ' +
      'select data, codadvervisit m, placar2 pm, placar1 pv, codadvermand v ' +
      'from ca_jogos ' + 'where codadvermand = ' + Param + ' order by data';
  end
  else
  begin
    if Param = 'Geral' then
    begin
      sql := 'select data, codadvermand m, placar1 pm, placar2 pv, codadvervisit v '
        + 'from ca_jogos ' + 'where codadvermand = 0 ' + ' union ' +
        'select data, codadvervisit m, placar2 pm, placar1 pv, codadvermand v '
        + 'from ca_jogos ' + 'where codadvervisit = 0 ' + ' order by data';
    end
    else
    begin
      sql := 'select data, codadvermand m, placar1 pm, placar2 pv, codadvervisit v '
        + 'from ca_jogos ' + 'where codadvermand = 0 ' +
        'and temporada = ' + Param + ' union ' +
        'select data, codadvervisit m, placar2 pm, placar1 pv, codadvermand v '
        + 'from ca_jogos ' + 'where codadvervisit = 0 ' +
        'and temporada = ' + Param + ' order by data';
    end;
  end;

  QrSequencias.Close;
  QrSequencias.sql.Clear;
  QrSequencias.sql.Add(sql);
  QrSequencias.Open();
  QrSequencias.First;

  case indice of
    1: // maior sequencia de vitórias
      begin
        qtde := 0;
        maior := 0;
        while not(QrSequencias.Eof) do
        begin
          if QrSequencias.Fields[2].AsInteger > QrSequencias.Fields[3].AsInteger
          then
          begin
            qtde := qtde + 1;
            if qtde = 1 then
              dtaux := QrSequencias.Fields[0].AsString;
            if qtde >= maior then
            begin
              maior := qtde;
              dtini1 := dtaux;
              dtfim1 := QrSequencias.Fields[0].AsString;
            end;
          end
          else
          begin
            qtde := 0;
          end;
          QrSequencias.Next;
        end;
      end;
    2: // maior sequencia invicta
      begin
        qtde := 0;
        maior := 0;
        while not(QrSequencias.Eof) do
        begin
          if QrSequencias.Fields[2].AsInteger >= QrSequencias.Fields[3].AsInteger
          then
          begin
            qtde := qtde + 1;
            if qtde = 1 then
              dtaux := QrSequencias.Fields[0].AsString;
            if qtde >= maior then
            begin
              maior := qtde;
              dtini1 := dtaux;
              dtfim1 := QrSequencias.Fields[0].AsString;
            end;
          end
          else
          begin
            qtde := 0;
          end;
          QrSequencias.Next;
        end;
      end;
    3: // Maior sequencia de derrotas
      begin
        qtde := 0;
        maior := 0;
        while not(QrSequencias.Eof) do
        begin
          if QrSequencias.Fields[2].AsInteger < QrSequencias.Fields[3].AsInteger
          then
          begin
            qtde := qtde + 1;
            if qtde = 1 then
              dtaux := QrSequencias.Fields[0].AsString;
            if qtde >= maior then
            begin
              maior := qtde;
              dtini1 := dtaux;
              dtfim1 := QrSequencias.Fields[0].AsString;
            end;
          end
          else
          begin
            qtde := 0;
          end;
          QrSequencias.Next;
        end;
      end;
    4: // Maior sequencia sem vencer
      begin
        qtde := 0;
        maior := 0;
        while not(QrSequencias.Eof) do
        begin
          if QrSequencias.Fields[2].AsInteger <= QrSequencias.Fields[3].AsInteger
          then
          begin
            qtde := qtde + 1;
            if qtde = 1 then
              dtaux := QrSequencias.Fields[0].AsString;
            if qtde >= maior then
            begin
              maior := qtde;
              dtini1 := dtaux;
              dtfim1 := QrSequencias.Fields[0].AsString;
            end;
          end
          else
          begin
            qtde := 0;
          end;
          QrSequencias.Next;
        end;
      end;
  end;

  dti.Caption := dtini1;
  dtf.Caption := dtfim1;

  if maior = 0 then
    Result := 'Não houve'
  else
  begin
    if maior = 1 then
      Result := IntToStr(maior) + ' jogo, em ' + dti.Caption
    else
      Result := IntToStr(maior) + ' jogos, de ' + dti.Caption + ' à ' +
        dtf.Caption;

  end;
end;


// =============================================================================
// Preenchimento jogos por periodo
// Relatório: 1 - Adeversário; 2 - Ano
// =============================================================================

procedure Tf_gerais.relPeriodoEstGerais(dtini, dtfim: String; relat: Integer);
var
  i, cont: Integer;
begin

  // guardar o número do forumlário na label
  if relat = 1 then
  begin
    r_jogospadrao.numerorelatorio := '27';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
      + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
      'and r.codadver = ' + r_jogospadrao.codauxiliar1 +
      ' and j.data between :DATAINI and :DATAFIM';
  end
  else
  begin
    r_jogospadrao.numerorelatorio := '28';

    // contar a quantidade de registros retornados na pesquisa
    if r_jogospadrao.codauxiliar1 = 'Geral' then
    begin
      sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
        + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
        ' and j.data between :DATAINI and :DATAFIM';
    end
    else
    begin
      sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
        + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
        'and r.ano = ' + r_jogospadrao.codauxiliar1 +
        ' and j.data between :DATAINI and :DATAFIM';
    end;
  end;

  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Params.ParamByName('DATAINI').AsDate := StrToDate(dtini);
  FrmDm.QrContador.Params.ParamByName('DATAFIM').AsDate := StrToDate(dtfim);
  FrmDm.QrContador.Open;
  FrmDm.QrContador.First;

  if FrmDm.QrContador.Fields[0].AsInteger = 0 then
  begin
    msg := 'Não há nenhum jogo cadastrado ' + #13 +
      'para este período selecionado';
    Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin

    r_jogospadrao.codauxiliar2 := dtini;
    r_jogospadrao.codauxiliar3 := dtfim;

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

    if relat = 1 then
    begin
      // agora faremos a pesquisa com retorno dos resultados para serem
      // arpesentados na tela padrão
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codadvermand = ' +
        r_jogospadrao.codauxiliar1 + ' and data between :DATAINI and :DATAFIM '
        + 'union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codadvervisit = ' +
        r_jogospadrao.codauxiliar1 + ' and data between :DATAINI and :DATAFIM '
        + 'order by data desc ' + 'limit :LIMITE offset :CORTE';
    end
    else
    begin
      if r_jogospadrao.codauxiliar1 = 'Geral' then
      begin
        sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
          + 'from ca_jogos ' + 'where data between :DATAINI and :DATAFIM ' +
          'order by data desc ' + 'limit :LIMITE offset :CORTE';
      end
      else
      begin
        sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
          + 'from ca_jogos ' + 'where temporada = ' +
          r_jogospadrao.codauxiliar1 +
          ' and data between :DATAINI and :DATAFIM ' + 'order by data desc ' +
          'limit :LIMITE offset :CORTE';
      end;
    end;

    // função para preencher a tela padrão com os resultados da sql acima
    f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

    // títulos e descrição do relatório
    if relat = 1 then
    begin
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS CONTRA: ' +
        AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1));
    end
    else
    begin
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS POR PERÍODO';
    end;

    r_jogospadrao.LblDescricao2.Caption := 'Período selecionado: ' + dtini +
      ' e ' + dtfim;
    if relat = 1 then
    begin
      r_jogospadrao.Caption := 'Jogos por período contra adversário:  ' +
        f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
        r_jogospadrao.codauxiliar1);
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime,
        r_jogospadrao.codauxiliar1, '0');
      // definir título do formulário
    end
    else
    begin
      r_jogospadrao.Caption := 'Jogos por período';
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0', '0');
    end;

    // mostara a consulta finalizada
    r_jogospadrao.ShowModal;

  end;
end;

procedure Tf_gerais.relacaoTitulos(tipo: String; descricao: TLabel);
var
  i: Integer;
  cont: Integer;
  qryTitulos: TFDQuery;
  dtsTitulos: TDataSource;
  qryEstatTitulos: TFDQuery;
  dtsEstatTitulos: TDataSource;
  {
    =======================================================
    Relação Titulos
    =======================================================
  }
begin
  cont := 0;
  sql := 'select e.codcompeticao, c.nome, count(*) ' +
    'from es_titulos e, ca_compe c ' +
    'where e.codcompeticao = c.codcompeticao ' +
    'and c.tipocompeticao = :TIPOCOMPET ' + ' group by e.codcompeticao, c.nome '
    + 'order by count(*) desc, c.nome ';

  qryTitulos := TFDQuery.Create(nil);
  qryTitulos.Connection := FrmDm.BDMySQL;
  dtsTitulos := TDataSource.Create(nil);
  dtsTitulos.DataSet := qryTitulos;
  qryEstatTitulos := TFDQuery.Create(nil);
  qryEstatTitulos.Connection := FrmDm.BDMySQL;
  dtsEstatTitulos := TDataSource.Create(nil);
  dtsEstatTitulos.DataSet := qryEstatTitulos;

  qryTitulos.Close;
  qryTitulos.sql.Clear;
  qryTitulos.sql.Add(sql);
  qryTitulos.Params.ParamByName('TIPOCOMPET').AsString := tipo;
  qryTitulos.Open;
  qryTitulos.First;

  while not(qryTitulos.Eof) do
  begin

    descricao.Caption := descricao.Caption + qryTitulos.Fields[2].AsString + ' - '
      + qryTitulos.Fields[1].AsString;

    sql := 'select ano from es_titulos where codcompeticao = ' + qryTitulos.Fields
      [0].AsString;

    qryEstatTitulos.Close;
    qryEstatTitulos.sql.Clear;
    qryEstatTitulos.sql.Add(sql);
    qryEstatTitulos.Open;
    qryEstatTitulos.First;

    descricao.Caption := descricao.Caption + ' [ ';

    while not(qryEstatTitulos.Eof) do
    begin
      descricao.Caption := descricao.Caption + qryEstatTitulos.Fields[0].AsString;
      qryEstatTitulos.Next;
      cont := cont + 1;
      if qryEstatTitulos.Eof then
        descricao.Caption := descricao.Caption + ' ]' + #13 + #13
      else
        descricao.Caption := descricao.Caption + ', ';
    end;
    qryTitulos.Next;
  end;
  if tipo = 'N' then
    r_titulos.lblTitulosNacionais.Caption := 'Títulos Nacionais [' +
      IntToStr(cont) + ']'
  else
    r_titulos.lblTitulosInternacionais.Caption := 'Títulos Internacionais [' +
      IntToStr(cont) + ']';
end;

function Tf_gerais.idadeAtual(DataIni, DataFim: TDateTime): string;
var
  Idade: string;
  Resto: Integer;
  iDia, iMes, iAno, fDia, fMes, fAno: Word;
  nDia, nMes, nAno, DiaBissexto: Double;
  {
    =======================================================
    IDADEATUAL = FUNÇÃO QUE RETORNA A DIFERENÇA ENTRE DATAS
    NO PADRÃO ANO, DIAS, MESES EX: 7 ANOS, 5 MESES E 2 DIAS
    =======================================================
  }
begin
  DecodeDate(DataIni, iAno, iMes, iDia);
  DecodeDate(DataFim, fAno, fMes, fDia);
  nAno := fAno - iAno;

  if nAno > 0 then
    if fMes < iMes then
      nAno := nAno - 1
    else if (fMes = iMes) and (fDia < iDia) then
      nAno := nAno - 1;

  if fMes < iMes then
  begin
    nMes := 12 - (iMes - fMes);
    if fDia < iDia then
      nMes := nMes - 1;
  end
  else if fMes = iMes then
  begin
    nMes := 0;
    if fDia < iDia then
      nMes := 11;
  end
  else if fMes > iMes then
  begin
    nMes := fMes - iMes;
    if fDia < iDia then
      nMes := nMes - 1;
  end;
  nDia := 0;

  if fDia > iDia then
    nDia := fDia - iDia;
  if fDia < iDia then
    nDia := (DataFim - IncMonth(DataFim, -1)) - (iDia - fDia);
  Result := '';
  if nAno = 1 then
    Result := FloatToStr(nAno) + ' ano '
  else if nAno > 1 then
    Result := FloatToStr(nAno) + ' anos ';

  if nMes = 1 then
    Result := Result + FloatToStr(nMes) + ' mês '
  else if nMes > 1 then
    Result := Result + FloatToStr(nMes) + ' meses ';

  if nDia = 1 then
    Result := Result + FloatToStr(nDia) + ' dia '
  else if nDia > 1 then
    Result := Result + FloatToStr(nDia) + ' dias ';

end;

{
  =======================================================
  Preencher combo com dos estados
  =======================================================
}
procedure Tf_gerais.atualizarRival(codadver, erival: String);
begin
  sql := 'select count(*) from ca_rival where codadver = ' + codadver;
  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;

  if erival = '0' then
  begin
    if FrmDm.QrContador.Fields[0].AsInteger > 0 then
    begin
      sql := 'delete from ca_rival where codadver = ' + codadver;

      QrDisponivel.Close;
      QrDisponivel.sql.Clear;
      QrDisponivel.sql.Add(sql);
      QrDisponivel.ExecSQL;
    end;
  end;
  if erival = '1' then
  begin
    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      sql := 'insert into ca_rival values(' +
        IntToStr(f_gerais.novoCodigo('ca_rival', 'codrival')) + ', ' +
        codadver + ')';

      QrDisponivel.Close;
      QrDisponivel.sql.Clear;
      QrDisponivel.sql.Add(sql);
      QrDisponivel.ExecSQL;
    end;
  end;
end;

procedure Tf_gerais.infIniciais(qttemp, qtjogos, qtjogad, qttecn: TLabel);
begin
  // tecnicos
  sql := 'select count(*) from ca_jogad where codposicao in (6, 9)';
  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  qttecn.Caption := FormatFloat('#,###', FrmDm.QrContador.Fields[0].AsFloat);

  // jogadores
  sql := 'select count(*) from ca_jogad where codposicao not in (6, 9)';
  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  qtjogad.Caption := FormatFloat('#,###', FrmDm.QrContador.Fields[0].AsFloat);

  // jogos
  sql := 'select count(*) from ca_jogos';
  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  qtjogos.Caption := FormatFloat('#,###', FrmDm.QrContador.Fields[0].AsFloat);

  // temporadas
  sql := 'select count(*) from ( select ano, count(*) from es_resum group by ano ) as a';
  FrmDm.QrContador.Close;
  FrmDm.QrContador.sql.Clear;
  FrmDm.QrContador.sql.Add(sql);
  FrmDm.QrContador.Open;
  qttemp.Caption := FormatFloat('#,###', FrmDm.QrContador.Fields[0].AsFloat);
end;

{
  =======================================================
  Criptografar Senha
  =======================================================
}

function Tf_gerais.criptografarSenha(pwd: string): Integer;
var
  tamanho, i, x: Integer;
begin
  x := 0;
  tamanho := Length(pwd);
  // PEGA O NÚMERO DE CARACTERES DA VARIÁVEL PASSADA COMO PARÂMETRO
  for i := 1 to tamanho do // LOOP QUE VAI DE 1 AO TAMANHO DA VARIÁVEL
  begin // ESSE LOOP SOMA O VALOR ORDINAL DE CADA CARACTERE, ACUMULA NUMA VARIÁVEL
    x := x + ord(pwd[i]);
    // E POR FIM MULTIPLICA POR UM NÚMERO ALEATÓRIO, NO CASO 6.
  end;
  Result := x * tamanho * 6;
end;

{
  =======================================================
  Muda cor do componente
  =======================================================
}
procedure Tf_gerais.MudaCor(Evento: String; Componente: TObject);
begin
  if Evento = 'Entra' then
  begin
    if Componente is TDBEdit then
      (Componente as TDBEdit).Color := clGradientActiveCaption;
    if Componente is TEdit then
      (Componente as TEdit).Color := clGradientActiveCaption;
    if Componente is TDBLookupComboBox then
      (Componente as TDBLookupComboBox).Color := clGradientActiveCaption;

    // Coloca o restante dos componentes que vc quer que mude de cor

  end
  else
  begin
    if Componente is TDBEdit then
      (Componente as TDBEdit).Color := clWhite;
    if Componente is TEdit then
      (Componente as TEdit).Color := clWhite;
    if Componente is TDBLookupComboBox then
      (Componente as TDBLookupComboBox).Color := clWhite;

    // Idem

  end;
end;

{
  =======================================================
  Testar acessos do usuário
  =======================================================
}

procedure Tf_gerais.testaUsuario(cod: Integer);
begin
  if StrToInt(f_gerais.buscarNome('perfil', 'ca_user', 'codusuario',
    IntToStr(cod))) = 1 then
  begin
    FrmPrincipal.BtnCadJogos.Enabled := false;
    FrmPrincipal.BtnBackup.Enabled := true;
    FrmPrincipal.BtnCadClubes.Enabled := false;
    FrmPrincipal.BtnCadTitulos.Enabled := false;
    FrmPrincipal.BtnCadEstadios.Enabled := false;
    FrmPrincipal.BtnCadJogadores.Enabled := false;
    FrmPrincipal.BtnCadTitulos.Enabled := false;
    FrmPrincipal.BtnCadArbitros.Enabled := false;
    FrmPrincipal.MnCadastro.Enabled := false;
    FrmPrincipal.MnEditar.Enabled := false;
  end
  else
  begin
    FrmPrincipal.BtnCadJogos.Enabled := true;
    FrmPrincipal.BtnBackup.Enabled := true;
    FrmPrincipal.BtnCadClubes.Enabled := true;
    FrmPrincipal.BtnCadTitulos.Enabled := true;
    FrmPrincipal.BtnCadEstadios.Enabled := true;
    FrmPrincipal.BtnCadJogadores.Enabled := true;
    FrmPrincipal.BtnCadTitulos.Enabled := true;
    FrmPrincipal.BtnCadArbitros.Enabled := true;
    FrmPrincipal.MnCadastro.Enabled := true;
    FrmPrincipal.MnEditar.Enabled := true;
  end;
end;

{
  =======================================================
  Contador de títulos
  =======================================================
}
procedure Tf_gerais.qtdeDeTitulos(titulos, descultimotit: TLabel);
var
  qtde, primeiro, ultimo, descultimo: String;
begin

  // Total de títulos
  sql := 'select count(*) from es_titulos';
  QrTitulos.Close;
  QrTitulos.sql.Clear;
  QrTitulos.sql.Add(sql);
  QrTitulos.Open;
  qtde := QrTitulos.Fields[0].AsString;

  // primeiro título
  sql := 'select ano from es_titulos order by ano limit 1 offset 0';
  QrTitulos.Close;
  QrTitulos.sql.Clear;
  QrTitulos.sql.Add(sql);
  QrTitulos.Open;
  primeiro := QrTitulos.Fields[0].AsString;

  // ultimo título
  sql := 'select ano from es_titulos order by ano desc limit 1 offset 0';
  QrTitulos.Close;
  QrTitulos.sql.Clear;
  QrTitulos.sql.Add(sql);
  QrTitulos.Open;
  ultimo := QrTitulos.Fields[0].AsString;

  // descrição do ultimo título
  sql := 'select c.nome, e.ano ' + 'from es_titulos e, ca_jogos j, ca_compe c '
    + 'where e.ano = j.temporada ' +
    'and e.codcompeticao = j.codcompeticao ' +
    'and e.codcompeticao = c.codcompeticao ' + 'order by j.data desc ' +
    'limit 1 offset 0';

  QrTitulos.Close;
  QrTitulos.sql.Clear;
  QrTitulos.sql.Add(sql);
  QrTitulos.Open;
  descultimo := AnsiUpperCase(QrTitulos.Fields[0].AsString) + ' ( ' +
    QrTitulos.Fields[1].AsString + ' )';

  if StrToInt(qtde) > 1 then
  begin
    titulos.Caption := qtde + ' títulos conquistados entre ' + primeiro +
      ' e ' + ultimo;
    descultimotit.Caption := 'Último título conquistado: ' + descultimo;
  end
  else
  begin
    if StrToInt(qtde) = 1 then
      titulos.Caption := qtde + ' título conquistado em ' + primeiro
    else
    begin
      titulos.Caption := 'Nenhum título conquistado';
      descultimotit.Caption := ' ';
    end;
  end;

end;

procedure Tf_gerais.ultimoBackup(tempo: TLabel);
var
  sql: String;
  {
    =======================================================
    Ultimo backup realizado
    =======================================================
  }
begin
  sql := 'select count(*) from ca_backup where tipo = :TIPO order by data desc limit 1';
  FrmDm.QrBackup.Close;
  FrmDm.QrBackup.sql.Clear;
  FrmDm.QrBackup.sql.Add(sql);
  FrmDm.QrBackup.Params.ParamByName('TIPO').AsString := 'B';
  FrmDm.QrBackup.Open;

  if FrmDm.QrBackup.Fields[0].AsInteger = 0 then
    tempo.Caption := 'ÚLTIMO BACKUP REALIZADO: NUNCA'
  else
  begin
    sql := 'select data from ca_backup where tipo = :TIPO order by data desc limit 1';
    FrmDm.QrBackup.Close;
    FrmDm.QrBackup.sql.Clear;
    FrmDm.QrBackup.sql.Add(sql);
    FrmDm.QrBackup.Params.ParamByName('TIPO').AsString := 'B';
    FrmDm.QrBackup.Open;

    if FrmDm.QrBackup.Fields[0].AsString = DateToStr(now) then
      tempo.Caption := 'ÚLTIMO BACKUP REALIZADO: ' + FrmDm.QrBackup.Fields[0]
        .AsString + ' ( HOJE )'
    else
      tempo.Caption := 'ÚLTIMO BACKUP REALIZADO: ' + FrmDm.QrBackup.Fields[0]
        .AsString + ' ( ' + f_gerais.idadeAtual
        (FrmDm.QrBackup.Fields[0].AsDateTime, now) + ' )';

  end;

end;

end.
