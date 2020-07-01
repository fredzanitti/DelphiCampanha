unit selecionapais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Th_pais = class(TForm)
    CbxPais: TComboBox;
    BtnGravar: TBitBtn;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    ImgBand: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure CbxPaisChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_pais: Th_pais;
  i, cont: integer;
  codpais, msg: String;

implementation

{$R *.dfm}

uses module, funcoes, telapadraojogos;

procedure Th_pais.BtnGravarClick(Sender: TObject);
begin

  codpais := f_gerais.buscarNome('codpais', 'ca_pais', 'sigla',
    copy(CbxPais.Text, 1, 3));

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Por País
  // ==========================================================================

  if identificacao = 'MnJogosPais' then
  begin
    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '22';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, ca_adver a, ca_cidad c, ca_pais p, ca_uf u ' +
      'where r.codadver = a.codadver ' + 'and a.codcidade = c.codcidade ' +
      'and c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' +
      'and p.codpais = ' + codpais;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0') +
        ' não disputou nenhum jogo ' + #13 + 'contra clubes da(o) ' +
        f_gerais.buscarNome('nome', 'ca_pais', 'codpais', codpais);
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
        + 'from ca_jogos j, ca_adver a, ca_cidad c, ca_pais p, ca_uf u ' +
        'where (j.codadvermand = a.codadver or j.codadvervisit = codadver) ' +
        'and a.codcidade = c.codcidade ' + 'and c.codpais = p.codpais ' +
        'and c.coduf = u.coduf ' + 'and p.codpais = ' + codpais +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := codpais;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS CONTRA ADVERSÁRIOS';
      r_jogospadrao.LblDescricao2.Caption := 'Da(o): ' +
        f_gerais.buscarNome('nome', 'ca_pais', 'codpais', codpais);
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0', '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Jogos contra rivais da(o) ' +
        f_gerais.buscarNome('nome', 'ca_pais', 'codpais', codpais);
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;
{ if FrmDm.QrContador.Fields[0].AsInteger > 0 then
    h_pais.Close;}
end;

procedure Th_pais.CbxPaisChange(Sender: TObject);
begin
  f_gerais.buscaImagem(ImgBand, f_gerais.buscarNome('bandeira', 'ca_pais',
    'sigla', copy(CbxPais.Text, 1, 3)));
end;

procedure Th_pais.FormActivate(Sender: TObject);
begin
  f_gerais.preencherComboPais(CbxPais);
  f_gerais.buscaImagem(ImgBand, f_gerais.buscarNome('bandeira', 'ca_pais',
    'sigla', copy(CbxPais.Text, 1, 3)));
end;

procedure Th_pais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_pais.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

end.
