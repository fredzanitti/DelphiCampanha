unit h_mes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, DateUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  Th_meses = class(TForm)
    BtnGravar: TBitBtn;
    CbxMeses: TComboBox;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    origem: string;

  end;

var
  h_meses: Th_meses;

implementation

{$R *.dfm}

uses funcoes, telapadraojogos, module;

procedure Th_meses.BtnGravarClick(Sender: TObject);
var
  dia, mes, ano, data, msg: string;
  DtInicial, DtFinal, NomeMes: string;
  cont, i: integer;
begin
  if CbxMeses.Text = EmptyStr then
  begin
    msg := 'Nenhum mês selecionado!';
    Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    dia := '01';
    ano := FormatDateTime('yyyy', now);

    case CbxMeses.ItemIndex of
      1:
        mes := '01';
      2:
        mes := '02';
      3:
        mes := '03';
      4:
        mes := '04';
      5:
        mes := '05';
      6:
        mes := '06';
      7:
        mes := '07';
      8:
        mes := '08';
      9:
        mes := '09';
      10:
        mes := '10';
      11:
        mes := '11';
      12:
        mes := '12';
    end;

    data := dia + '/' + mes + '/' + ano;
    DtInicial := DateToStr(StartOfTheMonth(StrToDate(data)));
    DtFinal := DateToStr(EndOfTheMonth(StrToDate(data)));
    NomeMes := CbxMeses.Text;

    if origem = 'MnMesAno' then
    begin
      // guardar o número do forumlário na label
      r_jogospadrao.numerorelatorio := '37';

      // contar a quantidade de registros retornados na pesquisa
      sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
        + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
        ' and j.data between :DATAINI and :DATAFIM';

      FrmDm.QrContador.Close;
      FrmDm.QrContador.sql.Clear;
      FrmDm.QrContador.sql.Add(sql);
      FrmDm.QrContador.Params.ParamByName('DATAINI').AsDate :=
        StrToDate(DtInicial);
      FrmDm.QrContador.Params.ParamByName('DATAFIM').AsDate :=
        StrToDate(DtFinal);
      FrmDm.QrContador.Open;
      FrmDm.QrContador.First;

      if FrmDm.QrContador.Fields[0].AsInteger = 0 then
      begin
        msg := 'O  ' + f_gerais.buscarNome('nome', 'ca_adver', 'codadver', '0')
          + ' ainda não disputou' + #13 + 'nenhuma partida no mês de ' + NomeMes
          + ' de ' + ano;
        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
          MB_OK + MB_ICONINFORMATION);
      end
      else
      begin

        r_jogospadrao.codauxiliar2 := DtInicial;
        r_jogospadrao.codauxiliar3 := DtFinal;

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
          + 'from ca_jogos ' + 'where data between :DATAINI and :DATAFIM ' +
          'order by data desc ' + 'limit :LIMITE offset :CORTE';

        // função para preencher a tela padrão com os resultados da sql acima
        f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

        // títulos e descrição do relatório
        r_jogospadrao.LblDescricao1.Caption := 'JOGOS DISPUTADOS - POR MÊS';
        r_jogospadrao.LblDescricao2.Caption :=
          'Todos os jogos disputados no mês de ' + NomeMes + ' de ' + ano;
        // buscar escudo do seu time
        f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0', '0');
        // definir título do formulário
        r_jogospadrao.Caption := 'Jogos disputados por mês';
        // mostara a consulta finalizada
        r_jogospadrao.ShowModal;
      end;

    end;
  end;
end;

procedure Th_meses.FormActivate(Sender: TObject);
begin
  CbxMeses.Items.Add('Janeiro');
  CbxMeses.Items.Add('Fevereiro');
  CbxMeses.Items.Add('Março');
  CbxMeses.Items.Add('Abril');
  CbxMeses.Items.Add('Maio');
  CbxMeses.Items.Add('Junho');
  CbxMeses.Items.Add('Julho');
  CbxMeses.Items.Add('Agosto');
  CbxMeses.Items.Add('Setembro');
  CbxMeses.Items.Add('Outubro');
  CbxMeses.Items.Add('Novembro');
  CbxMeses.Items.Add('Dezembro');
end;

procedure Th_meses.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_meses.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

end.
