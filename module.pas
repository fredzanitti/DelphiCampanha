unit module;

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
  TFrmDm = class(TDataModule)
    BDMySQL: TFDConnection;
    TransacaoSQL: TFDTransaction;
    VendorLib: TFDPhysMySQLDriverLink;
    TblAdversarios: TFDTable;
    WaitCursor: TFDGUIxWaitCursor;
    DtsAdversarios: TDataSource;
    TblArbitros: TFDTable;
    DtsArbitros: TDataSource;
    TblArbitroscodarbitro: TIntegerField;
    TblArbitrosnome: TWideStringField;
    DtsTitulos: TDataSource;
    DtsResumo: TDataSource;
    DtsEstTitulares: TDataSource;
    DtsEstReservas: TDataSource;
    DtsAno: TDataSource;
    DtsUf: TDataSource;
    DtsRival: TDataSource;
    DtsPais: TDataSource;
    DtsPosicao: TDataSource;
    DtsJogos: TDataSource;
    DtsJogadores: TDataSource;
    DtsFase: TDataSource;
    DtsEstadio: TDataSource;
    DtsCompeticao: TDataSource;
    TblCidade: TFDTable;
    TblCompeticao: TFDTable;
    TblEstadio: TFDTable;
    TblFase: TFDTable;
    TblJogadores: TFDTable;
    TblJogos: TFDTable;
    TblPais: TFDTable;
    TblPosicao: TFDTable;
    TblRival: TFDTable;
    TblUf: TFDTable;
    TblAno: TFDTable;
    TblEstReservas: TFDTable;
    TblEstTitulares: TFDTable;
    TblResumo: TFDTable;
    TblTitulos: TFDTable;
    DtsCidade: TDataSource;
    TblCidadecodcidade: TIntegerField;
    TblCidadenome: TWideStringField;
    TblCidadecodpais: TIntegerField;
    TblCidadecoduf: TIntegerField;
    TblCompeticaocodcompeticao: TIntegerField;
    TblCompeticaonome: TWideStringField;
    TblEstadiocodestadio: TIntegerField;
    TblEstadionome: TWideStringField;
    TblEstadiocodcidade: TIntegerField;
    TblFasecodfase: TIntegerField;
    TblFasenome: TWideStringField;
    TblPosicaocodposicao: TIntegerField;
    TblPosicaoabreviatura: TWideStringField;
    TblPosicaodescricao: TWideStringField;
    TblRivalcodrival: TIntegerField;
    TblRivalcodadver: TIntegerField;
    TblUfcoduf: TIntegerField;
    TblUfsigla: TWideStringField;
    TblUfnome: TWideStringField;
    TblUfbandeira: TWideStringField;
    TblAnoano: TIntegerField;
    TblEstReservascoditem: TIntegerField;
    TblEstReservascodjogador: TIntegerField;
    TblEstReservascodjogo: TIntegerField;
    TblEstReservascodjogadorsaiu: TIntegerField;
    TblEstReservascamarelo: TIntegerField;
    TblEstReservascvermelho: TIntegerField;
    TblEstReservasgols: TIntegerField;
    TblEstReservasano: TIntegerField;
    TblEstReservasv: TIntegerField;
    TblEstReservase: TIntegerField;
    TblEstReservasd: TIntegerField;
    TblEstTitularescoditem: TIntegerField;
    TblEstTitularescodjogador: TIntegerField;
    TblEstTitularescodjogo: TIntegerField;
    TblEstTitularescamarelo: TIntegerField;
    TblEstTitularescvermelho: TIntegerField;
    TblEstTitularesgols: TIntegerField;
    TblEstTitularesano: TIntegerField;
    TblEstTitularesv: TIntegerField;
    TblEstTitularese: TIntegerField;
    TblEstTitularesd: TIntegerField;
    TblResumocodjogo: TIntegerField;
    TblResumocodadver: TIntegerField;
    TblResumoj: TIntegerField;
    TblResumov: TIntegerField;
    TblResumoe: TIntegerField;
    TblResumod: TIntegerField;
    TblResumogp: TIntegerField;
    TblResumogc: TIntegerField;
    TblResumosg: TIntegerField;
    TblResumoano: TIntegerField;
    TblTitulosano: TIntegerField;
    TblTituloscodcompeticao: TIntegerField;
    QrGeral: TFDQuery;
    DtsQrGeral: TDataSource;
    TblTatica: TFDTable;
    TblTaticacodtatica: TIntegerField;
    TblTaticaesquema: TWideStringField;
    DtsTatica: TDataSource;
    TblCompeticaotipocompeticao: TWideStringField;
    TblAdversarioscodadver: TIntegerField;
    TblAdversariosnome: TWideStringField;
    TblAdversarioscodcidade: TIntegerField;
    TblAdversariosrival: TSmallintField;
    TblAdversariosescudo: TWideStringField;
    TblPaiscodpais: TIntegerField;
    TblPaissigla: TWideStringField;
    TblPaisnome: TWideStringField;
    TblPaisbandeira: TWideStringField;
    TblJogoscodjogo: TIntegerField;
    TblJogosdata: TDateField;
    TblJogoshora: TWideStringField;
    TblJogoscodadvervisit: TIntegerField;
    TblJogoscodadvermand: TIntegerField;
    TblJogosplacar1: TIntegerField;
    TblJogosplacar2: TIntegerField;
    TblJogoscodestadio: TIntegerField;
    TblJogoscodcompeticao: TIntegerField;
    TblJogoscodarbitro: TIntegerField;
    TblJogospublico: TIntegerField;
    TblJogoscodfase: TIntegerField;
    TblJogospenalty1: TIntegerField;
    TblJogospenalty2: TIntegerField;
    TblJogoscontra: TIntegerField;
    TblJogoswo: TIntegerField;
    TblJogosvideos: TWideStringField;
    TblJogoscodtatica: TIntegerField;
    QrEstatisticas: TFDQuery;
    DtsQrEstatisticas: TDataSource;
    QrContador: TFDQuery;
    DtsQrContador: TDataSource;
    DtsUsuario: TDataSource;
    TblUsuario: TFDTable;
    TblUsuariocodusuario: TIntegerField;
    TblUsuarionome: TWideStringField;
    TblUsuariosenha: TIntegerField;
    TblUsuarioperfil: TIntegerField;
    TblJogadorescodjogador: TIntegerField;
    TblJogadoresnome: TWideStringField;
    TblJogadoresnomecompleto: TWideStringField;
    TblJogadoresfoto: TWideStringField;
    TblJogadoresdtnasc: TDateField;
    TblJogadorescodcidade: TIntegerField;
    TblJogadoressituacao: TIntegerField;
    TblJogadorescodposicao: TIntegerField;
    DtsBackup: TDataSource;
    TblBackup: TFDTable;
    TblBackupid_backup: TIntegerField;
    TblBackuptipo: TWideStringField;
    TblBackupdata: TDateField;
    DtsQrBackup: TDataSource;
    QrBackup: TFDQuery;
    TblPatroc: TFDTable;
    DtsPatroc: TDataSource;
    DtsFornec: TDataSource;
    TblFornec: TFDTable;
    TblPatroccodpatroc: TIntegerField;
    TblPatrocnomepatroc: TWideStringField;
    TblPatroccodcidade: TIntegerField;
    TblPatrocdt_inicio: TDateField;
    TblPatrocdt_fim: TDateField;
    TblPatroclogo_patroc: TWideStringField;
    TblUniformes: TFDTable;
    DtsUniformes: TDataSource;
    TblUniformescoduniforme: TIntegerField;
    TblUniformesdescricao: TWideStringField;
    TblUniformesfoto_uniforme: TWideStringField;
    TblJogoscoduniforme: TIntegerField;
    TblForneccodfornec: TIntegerField;
    TblFornecnomefornec: TWideStringField;
    TblForneccodcidade: TIntegerField;
    TblFornecdt_inicio: TDateTimeField;
    TblFornecdt_fim: TDateTimeField;
    TblForneclogo_fornec: TWideStringField;
    TblCarreira: TFDTable;
    TblCarreiracodjogador: TIntegerField;
    TblCarreiracodclube: TIntegerField;
    TblCarreiraanoini: TIntegerField;
    TblCarreiraanofim: TIntegerField;
    dtsCarreira: TDataSource;
    TblJogosportaofechado: TWideStringField;
    tblTiposGols: TFDTable;
    dtsTiposGols: TDataSource;
    tblTiposGolscodtipo: TFDAutoIncField;
    tblTiposGolstipo: TWideStringField;
    tblGolsporpartida: TFDTable;
    dtsGolsporpartida: TDataSource;
    tblEscudos: TFDTable;
    tblEscudoscoditem: TFDAutoIncField;
    tblEscudoscodadver: TIntegerField;
    tblEscudosano_inicio: TIntegerField;
    tblEscudosano_fim: TIntegerField;
    tblEscudosescudo: TWideStringField;
    dtsEscudos: TDataSource;
    TblJogostemporada: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDm: TFrmDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
