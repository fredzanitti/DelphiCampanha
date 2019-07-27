unit edtiarescalacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  Th_editaescalacao = class(TForm)
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
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    LblCodigo12: TLabel;
    LblNome12: TLabel;
    CbCa12: TCheckBox;
    CbCv12: TCheckBox;
    LblSeq12: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    titoureser: String;
  end;

var
  h_editaescalacao: Th_editaescalacao;
  sql: String;

implementation

{$R *.dfm}

uses module, jogos, funcoes;

procedure Th_editaescalacao.BtnCancelarClick(Sender: TObject);
begin
  h_editaescalacao.Close;
end;

procedure Th_editaescalacao.BtnGravarClick(Sender: TObject);
var
  i, codjogador, codjogo, ca, cv, gols: integer;
begin
  codjogo := StrToInt(CA_JOGOS.EdtCodigo.Text);

  for i := 1 to 12 do
  begin
    if TLabel(FindComponent('LblCodigo' + IntToStr(i))).Caption <> EmptyStr then
    begin
      codjogador := StrToInt(TLabel(FindComponent('LblCodigo' + IntToStr(i))
        ).Caption);

      if i < 12 then
      begin
        // gols
        if TComboBox(FindComponent('CbxGols' + IntToStr(i))).Text = EmptyStr
        then
          gols := 0
        else
          gols := StrToInt
            (TComboBox(FindComponent('CbxGols' + IntToStr(i))).Text);
      end;

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

      if titoureser = 'T' then
      begin
        // atualizar os dados na tabela ES_TITUL
        sql := 'update es_titul ' +
          'set camarelo = :CARTAOAMARELO, cvermelho = :CARTAOVERMELHO, gols = :GOLSMARC '
          + 'where codjogo = :CODIGODOJOGO ' +
          'and codjogador = :CODIGODOJOGADOR';
      end
      else
      begin
        // atualizar os dados na tabela ES_RESER
        sql := 'update es_reser ' +
          'set camarelo = :CARTAOAMARELO, cvermelho = :CARTAOVERMELHO, gols = :GOLSMARC '
          + 'where codjogo = :CODIGODOJOGO ' +
          'and codjogador = :CODIGODOJOGADOR';
      end;

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
  f_gerais.preencherGridTitulares(CA_JOGOS.DbGridTitulares,
    CA_JOGOS.EdtCodigo.Text);
  h_editaescalacao.Close;
end;

procedure Th_editaescalacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      // ações quando pressionar ESC
      begin
        BtnCancelarClick(Self);
      end;
  end;
end;

end.
