unit selecionarfoto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, jpeg,
  Vcl.Buttons, Vcl.ExtDlgs;

type
  Th_editafoto = class(TForm)
    GroupBox1: TGroupBox;
    ImgSelecionada: TImage;
    Delimitador: TShape;
    GroupBox2: TGroupBox;
    ImgFinal: TImage;
    Label1: TLabel;
    Label2: TLabel;
    OpenFoto: TOpenPictureDialog;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure ImgSelecionadaClick(Sender: TObject);
    procedure GroupBox1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  h_editafoto: Th_editafoto;
  caminho, caminhoArquivoFoto, caminhoIndisp: String;

implementation

{$R *.dfm}

uses module, jogadores, funcoes;

procedure Th_editafoto.FormActivate(Sender: TObject);
begin
  caminho :=
    'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Jogadores\JOG_';
  caminhoIndisp :=
    'C:\Arquivos de programas\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Imagens\indisponivel.jpg'
end;

procedure Th_editafoto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift // se control estiver pressionado
  then
  begin
    case Key of
      VK_LEFT:
        ImgSelecionada.Left := ImgSelecionada.Left - 10;
      VK_RIGHT:
        ImgSelecionada.Left := ImgSelecionada.Left + 10;
      VK_UP:
        ImgSelecionada.Top := ImgSelecionada.Top - 10;
      VK_DOWN:
        ImgSelecionada.Top := ImgSelecionada.Top + 10;
    end;
  end;

  case Key of
    VK_ESCAPE:
      begin
        f_gerais.buscaImagemJogador(CA_JOGAD.ImgFoto, caminhoIndisp);
        CA_JOGAD.EdtFoto.Text := caminhoIndisp;
        h_editafoto.Close;
      end;
    VK_LEFT:
      begin
        ImgSelecionada.Left := ImgSelecionada.Left - 1;
        f_gerais.cortarFoto(ImgFinal, ImgSelecionada, Delimitador);
      end;
    VK_RIGHT:
      begin
        ImgSelecionada.Left := ImgSelecionada.Left + 1;
        f_gerais.cortarFoto(ImgFinal, ImgSelecionada, Delimitador);
      end;
    VK_UP:
      begin
        ImgSelecionada.Top := ImgSelecionada.Top - 1;
        f_gerais.cortarFoto(ImgFinal, ImgSelecionada, Delimitador);
      end;
    VK_DOWN:
      begin
        ImgSelecionada.Top := ImgSelecionada.Top + 1;
        f_gerais.cortarFoto(ImgFinal, ImgSelecionada, Delimitador);
      end;

    VK_RETURN:
      begin
        if ImgFinal.Picture.Graphic <> nil then
        begin
          // salvar e visualizar foto
          caminhoArquivoFoto :=
            PChar(caminho + FormatFloat('00000',
            StrToFloat(CA_JOGAD.EdtCodigo.Text)) + '.bmp');

          ImgFinal.Picture.SaveToFile(caminhoArquivoFoto);
          f_gerais.buscaImagemJogador(CA_JOGAD.ImgFoto, caminhoArquivoFoto);
          CA_JOGAD.EdtFoto.Text := caminhoArquivoFoto;
          h_editafoto.Close;
        end
        else
        begin
          Application.MessageBox
            ('Se a VISUALIZAÇÃO DO CORTE está "em branco", significa que nenhuma irmagem foi cortada.'
            + #13 + 'Selecione o local de corte ou cancele a busca.' + #13 +
            'Caso cancele a ação a imagem assumirá o padrão "IMAGEM NÃO DISPONÍVEL".',
            'CORTE NÃO SELECIONADO', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;
      end;

  end;
end;

procedure Th_editafoto.GroupBox1DblClick(Sender: TObject);
begin
  ImgSelecionadaClick(Self);
end;

procedure Th_editafoto.ImgSelecionadaClick(Sender: TObject);
begin
  if OpenFoto.Execute then
  begin
    ImgSelecionada.Picture.LoadFromFile(OpenFoto.FileName);
    if (ImgSelecionada.Width > 1024) and (ImgSelecionada.Height > 768) then
      ImgSelecionada.Stretch := True
    else
      ImgSelecionada.Stretch := False;
  end;
end;

end.

