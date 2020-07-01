unit escudos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBGrids, Vcl.StdCtrls,
  jpeg, UProgresso, SHDocVw, ActiveX, ComObj,
  DateUtils, IdHashMessageDigest, DBXJSON, Character,
  IdCoder, IdCoder3to4, IdCoderMIME, XSBuiltIns,ComCtrls, Vcl.Mask,
  frameBotoesMenuPadrao, Vcl.ExtDlgs;

type
  TfrmEscudosHistoricos = class(TForm)
    fraBotoes: TfraBotoes;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ImgLogoTime: TImage;
    BtnEscolherFoto: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label4: TLabel;
    edtCodigoTime: TDBEdit;
    edtAnoFinal: TDBEdit;
    edtAnoInicial: TDBEdit;
    edtNomeTime: TEdit;
    edtCaminhoEscudo: TDBEdit;
    edtCodigoItem: TDBEdit;
    BtnAdversario: TBitBtn;
    OpenLogo: TOpenPictureDialog;
    procedure FormActivate(Sender: TObject);
    procedure BtnAdversarioClick(Sender: TObject);
    procedure fraBotoesBtnPrimeiroClick(Sender: TObject);
    procedure fraBotoesBtnAnteriorClick(Sender: TObject);
    procedure fraBotoesBtnProximoClick(Sender: TObject);
    procedure fraBotoesBtnUltimoClick(Sender: TObject);
    procedure fraBotoesBtnIncluirClick(Sender: TObject);
    procedure fraBotoesBtnEditarClick(Sender: TObject);
    procedure fraBotoesBtnExcluirClick(Sender: TObject);
    procedure fraBotoesBtnGravarClick(Sender: TObject);
    procedure BtnEscolherFotoClick(Sender: TObject);
    procedure fraBotoesBtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtAnoFinalExit(Sender: TObject);
    procedure fraBotoesBtnPesquisarClick(Sender: TObject);
    procedure edtAnoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtAnoFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  frmEscudosHistoricos: TfrmEscudosHistoricos;
  NomeArquivo, NomeArquivoAnterior: String;

const
  caminho = 'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Escudos\ADVER_';

implementation

uses
  module, funcoes, pesquisaclubes;

{$R *.dfm}

procedure TfrmEscudosHistoricos.BtnEscolherFotoClick(Sender: TObject);
var
  sql: string;
begin
  NomeArquivoAnterior := edtCaminhoEscudo.Text;
  if OpenLogo.Execute then
  begin
    NomeArquivo := OpenLogo.FileName;
    f_gerais.buscaImagem(ImgLogoTime, NomeArquivo);
    edtCaminhoEscudo.Text := PChar(
      //constante com o endereço onde será gravado o arquivo do escudo
      caminho +
      //concatenado com o código do clube formatado em 5 dígitos
      FormatFloat('00000',StrToFloat(edtCodigoTime.Text)) + '_' +
      //concatenado com o ano inicial e final de utilização do escudo
      edtAnoInicial.Text + '_' + edtAnoFinal.Text +
      //concatenado com a extensão do arquivo de foto
      ExtractFileExt(OpenLogo.FileName));
  end;
end;

procedure TfrmEscudosHistoricos.edtAnoFinalExit(Sender: TObject);
begin
  if (edtCodigoTime.Text <> EmptyStr) and
     (edtAnoInicial.Text <> EmptyStr) and
     (edtAnoFinal.Text <> EmptyStr) then
      BtnEscolherFoto.Enabled := true
  else
      BtnEscolherFoto.Enabled := false;
end;

procedure TfrmEscudosHistoricos.edtAnoFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
      key := #0;
end;

procedure TfrmEscudosHistoricos.edtAnoInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
      key := #0;
end;

procedure TfrmEscudosHistoricos.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.dtsEscudos.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.dtsEscudos.DataSet.State in [dsBrowse] then
  begin
    // botões
    BtnAdversario.Enabled := False;
    // demais componentes
    edtAnoInicial.Enabled := false;
    edtAnoFinal.Enabled := false;
  end;

  if FrmDm.dtsEscudos.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    BtnAdversario.Enabled := True;
    // demais componentes
    edtAnoInicial.Enabled := True;
    edtAnoFinal.Enabled := True;
  end;
  BtnEscolherFoto.Enabled := False;

  // buscar logo do time
  f_gerais.buscaImagem(ImgLogoTime, edtCaminhoEscudo.Text);

  //buscar nome do time
   if edtCodigoTime.Text = EmptyStr then
      edtNomeTime.Clear
   else
      edtNomeTime.Text := f_gerais.retornaNomeTimePorCodigo(StrToInt(edtCodigoTime.Text));
