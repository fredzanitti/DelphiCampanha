unit selecionaperiodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  Th_periodo = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    BtnGravar: TBitBtn;
    DtInicial: TDateTimePicker;
    DtFinal: TDateTimePicker;
    Label2: TLabel;
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_periodo: Th_periodo;
  sql, msg: String;

implementation

{$R *.dfm}

uses telapadraojogos, module, funcoes;

procedure Th_periodo.BtnGravarClick(Sender: TObject);
var
  i, cont: integer;
begin
  if DtFinal.Date < DtInicial.Date then
  begin
    Application.MessageBox('A data final não pode ser menor que a data inicial',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    DtFinal.SetFocus;
  end
  else
  begin
    // ==========================================================================
    // Pesquisa quando acionada pelo Jogos / Adversário por período
    // ==========================================================================

    if identificacao = 'MnAdversario4' then
    begin
      // guardar o número do forumlário na label
      r_jogospadrao.numerorelatorio := '10';

      // contar a quantidade de registros retornados na pesquisa
      sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
        + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
        'and r.codadver = ' + r_jogospadrao.codauxiliar1 +
        ' and j.data between :DATAINI and :DATAFIM';

      FrmDm.QrContador.Close;
      FrmDm.QrContador.sql.Clear;
      FrmDm.QrContador.sql.Add(sql);
      FrmDm.QrContador.Params.ParamByName('DATAINI').AsDate := DtInicial.Date;
      FrmDm.QrContador.Params.ParamByName('DATAFIM').AsDate := DtFinal.Date;
      FrmDm.QrContador.Open;
      FrmDm.QrContador.First;

      if FrmDm.QrContador.Fields[0].AsInteger = 0 then
      begin
        msg := 'Não há nenhum jogo cadastrado ' + #13 +
          'contra este adversário no período selecionado';
        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
          MB_OK + MB_ICONINFORMATION);
      end
      else
      begin

        r_jogospadrao.codauxiliar2 := DateToStr(DtInicial.Date);
        r_jogospadrao.codauxiliar3 := DateToStr(DtFinal.Date);

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
          r_jogospadrao.codauxiliar1 +
          ' and data between :DATAINI and :DATAFIM ' + 'union ' +
          'select codjogo, data, codadvermand, placar1, placar2, codadvervisit, codestadio, codcompeticao, publico '
          + 'from ca_jogos ' + 'where codadvervisit = ' +
          r_jogospadrao.codauxiliar1 +
          ' and data between :DATAINI and :DATAFIM ' + 'order by data desc ' +
          'limit :LIMITE offset :CORTE';

        // função para preencher a tela padrão com os resultados da sql acima
        f_gerais.preenchimentoTelaPadraoJogos(sql, 0, 10);

        // títulos e descrição do relatório
        r_jogospadrao.LblDescricao1.Caption := 'JOGOS CONTRA: ' +
          AnsiUpperCase(f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
          r_jogospadrao.codauxiliar1));
        r_jogospadrao.LblDescricao2.Caption := 'Período selecionado: ' +
          DateToStr(DtInicial.Date) + ' e ' + DateToStr(DtFinal.Date);
        // buscar escudo do seu time
        f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime,
          r_jogospadrao.codauxiliar1);
        // definir título do formulário
        r_jogospadrao.Caption := 'Jogos por período contra adversário:  ' +
          f_gerais.buscarNome('nome', 'ca_adver', 'codadver',
          r_jogospadrao.codauxiliar1);
        // mostara a consulta finalizada
        r_jogospadrao.ShowModal;
      end;
    end;

    // ==========================================================================
    // Pesquisa quando acionada pelo Jogos / Jogos por período
    // ==========================================================================

    if identificacao = 'MnJogosPeriodo' then
    begin
      // guardar o número do forumlário na label
      r_jogospadrao.numerorelatorio := '23';

      // contar a quantidade de registros retornados na pesquisa
      sql := 'select sum(r.j), sum(r.v), sum(r.e), sum(r.d), sum(r.gp), sum(r.gc), sum(r.sg) '
        + 'from es_resum r, ca_jogos j ' + 'where r.codjogo = j.codjogo ' +
        ' and j.data between :DATAINI and :DATAFIM';

      FrmDm.QrContador.Close;
      FrmDm.QrContador.sql.Clear;
      FrmDm.QrContador.sql.Add(sql);
      FrmDm.QrContador.Params.ParamByName('DATAINI').AsDate := DtInicial.Date;
      FrmDm.QrContador.Params.ParamByName('DATAFIM').AsDate := DtFinal.Date;
      FrmDm.QrContador.Open;
      FrmDm.QrContador.First;

      if FrmDm.QrContador.Fields[0].AsInteger = 0 then
      begin
        msg := 'Não há nenhum jogo disputado ' + #13 +
          'neste período selecionado';
        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
          MB_OK + MB_ICONINFORMATION);
      end
      else
      begin

        r_jogospadrao.codauxiliar2 := DateToStr(DtInicial.Date);
        r_jogospadrao.codauxiliar3 := DateToStr(DtFinal.Date);

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
        r_jogospadrao.LblDescricao1.Caption := 'JOGOS DISPUTADOS NUM PERÍODO';
        r_jogospadrao.LblDescricao2.Caption := 'Período selecionado: ' +
          DateToStr(DtInicial.Date) + ' e ' + DateToStr(DtFinal.Date);
        // buscar escudo do seu time
        f_gerais.buscaImagemPorCodigo(r_jogospadrao.ImgEscudoSeutime, '0');
        // definir título do formulário
        r_jogospadrao.Caption := 'Jogos disputados por período';;
        // mostara a consulta finalizada
        r_jogospadrao.ShowModal;
      end;
    end;

    h_periodo.Close;
  end;
end;

procedure Th_periodo.FormActivate(Sender: TObject);
begin
  DtInicial.SetFocus;
end;

procedure Th_periodo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_periodo.Close;
      end;
    VK_RETURN:
      begin
        BtnGravarClick(Self);
      end;
  end;
end;

end.
