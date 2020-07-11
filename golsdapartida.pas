unit golsdapartida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, module, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, funcoes, pesquisajogadores,
  Vcl.ExtCtrls;

type
  TfrmGolsdaPartida = class(TForm)
    btnJogadores: TBitBtn;
    DbGridGols: TDBGrid;
    EdtJogador: TEdit;
    Label20: TLabel;
    qryGolsporjogo: TFDQuery;
    qryGolsporjogocodjogador: TIntegerField;
    qryGolsporjogonome: TWideStringField;
    qryGolsporjogotempo: TIntegerField;
    qryGolsporjogofracao: TWideStringField;
    dtsGolsporjogo: TDataSource;
    CbxFracao: TComboBox;
    Label1: TLabel;
    BtnGravar: TBitBtn;
    qryPrincipal: TFDQuery;
    qryPrincipalcoditem: TFDAutoIncField;
    qryPrincipalcodjogador: TIntegerField;
    qryPrincipalcodjogo: TIntegerField;
    qryPrincipaltempo: TIntegerField;
    qryPrincipalfracao: TWideStringField;
    rgrTiposGols: TRadioGroup;
    qryTipoGol: TFDQuery;
    qryTipoGolcodtipo: TFDAutoIncField;
    qryTipoGoltipo: TWideStringField;
    qryRecuperaCodigoTipo: TFDQuery;
    qryRecuperaCodigoTipocodtipo: TFDAutoIncField;
    qryPrincipalcodtipogol: TIntegerField;
    qryGolsporjogotipo: TWideStringField;
    qryGolsporjogocodtipo: TIntegerField;
    BtnEliminarUltimo: TBitBtn;
    qryEliminarUltimoRegistro: TFDQuery;
    rgrGolContra: TRadioGroup;
    cbxTempo: TComboBox;
    qryPrincipalperiodo: TWideStringField;
    qryGolsporjogoperiodo: TWideStringField;
    qryGolsporjogocoditem: TFDAutoIncField;
    EdtTempo: TEdit;
    qryUltimoTempo: TFDQuery;
    qryUltimoTempoperiodo: TWideStringField;
    procedure BtnGravarClick(Sender: TObject);
    procedure btnJogadoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnEliminarUltimoClick(Sender: TObject);
    procedure rgrGolContraClick(Sender: TObject);
    procedure EdtTempoExit(Sender: TObject);
    procedure EdtTempoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoJogo,
    CodigoJogador,
    CodigoItem,
    Tempo,
    CodigoTipoGol: Integer;
    Fracao: string;
    procedure LimparCampos;
  end;

var
  frmGolsdaPartida: TfrmGolsdaPartida;

implementation

{$R *.dfm}

procedure TfrmGolsdaPartida.LimparCampos;
begin
    rgrGolContra.ItemIndex := 0;
    rgrTiposGols.ItemIndex := 10;
    EdtJogador.Clear;
    btnJogadores.Enabled := true;
    EdtTempo.Clear;
    CbxFracao.ItemIndex := 0;
    cbxTempo.ItemIndex := 0;

    if qryGolsporjogo.Active then
       qryGolsporjogo.Close;
    qryGolsporjogo.Params.ParamByName('CodigoJogo').DataType := ftInteger;
    qryGolsporjogo.Params.ParamByName('CodigoJogo').Value := CodigoJogo;
    qryGolsporjogo.Open;

    if qryGolsporjogo.RecordCount > 0 then
       BtnEliminarUltimo.Enabled := True
    else
       BtnEliminarUltimo.Enabled := false;
end;

procedure TfrmGolsdaPartida.BtnEliminarUltimoClick(Sender: TObject);
begin
   if f_gerais.desejaRealizarAcao('excluir o último registro?') then
   begin
        if qryEliminarUltimoRegistro.Active then
           qryEliminarUltimoRegistro.Close;
        qryEliminarUltimoRegistro.Params.ParamByName('CodigoJogo').DataType := ftInteger;
        qryEliminarUltimoRegistro.Params.ParamByName('CodigoJogo').Value := CodigoJogo;
        qryEliminarUltimoRegistro.ExecSQL;

        LimparCampos;
   end;
end;

procedure TfrmGolsdaPartida.BtnGravarClick(Sender: TObject);
var
  CodigoTipo: Integer;
  TipoGol, Tempo: string;
