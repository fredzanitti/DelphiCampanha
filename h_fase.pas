unit h_fase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids;

type
  Th_fases = class(TForm)
    Label1: TLabel;
    EdtPesquisa: TEdit;
    DbGridFase: TDBGrid;
    BtnSelecionar: TBitBtn;
    BtnIncluir: TBitBtn;
    procedure BtnSelecionarClick(Sender: TObject);
    procedure DbGridFaseDblClick(Sender: TObject);
    procedure EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnIncluirClick(Sender: TObject);
    procedure DbGridFaseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  var
    identificacao: String;
  end;

var
  h_fases: Th_fases;

implementation

{$R *.dfm}

uses module, funcoes, fases, jogos;

procedure Th_fases.BtnIncluirClick(Sender: TObject);
begin
  CA_FASE.ShowModal;
end;

procedure Th_fases.BtnSelecionarClick(Sender: TObject);
begin
  DbGridFaseDblClick(Self);
end;

procedure Th_fases.DbGridFaseDblClick(Sender: TObject);
begin
  if identificacao = 'CA_FASE' then
  begin
    FrmDm.TblFase.First;
    while FrmDm.TblFasecodfase.AsInteger <> DbGridFase.Columns[0]
      .Field.AsInteger do
    begin
      FrmDm.TblFase.Next;
    end;
    CA_FASE.estadoDosBotoesdeCadastro();
  end;

  if identificacao = 'CA_JOGOS' then
  begin
    CA_JOGOS.EdtCodFase.Text := DbGridFase.Columns[0].Field.AsString;
    CA_JOGOS.EdtFase.Text := f_gerais.buscarNome('nome', 'CA_FASE', 'codfase',
      CA_JOGOS.EdtCodFase.Text);
  end;
  h_fases.Close;
end;

procedure Th_fases.DbGridFaseDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  ShowScrollBar(TDBGrid(Sender).Handle, SB_HORZ, False); // Remove barra Horizontal
end;

procedure Th_fases.EdtPesquisaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // preencher grid da pesquisa de estádios
  f_gerais.pesquisaFase(DbGridFase, EdtPesquisa.Text);
end;

procedure Th_fases.FormActivate(Sender: TObject);
begin
  EdtPesquisa.Clear;
  EdtPesquisa.SetFocus;
end;

procedure Th_fases.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: // ações quando pressionar ESC
      begin
        h_fases.Close;
      end;
    VK_RETURN: // ações quando pressionar ENTER
      begin
        DbGridFaseDblClick(Self);
      end;
  end;
end;

end.
