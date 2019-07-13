unit frameBotoesMenuPadrao;

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
  FireDAC.Comp.UI, jpeg, Vcl.Buttons, Vcl.ExtDlgs, Vcl.Menus;

type
  TfraBotoes = class(TFrame)
    BtnCancelar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnEditar: TBitBtn;
    BtnIncluir: TBitBtn;
    BtnUltimo: TBitBtn;
    BtnProximo: TBitBtn;
    BtnAnterior: TBitBtn;
    BtnPrimeiro: TBitBtn;
    BtnGravar: TBitBtn;
    BtnPesquisar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure estadoDosBotoesdeCadastro(dataSetState: TDataSetState);
  end;

implementation

{$R *.dfm}


{
  =======================================================
  Ativar ou desativar botões de Cadastro
  =======================================================
}
procedure TfraBotoes.estadoDosBotoesdeCadastro(dataSetState: TDataSetState);
begin
  { O Dataset está aberto. Seus dados podem ser visualizados, mas não podem ser alterados. }
  if dataSetState in [dsBrowse] then
  begin
    // botões
    BtnPrimeiro.Enabled := true;
    BtnAnterior.Enabled := true;
    BtnProximo.Enabled := true;
    BtnUltimo.Enabled := true;
    BtnIncluir.Enabled := true;
    BtnEditar.Enabled := true;
    BtnExcluir.Enabled := true;
    BtnGravar.Enabled := false;
    BtnCancelar.Enabled := false;
    BtnPesquisar.Enabled := true;
  end;

  if dataSetState in [dsInsert, dsEdit] then
  begin
    // botões
    BtnPrimeiro.Enabled := false;
    BtnAnterior.Enabled := false;
    BtnProximo.Enabled := false;
    BtnUltimo.Enabled := false;
    BtnIncluir.Enabled := false;
    BtnEditar.Enabled := false;
    BtnExcluir.Enabled := false;
    BtnGravar.Enabled := true;
    BtnCancelar.Enabled := true;
    BtnPesquisar.Enabled := false;
  end;
end;

end.
