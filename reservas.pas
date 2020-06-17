unit reservas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, jpeg, Vcl.Buttons, Vcl.ExtDlgs, Vcl.Menus, Vcl.ComCtrls,
  ShellApi, Vcl.Grids, Vcl.DBGrids;

type
  Th_substituicoes = class(TForm)
    DbGridAsubstituir: TDBGrid;
    Label4: TLabel;
    DbGridDisponiveis: TDBGrid;
    Label1: TLabel;
    BtnSubstituir: TBitBtn;
    GroupBox1: TGroupBox;
    LlbJogador: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    LblNome1: TLabel;
    LblCodigo1: TLabel;
    LblNome2: TLabel;
    LblCodigo2: TLabel;
    LblSeq1: TLabel;
    LblSeq2: TLabel;
    LblNome3: TLabel;
    LblCodigo3: TLabel;
    LblSeq3: TLabel;
    LblNome4: TLabel;
    LblCodigo4: TLabel;
    LblNome5: TLabel;
    LblCodigo5: TLabel;
    LblSeq4: TLabel;
    LblSeq5: TLabel;
    LblNome6: TLabel;
    LblCodigo6: TLabel;
    LblSeq6: TLabel;
    LblNome7: TLabel;
    LblCodigo7: TLabel;
    LblNome8: TLabel;
    LblCodigo8: TLabel;
    LblSeq7: TLabel;
    LblSeq8: TLabel;
    LblNome9: TLabel;
    LblCodigo9: TLabel;
    LblSeq9: TLabel;
    LblNome10: TLabel;
    LblCodigo10: TLabel;
    LblNome11: TLabel;
    LblCodigo11: TLabel;
    LblSeq10: TLabel;
    LblSeq11: TLabel;
    CbCa1: TCheckBox;
    CbCv1: TCheckBox;
    CbxGols1: TComboBox;
    CbCa2: TCheckBox;
    CbCv2: TCheckBox;
    CbxGols2: TComboBox;
    CbCa3: TCheckBox;
    CbCv3: TCheckBox;
    CbxGols3: TComboBox;
    CbCa4: TCheckBox;
    CbCv4: TCheckBox;
    CbxGols4: TComboBox;
    CbCa5: TCheckBox;
    CbCv5: TCheckBox;
    CbxGols5: TComboBox;
    CbCa6: TCheckBox;
    CbCv6: TCheckBox;
    CbxGols6: TComboBox;
    CbCa7: TCheckBox;
    CbCv7: TCheckBox;
    CbxGols7: TComboBox;
    CbCa8: TCheckBox;
    CbCv8: TCheckBox;
    CbxGols8: TComboBox;
    CbCa9: TCheckBox;
    CbCv9: TCheckBox;
    CbxGols9: TComboBox;
    CbCa10: TCheckBox;
    CbCv10: TCheckBox;
    CbxGols10: TComboBox;
    CbCa11: TCheckBox;
    CbCv11: TCheckBox;
    CbxGols11: TComboBox;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    LblCodEntrou1: TLabel;
    LblCodEntrou10: TLabel;
    LblCodEntrou11: TLabel;
    LblCodEntrou2: TLabel;
    LblCodEntrou3: TLabel;
    LblCodEntrou4: TLabel;
    LblCodEntrou5: TLabel;
    LblCodEntrou6: TLabel;
    LblCodEntrou7: TLabel;
    LblCodEntrou8: TLabel;
    LblCodEntrou9: TLabel;
    LblEntrou10: TLabel;
    LblEntrou11: TLabel;
    LblEntrou2: TLabel;
    LblEntrou3: TLabel;
    LblEntrou4: TLabel;
    LblEntrou5: TLabel;
    LblEntrou6: TLabel;
    LblEntrou7: TLabel;
    LblEntrou8: TLabel;
    LblEntrou9: TLabel;
    LblEntrou1: TLabel;
    Label6: TLabel;
    BtnEliminarUltimo: TBitBtn;
    BtnDesbloqJogador: TBitBtn;
    BtnIncluir: TBitBtn;
    EdtPesquisa: TEdit;
    qrySubstituicoes: TFDQuery;
    qrySubstituicoescodjogo: TIntegerField;
    qrySubstituicoescodJogadorEntrou: TIntegerField;
    qrySubstituicoesnomeJogadorEntrou: TWideStringField;
    qrySubstituicoescodjogadorsaiu: TIntegerField;
    qrySubstituicoesnomeJogadorSaiu: TWideStringField;
    qrySubstituicoesgols: TIntegerField;
    qrySubstituicoescamarelo: TIntegerField;
    qrySubstituicoescvermelho: TIntegerField;
    procedure DbGridAsubstituirCellClick(Column: TColumn);
    procedure DbGridDisponiveisCellClick(Column: TColumn);
    procedure BtnSubstituirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnEliminarUltimoClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnDesbloqJogadorClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGridAsubstituirDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DbGridDisponiveisDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoJogo: Integer;
    function sequenciaMaxima(): Integer;
    procedure substitutosJaInclusos;
  end;

