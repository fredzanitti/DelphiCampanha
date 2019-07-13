unit fases;

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
  frameBotoesMenuPadrao;

type
  TCA_FASE = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdtCodigo: TDBEdit;
    EdtNome: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    fraBotoes: TfraBotoes;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
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
  CA_FASE: TCA_FASE;
  sql: String;

implementation

{$R *.dfm}

uses module, funcoes, h_fase, home;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_FASE.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.DtsFase.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsFase.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := true;
    MnExcluir.Enabled := true;
    // demais componentes
    EdtNome.Enabled := false;
  end;

  if FrmDm.DtsFase.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    MnCadastrar.Enabled := false;
    MnEditar.Enabled := false;
    MnExcluir.Enabled := false;
    // demais componentes
    EdtNome.Enabled := true;
    EdtNome.SetFocus;
  end;
end;

procedure TCA_FASE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MnSairClick(Self);
end;

procedure TCA_FASE.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoesBtnIncluirClick(Self);
      end;
    VK_F10:
      begin
        fraBotoesBtnPesquisarClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsFase.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          MnSairClick(Self);
      end;
    VK_RETURN:
      begin
        fraBotoesBtnGravarClick(Self);
      end;
  end;
end;

procedure TCA_FASE.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsFase.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FASE.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsFase.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FASE.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_FASE') > 0 then
  begin
    FrmDm.DtsFase.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_FASE.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  sql := 'select count(*) from CA_JOGOS where codfase = :CODIGO';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString := EdtCodigo.Text;
  FrmDm.QrGeral.Open;

  if FrmDm.QrGeral.Fields[0].AsInteger > 0 then
  begin
    Application.MessageBox('Impossível excluir, pois existem jogos cadastrados '
      + #13 + 'em que este fase foi informada.', 'ATENÇÃO',
      MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar o registro do clube
      FrmDm.DtsFase.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_FASE.fraBotoesBtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtNome.Text, 'NOME DA FASE') then
    EdtNome.SetFocus
  else
  begin
    FrmDm.DtsFase.DataSet.Post;
    estadoDosBotoesdeCadastro();
    FrmDm.DtsFase.DataSet.Refresh;
  end;
end;

procedure TCA_FASE.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsFase.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_FASE', 'codfase'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FASE.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaFase(h_fases.DbGridFase, 'TODOS');
  h_fases.identificacao := 'CA_FASE';
  h_fases.ShowModal;
end;

procedure TCA_FASE.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsFase.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FASE.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsFase.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FASE.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsFase.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_FASE.MnCadastrarClick(Sender: TObject);
begin
  fraBotoesBtnIncluirClick(Self);
end;

procedure TCA_FASE.MnEditarClick(Sender: TObject);
begin
  fraBotoesBtnEditarClick(Self);
end;

procedure TCA_FASE.MnExcluirClick(Sender: TObject);
begin
  fraBotoesBtnExcluirClick(Self);
end;

procedure TCA_FASE.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsFase.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self)
  else
    CA_FASE.Close;
end;

procedure TCA_FASE.EdtNomeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_FASE.EdtNomeExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

end.
