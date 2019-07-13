unit competicao;

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
  TCA_COMPE = class(TForm)
    Label3: TLabel;
    EdtTipoCompet: TDBEdit;
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
    RbNac: TRadioButton;
    RbInt: TRadioButton;
    fraBotoes: TfraBotoes;
    procedure RbNacClick(Sender: TObject);
    procedure RbIntClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
    procedure frabotoesBtnPrimeiroClick(Sender: TObject);
    procedure frabotoesBtnAnteriorClick(Sender: TObject);
    procedure frabotoesBtnProximoClick(Sender: TObject);
    procedure frabotoesBtnUltimoClick(Sender: TObject);
    procedure frabotoesBtnIncluirClick(Sender: TObject);
    procedure frabotoesBtnEditarClick(Sender: TObject);
    procedure frabotoesBtnExcluirClick(Sender: TObject);
    procedure frabotoesBtnGravarClick(Sender: TObject);
    procedure frabotoesBtnCancelarClick(Sender: TObject);
    procedure frabotoesBtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  CA_COMPE: TCA_COMPE;

implementation

{$R *.dfm}

uses module, funcoes, pesquisacompeticao, home;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TCA_COMPE.EdtNomeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_COMPE.EdtNomeExit(Sender: TObject);
begin
  f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_COMPE.estadoDosBotoesdeCadastro();
begin
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsCompeticao.DataSet.State in [dsBrowse] then
  begin
    // botões
    fraBotoes.BtnPrimeiro.Enabled := true;
    fraBotoes.BtnAnterior.Enabled := true;
    fraBotoes.BtnProximo.Enabled := true;
    fraBotoes.BtnUltimo.Enabled := true;
    fraBotoes.BtnIncluir.Enabled := true;
    MnCadastrar.Enabled := true;
    fraBotoes.BtnEditar.Enabled := true;
    MnEditar.Enabled := true;
    fraBotoes.BtnExcluir.Enabled := true;
    MnExcluir.Enabled := true;
    fraBotoes.BtnGravar.Enabled := false;
    fraBotoes.BtnCancelar.Enabled := false;
    fraBotoes.BtnPesquisar.Enabled := true;
    // demais componentes
    EdtNome.Enabled := false;
    RbNac.Enabled := false;
    RbInt.Enabled := false;

    if EdtTipoCompet.Text = 'N' then
      RbNac.Checked := true
    else
    begin
      RbNac.Checked := false;
      if EdtTipoCompet.Text = 'I' then
        RbInt.Checked := true
      else
        RbInt.Checked := false;
    end;
  end;

  if FrmDm.DtsCompeticao.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    fraBotoes.BtnPrimeiro.Enabled := false;
    fraBotoes.BtnAnterior.Enabled := false;
    fraBotoes.BtnProximo.Enabled := false;
    fraBotoes.BtnUltimo.Enabled := false;
    fraBotoes.BtnIncluir.Enabled := false;
    MnCadastrar.Enabled := false;
    fraBotoes.BtnEditar.Enabled := false;
    MnEditar.Enabled := false;
    fraBotoes.BtnExcluir.Enabled := false;
    MnExcluir.Enabled := false;
    fraBotoes.BtnGravar.Enabled := true;
    fraBotoes.BtnCancelar.Enabled := true;
    fraBotoes.BtnPesquisar.Enabled := false;
    // demais componentes
    EdtNome.Enabled := true;
    EdtNome.SetFocus;
    RbNac.Enabled := true;
    RbInt.Enabled := true;

    if FrmDm.DtsCompeticao.DataSet.State in [dsInsert] then
    begin
      RbNac.Checked := true;
      EdtTipoCompet.Text := 'N';
    end;

    if FrmDm.DtsCompeticao.DataSet.State in [dsEdit] then
    begin
      if EdtTipoCompet.Text = 'N' then
        RbNac.Checked := true
      else
      begin
        RbNac.Checked := false;
        if EdtTipoCompet.Text = 'I' then
          RbInt.Checked := true
        else
          RbInt.Checked := false;
      end;
    end;
  end;
end;

procedure TCA_COMPE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MnSairClick(Self);
end;

