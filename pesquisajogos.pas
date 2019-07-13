unit pesquisajogos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  Th_jogos = class(TForm)
    Label1: TLabel;
    DbGridJogos: TDBGrid;
    BtnSelecionar: TBitBtn;
    BtnConfirmar: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    EdtPesqCodigo: TEdit;
    DtpIni: TDateTimePicker;
    EdtDtIni: TEdit;
    DtpFim: TDateTimePicker;
    EdtDtFim: TEdit;
    BtnLimpar: TBitBtn;
    procedure BtnConfirmarClick(Sender: TObject);
    procedure DbGridJogosDblClick(Sender: TObject);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DbGridJogosCellClick(Column: TColumn);
    procedure DtpIniChange(Sender: TObject);
    procedure EdtDtIniExit(Sender: TObject);
    procedure EdtDtIniEnter(Sender: TObject);
    procedure DtpFimChange(Sender: TObject);
    procedure EdtDtFimEnter(Sender: TObject);
    procedure EdtDtFimExit(Sender: TObject);
    procedure EdtDtIniChange(Sender: TObject);
    procedure EdtDtFimChange(Sender: TObject);
    procedure EdtDtIniKeyPress(Sender: TObject; var Key: Char);
    procedure EdtDtFimKeyPress(Sender: TObject; var Key: Char);
    procedure DbGridJogosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BtnLimparClick(Sender: TObject);
    procedure EdtPesqCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  h_jogos: Th_jogos;
  clicou: boolean;

implementation

{$R *.dfm}

uses funcoes, module, jogos;

procedure Th_jogos.BtnConfirmarClick(Sender: TObject);
begin

  if EdtPesqCodigo.Text <> EmptyStr then
  begin
    f_gerais.pesquisaJogosPorNumero(h_jogos.DbGridJogos, EdtPesqCodigo.Text);
  end
  else
  begin
    if EdtDtIni.Text = EmptyStr then
    begin
      Application.MessageBox('A data inicial deve ser preenchida!', 'ATENÇÃO',
        MB_OK + MB_ICONINFORMATION);
      EdtDtIni.SetFocus;
    end
    else
    begin
      if EdtDtFim.Text = EmptyStr then
      begin
        EdtDtFim.Text := EdtDtIni.Text;
      end;
      if StrToDate(EdtDtIni.Text) > StrToDate(EdtDtFim.Text) then
      begin
        Application.MessageBox('A data inicial não pode ser ' + #13 +
          'maior que a data final!', 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
        EdtDtIni.SetFocus;
      end
      else
      begin
        // preencher grid da pesquisa de jogos
        if EdtDtFim.Text = EmptyStr then
          EdtDtFim.Text := EdtDtIni.Text;
        f_gerais.pesquisajogos(h_jogos.DbGridJogos, EdtDtIni.Text,
          EdtDtFim.Text);
      end;
    end;
  end;
end;

procedure Th_jogos.BtnLimparClick(Sender: TObject);
begin
  EdtPesqCodigo.Text := EmptyStr;
  EdtDtIni.Text := EmptyStr;
  EdtDtFim.Text := EmptyStr;
  // preencher grid da pesquisa de jogos
  f_gerais.pesquisajogos(h_jogos.DbGridJogos, EmptyStr, EmptyStr);
  EdtPesqCodigo.SetFocus;
end;

procedure Th_jogos.BtnSelecionarClick(Sender: TObject);
begin
  DbGridJogosDblClick(Self);
end;

procedure Th_jogos.DtpFimChange(Sender: TObject);
begin
  EdtDtFim.Text := DateToStr(DtpFim.Date);
end;

procedure Th_jogos.DtpIniChange(Sender: TObject);
begin
  EdtDtIni.Text := DateToStr(DtpIni.Date);
end;

procedure Th_jogos.DbGridJogosCellClick(Column: TColumn);
begin
  clicou := true;
end;

procedure Th_jogos.DbGridJogosDblClick(Sender: TObject);
begin
  if clicou then
  begin
    FrmDm.TblJogos.First;

    while FrmDm.TblJogoscodjogo.AsInteger <> DbGridJogos.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblJogos.Next;
    end;
    CA_JOGOS.estadoDosBotoesdeCadastro();
    h_jogos.Close;
  end
  else
    Application.MessageBox('Nenhum jogo foi selecionado para ser exibido',
      'ATENÇÃO', MB_OK + MB_ICONEXCLAMATION);

end;

procedure Th_jogos.DbGridJogosDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False);
  // Remove barra Horizontal
end;

procedure Th_jogos.EdtDtFimChange(Sender: TObject);
begin
  EdtDtFim.Text := f_gerais.Mascara(EdtDtFim.Text, '99/99/9999');
  EdtDtFim.SelStart := Length(EdtDtFim.Text);
end;

procedure Th_jogos.EdtDtFimEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
  EdtDtFim.Text := DateToStr(Now);
end;

procedure Th_jogos.EdtDtFimExit(Sender: TObject);
var
  erro: boolean;
begin
  f_gerais.MudaCor('Sai', Sender);
  EdtDtFim.Text := f_gerais.retornaData(EdtDtFim.Text);
end;

procedure Th_jogos.EdtDtFimKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
    Abort;
end;

procedure Th_jogos.EdtDtIniChange(Sender: TObject);
begin
  EdtDtIni.Text := f_gerais.Mascara(EdtDtIni.Text, '99/99/9999');
  EdtDtIni.SelStart := Length(EdtDtIni.Text);
end;

procedure Th_jogos.EdtDtIniEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
  EdtDtIni.Text := DateToStr(Now);
end;

procedure Th_jogos.EdtDtIniExit(Sender: TObject);
var
  erro: boolean;
begin
  f_gerais.MudaCor('Sai', Sender);
  EdtDtIni.Text := f_gerais.retornaData(EdtDtIni.Text);
end;

procedure Th_jogos.EdtDtIniKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then
    Abort;
end;

procedure Th_jogos.EdtPesqCodigoExit(Sender: TObject);
var
  cod, maior: Integer;
begin
  if EdtPesqCodigo.Text = EmptyStr then
    cod := 0
  else
    cod := StrToInt(EdtPesqCodigo.Text);

  maior := f_gerais.maiorCodigo('codjogo', 'CA_JOGOS');

  if cod > maior then
    EdtPesqCodigo.Text := IntToStr(maior);

end;

procedure Th_jogos.FormActivate(Sender: TObject);
begin
  EdtDtIni.Clear;
  EdtDtFim.Clear;
  EdtPesqCodigo.Clear;
  EdtPesqCodigo.SetFocus;
  clicou := False;
end;

procedure Th_jogos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_jogos.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridJogosDblClick(Self);
      end;
  end;
end;

end.
