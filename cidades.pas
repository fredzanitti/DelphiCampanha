unit cidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TCA_CIDAD = class(TForm)
    ImgBand: TImage;
    CbxPaisNovaCidade: TComboBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtCodCidade: TDBEdit;
    EdtNomeCidade: TDBEdit;
    EdtCodPais: TDBEdit;
    EdtCodUf: TDBEdit;
    ImgBandUf: TImage;
    Label6: TLabel;
    CbxUfNovaCidade: TComboBox;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    procedure CbxPaisNovaCidadeChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CbxUfNovaCidadeChange(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtNomeCidadeEnter(Sender: TObject);
    procedure EdtNomeCidadeExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CA_CIDAD: TCA_CIDAD;
  sql: String;

implementation

{$R *.dfm}

uses module, funcoes, home;

procedure TCA_CIDAD.CbxUfNovaCidadeChange(Sender: TObject);
begin
  f_gerais.buscaImagem(ImgBandUf, f_gerais.buscarNome('bandeira', 'ca_uf',
    'sigla', copy(CbxUfNovaCidade.Text, 1, 2)));

  EdtCodUf.Text := f_gerais.buscarNome('coduf', 'ca_uf', 'sigla',
    copy(CbxUfNovaCidade.Text, 1, 2));
end;

procedure TCA_CIDAD.EdtNomeCidadeEnter(Sender: TObject);
begin
  f_gerais.MudaCor('Entra', Sender);
end;

procedure TCA_CIDAD.EdtNomeCidadeExit(Sender: TObject);
begin
f_gerais.MudaCor('Sai', Sender);
end;

procedure TCA_CIDAD.BtnCancelarClick(Sender: TObject);
begin
  FrmDm.DtsCidade.DataSet.Cancel;
  CA_CIDAD.Close;
end;

procedure TCA_CIDAD.BtnGravarClick(Sender: TObject);
var
  msg: String;
begin

  if f_gerais.verificarStringEmBranco(EdtNomeCidade.Text, 'NOME DA CIDADE') then
  begin
    EdtNomeCidade.SetFocus;
  end
  else
  begin
    if (copy(CbxPaisNovaCidade.Text, 1, 3) = 'BRA') and
      (copy(CbxUfNovaCidade.Text, 1, 2) = 'EX') then
    begin
      msg := 'Se o país selecionado for o Brasil, ' + #13 +
        'o estado não poderá ser EX-Exterior';
      Application.MessageBox(Pchar(msg), 'ATENÇÃO', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      if (copy(CbxPaisNovaCidade.Text, 1, 3) <> 'BRA') and
        (copy(CbxUfNovaCidade.Text, 1, 2) <> 'EX') then
      begin
        msg := 'Se o país selecionado não for o Brasil, ' + #13 +
          'o estado deverá ser obrigatoriamente EX-Exterior';
        Application.MessageBox(Pchar(msg), 'ATENÇÃO',
          MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        sql := 'select count(*) from ca_cidad where codpais = :PAIS and coduf = :UF and nome = :CIDADE';
        FrmDm.QrContador.Close;
        FrmDm.QrContador.sql.Clear;
        FrmDm.QrContador.sql.Add(sql);
        FrmDm.QrContador.Params.ParamByName('CIDADE').AsString :=
          EdtNomeCidade.Text;
        FrmDm.QrContador.Params.ParamByName('PAIS').AsString := EdtCodPais.Text;
        FrmDm.QrContador.Params.ParamByName('UF').AsString := EdtCodUf.Text;
        FrmDm.QrContador.Open;

        if FrmDm.QrContador.Fields[0].AsInteger > 0 then
        begin
          Application.MessageBox('Esta cidade já está cadastrada!', 'ATENÇÃO',
            MB_OK + MB_ICONERROR);
        end
        else
        begin
          FrmDm.DtsCidade.DataSet.Post;
          Application.MessageBox('Cidade cadastrada com sucesso!', 'ATENÇÃO',
            MB_OK + MB_ICONINFORMATION);
          CA_CIDAD.Close;
        end;

      end;
    end;
  end;
end;

procedure TCA_CIDAD.CbxPaisNovaCidadeChange(Sender: TObject);
begin
  f_gerais.buscaImagem(ImgBand, f_gerais.buscarNome('bandeira', 'ca_pais',
    'sigla', copy(CbxPaisNovaCidade.Text, 1, 3)));

  EdtCodPais.Text := f_gerais.buscarNome('codpais', 'ca_pais', 'sigla',
    copy(CbxPaisNovaCidade.Text, 1, 3));

end;

procedure TCA_CIDAD.FormActivate(Sender: TObject);
begin
  f_gerais.preencherComboPais(CbxPaisNovaCidade);
  f_gerais.preencherComboUfSilgaNome(CbxUfNovaCidade);

  f_gerais.buscaImagem(ImgBand, f_gerais.buscarNome('bandeira', 'ca_pais',
    'sigla', copy(CbxPaisNovaCidade.Text, 1, 3)));
  f_gerais.buscaImagem(ImgBandUf, f_gerais.buscarNome('bandeira', 'ca_uf',
    'sigla', copy(CbxUfNovaCidade.Text, 1, 2)));
  EdtCodPais.Text := f_gerais.buscarNome('codpais', 'ca_pais', 'sigla',
    copy(CbxPaisNovaCidade.Text, 1, 3));
  EdtCodUf.Text := f_gerais.buscarNome('coduf', 'ca_uf', 'sigla',
    copy(CbxUfNovaCidade.Text, 1, 2));
end;

procedure TCA_CIDAD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        CA_CIDAD.Close;
      end;
  end;
end;

end.
