unit SelRelatorioJogador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  frameSelecionarPosicao, frameSelecionarJogador, relTodosJogadores,
  relTodosJogadoresComFoto, Vcl.ExtCtrls,
  frameSelecionarNacionalidade, frameSelecionarAno;

type
  TfrmSelRelatorioJogador = class(TForm)
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    cbhAtuais: TCheckBox;
    rgTipoRel: TRadioGroup;
    fraSelJogador: TfraSelJogador;
    fraSelPosicao: TfraSelPosicao;
    fraSelNacionalidade: TfraSelNacionalidade;
    fraSelecionarAno: TfraSelecionarAno;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure fraSelJogador1dblJogadorClick(Sender: TObject);
    procedure fraSelNacJogadordblPaisClick(Sender: TObject);
    procedure fraSelNacJogadorchbTodosClick(Sender: TObject);
    procedure fraSelNacionalidade1chbTodosClick(Sender: TObject);
    procedure fraSelNacionalidadedblPaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelatorioJogador: TfrmSelRelatorioJogador;

implementation

{$R *.dfm}

procedure TfrmSelRelatorioJogador.BtnCancelarClick(Sender: TObject);
begin
  frmSelRelatorioJogador.Close;
end;

procedure TfrmSelRelatorioJogador.BtnGravarClick(Sender: TObject);
var
  sql: String;