var
  h_substituicoes: Th_substituicoes;
  entrou, saiu: Integer;

implementation

{$R *.dfm}

uses funcoes, jogos, module, liberarjogador, jogadores, home;

procedure Th_substituicoes.BtnDesbloqJogadorClick(Sender: TObject);
begin
  f_gerais.liberaJogadores('TODOS');
  h_liberarjogador.ShowModal;
end;

procedure Th_substituicoes.substitutosJaInclusos;
var
  item: Integer;
begin
  item := 1;
  if qrySubstituicoes.Active then
    qrySubstituicoes.Close;
  qrySubstituicoes.Params.ParamByName('CodigoJogo').DataType := ftInteger;
  qrySubstituicoes.Params.ParamByName('CodigoJogo').Value := CodigoJogo;
  qrySubstituicoes.Open;
  qrySubstituicoes.First;
  if qrySubstituicoes.RecordCount > 0 then
  begin
    while not qrySubstituicoes.Eof do
    begin
      (TLabel(FindComponent('LblCodigo' + IntToStr(item)))).Caption :=
        qrySubstituicoescodjogadorsaiu.AsString;
      (TLabel(FindComponent('LblNome' + IntToStr(item)))).Caption :=
        qrySubstituicoesnomeJogadorSaiu.Value;
      (TLabel(FindComponent('LblNome' + IntToStr(item)))).Visible := True;

      (TLabel(FindComponent('LblCodEntrou' + IntToStr(item)))).Caption :=
        qrySubstituicoescodJogadorEntrou.AsString;
      (TLabel(FindComponent('LblEntrou' + IntToStr(item)))).Caption :=
        qrySubstituicoesnomeJogadorEntrou.Value;
      (TLabel(FindComponent('LblEntrou' + IntToStr(item)))).Visible := True;

      (TComboBox(FindComponent('CbxGols' + IntToStr(item)))).ItemIndex :=
        qrySubstituicoesgols.Value;
      (TComboBox(FindComponent('CbxGols' + IntToStr(item)))).Visible := True;

      if qrySubstituicoescamarelo.Value = 0 then
        (TCheckBox(FindComponent('CbCa' + IntToStr(item)))).Checked := false
      else
        (TCheckBox(FindComponent('CbCa' + IntToStr(item)))).Checked := True;
      (TCheckBox(FindComponent('CbCa' + IntToStr(item)))).Visible := True;

      if qrySubstituicoescvermelho.Value = 0 then
        (TCheckBox(FindComponent('CbCv' + IntToStr(item)))).Checked := false
      else
        (TCheckBox(FindComponent('CbCv' + IntToStr(item)))).Checked := True;
      (TCheckBox(FindComponent('CbCv' + IntToStr(item)))).Visible := True;

      (TLabel(FindComponent('LblSeq' + IntToStr(item)))).Caption := IntToStr(item);

      qrySubstituicoes.Next;
      Inc(item);
    end;
  end;
end;

procedure Th_substituicoes.BtnCancelarClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 11 do
  begin
    if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
    begin
      if (FindComponent('LblCodEntrou' + IntToStr(i)) as TLabel).Caption <> '0'
      then
        f_gerais.deletarReservas(CA_JOGOS.EdtCodigo.Text,
          (FindComponent('LblCodEntrou' + IntToStr(i)) as TLabel).Caption);
    end;
  end;
  f_gerais.limpaTelaJogadoresNosJogos(11);
  if FrmDm.DtsJogos.DataSet.State in [dsInsert] then
    f_gerais.deletarTitularesOuReservas('ES_RESER', CA_JOGOS.EdtCodigo.Text);
  h_substituicoes.Close;
end;

