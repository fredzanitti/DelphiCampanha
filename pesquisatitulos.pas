unit pesquisatitulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  Th_titulos = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridTitulos: TDBGrid;
    BtnSelecionar: TBitBtn;
    procedure DbGridTitulosDblClick(Sender: TObject);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSelecionarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_titulos: Th_titulos;

implementation

{$R *.dfm}

uses funcoes, module, titulos;

procedure Th_titulos.BtnSelecionarClick(Sender: TObject);
begin
  DbGridTitulosDblClick(Self);
end;

procedure Th_titulos.DbGridTitulosDblClick(Sender: TObject);
begin
  if identificacao = 'ES_TITULOS' then
  begin
    FrmDm.TblTitulos.First;
    while (FrmDm.TblTitulosano.AsInteger <> DbGridTitulos.Columns[0]
      .Field.AsInteger) and (FrmDm.TblTituloscodcompeticao.AsInteger <>
      DbGridTitulos.Columns[2].Field.AsInteger) do
    begin
      FrmDm.TblTitulos.Next;
    end;
    ES_TITULOS.estadoDosBotoesdeCadastro();
  end;
  h_titulos.Close;
end;

procedure Th_titulos.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de títulos
  f_gerais.pesquisatitulos(DbGridTitulos, EdtPesquisa.Text);
end;

procedure Th_titulos.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_titulos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_titulos.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridTitulosDblClick(Self);
      end;
  end;
end;

end.