procedure TCA_COMPE.FormKeyDown(Sender: TObject; var Key: Word;
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
        if FrmDm.DtsCompeticao.DataSet.State in [dsInsert, dsEdit] then
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

procedure TCA_COMPE.frabotoesBtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsCompeticao.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_COMPE.frabotoesBtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsCompeticao.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_COMPE.frabotoesBtnEditarClick(Sender: TObject);
begin
  if f_gerais.contadorRegistros('CA_COMPE') > 0 then
  begin
    FrmDm.DtsCompeticao.DataSet.Edit;
    estadoDosBotoesdeCadastro();
  end
  else
    Application.MessageBox('A tabela está vazia!', 'ATENÇÃO',
      MB_OK + MB_ICONWARNING);
end;

procedure TCA_COMPE.frabotoesBtnExcluirClick(Sender: TObject);
begin
  sql := 'select count(*) from CA_JOGOS where codcompeticao = :CODIGO';

  FrmDm.QrGeral.Close;
  FrmDm.QrGeral.sql.Clear;
  FrmDm.QrGeral.sql.Add(sql);
  FrmDm.QrGeral.Params.ParamByName('CODIGO').AsString := EdtCodigo.Text;
  FrmDm.QrGeral.Open;

  if FrmDm.QrGeral.Fields[0].AsInteger > 0 then
  begin
    Application.MessageBox('Impossível excluir, pois existem jogos cadastrados '
      + #13 + 'em que esta competição está sendo utilizada.', 'ATENÇÃO',
      MB_OK + MB_ICONERROR);
  end
  else
  begin
    if f_gerais.desejaRealizarAcao('excluir o registro?') then
    begin
      // deletar o registro
      FrmDm.DtsCompeticao.DataSet.Delete;
      // restaurar bandeiras e estado dos botões
      estadoDosBotoesdeCadastro();
    end;
  end;
end;

procedure TCA_COMPE.frabotoesBtnGravarClick(Sender: TObject);
begin
  if f_gerais.verificarStringEmBranco(EdtNome.Text, 'NOME DA COMPETIÇÃO') then
    EdtNome.SetFocus
  else
  begin
    if f_gerais.verificarStringEmBranco(EdtTipoCompet.Text, 'TIPO DE COMPETIÇÃO')
    then
      RbNacClick(Self)
    else
    begin
      FrmDm.DtsCompeticao.DataSet.Post;
      estadoDosBotoesdeCadastro();
      FrmDm.DtsCompeticao.DataSet.Refresh;
    end;
  end;
end;

procedure TCA_COMPE.frabotoesBtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsCompeticao.DataSet.Append;
  EdtCodigo.Text := IntToStr(f_gerais.novoCodigo('CA_COMPE', 'codcompeticao'));
  estadoDosBotoesdeCadastro();
end;

procedure TCA_COMPE.frabotoesBtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisacompeticao(h_competicao.DbGridCompeticao, 'TODOS');
  h_competicao.identificacao := 'CA_COMPE';
  h_competicao.ShowModal;
end;

procedure TCA_COMPE.frabotoesBtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsCompeticao.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_COMPE.fraBotoesBtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsCompeticao.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_COMPE.fraBotoesBtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsCompeticao.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TCA_COMPE.MnCadastrarClick(Sender: TObject);
begin
  fraBotoesBtnIncluirClick(Self);
end;

procedure TCA_COMPE.MnEditarClick(Sender: TObject);
begin
  fraBotoesBtnEditarClick(Self);
end;

procedure TCA_COMPE.MnExcluirClick(Sender: TObject);
begin
  fraBotoesBtnExcluirClick(Self);
end;

procedure TCA_COMPE.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsCompeticao.DataSet.State in [dsInsert, dsEdit] then
    fraBotoesBtnCancelarClick(Self)
  else
    CA_COMPE.Close;
end;

procedure TCA_COMPE.RbIntClick(Sender: TObject);
begin
  if RbInt.Checked then
    EdtTipoCompet.Text := 'I';
end;

procedure TCA_COMPE.RbNacClick(Sender: TObject);
begin
  if RbNac.Checked then
    EdtTipoCompet.Text := 'N';
end;

end.yyyyyy
