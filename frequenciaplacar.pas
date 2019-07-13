unit frequenciaplacar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMemo, cxListBox;

type
  Th_freqplacar = class(TForm)
    QrEst: TFDQuery;
    DtsQrEst: TDataSource;
    LblTitulo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LtFavor: TListBox;
    LtContra: TListBox;
    Label4: TLabel;
    LtGeral: TListBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure preencheListBox();
  end;

var
  h_freqplacar: Th_freqplacar;

implementation

{$R *.dfm}

uses module, UProgresso;

procedure Th_freqplacar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        h_freqplacar.Close;
      end;
  end;
end;

procedure Th_freqplacar.preencheListBox();
var
  i, j, max: integer;
  sql: String;
begin

  LtFavor.Clear;
  LtContra.Clear;
  LtGeral.Clear;

  // placar máximo
  sql := 'select max(a.ma), min(mi) from( ' +
    'select max(placar1) ma, min(placar1) mi ' + 'from ca_jogos ' + 'union ' +
    'select max(placar2) ma, min(placar2) mi ' + 'from ca_jogos ' + ') as a';

  QrEst.Close;
  QrEst.sql.Clear;
  QrEst.sql.Add(sql);
  QrEst.Open;
  max := QrEst.Fields[0].AsInteger;

  // geral
  // Modifica o cursor para ampulheta
  Screen.Cursor := crHourGlass;
  // Cria o formulário de progresso
  frmProgresso := TfrmProgresso.Create(Self);
  // Define o mínimo da barra de progresso
  frmProgresso.gauProgresso.MinValue := 0;
  // Define o máximo da barra de progresso como o número total de itens no listview
  frmProgresso.gauProgresso.MaxValue := QrEst.RecordCount;
  // Zera a barra de progresso
  frmProgresso.gauProgresso.Progress := 0;
  // Exibe o formulário de progresso
  frmProgresso.Show;
  // Informa que a planilha está sendo criada
  frmProgresso.lblMensagem.Caption :=  'Processando informações - Geral...';
  // Atualiza o label para exibir a mensagem para o usuário
  frmProgresso.lblMensagem.Update;
  for i := 0 to max do
  begin
    // Processa as mensagens do sistema operacional
    Application.ProcessMessages;
    // Progresso percentual
    frmProgresso.gauProgresso.Progress := I;
    for j := i to max do
    begin
      sql := 'select count(*) ' + 'from ca_jogos j, es_resum r ' +
        'where j.codjogo = r.codjogo ' + 'and ((j.placar1 = ' + IntToStr(i) +
        ' and j.placar2 = ' + IntToStr(j) + ') or (j.placar1 = ' + IntToStr(j) +
        ' and j.placar2 = ' + IntToStr(i) + '))';

      QrEst.Close;
      QrEst.sql.Clear;
      QrEst.sql.Add(sql);
      QrEst.Open;

      if QrEst.Fields[0].AsInteger > 0 then
      begin
        if QrEst.Fields[0].AsInteger = 1 then
        begin
          LtGeral.Items.Add('  ' + IntToStr(j) + 'x' + IntToStr(i) + ' - ' +
            QrEst.Fields[0].AsString + ' vez');
        end
        else
        begin
          LtGeral.Items.Add('  ' + IntToStr(j) + 'x' + IntToStr(i) + ' - ' +
            QrEst.Fields[0].AsString + ' vezes');
        end;
      end;
    end;
  end;
  // Libera o formulário de progresso da memória
  if Assigned(frmProgresso) then
     frmProgresso.Free;
  // Atribui o cursor salvo no começo do método
  Screen.Cursor := crDefault;

  // a favor
  // Modifica o cursor para ampulheta
  Screen.Cursor := crHourGlass;
  // Cria o formulário de progresso
  frmProgresso := TfrmProgresso.Create(Self);
  // Define o mínimo da barra de progresso
  frmProgresso.gauProgresso.MinValue := 0;
  // Define o máximo da barra de progresso como o número total de itens no listview
  frmProgresso.gauProgresso.MaxValue := QrEst.RecordCount;
  // Zera a barra de progresso
  frmProgresso.gauProgresso.Progress := 0;
  // Exibe o formulário de progresso
  frmProgresso.Show;
  // Informa que a planilha está sendo criada
  frmProgresso.lblMensagem.Caption :=  'Processando informações - A Favor...';
  // Atualiza o label para exibir a mensagem para o usuário
  frmProgresso.lblMensagem.Update;
  for i := 0 to max do
  begin
    // Processa as mensagens do sistema operacional
    Application.ProcessMessages;
    // Progresso percentual
    frmProgresso.gauProgresso.Progress := I;
    for j := i to max do
    begin
      sql := 'select count(*) ' + 'from ca_jogos j, es_resum r ' +
        'where j.codjogo = r.codjogo ' + 'and ((j.placar1 = ' + IntToStr(i) +
        ' and j.placar2 = ' + IntToStr(j) + ') or (j.placar1 = ' + IntToStr(j) +
        ' and j.placar2 = ' + IntToStr(i) + ')) ' + 'and r.sg >=0';

      QrEst.Close;
      QrEst.sql.Clear;
      QrEst.sql.Add(sql);
      QrEst.Open;

      if QrEst.Fields[0].AsInteger > 0 then
      begin
        if QrEst.Fields[0].AsInteger = 1 then
        begin
          LtFavor.Items.Add('  ' + IntToStr(j) + 'x' + IntToStr(i) + ' - ' +
            QrEst.Fields[0].AsString + ' vez');
        end
        else
        begin
          LtFavor.Items.Add('  ' + IntToStr(j) + 'x' + IntToStr(i) + ' - ' +
            QrEst.Fields[0].AsString + ' vezes');
        end;
      end;
    end;
  end;
  // Libera o formulário de progresso da memória
  if Assigned(frmProgresso) then
     frmProgresso.Free;
  // Atribui o cursor salvo no começo do método
  Screen.Cursor := crDefault;

  // contra
  // Modifica o cursor para ampulheta
  Screen.Cursor := crHourGlass;
  // Cria o formulário de progresso
  frmProgresso := TfrmProgresso.Create(Self);
  // Define o mínimo da barra de progresso
  frmProgresso.gauProgresso.MinValue := 0;
  // Define o máximo da barra de progresso como o número total de itens no listview
  frmProgresso.gauProgresso.MaxValue := QrEst.RecordCount;
  // Zera a barra de progresso
  frmProgresso.gauProgresso.Progress := 0;
  // Exibe o formulário de progresso
  frmProgresso.Show;
  // Informa que a planilha está sendo criada
  frmProgresso.lblMensagem.Caption :=  'Processando informações - Contra...';
  // Atualiza o label para exibir a mensagem para o usuário
  frmProgresso.lblMensagem.Update;
  for i := 0 to max do
  begin
    // Processa as mensagens do sistema operacional
    Application.ProcessMessages;
    // Progresso percentual
    frmProgresso.gauProgresso.Progress := I;
    for j := i to max do
    begin
      sql := 'select count(*) ' + 'from ca_jogos j, es_resum r ' +
        'where j.codjogo = r.codjogo ' + 'and ((j.placar1 = ' + IntToStr(i) +
        ' and j.placar2 = ' + IntToStr(j) + ') or (j.placar1 = ' + IntToStr(j) +
        ' and j.placar2 = ' + IntToStr(i) + ')) ' + 'and r.sg <0';

      QrEst.Close;
      QrEst.sql.Clear;
      QrEst.sql.Add(sql);
      QrEst.Open;

      if QrEst.Fields[0].AsInteger > 0 then
      begin
        if QrEst.Fields[0].AsInteger = 1 then
        begin
          LtContra.Items.Add('  ' + IntToStr(j) + 'x' + IntToStr(i) + ' - ' +
            QrEst.Fields[0].AsString + ' vez');
        end
        else
        begin
          LtContra.Items.Add('  ' + IntToStr(j) + 'x' + IntToStr(i) + ' - ' +
            QrEst.Fields[0].AsString + ' vezes');
        end;
      end;
    end;
  end;
  // Libera o formulário de progresso da memória
  if Assigned(frmProgresso) then
     frmProgresso.Free;
  // Atribui o cursor salvo no começo do método
  Screen.Cursor := crDefault;
end;

end.
