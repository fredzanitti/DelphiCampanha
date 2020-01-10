unit titulos;

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
  TES_TITULOS = class(TForm)
    Label1: TLabel;
    EdtAno: TDBEdit;
    Label2: TLabel;
    EdtCompeticao: TDBEdit;
    MainMenu: TMainMenu;
    MnArquivo: TMenuItem;
    MnCadastrar: TMenuItem;
    MnEditar: TMenuItem;
    MnExcluir: TMenuItem;
    MnSair: TMenuItem;
    EdtCompExtenso: TEdit;
    BtnCompeticao: TBitBtn;
    fraBotoes1: TfraBotoes;
    procedure MnCadastrarClick(Sender: TObject);
    procedure MnEditarClick(Sender: TObject);
    procedure MnExcluirClick(Sender: TObject);
    procedure MnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCompeticaoClick(Sender: TObject);
    procedure fraBotoes1BtnPrimeiroClick(Sender: TObject);
    procedure fraBotoes1BtnAnteriorClick(Sender: TObject);
    procedure fraBotoes1BtnProximoClick(Sender: TObject);
    procedure fraBotoes1BtnUltimoClick(Sender: TObject);
    procedure fraBotoes1BtnIncluirClick(Sender: TObject);
    procedure fraBotoes1BtnEditarClick(Sender: TObject);
    procedure fraBotoes1BtnExcluirClick(Sender: TObject);
    procedure fraBotoes1BtnGravarClick(Sender: TObject);
    procedure fraBotoes1BtnCancelarClick(Sender: TObject);
    procedure fraBotoes1BtnPesquisarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro();
  end;

var
  ES_TITULOS: TES_TITULOS;

implementation

{$R *.dfm}

uses module, funcoes, pesquisatitulos, home, pesquisacompeticao;