procedure Th_substituicoes.BtnEliminarUltimoClick(Sender: TObject);
var
  i, ultimo: Integer;
begin
  ultimo := 0;
  for i := 1 to 11 do
  begin
    if (FindComponent('LblSeq' + IntToStr(i)) as TLabel).Caption <> '0' then
      ultimo := i;
  end;

  if ultimo > 0 then
  begin
    f_gerais.deletarReservas(CA_JOGOS.EdtCodigo.Text,
      (FindComponent('LblCodEntrou' + IntToStr(ultimo)) as TLabel).Caption);

    (FindComponent('LblSeq' + IntToStr(ultimo)) as TLabel).Caption := '0';
    (FindComponent('LblCodigo' + IntToStr(ultimo)) as TLabel).Caption
      := EmptyStr;
    (FindComponent('LblNome' + IntToStr(ultimo)) as TLabel).Visible := false;
    (FindComponent('LblEntrou' + IntToStr(ultimo)) as TLabel).Visible := false;
    (FindComponent('LblCodEntrou' + IntToStr(ultimo)) as TLabel).Caption
      := EmptyStr;
    (FindComponent('CbxGols' + IntToStr(ultimo)) as TComboBox).Visible := false;
    (FindComponent('CbCa' + IntToStr(ultimo)) as TCheckBox).Visible := false;
    (FindComponent('CbCv' + IntToStr(ultimo)) as TCheckBox).Visible := false;

    f_gerais.jogadoresASubstituir(h_substituicoes.DbGridAsubstituir,
      CA_JOGOS.EdtCodigo.Text);
  end;
end;

procedure Th_substituicoes.BtnGravarClick(Sender: TObject);
var
  coditem, codjogador, codjogo, codjogadorsaiu, ca, cv, gols, anojogo, v, e, d,
    i: Integer;
  houvesubstituicao: boolean;
  msg: String;
begin
  houvesubstituicao := false;
  for i := 1 to 11 do
  begin
    if (FindComponent('LblSeq' + IntToStr(i)) as TLabel).Caption <> '0' then
      houvesubstituicao := True;
  end;

  if houvesubstituicao then
  begin
    codjogo := StrToInt(CA_JOGOS.EdtCodigo.Text);

    for i := 1 to 11 do
    begin
      if TLabel(FindComponent('LblCodEntrou' + IntToStr(i))).Caption <> EmptyStr
      then
      begin
        coditem := f_gerais.novoCodigo('ES_RESER', 'coditem');
        codjogador := StrToInt(TLabel(FindComponent('LblCodEntrou' + IntToStr(i)
          )).Caption);
        codjogadorsaiu :=
          StrToInt(TLabel(FindComponent('LblCodigo' + IntToStr(i))).Caption);

        // gols
        if TComboBox(FindComponent('CbxGols' + IntToStr(i))).Text = EmptyStr
        then
          gols := 0
        else
          gols := StrToInt
            (TComboBox(FindComponent('CbxGols' + IntToStr(i))).Text);
        // cartões amarelos
        if TCheckBox(FindComponent('CbCa' + IntToStr(i))).Checked then
          ca := 1
        else
          ca := 0;
        // cartões vermelhos
        if TCheckBox(FindComponent('CbCv' + IntToStr(i))).Checked then
          cv := 1
        else
          cv := 0;

        // inserir os dados na tabela ES_RESER
        sql := 'update es_reser ' +
          'set camarelo = :CARTAOAMARELO, cvermelho = :CARTAOVERMELHO, gols = :GOLSMARC '
          + 'where codjogo = :CODIGODOJOGO ' +
          'and codjogador = :CODIGODOJOGADOR';

        FrmDm.QrGeral.Close;
        FrmDm.QrGeral.sql.Clear;
        FrmDm.QrGeral.sql.Add(sql);
        FrmDm.QrGeral.Params.ParamByName('CODIGODOJOGADOR').AsInteger :=
          codjogador;
        FrmDm.QrGeral.Params.ParamByName('CODIGODOJOGO').AsInteger := codjogo;
        FrmDm.QrGeral.Params.ParamByName('CARTAOAMARELO').AsInteger := ca;
        FrmDm.QrGeral.Params.ParamByName('CARTAOVERMELHO').AsInteger := cv;
        FrmDm.QrGeral.Params.ParamByName('GOLSMARC').AsInteger := gols;
        FrmDm.QrGeral.ExecSQL;
      end;
    end;
    f_gerais.preencherGridReservas(CA_JOGOS.DbGridReservas,
      CA_JOGOS.EdtCodigo.Text);

    CA_JOGOS.estadoDosBotoesdeJogadores();
    h_substituicoes.Close;
  end
  else
  begin
    msg := 'Não há nenhuma substituição efetivada. ' + #13 +
      'Selecione um jogador no primeiro painel para ser substituído ' + #13 +
      'depois selecione um jogador no segundo painel para' + #13 +
      'substituir o jogador do primeiro painel.';
    Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONERROR);
  end;