begin
  if rgTipoRel.ItemIndex = 0 then // relatorio sem foto
  begin
  {
    sql := 'SELECT ca_jogad.codjogador as Codigo, ca_jogad.nome as Apelido, ' +
      'ca_jogad.nomecompleto as NomeCompleto, ca_jogad.dtnasc as DataNascimento, '
      + 'ca_cidad.nome as LocalNascimento,  CASE WHEN ca_uf.sigla = "EX" THEN "" '
      + 'ELSE ca_uf.nome END as Estado, ca_pais.nome as Pais, ca_posic.descricao as Posicao, '
      + 'CASE WHEN ca_jogad.situacao = 1 THEN "Não joga mais no clube" ' +
      'ELSE "Jogando atualmente" END as Situacao,ca_pais.bandeira as Bandeira '
      + 'FROM ca_jogad INNER JOIN ca_cidad ON ca_cidad.CodCidade = ca_jogad.CodCidade '
      + 'INNER JOIN ca_posic ON ca_posic.codposicao = ca_jogad.codposicao ' +
      'INNER JOIN ca_uf ON ca_cidad.coduf = ca_uf.coduf ' +
      'INNER JOIN ca_pais ON ca_cidad.codpais = ca_pais.codpais ' +
      'WHERE ((:TODOSJOGADORES <> 0) OR (ca_jogad.codjogador = :CODJOGADOR)) ' +
      'AND ((:TODASPOSICOES <> 0) OR (ca_posic.codposicao = :CODPOSICAO)) ' +
      'AND ((:TODOS <> 0) OR (ca_jogad.situacao = :TODOSATUAIS)) ' +
      'AND ((:TODOSPAISES <> 0) OR (ca_pais.codpais = :CODIGOPAIS)) ' +
      'ORDER BY ca_jogad.nome';
    }

    sql :=  'SELECT J.Codigo, J.Apelido, J.NomeCompleto, J.DataNascimento, J.LocalNascimento, ' +
            '       J.Estado, J.Pais, J.Posicao, J.Situacao, J.Bandeira ' +
            'FROM ( ' +
            'SELECT distinct ca_jogad.codjogador as Codigo, ca_jogad.nome as Apelido, ' +
            '      ca_jogad.nomecompleto as NomeCompleto, ca_jogad.dtnasc as DataNascimento, ' +
            '      ca_cidad.nome as LocalNascimento,  CASE WHEN ca_uf.sigla = "EX" THEN "" ' +
            '      ELSE ca_uf.nome END as Estado, ca_pais.nome as Pais, ca_posic.descricao as Posicao, ' +
            '      CASE WHEN ca_jogad.situacao = 1 THEN "Não joga mais no clube" ' +
            '      ELSE "Jogando atualmente" END as Situacao, ca_pais.bandeira as Bandeira ' +
            '      FROM ca_jogad INNER JOIN ca_cidad ON ca_cidad.CodCidade = ca_jogad.CodCidade ' +
            '      INNER JOIN ca_posic ON ca_posic.codposicao = ca_jogad.codposicao ' +
            '      INNER JOIN ca_uf ON ca_cidad.coduf = ca_uf.coduf ' +
            '      INNER JOIN ca_pais ON ca_cidad.codpais = ca_pais.codpais ' +
            '      INNER JOIN es_titul ON es_titul.codjogador = ca_jogad.codjogador ' +
            '      INNER JOIN ca_jogos ON es_titul.codjogo = ca_jogos.codjogo ' +
            '      WHERE ((:TODOSJOGADORES <> 0) OR (ca_jogad.codjogador = :CODJOGADOR)) ' +
            '      AND ((:TODASPOSICOES <> 0) OR (ca_posic.codposicao = :CODPOSICAO)) ' +
            '      AND ((:TODOS <> 0) OR (ca_jogad.situacao = :TODOSATUAIS)) ' +
            '      AND ((:TODOSPAISES <> 0) OR (ca_pais.codpais = :CODIGOPAIS)) ' +
            '      AND ((:TODOSANOS <> 0) OR (YEAR(ca_jogos.data) = :ANO)) ' +
            'UNION ' +
            'SELECT distinct ca_jogad.codjogador as Codigo, ca_jogad.nome as Apelido, ' +
            '      ca_jogad.nomecompleto as NomeCompleto, ca_jogad.dtnasc as DataNascimento, ' +
            '      ca_cidad.nome as LocalNascimento,  CASE WHEN ca_uf.sigla = "EX" THEN "" ' +
            '      ELSE ca_uf.nome END as Estado, ca_pais.nome as Pais, ca_posic.descricao as Posicao, ' +
            '      CASE WHEN ca_jogad.situacao = 1 THEN "Não joga mais no clube" ' +
            '      ELSE "Jogando atualmente" END as Situacao,ca_pais.bandeira as Bandeira ' +
            '      FROM ca_jogad INNER JOIN ca_cidad ON ca_cidad.CodCidade = ca_jogad.CodCidade ' +
            '      INNER JOIN ca_posic ON ca_posic.codposicao = ca_jogad.codposicao ' +
            '      INNER JOIN ca_uf ON ca_cidad.coduf = ca_uf.coduf ' +
            '      INNER JOIN ca_pais ON ca_cidad.codpais = ca_pais.codpais ' +
            '      INNER JOIN es_reser ON es_reser.codjogador = ca_jogad.codjogador ' +
            '      INNER JOIN ca_jogos ON es_reser.codjogo = ca_jogos.codjogo ' +
            '      WHERE ((:TODOSJOGADORES <> 0) OR (ca_jogad.codjogador = :CODJOGADOR)) ' +
            '      AND ((:TODASPOSICOES <> 0) OR (ca_posic.codposicao = :CODPOSICAO)) ' +
            '      AND ((:TODOS <> 0) OR (ca_jogad.situacao = :TODOSATUAIS)) ' +
            '      AND ((:TODOSPAISES <> 0) OR (ca_pais.codpais = :CODIGOPAIS)) ' +
            '      AND ((:TODOSANOS <> 0) OR (YEAR(ca_jogos.data) = :ANO)) ' +
            ') AS J ' +
            'ORDER BY J.Apelido';

    frmRelJogador.qryJogadores.Close;
    frmRelJogador.qryJogadores.sql.Clear;
    frmRelJogador.qryJogadores.sql.Add(sql);

    // filtra jogador
    if fraSelJogador.chbTodos.Checked then
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSJOGADORES')
        .AsInteger := 1;
      frmRelJogador.qryJogadores.Params.ParamByName('CODJOGADOR')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSJOGADORES')
        .AsInteger := 0;
      frmRelJogador.qryJogadores.Params.ParamByName('CODJOGADOR').AsInteger :=
        fraSelJogador.codigoJogador;
    end;

    // filtra posicao
    if fraSelPosicao.chbTodos.Checked then
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODASPOSICOES')
        .AsInteger := 1;
      frmRelJogador.qryJogadores.Params.ParamByName('CODPOSICAO')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODASPOSICOES')
        .AsInteger := 0;
      frmRelJogador.qryJogadores.Params.ParamByName('CODPOSICAO').AsInteger :=
        fraSelPosicao.codigoPosicao;
    end;

    // filtra nacionalidade
    if fraSelNacionalidade.chbTodos.Checked then
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSPAISES')
        .AsInteger := 1;
      frmRelJogador.qryJogadores.Params.ParamByName('CODIGOPAIS')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSPAISES')
        .AsInteger := 0;
      frmRelJogador.qryJogadores.Params.ParamByName('CODIGOPAIS').AsInteger :=
        fraSelNacionalidade.CodigoPais;
    end;

    // filtra situacao
    if cbhAtuais.Checked then
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOS').AsInteger := 0;
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSATUAIS')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOS').AsInteger := 1;
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSATUAIS')
        .AsInteger := 1;
    end;

    // filtra ano
    if fraSelecionarAno.chbTodos.Checked then
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSANOS')
        .AsInteger := 1;
      frmRelJogador.qryJogadores.Params.ParamByName('ANO')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogador.qryJogadores.Params.ParamByName('TODOSANOS')
        .AsInteger := 0;
      frmRelJogador.qryJogadores.Params.ParamByName('ANO')
        .AsInteger := fraSelecionarAno.Ano;
    end;

    frmRelJogador.qryJogadores.Open;
    if frmRelJogador.qryJogadores.RecordCount = 0 then
      Application.MessageBox('Nenhuma informação para esta seleção de dados!',
        'ATENÇÃO', MB_OK + MB_ICONWARNING)
    else
    begin
      frmRelJogador.frxRelJogadores.PrepareReport();
      frmRelJogador.frxRelJogadores.ShowPreparedReport;
    end;
  end // fim relatorio sem foto
  else
  begin // relatório com foto
  {
    sql := 'SELECT ca_jogad.codjogador as Codigo, ca_jogad.nome as Apelido, ' +
      'ca_jogad.nomecompleto as NomeCompleto, ca_jogad.dtnasc as DataNascimento, '
      + 'ca_cidad.nome as LocalNascimento,  CASE WHEN ca_uf.sigla = "EX" THEN "" '
      + 'ELSE ca_uf.nome END as Estado, ca_pais.nome as Pais, ca_posic.descricao as Posicao, '
      + 'CASE WHEN ca_jogad.situacao = 1 THEN "Não joga mais no clube" ' +
      'ELSE "Jogando atualmente" END as Situacao,ca_pais.bandeira as Bandeira, ca_jogad.foto as Foto '
      + 'FROM ca_jogad INNER JOIN ca_cidad ON ca_cidad.CodCidade = ca_jogad.CodCidade '
      + 'INNER JOIN ca_posic ON ca_posic.codposicao = ca_jogad.codposicao ' +
      'INNER JOIN ca_uf ON ca_cidad.coduf = ca_uf.coduf ' +
      'INNER JOIN ca_pais ON ca_cidad.codpais = ca_pais.codpais ' +
      'WHERE ((:TODOSJOGADORES <> 0) OR (ca_jogad.codjogador = :CODJOGADOR)) ' +
      'AND ((:TODASPOSICOES <> 0) OR (ca_posic.codposicao = :CODPOSICAO)) ' +
      'AND ((:TODOS <> 0) OR (ca_jogad.situacao = :TODOSATUAIS)) ' +
      'AND ((:TODOSPAISES <> 0) OR (ca_pais.codpais = :CODIGOPAIS)) ' +
      'ORDER BY ca_jogad.nome';
    }

    sql :=  'SELECT J.Codigo, J.Apelido, J.NomeCompleto, J.DataNascimento, J.LocalNascimento, ' +
            '       J.Estado, J.Pais, J.Posicao, J.Situacao, J.Bandeira, J.Foto ' +
            'FROM ( ' +
            'SELECT distinct ca_jogad.codjogador as Codigo, ca_jogad.nome as Apelido, ' +
            '      ca_jogad.nomecompleto as NomeCompleto, ca_jogad.dtnasc as DataNascimento, ' +
            '      ca_cidad.nome as LocalNascimento,  CASE WHEN ca_uf.sigla = "EX" THEN "" ' +
            '      ELSE ca_uf.nome END as Estado, ca_pais.nome as Pais, ca_posic.descricao as Posicao, ' +
            '      CASE WHEN ca_jogad.situacao = 1 THEN "Não joga mais no clube" ' +
            '      ELSE "Jogando atualmente" END as Situacao, ca_pais.bandeira as Bandeira, ca_jogad.foto as Foto ' +
            '      FROM ca_jogad INNER JOIN ca_cidad ON ca_cidad.CodCidade = ca_jogad.CodCidade ' +
            '      INNER JOIN ca_posic ON ca_posic.codposicao = ca_jogad.codposicao ' +
            '      INNER JOIN ca_uf ON ca_cidad.coduf = ca_uf.coduf ' +
            '      INNER JOIN ca_pais ON ca_cidad.codpais = ca_pais.codpais ' +
            '      INNER JOIN es_titul ON es_titul.codjogador = ca_jogad.codjogador ' +
            '      INNER JOIN ca_jogos ON es_titul.codjogo = ca_jogos.codjogo ' +
            '      WHERE ((:TODOSJOGADORES <> 0) OR (ca_jogad.codjogador = :CODJOGADOR)) ' +
            '      AND ((:TODASPOSICOES <> 0) OR (ca_posic.codposicao = :CODPOSICAO)) ' +
            '      AND ((:TODOS <> 0) OR (ca_jogad.situacao = :TODOSATUAIS)) ' +
            '      AND ((:TODOSPAISES <> 0) OR (ca_pais.codpais = :CODIGOPAIS)) ' +
            '      AND ((:TODOSANOS <> 0) OR (YEAR(ca_jogos.data) = :ANO)) ' +
            'UNION ' +
            'SELECT distinct ca_jogad.codjogador as Codigo, ca_jogad.nome as Apelido, ' +
            '      ca_jogad.nomecompleto as NomeCompleto, ca_jogad.dtnasc as DataNascimento, ' +
            '      ca_cidad.nome as LocalNascimento,  CASE WHEN ca_uf.sigla = "EX" THEN "" ' +
            '      ELSE ca_uf.nome END as Estado, ca_pais.nome as Pais, ca_posic.descricao as Posicao, ' +
            '      CASE WHEN ca_jogad.situacao = 1 THEN "Não joga mais no clube" ' +
            '      ELSE "Jogando atualmente" END as Situacao,ca_pais.bandeira as Bandeira, ca_jogad.foto as Foto ' +
            '      FROM ca_jogad INNER JOIN ca_cidad ON ca_cidad.CodCidade = ca_jogad.CodCidade ' +
            '      INNER JOIN ca_posic ON ca_posic.codposicao = ca_jogad.codposicao ' +
            '      INNER JOIN ca_uf ON ca_cidad.coduf = ca_uf.coduf ' +
            '      INNER JOIN ca_pais ON ca_cidad.codpais = ca_pais.codpais ' +
            '      INNER JOIN es_reser ON es_reser.codjogador = ca_jogad.codjogador ' +
            '      INNER JOIN ca_jogos ON es_reser.codjogo = ca_jogos.codjogo ' +
            '      WHERE ((:TODOSJOGADORES <> 0) OR (ca_jogad.codjogador = :CODJOGADOR)) ' +
            '      AND ((:TODASPOSICOES <> 0) OR (ca_posic.codposicao = :CODPOSICAO)) ' +
            '      AND ((:TODOS <> 0) OR (ca_jogad.situacao = :TODOSATUAIS)) ' +
            '      AND ((:TODOSPAISES <> 0) OR (ca_pais.codpais = :CODIGOPAIS)) ' +
            '      AND ((:TODOSANOS <> 0) OR (YEAR(ca_jogos.data) = :ANO)) ' +
            ') AS J ' +
            'ORDER BY J.Apelido';

    frmRelJogadorComFoto.qryJogadores.Close;
    frmRelJogadorComFoto.qryJogadores.sql.Clear;
    frmRelJogadorComFoto.qryJogadores.sql.Add(sql);

    // filtra jogador
    if fraSelJogador.chbTodos.Checked then
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSJOGADORES')
        .AsInteger := 1;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('CODJOGADOR')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSJOGADORES')
        .AsInteger := 0;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('CODJOGADOR')
        .AsInteger := fraSelJogador.codigoJogador;
    end;

    // filtra posicao
    if fraSelPosicao.chbTodos.Checked then
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODASPOSICOES')
        .AsInteger := 1;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('CODPOSICAO')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODASPOSICOES')
        .AsInteger := 0;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('CODPOSICAO')
        .AsInteger := fraSelPosicao.codigoPosicao;
    end;

    // filtra nacionalidade
    if fraSelNacionalidade.chbTodos.Checked then
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSPAISES')
        .AsInteger := 1;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('CODIGOPAIS')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSPAISES')
        .AsInteger := 0;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('CODIGOPAIS')
        .AsInteger := fraSelNacionalidade.CodigoPais;
    end;

    // filtra situacao
    if cbhAtuais.Checked then
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOS')
        .AsInteger := 0;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSATUAIS')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOS')
        .AsInteger := 1;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSATUAIS')
        .AsInteger := 1;
    end;

    // filtra ano
    if fraSelecionarAno.chbTodos.Checked then
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSANOS')
        .AsInteger := 1;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('ANO')
        .AsInteger := 0;
    end
    else
    begin
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('TODOSANOS')
        .AsInteger := 0;
      frmRelJogadorComFoto.qryJogadores.Params.ParamByName('ANO')
        .AsInteger := fraSelecionarAno.Ano;
    end;

    frmRelJogadorComFoto.qryJogadores.Open;
    if frmRelJogadorComFoto.qryJogadores.RecordCount = 0 then
      Application.MessageBox('Nenhuma informação para esta seleção de dados!',
        'ATENÇÃO', MB_OK + MB_ICONWARNING)
    else
    begin
      frmRelJogadorComFoto.frxRelJogadoresComFoto.PrepareReport();
      frmRelJogadorComFoto.frxRelJogadoresComFoto.ShowPreparedReport;
    end;
  end; // fim relatório com foto

end;

procedure TfrmSelRelatorioJogador.FormActivate(Sender: TObject);
begin
  rgTipoRel.ItemIndex := 0;
  cbhAtuais.Checked := false;
end;

procedure TfrmSelRelatorioJogador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      frmSelRelatorioJogador.Close;
  end;
end;

procedure TfrmSelRelatorioJogador.fraSelJogador1dblJogadorClick
  (Sender: TObject);
begin
  fraSelJogador.dblJogadorClick(Sender);
end;

procedure TfrmSelRelatorioJogador.fraSelNacionalidade1chbTodosClick(
  Sender: TObject);
begin
  fraSelNacionalidade.chbTodosClick(Sender);

end;

procedure TfrmSelRelatorioJogador.fraSelNacionalidadedblPaisClick(
  Sender: TObject);
begin
  fraSelNacionalidade.dblPaisClick(Sender);

end;

procedure TfrmSelRelatorioJogador.fraSelNacJogadorchbTodosClick
  (Sender: TObject);
begin
  fraSelNacionalidade.chbTodosClick(Sender);

end;

procedure TfrmSelRelatorioJogador.fraSelNacJogadordblPaisClick(Sender: TObject);
begin
  fraSelNacionalidade.dblPaisClick(Sender);
end;

end.