begin
  if (not (CodigoJogador > 0)) and (rgrGolContra.ItemIndex = 0) then
  begin
     Application.MessageBox('É obrigatório selecionar um jogador', 'ATENÇÃO', MB_OK + MB_ICONWARNING);
     btnJogadores.SetFocus;
     Abort;
  end;

  if EdtTempo.Text = EmptyStr then
  begin
     Application.MessageBox('É obrigatório informar o tempo do gol', 'ATENÇÃO', MB_OK + MB_ICONWARNING);
     EdtTempo.SetFocus;
     Abort;
  end;

  if CbxFracao.Text = EmptyStr then
  begin
     Application.MessageBox('É obrigatório informar a fração de tempo do gol', 'ATENÇÃO', MB_OK + MB_ICONWARNING);
     CbxFracao.SetFocus;
     Abort;
  end;

  if cbxTempo.Text = EmptyStr then
  begin
     Application.MessageBox('É obrigatório informar o período em que o gol aconteceu', 'ATENÇÃO', MB_OK + MB_ICONWARNING);
     cbxTempo.SetFocus;
     Abort;
  end;

  if rgrTiposGols.ItemIndex = -1 then
  begin
     Application.MessageBox('É obrigatório informar o tipo do gol', 'ATENÇÃO', MB_OK + MB_ICONWARNING);
     rgrTiposGols.SetFocus;
     Abort;
  end;

  if rgrGolContra.ItemIndex = 1 then
  begin
     CodigoJogador := 0;
     EdtJogador.Text := 'Contra';
  end;

  case cbxTempo.ItemIndex of
      0: Tempo := '1T';
      1: Tempo := '2T';
      2: Tempo := '1TP';
      3: Tempo := '2TP';
  end;

  TipoGol := rgrTiposGols.Items[rgrTiposGols.ItemIndex];
  if qryRecuperaCodigoTipo.Active then
     qryRecuperaCodigoTipo.Close;
  qryRecuperaCodigoTipo.Params.ParamByName('tipogol').DataType := ftString;
  qryRecuperaCodigoTipo.Params.ParamByName('tipogol').Value := TipoGol;
  qryRecuperaCodigoTipo.Open;

  if qryPrincipal.Active then
     qryPrincipal.Close;
  qryPrincipal.Open;
  qryPrincipal.Append;
  qryPrincipalcodjogador.Value := CodigoJogador;
  qryPrincipalcodjogo.Value := CodigoJogo;
  qryPrincipaltempo.Value := StrToInt(EdtTempo.Text);
  qryPrincipalfracao.Value := CbxFracao.Text;
  qryPrincipalcodtipogol.Value := qryRecuperaCodigoTipocodtipo.Value;
  qryPrincipalperiodo.Value := Tempo;
  qryPrincipal.Post;

  LimparCampos;

end;

procedure TfrmGolsdaPartida.btnJogadoresClick(Sender: TObject);
begin
  h_jogadores.CodigoJogo := CodigoJogo;
  h_jogadores.identificacao := 'ES_GOLS';
  h_jogadores.ShowModal;
  rgrTiposGols.ItemIndex := 10;
  EdtTempo.SetFocus;
end;

procedure TfrmGolsdaPartida.EdtTempoExit(Sender: TObject);
begin
    if not (EdtTempo.Text = EmptyStr) then
    begin
        if StrToInt(EdtTempo.Text) > 60 then
        begin
            if not f_gerais.desejaRealizarAcao('manter o valor digitado? Possivelmente o tempo digitado está incorreto, pois considerando os acréscimos um tempo, provavelmente, não terá mais que 60 minutos') then
            begin
                EdtTempo.SetFocus;
                Abort;
            end;
        end;
    end;

    if qryUltimoTempo.Active then
       qryUltimoTempo.Close;
    qryUltimoTempo.Params.ParamByName('CodigoJogo').DataType := ftInteger;
    qryUltimoTempo.Params.ParamByName('CodigoJogo').Value := CodigoJogo;
    qryUltimoTempo.Open;

    if qryUltimoTempoperiodo.Value = '2T' then
       cbxTempo.ItemIndex := 1;
end;

procedure TfrmGolsdaPartida.EdtTempoKeyPress(Sender: TObject; var Key: Char);
begin
    if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
      key := #0;
end;

procedure TfrmGolsdaPartida.FormCreate(Sender: TObject);
begin
   if qryTipoGol.Active then
      qryTipoGol.Close;
   qryTipoGol.Open;
   qryTipoGol.First;
   while not qryTipoGol.Eof do
   begin
     rgrTiposGols.Items.Add(qryTipoGoltipo.Value);
     qryTipoGol.Next;
   end;
   rgrTiposGols.ItemIndex := -1;
   rgrGolContra.ItemIndex := 0;
   btnJogadores.Enabled := true;
end;

procedure TfrmGolsdaPartida.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      frmGolsdaPartida.Close;
    VK_RETURN:
      BtnGravarClick(Self);
  end;
end;

procedure TfrmGolsdaPartida.rgrGolContraClick(Sender: TObject);
begin
  if rgrGolContra.ItemIndex = 1 then
  begin
     EdtJogador.Text := 'Contra';
     btnJogadores.Enabled := False;
     CodigoJogador := 0;
  end
  else
  begin
     btnJogadores.Enabled := True;
     rgrTiposGols.ItemIndex := 10;
     EdtJogador.Clear;
  end;
  EdtTempo.SetFocus;
end;

end.