end;

procedure TfrmEscudosHistoricos.BtnAdversarioClick(Sender: TObject);
var
  qryProximoAno: TFDQuery;
  sql: string;
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'ESCUDOS_HISTORICOS';
  h_clubes.ShowModal;

  if not (edtCodigoTime.Text = EmptyStr) then
  begin
      sql := ' SELECT ' +
             '   CASE WHEN MAX(ano_fim) IS NULL THEN ''1900''' +
             '     ELSE MAX(ano_fim) + 1 ' +
             '     END AS ProximoAno ' +
             ' FROM ca_escudos ' +
             ' WHERE codadver = ' + edtCodigoTime.Text;

      qryProximoAno := TFDQuery.Create(nil);
      qryProximoAno.Connection := FrmDm.BDMySQL;
      qryProximoAno.Close;
      qryProximoAno.sql.Clear;
      qryProximoAno.sql.Add(sql);
      qryProximoAno.Open;
      edtAnoInicial.Text := qryProximoAno.Fields[0].AsString;
      edtAnoFinal.SetFocus;
  end;
end;

procedure TfrmEscudosHistoricos.FormActivate(Sender: TObject);
begin
   estadoDosBotoesdeCadastro();
end;

procedure TfrmEscudosHistoricos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoesBtnIncluirClick(Self);
      end;
    VK_F10:
      begin
        //BtnPesquisarClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.dtsEscudos.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          frmEscudosHistoricos.Close;
      end;
    VK_RETURN:
      begin
        fraBotoesBtnGravarClick(Self);
      end;
  end;
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.dtsEscudos.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  FrmDm.dtsEscudos.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_ESCUDOS') > 0 then
  begin
    FrmDm.dtsEscudos.DataSet.Edit;
    estadoDosBotoesdeCadastro();
    BtnEscolherFoto.Enabled := True;
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_ESCUDOS') > 0 then
  begin
      if f_gerais.desejaRealizarAcao('excluir o registro?') then
      begin
        // deletar o escudo do patrocinador
        f_gerais.deletarImagens(edtCaminhoEscudo.Text);
        // deletar o registro do patrocinador
        FrmDm.dtsEscudos.DataSet.Delete;
        // restaurar bandeiras e estado dos botões
        estadoDosBotoesdeCadastro();
      end;
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnGravarClick(Sender: TObject);
var
  sql: string;
begin
  if f_gerais.verificarStringEmBranco(edtAnoInicial.Text, 'ANO INICIAL') then
  begin
     edtAnoInicial.SetFocus;
     Abort;
  end;
  if f_gerais.verificarStringEmBranco(edtAnoFinal.Text, 'ANO FINAL') then
  begin
     edtAnoFinal.SetFocus;
     Abort;
  end;

  if StrToInt(edtAnoInicial.Text) > StrToInt(edtAnoFinal.Text) then
  begin
    Application.MessageBox('Ano final não pode ser menor que o ano inicial.',
      'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    edtAnoInicial.SetFocus;
  end
  else
  begin
    if f_gerais.verificarStringEmBranco(edtNomeTime.Text, 'NOME TIME')
    then
      BtnAdversario.SetFocus
    else
    begin

      if f_gerais.verificarStringEmBranco(edtCaminhoEscudo.Text, 'ESCUDO')
      then
        BtnEscolherFotoClick(Self)
      else
      begin
        CopyFile(PChar(NomeArquivo),
          PChar(
          //constante com o endereço onde será gravado o arquivo do escudo
          caminho +
          //concatenado com o código do clube formatado em 5 dígitos
          FormatFloat('00000',StrToFloat(edtCodigoTime.Text)) + '_' +
          //concatenado com o ano inicial e final de utilização do escudo
          edtAnoInicial.Text + '_' + edtAnoFinal.Text +
          //concatenado com a extensão do arquivo de foto
          ExtractFileExt(OpenLogo.FileName)), false);

        FrmDm.dtsEscudos.DataSet.Post;

        if NomeArquivoAnterior <> edtCaminhoEscudo.Text then
          f_gerais.deletarImagens(NomeArquivoAnterior);

        estadoDosBotoesdeCadastro();
        FrmDm.dtsEscudos.DataSet.Refresh;
      end;

    end;
  end;
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.dtsEscudos.DataSet.Append;
  estadoDosBotoesdeCadastro();
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaclubes(h_clubes.DbGridClubes, 'TODOS');
  h_clubes.identificacao := 'CA_ESCUDOS';
  h_clubes.ShowModal;
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.dtsEscudos.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.dtsEscudos.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TfrmEscudosHistoricos.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.dtsEscudos.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

end.
