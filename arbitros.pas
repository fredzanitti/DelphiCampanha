unit arbitros;

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
  TCA_ARBIT = class(TForm)
    Label1: TLabel;
    EdtCodigo: TDBEdit;
    Label2: TLabel;
    EdtNome: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    fraBotoes: TfraBotoes;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MnSairClick(Sender: TObject);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
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
  CA_ARBIT: TCA_ARBIT;
  sql: String;

implementation

{$R *.dfm}

uses module, funcoes, pesquisaarbitros, home;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_ARBIT.estadoDosBotoesdeCadastro();
begin
  fraBotoes.estadoDosBotoesdeCadastro(FrmDm.DtsArbitros.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsArbitros.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := true;
    MnEditar.Enabled := true;
    MnExcluir.Enabled := true;
    // demais componentes
    EdtNome.Enabled := false;
  end;

  if FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit] then
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

procedure TCA_ARBIT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MnSairClick(Self);
end;

procedure TCA_ARBIT.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      fraBotoesBtnIncluirClick(Self);
    VK_ESCAPE:
      begin
        if FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit] then
          fraBotoesBtnCancelarClick(Self)
        else
          MnSairClick(Self);
      end;
    VK_RETURN:
      begin
        if not(FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnGravarClick(Self);
      end;
    VK_LEFT:
      begin
        if not(FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnAnteriorClick(Self);
      end;
    VK_RIGHT:
      begin
        if not(FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnProximoClick(Self);
      end;
    VK_HOME:
      begin
        if not(FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnPrimeiroClick(Self);
      end;
    VK_END:
      begin
        if not(FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoesBtnUltimoClick(Self);
      end;
    VK_F10:
      fraBotoesBtnPesquisarClick(Self);
  end;
end;

procedure TCA_ARBIT.fraBotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsArbitros.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ARBIT.fraBotoesBtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsArbitros.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ARBIT.fraBotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_ARBIT') > 0 then
  begin
    FrmDm.DtsArbitros.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_ARBIT.fraBotoesBtnExcluirClick(Sender: TObject);
begin
  sql := 'select count(*) from CA_JOGOS where codarbitro = :CODIGO';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString := EdtCodigo.Text;
  FrmDm.QrGeral.Open;

  if FrmDm.QrGeral.Fields[0].AsInteger > 0 then
  begin
    Application.MessageBox('Impossível excluir, pois existem jogos cadastrados '
      + #13 + 'em que este árbitro foi escalado.', 'ATENÇÃO',
      MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar o registro do clube
      FrmDm.DtsArbitros.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_ARBIT.fraBotoesBtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtNome.Text, 'NOME DO ÁRBITRO') then
    EdtNome.SetFocus
  else
  begin
    FrmDm.DtsArbitros.DataSet.Post;
    estadoDosBotoesdeCadastro();
    FrmDm.DtsArbitros.DataSet.Refresh;
  end;
end;

procedure TCA_ARBIT.fraBotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsArbitros.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_ARBIT', 'codarbitro'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ARBIT.fraBotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisaArbitro(h_arbitros.DbGridArbitro, 'TODOS');
  h_arbitros.identificacao := 'CA_ARBIT';
  h_arbitros.ShowModal;
end;

procedure TCA_ARBIT.fraBotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsArbitros.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ARBIT.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsArbitros.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ARBIT.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsArbitros.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_ARBIT.MnCadastrarClick(Sender: TObject);
begin
  fraBotoesBtnIncluirClick(Self);
end;

procedure TCA_ARBIT.MnEditarClick(Sender: TObject);
begin
  fraBotoesBtnEditarClick(Self);
end;

procedure TCA_ARBIT.MnExcluirClick(Sender: TObject);
begin
  fraBotoesBtnExcluirClick(Self);
end;

procedure TCA_ARBIT.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsArbitros.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self)
  else
    CA_ARBIT.Close;
end;

procedure TCA_ARBIT.EdtNomeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_ARBIT.EdtNomeExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

end.
