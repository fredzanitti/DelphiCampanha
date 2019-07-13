unit framePesquisaCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TfraCidades = class(TFrame)
    GroupBox2: TGroupBox;
    ImgBandPaisAdver: TImage;
    LblCidade: TLabel;
    ImgUfAdver: TImage;
    LblPais: TLabel;
    LblUf: TLabel;
    BtnLocCidade: TBitBtn;
    procedure BtnLocCidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    formulario: String;
  end;

implementation

{$R *.dfm}

uses funcoes, pesquisacidades;

procedure TfraCidades.BtnLocCidadeClick(Sender: TObject);
begin
  // preencher grid da pesquisa de cidades
  f_gerais.pesquisaCidade(h_cidades.DbGridCidades, 'TODOS');
  h_cidades.identificacao := formulario;
  h_cidades.ShowModal;
end;

end.
