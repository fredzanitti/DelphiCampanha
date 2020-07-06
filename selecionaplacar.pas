unit selecionaplacar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  dxGDIPlusClasses, Vcl.ExtCtrls;

type
  Th_placar = class(TForm)
    Shape2: TShape;
    ImgEscudoSeutime: TImage;
    Shape1: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Image1: TImage;
    Label1: TLabel;
    EdtPlacar1: TEdit;
    EdtPlacar2: TEdit;
    Label2: TLabel;
    BtnGravar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_placar: Th_placar;
  i, cont: integer;
  msg, sql: String;

implementation

{$R *.dfm}

uses funcoes, module, telapadraojogos;

procedure Th_placar.BtnGravarClick(Sender: TObject);
begin
  if EdtPlacar1.Text = EmptyStr then
    EdtPlacar1.Text := '0';
  if EdtPlacar2.Text = EmptyStr then
    EdtPlacar2.Text := '0';

  // ==========================================================================
  // Jogos por placar
  // ==========================================================================

  if identificacao = 'MnPlacar' then
  begin

    // guardar o número do forumlário na label
    r_jogospadrao.numerorelatorio := '24';

    // contar a quantidade de registros retornados na pesquisa
    sql := 'select sum(r.j) j, sum(r.v) v, sum(r.e) e, sum(r.d) d, sum(r.gp) gp, sum(r.gc) gc, sum(r.sg) sg '
      + 'from es_resum r ' + 'where r.gp = ' + EdtPlacar1.Text + ' and r.gc = '
      + EdtPlacar2.Text;

    FrmDm.QrContador.Close;
    FrmDm.QrContador.sql.Clear;
    FrmDm.QrContador.sql.Add(sql);
    FrmDm.QrContador.Open;
    FrmDm.QrContador.First;

    if FrmDm.QrContador.Fields[0].AsInteger = 0 then
    begin
      msg := 'Não houve nenhum jogo onde o placar de ' + #13 + EdtPlacar1.Text +
        'x' + EdtPlacar2.Text + ' foi registrado.';
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
      sql := 'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codadvermand = "0" ' + 'and placar1 = ' +
        EdtPlacar1.Text + ' and placar2 = ' + EdtPlacar2.Text + ' union ' +
        'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
        + 'from ca_jogos ' + 'where codadvervisit = "0" ' + 'and placar1 = ' +
        EdtPlacar2.Text + ' and placar2 = ' + EdtPlacar1.Text +
        ' order by data desc ' + 'limit :LIMITE offset :CORTE';

      // função para preencher a tela padrão com os resultados da sql acima
      f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

      r_jogospadrao.codauxiliar1 := EdtPlacar1.Text;
      r_jogospadrao.codauxiliar2 := EdtPlacar2.Text;
      // títulos e descrição do relatório
      r_jogospadrao.LblDescricao1.Caption := 'RELAÇÃO DE JOGOS POR PLACAR';
      r_jogospadrao.LblDescricao2.Caption := 'Placar pesquisado: ' +
        EdtPlacar1.Text + ' x ' + EdtPlacar2.Text;
      // buscar escudo do seu time
      f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0', '0');
      // definir título do formulário
      r_jogospadrao.Caption := 'Jogos por Placar)';
      // mostara a consulta finalizada
      r_jogospadrao.ShowModal;
    end;
  end;
end;

procedure Th_placar.FormActivate(Sender: TObject);
begin
  EdtPlacar1.Text := EmptyStr;
  EdtPlacar2.Text := EmptyStr;
  EdtPlacar1.SetFocus;
end;

procedure Th_placar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_placar.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

end.
