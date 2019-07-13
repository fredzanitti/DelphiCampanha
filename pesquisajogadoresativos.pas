unit pesquisajogadoresativos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons;

type
  Th_jogadoresativos = class(TForm)
    DbGridAtivo: TDBGrid;
    BtnAdicionarJogador: TBitBtn;
    Label4: TLabel;
    EdtPesquisa: TEdit;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    GroupBox1: TGroupBox;
    LlbJogador: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    LblNome12: TLabel;
    LblCodigo12: TLabel;
    LblSeq12: TLabel;
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
    BtnEliminarUltimo: TBitBtn;
    BtnIncluir: TBitBtn;
    procedure DbGridAtivoDblClick(Sender: TObject);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAdicionarJogadorClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEliminarUltimoClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure DbGridAtivoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    function sequenciaMaxima(): Integer;
  end;

var
  h_jogadoresativos: Th_jogadoresativos;
  sql: String;

implementation

{$R *.dfm}

uses funcoes, jogos, module, jogadores;

procedure Th_jogadoresativos.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisajogadoresativos(h_jogadoresativos.DbGridAtivo,
    EdtPesquisa.Text);
end;

procedure Th_jogadoresativos.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_jogadoresativos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      // ações quando pressionar ESC
      begin
        BtnCancelarClick(Self);
        h_jogadoresativos.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridAtivoDblClick(Self);
      end;
  end;
end;

function Th_jogadoresativos.sequenciaMaxima(): Integer;
var
  i, maximo: Integer;
begin
  maximo := 0;
  for i := 1 to 12 do
  begin
    if StrToInt(TLabel(FindComponent('LblSeq' + IntToStr(i))).Caption) > maximo
    then
      maximo := StrToInt(TLabel(FindComponent('LblSeq' + IntToStr(i))).Caption);
  end;
  result := maximo;

end;

procedure Th_jogadoresativos.BtnCancelarClick(Sender: TObject);
begin
  f_gerais.limpaTelaJogadoresNosJogos(12);
  EdtPesquisa.SetFocus;
end;

procedure Th_jogadoresativos.BtnEliminarUltimoClick(Sender: TObject);
var
  i, ultimo: Integer;
begin
  ultimo := 0;
  for i := 1 to 12 do
  begin
    if (FindComponent('LblSeq' + IntToStr(i)) as TLabel).Caption <> '0' then
      ultimo := i;
  end;

  if ultimo > 0 then
  begin
    (FindComponent('LblSeq' + IntToStr(ultimo)) as TLabel).Caption := '0';
    (FindComponent('LblNome' + IntToStr(ultimo)) as TLabel).Visible := false;

    if ultimo < 12 then
    begin
      (FindComponent('CbxGols' + IntToStr(ultimo)) as TComboBox)
        .Visible := false;
      (FindComponent('CbCa' + IntToStr(ultimo)) as TCheckBox).Visible := false;
      (FindComponent('CbCv' + IntToStr(ultimo)) as TCheckBox).Visible := false;
    end;
  end;
  EdtPesquisa.SetFocus;
end;

procedure Th_jogadoresativos.BtnAdicionarJogadorClick(Sender: TObject);
begin
  DbGridAtivoDblClick(Self);
end;

procedure Th_jogadoresativos.BtnGravarClick(Sender: TObject);
var
  coditem, codjogador, codjogo, ca, cv, gols, v, e, d, i: Integer;
  completo: boolean;
  ano, mes, dia: Word;
  msg: String;
