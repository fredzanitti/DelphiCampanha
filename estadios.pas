unit estadios;

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
  FireDAC.Comp.UI, jpeg, Vcl.Buttons, Vcl.ExtDlgs, Vcl.Menus,
  framePesquisaCidades, frameBotoesMenuPadrao;

type
  TCA_ESTAD = class(TForm)
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    Label2: TLabel;
    EdtNome: TDBEdit;
    EdtCidade: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    fraCidades: TfraCidades;
    fraBotoes: TfraBotoes;
    procedure BtnLocCidadeClick(Sender: TObject);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
    procedure fraCidades1BtnLocCidadeClick(Sender: TObject);
    procedure fraBotoesBtnPrimeiroClick(Sender: TObject);
    procedure fraBotoesBtnAnteriorClick(Sender: TObject);
    procedure fraBotoesBtnProximoClick(Sender: TObject);
    procedure fraBotoesBtnUltimoClick(Sender: TObject);
    procedure fraBotoesBtnIncluirClick(Sender: TObject);
    procedure fraBotoesBtnEditarClick(Sender: TObject);
    procedure fraBotoesBtnExcluirClick(Sender: TObject);
    procedure fraBotoesBtnGravarClick(Sender: TObject);
    procedure fraBotoesBtnCancelarClick(Sender: TObject);
    procedure fraBotoesBtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_ESTAD: TCA_ESTAD;
  sql: String;

implementation

{$R *.dfm}

uses funcoes, pesquisacidades, module, pesquisaestadios, home;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_ESTAD.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.DtsEstadio.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsEstadio.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := true;
    MnEditar.Enabled := true;
    MnExcluir.Enabled := true;
    fraCidades.BtnLocCidade.Enabled := false;
    // demais componentes
    EdtNome.Enabled := false;
  end;

  if FrmDm.DtsEstadio.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    MnCadastrar.Enabled := false;
    MnEditar.Enabled := false;
    MnExcluir.Enabled := false;
    fraCidades.BtnLocCidade.Enabled := true;
    // demais componentes
    EdtNome.Enabled := true;
    EdtNome.SetFocus;
  end;

  if f_gerais.contadorRegistros('CA_ESTAD') > 0 then
  begin
    // buscar bandeiras do Pais e UF
    f_gerais.buscaBandeiras(fraCidades.ImgBandPaisAdver, fraCidades.ImgUfAdver,
      EdtCidade.Text, fraCidades.LblCidade, fraCidades.LblPais,
      fraCidades.LblUf);
  end;

end;

procedure TCA_ESTAD.FormActivate(Sender: TObject);
begin
  estadoDosBotoesdeCadastro();
  if f_gerais.contadorRegistros('ca_estad') = 0 then
  begin
    fraCidades.LblCidade.Caption := EmptyStr;
    fraCidades.LblPais.Caption := EmptyStr;
    fraCidades.LblUf.Caption := EmptyStr;
  end;
end;

procedure TCA_ESTAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MnSairClick(Self);
end;

procedure TCA_ESTAD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoesBtnIncluirClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsEstadio.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          MnSairClick(Self);
      end;
    VK_LEFT:
      begin
        if not(FrmDm.DtsEstadio.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnAnteriorClick(Self);
      end;
    VK_RIGHT:
      begin
        if not(FrmDm.DtsEstadio.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnProximoClick(Self);
      end;
    VK_HOME:
      begin
        if not(FrmDm.DtsEstadio.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnPrimeiroClick(Self);
      end;
    VK_END:
      begin
        if not(FrmDm.DtsEstadio.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnUltimoClick(Self);
      end;
    VK_F10:
      fraBotoesBtnPesquisarClick(Self);
  end;
end;

procedure TCA_ESTAD.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsEstadio.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ESTAD.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsEstadio.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ESTAD.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_ESTAD') > 0 then
  begin
    FrmDm.DtsEstadio.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_ESTAD.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  sql := 'select count(*) from CA_JOGOS where codestadio = :CODIGO';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString := EdtCodigo.Text;
  FrmDm.QrGeral.Open;

  if FrmDm.QrGeral.Fields[0].AsInteger > 0 then
  begin
    Application.MessageBox('Impossível excluir, pois existem jogos cadastrados '
      + #13 + ' utilizando este estádio.', 'ATENÇÃO', MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar o registro do clube
      FrmDm.DtsEstadio.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_ESTAD.fraBotoesBtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtNome.Text, 'NOME DO ESTÁDIO') then
    EdtNome.SetFocus
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtCidade.Text, 'CIDADE') then
      BtnLocCidadeClick(Self)
    else
    begin
      FrmDm.DtsEstadio.DataSet.Post;
      estadoDosBotoesdeCadastro();
      FrmDm.DtsEstadio.DataSet.Refresh;
    end;
  end;
end;

procedure TCA_ESTAD.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsEstadio.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_ESTAD', 'codestadio'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ESTAD.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa
  f_gerais.pesquisaEstadio(h_estadios.DbGridEstadio, 'TODOS');
  h_estadios.identificacao := 'CA_ESTAD';
  h_estadios.ShowModal;
end;

procedure TCA_ESTAD.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsEstadio.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ESTAD.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsEstadio.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ESTAD.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsEstadio.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ESTAD.fraCidades1BtnLocCidadeClick(Sender: TObject);
begin
  fraCidades.formulario := 'CA_ESTAD';
  fraCidades.BtnLocCidadeClick(Self);
end;

procedure TCA_ESTAD.MnCadastrarClick(Sender: TObject);
begin
  fraBotoesBtnIncluirClick(Self);
end;

procedure TCA_ESTAD.MnEditarClick(Sender: TObject);
begin
  fraBotoesBtnEditarClick(Self);
end;

procedure TCA_ESTAD.MnExcluirClick(Sender: TObject);
begin
  fraBotoesBtnExcluirClick(Self);
end;

procedure TCA_ESTAD.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsEstadio.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self)
  else
    CA_ESTAD.Close;
end;

procedure TCA_ESTAD.BtnLocCidadeClick(Sender: TObject);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaCidade(h_cidades.DbGridCidades, 'TODOS');
  h_cidades.identificacao := 'CA_ESTAD';
  h_cidades.ShowModal;
end;

procedure TCA_ESTAD.EdtNomeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_ESTAD.EdtNomeExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

end.
