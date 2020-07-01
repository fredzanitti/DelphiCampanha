unit selecionauf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  Th_uf = class(TForm)
    BtnGravar: TBitBtn;
    CbxUfs: TComboBox;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    ImgBand: TImage;
    procedure FormActivate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CbxUfsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_uf: Th_uf;
  i, cont: integer;
  coduf, msg: String;

implementation

{$R *.dfm}

uses funcoes, module, telapadraojogos;

procedure Th_uf.BtnGravarClick(Sender: TObject);
begin

  coduf := f_gerais.buscarNome('coduf', 'ca_uf', 'sigla', CbxUfs.Text);

  // ==========================================================================
  // Pesquisa quando acionada pelo Jogos / Por Um Adversário
  // ==========================================================================
  if identificacao = 'MnJogosUf' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '21';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r, ca_adver a, ca_cidad c, ca_pais p, ca_uf u ' +
      'where r.codadver = a.codadver ' + 'and a.codcidade = c.codcidade ' +
      'and c.codpais = p.codpais ' + 'and c.coduf = u.coduf ' +
      'and u.coduf = ' + coduf;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'O ' + f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0') +
        ' não disputou nenhum jogo ' + #13 + 'contra clubes do estado do(e) ' +
        f_gerais.buscarNome('nome', 'ca_uf', 'coduf', coduf);
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
        'and a.codcidade = c.codcidade ' +
        'and a.codadver <> 0 ' + 'and c.codpais = p.codpais ' +
        'and c.coduf = u.coduf ' + 'and u.coduf = ' + coduf +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := coduf;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'JOGOS CONTRA ADVERSÁRIOS';
      r_jogospadrao.LblDescricao2.Caption := 'Do estado do(e): ' +
        f_gerais.buscarNome('nome', 'ca_uf', 'coduf', coduf);
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0', '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Jogos contra rivais do(e) ' + CbxUfs.Text;
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;
{  if FrmDm.QrContador.Fields[0].AsInteger > 0 then
    h_uf.Close;}
end;

procedure Th_uf.CbxUfsChange(Sender: TObject);
begin
  f_gerais.buscaImagem(ImgBand, f_gerais.buscarNome('bandeira', 'ca_uf',
    'sigla', CbxUfs.Text));
end;

procedure Th_uf.FormActivate(Sender: TObject);
begin
  f_gerais.preencherComboUf(CbxUfs);
  f_gerais.buscaImagem(ImgBand, f_gerais.buscarNome('bandeira', 'ca_uf',
    'sigla', CbxUfs.Text));
end;

procedure Th_uf.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_uf.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

end.