end;

procedure Th_substituicoes.BtnIncluirClick(Sender: TObject);
begin
  CA_JOGAD.ShowModal;
end;

procedure Th_substituicoes.BtnSubstituirClick(Sender: TObject);
var
  coditem, codjogador, codjogo, codjogadorsaiu, ca, cv, gols, anojogo, v, e, d,
    i, maximo: Integer;
  ano, mes, dia: Word;
  msg: String;
  verificacao: boolean;
begin
  if (saiu = 0) or (entrou = 0) then
    Application.MessageBox
      ('Deve-se selecionar o jogador substituído e o seu substituto', 'ATENÇÃO',
      MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    maximo := sequenciaMaxima() + 1;
    verificacao := false;
    if maximo < 12 then
    begin
      // testar se jogador já está incluso
      for i := 1 to 11 do
      begin
        if DbGridDisponiveis.Columns[0].Field.AsString =
          (TLabel(FindComponent('LblCodEntrou' + IntToStr(i)))).Caption then
        begin
          verificacao := True;
        end;
      end;
      if verificacao then
        Application.MessageBox('Esse jogador já entrou na partida!', 'ATENÇÃO',
          MB_OK + MB_ICONINFORMATION)
      else
      begin
        // jogador substituido
        (TLabel(FindComponent('LblCodigo' + IntToStr(maximo)))).Caption :=
          DbGridAsubstituir.Columns[0].Field.AsString;
        (TLabel(FindComponent('LblNome' + IntToStr(maximo)))).Caption :=
          DbGridAsubstituir.Columns[1].Field.AsString + ' ( ' +
          DbGridAsubstituir.Columns[2].Field.AsString + ' )';
        (TLabel(FindComponent('LblNome' + IntToStr(maximo)))).Visible := True;
        // jogador substituto
        (TLabel(FindComponent('LblCodEntrou' + IntToStr(maximo)))).Caption :=
          DbGridDisponiveis.Columns[0].Field.AsString;
        (TLabel(FindComponent('LblEntrou' + IntToStr(maximo)))).Caption :=
          DbGridDisponiveis.Columns[1].Field.AsString + ' ( ' +
          DbGridDisponiveis.Columns[2].Field.AsString + ' )';
        (TLabel(FindComponent('LblEntrou' + IntToStr(maximo)))).Visible := True;

        (TComboBox(FindComponent('CbxGols' + IntToStr(maximo))))
          .Visible := True;
        (TCheckBox(FindComponent('CbCa' + IntToStr(maximo)))).Visible := True;
        (TCheckBox(FindComponent('CbCv' + IntToStr(maximo)))).Visible := True;

        (TLabel(FindComponent('LblSeq' + IntToStr(maximo)))).Caption :=
          IntToStr(maximo);

        // gravar a substituição no banco

        codjogo := StrToInt(CA_JOGOS.EdtCodigo.Text);
        DecodeDate(StrToDate(CA_JOGOS.EdtData.Text), ano, mes, dia);
        anojogo := ano;

        // buscar v, e, d
        // buscar vitórias, empates ou derrotas
        if f_gerais.determinarVED() = 'V' then
        begin
          v := 1;
          e := 0;
          d := 0;
        end
        else
        begin
          if f_gerais.determinarVED() = 'E' then
          begin
            v := 0;
            e := 1;
            d := 0;
          end
          else
          begin
            v := 0;
            e := 0;
            d := 1;
          end;
        end;

        coditem := f_gerais.novoCodigo('ES_RESER', 'coditem');
        codjogador :=
          StrToInt(TLabel(FindComponent('LblCodEntrou' + IntToStr(maximo))
          ).Caption);
        codjogadorsaiu :=
          StrToInt(TLabel(FindComponent('LblCodigo' + IntToStr(maximo))
          ).Caption);

        // gols
        if TComboBox(FindComponent('CbxGols' + IntToStr(maximo))).Text = EmptyStr
        then
          gols := 0
        else
          gols := StrToInt
            (TComboBox(FindComponent('CbxGols' + IntToStr(maximo))).Text);
        // cartões amarelos
        if TCheckBox(FindComponent('CbCa' + IntToStr(maximo))).Checked then
          ca := 1
        else
          ca := 0;
        // cartões vermelhos
        if TCheckBox(FindComponent('CbCv' + IntToStr(maximo))).Checked then
          cv := 1
        else
          cv := 0;

        // inserir os dados na tabela ES_RESER
        sql := 'insert into ES_RESER values(:CODITEM, :CODJOGADOR, :CODJOGO, :CODJOGADORSAIU, :CAMARELO, :CVERMELHO, :GOLS, :ANO, :V, :E, :D)';

        FrmDm.QrGeral.Close;
        FrmDm.QrGeral.sql.Clear;
        FrmDm.QrGeral.sql.Add(sql);
        FrmDm.QrGeral.Params.ParamByName('CODITEM').AsInteger := coditem;
        FrmDm.QrGeral.Params.ParamByName('CODJOGADOR').AsInteger := codjogador;
        FrmDm.QrGeral.Params.ParamByName('CODJOGO').AsInteger := codjogo;
        FrmDm.QrGeral.Params.ParamByName('CODJOGADORSAIU').AsInteger :=
          codjogadorsaiu;
        FrmDm.QrGeral.Params.ParamByName('CAMARELO').AsInteger := ca;
        FrmDm.QrGeral.Params.ParamByName('CVERMELHO').AsInteger := cv;
        FrmDm.QrGeral.Params.ParamByName('GOLS').AsInteger := gols;
        FrmDm.QrGeral.Params.ParamByName('ANO').AsInteger := ano;
        FrmDm.QrGeral.Params.ParamByName('V').AsInteger := v;
        FrmDm.QrGeral.Params.ParamByName('E').AsInteger := e;
        FrmDm.QrGeral.Params.ParamByName('D').AsInteger := d;
        FrmDm.QrGeral.ExecSQL;

        // fim gravar alteração no banco

        f_gerais.jogadoresASubstituir(h_substituicoes.DbGridAsubstituir,
          CA_JOGOS.EdtCodigo.Text);

        f_gerais.jogadoresDisponiveis(DbGridDisponiveis,
          CA_JOGOS.EdtCodigo.Text, h_substituicoes.Name, EmptyStr);

        EdtPesquisa.Text := EmptyStr;

      end;
    end
    else
      Application.MessageBox('Você pode fazer no máximo 11 substituições',
        'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
  end;
end;

function Th_substituicoes.sequenciaMaxima(): Integer;
var
  i, maximo: Integer;
begin
  maximo := 0;
  for i := 1 to 11 do
  begin
    if StrToInt(TLabel(FindComponent('LblSeq' + IntToStr(i))).Caption) > maximo
    then
      maximo := StrToInt(TLabel(FindComponent('LblSeq' + IntToStr(i))).Caption);
  end;
  result := maximo;
end;

procedure Th_substituicoes.DbGridAsubstituirCellClick(Column: TColumn);
begin
  saiu := DbGridAsubstituir.Columns[0].Field.AsInteger;
end;

procedure Th_substituicoes.DbGridAsubstituirDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, false);
  // Remove barra Horizontal
end;

procedure Th_substituicoes.DbGridDisponiveisCellClick(Column: TColumn);
begin
  entrou := DbGridDisponiveis.Columns[0].Field.AsInteger;
end;

procedure Th_substituicoes.DbGridDisponiveisDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, false);
  // Remove barra Horizontal
end;

procedure Th_substituicoes.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  f_gerais.jogadoresDisponiveis(DbGridDisponiveis, CA_JOGOS.EdtCodigo.Text,
    h_substituicoes.Name, EdtPesquisa.Text);
end;

procedure Th_substituicoes.FormActivate(Sender: TObject);
begin
  saiu := 0;
  entrou := 0;
  EdtPesquisa.Text := EmptyStr;
  if CodigoJogo > 0 then
    substitutosJaInclusos;
end;

procedure Th_substituicoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        BtnCancelarClick(Self);
      end;
  end;
end;

end.