{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TES_TITULOS.estadoDosBotoesdeCadastro();
begin
  fraBotoes1.estadoDosBotoesdeCadastro(FrmDm.DtsTitulos.DataSet.State);
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if FrmDm.DtsTitulos.DataSet.State in [dsBrowse] then
  begin
    // botões
    MnCadastrar.Enabled := true;
    MnEditar.Enabled := true;
    MnExcluir.Enabled := true;
    // demais componentes
    EdtAno.Enabled := false;
    BtnCompeticao.Enabled := false;
    if EdtCompeticao.Text <> EmptyStr then
        EdtCompExtenso.Text := f_gerais.retornaNomeCompeticao
          (StrToInt(EdtCompeticao.Text));
  end;

  if FrmDm.DtsTitulos.DataSet.State in [dsInsert, dsEdit] then
  begin
    // botões
    MnCadastrar.Enabled := false;
    MnEditar.Enabled := false;
    MnExcluir.Enabled := false;
    // demais componentes
    EdtAno.Enabled := true;
    BtnCompeticao.Enabled := true;
    EdtCompExtenso.Clear;
    EdtAno.SetFocus;
  end;
end;

procedure TES_TITULOS.FormActivate(Sender: TObject);
begin
  fraBotoes1BtnCancelarClick(Self);
  fraBotoes1.estadoDosBotoesdeCadastro(FrmDm.DtsTitulos.DataSet.State);
end;

procedure TES_TITULOS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MnSairClick(Self);
end;

procedure TES_TITULOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F5:
      begin
        fraBotoes1BtnIncluirClick(Self);
      end;
    VK_ESCAPE:
      begin
        if FrmDm.DtsTitulos.DataSet.State in [dsInsert, dsEdit] then
          fraBotoes1BtnCancelarClick(Self)
        else
          MnSairClick(Self);
      end;
    VK_RETURN:
      begin
        fraBotoes1BtnGravarClick(Self);
      end;
    VK_LEFT:
      begin
        if not(FrmDm.DtsTitulos.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoes1BtnAnteriorClick(Self);
      end;
    VK_RIGHT:
      begin
        if not(FrmDm.DtsTitulos.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoes1BtnProximoClick(Self);
      end;
    VK_HOME:
      begin
        if not(FrmDm.DtsTitulos.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoes1BtnPrimeiroClick(Self);
      end;
    VK_END:
      begin
        if not(FrmDm.DtsTitulos.DataSet.State in [dsInsert, dsEdit]) then
          fraBotoes1BtnUltimoClick(Self);
      end;
    VK_F10:
      fraBotoes1BtnPesquisarClick(Self);
  end;
end;

procedure TES_TITULOS.fraBotoes1BtnAnteriorClick(Sender: TObject);
begin
  FrmDm.DtsTitulos.DataSet.Prior;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.fraBotoes1BtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsTitulos.DataSet.Cancel;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.fraBotoes1BtnEditarClick(Sender: TObject);
begin
  FrmDm.DtsTitulos.DataSet.Edit;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.fraBotoes1BtnExcluirClick(Sender: TObject);
begin
  if f_gerais.desejaRealizarAcao('excluir o registro?') then
  begin
    // deletar o registro do título cadastrado
    FrmDm.DtsTitulos.DataSet.Delete;
    // restaurar estado dos botões
    estadoDosBotoesdeCadastro();
  end;
end;

procedure TES_TITULOS.fraBotoes1BtnGravarClick(Sender: TObject);
var
  ano: Word;
begin
  if f_gerais.verificarStringEmBranco(EdtAno.Text, 'ANO') then
    EdtAno.SetFocus
  else
  begin
    ano := StrToInt(EdtAno.Text);
    if ano > CurrentYear then
    begin
      Application.MessageBox('Não se pode cadastrar possíveis títulos. ' + #13 +
        'O ano selecionado deve ser menor ou igual ao ano corrente.', 'ATENÇÃO',
        MB_OK + MB_ICONERROR);
      EdtAno.SetFocus;
    end
    else
    begin
      if f_gerais.verificarStringEmBranco(EdtCompExtenso.Text, 'COMPETIÇÃO')
      then
        BtnCompeticao.SetFocus
      else
      begin

        sql := 'select count(*) from es_titulos ' +
          'where ano = :ANO and codcompeticao = :CODIGO';

        FrmDm.QrContador.Close;
        FrmDm.QrContador.sql.Clear;
        FrmDm.QrContador.sql.Add(sql);
        FrmDm.QrContador.Params.ParamByName('ANO').AsString := EdtAno.Text;
        FrmDm.QrContador.Params.ParamByName('CODIGO').AsString :=
          EdtCompeticao.Text;
        FrmDm.QrContador.Open;

        if FrmDm.QrContador.Fields[0].AsInteger = 0 then
        begin
          FrmDm.DtsTitulos.DataSet.Post;
          estadoDosBotoesdeCadastro();
          FrmDm.DtsTitulos.DataSet.Refresh;
        end
        else
        begin
          Application.MessageBox('Este título já está cadastrado!', 'ATENÇÃO',
            MB_OK + MB_ICONINFORMATION);
        end;
      end;
    end;
  end;
end;

procedure TES_TITULOS.fraBotoes1BtnIncluirClick(Sender: TObject);
begin
  FrmDm.DtsTitulos.DataSet.Append;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.fraBotoes1BtnPesquisarClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisatitulos(h_titulos.DbGridTitulos, 'TODOS');
  h_titulos.identificacao := 'ES_TITULOS';
  h_titulos.ShowModal;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.fraBotoes1BtnPrimeiroClick(Sender: TObject);
begin
  FrmDm.DtsTitulos.DataSet.First;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.fraBotoes1BtnProximoClick(Sender: TObject);
begin
  FrmDm.DtsTitulos.DataSet.Next;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.fraBotoes1BtnUltimoClick(Sender: TObject);
begin
  FrmDm.DtsTitulos.DataSet.Last;
  estadoDosBotoesdeCadastro();
end;

procedure TES_TITULOS.MnCadastrarClick(Sender: TObject);
begin
  fraBotoes1BtnIncluirClick(Self);
end;

procedure TES_TITULOS.MnEditarClick(Sender: TObject);
begin
  fraBotoes1BtnEditarClick(Self);
end;

procedure TES_TITULOS.MnExcluirClick(Sender: TObject);
begin
  fraBotoes1BtnExcluirClick(Self);
end;

procedure TES_TITULOS.MnSairClick(Sender: TObject);
begin
  if FrmDm.DtsTitulos.DataSet.State in [dsInsert, dsEdit] then
    fraBotoes1BtnCancelarClick(Self)
  else
    ES_TITULOS.Close;
end;

procedure TES_TITULOS.BtnCompeticaoClick(Sender: TObject);
begin
  // preencher grid da pesquisa de clubes
  f_gerais.pesquisacompeticao(h_competicao.DbGridCompeticao, 'TODOS');
  h_competicao.identificacao := 'ES_TITULOS';
  h_competicao.ShowModal;
end;

end.