begin
  completo := true;
  for i := 1 to 12 do
  begin
    if (FindComponent('LblSeq' + IntToStr(i)) as TLabel).Caption = '0' then
      completo := false;
  end;

  if completo then
  begin
    // inserir os dados na tabela ES_TITUL
    sql := 'insert into ES_TITUL values(:CODITEM, :CODJOGADOR, :CODJOGO, :CAMARELO, :CVERMELHO, :GOLS, :ANO, :V, :E, :D)';

    codjogo := StrToInt(CA_JOGOS.EdtCodigo.Text);
    DecodeDate(StrToDate(CA_JOGOS.EdtData.Text), ano, mes, dia);

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

    for i := 1 to 12 do
    begin
      coditem := f_gerais.novoCodigo('ES_TITUL', 'coditem');
      codjogador := StrToInt(TLabel(FindComponent('LblCodigo' + IntToStr(i))
        ).Caption);

      if i = 12 then
      begin
        gols := 0;
        ca := 0;
        cv := 0;
      end
      else
      begin
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
      end;

      FrmDm.QrGeral.Close;
      FrmDm.QrGeral.sql.Clear;
      FrmDm.QrGeral.sql.Add(sql);
      FrmDm.QrGeral.Params.ParamByName('CODITEM').AsInteger := coditem;
      FrmDm.QrGeral.Params.ParamByName('CODJOGADOR').AsInteger := codjogador;
      FrmDm.QrGeral.Params.ParamByName('CODJOGO').AsInteger := codjogo;
      FrmDm.QrGeral.Params.ParamByName('CAMARELO').AsInteger := ca;
      FrmDm.QrGeral.Params.ParamByName('CVERMELHO').AsInteger := cv;
      FrmDm.QrGeral.Params.ParamByName('GOLS').AsInteger := gols;
      FrmDm.QrGeral.Params.ParamByName('ANO').AsInteger := ano;
      FrmDm.QrGeral.Params.ParamByName('V').AsInteger := v;
      FrmDm.QrGeral.Params.ParamByName('E').AsInteger := e;
      FrmDm.QrGeral.Params.ParamByName('D').AsInteger := d;
      FrmDm.QrGeral.ExecSQL;
    end;
    f_gerais.preencherGridTitulares(CA_JOGOS.DbGridTitulares,
      CA_JOGOS.EdtCodigo.Text);
    CA_JOGOS.CbEscalacoDisp.Enabled := false;

    CA_JOGOS.estadoDosBotoesdeJogadores();
    h_jogadoresativos.Close;
  end
  else
  begin
    msg := 'A escalação está incompleta. Deve-se selecionar: ' + #13 +
      'Um goleiro, dez jogadores e um técnico, ' + #13 +
      'exatamente nesta ordem.';
    Application.MessageBox(pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONERROR);
  end;

end;

procedure Th_jogadoresativos.BtnIncluirClick(Sender: TObject);
begin
  CA_JOGAD.ShowModal;
end;

procedure Th_jogadoresativos.DbGridAtivoDblClick(Sender: TObject);
var
  i, maximo: Integer;
  verificacao: boolean;
  inexistente: boolean;
begin
  maximo := sequenciaMaxima() + 1;
  verificacao := false;
  inexistente := false;
  if maximo < 13 then
  begin
    // testar se jogador já está incluso
    for i := 1 to 12 do
    begin
      if DbGridAtivo.Columns[0].Field.AsString =
        (TLabel(FindComponent('LblCodigo' + IntToStr(i)))).Caption then
      begin
        verificacao := true;
      end
      else
      begin
        if (DbGridAtivo.Columns[0].Field.AsString = EmptyStr) or
          (DbGridAtivo.Columns[0].Field.AsString = '0') then
        begin
          inexistente := true;
        end;
      end;
    end;

    if verificacao then
      Application.MessageBox('Esse jogador já está escalado!', 'ATENÇÃO',
        MB_OK + MB_ICONINFORMATION)
    else
    begin
      if inexistente then
        Application.MessageBox('Nenhum jogador selecionado!', 'ATENÇÃO',
          MB_OK + MB_ICONINFORMATION)
      else
      begin
        (TLabel(FindComponent('LblCodigo' + IntToStr(maximo)))).Caption :=
          DbGridAtivo.Columns[0].Field.AsString;
        (TLabel(FindComponent('LblNome' + IntToStr(maximo)))).Caption :=
          DbGridAtivo.Columns[1].Field.AsString + ' ( ' + DbGridAtivo.Columns[2]
          .Field.AsString + ' )';
        (TLabel(FindComponent('LblSeq' + IntToStr(maximo)))).Caption :=
          IntToStr(maximo);
        (TLabel(FindComponent('LblNome' + IntToStr(maximo)))).Visible := true;
        if maximo < 12 then
        begin
          (TComboBox(FindComponent('CbxGols' + IntToStr(maximo))))
            .Visible := true;
          (TCheckBox(FindComponent('CbCa' + IntToStr(maximo)))).Visible := true;
          (TCheckBox(FindComponent('CbCv' + IntToStr(maximo)))).Visible := true;
        end;
      end;
    end;
  end
  else
    Application.MessageBox('A escalação do time está completa!', 'ATENÇÃO',
      MB_OK + MB_ICONINFORMATION);

  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_jogadoresativos.DbGridAtivoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

end.
