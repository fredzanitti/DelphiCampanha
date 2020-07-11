object FrmDm: TFrmDm
  OldCreateOrder = False
  Height = 588
  Width = 650
  object BDMySQL: TFDConnection
    Params.Strings = (
      'Database=zanittic_software'
      'User_Name=root'
      'Server=127.0.0.1'
      'CharacterSet=utf8'
      'Password=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Transaction = TransacaoSQL
    Left = 48
    Top = 16
  end
  object TransacaoSQL: TFDTransaction
    Connection = BDMySQL
    Left = 144
    Top = 16
  end
  object VendorLib: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Program Files\Campanha Ano a Ano\Seu Time\DBAcompanhamento\Dr' +
      'iverMySQL\libmysql.dll'
    Left = 224
    Top = 16
  end
  object TblAdversarios: TFDTable
    Active = True
    IndexFieldNames = 'nome;codadver'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_ADVER'
    TableName = 'zanittic_software.CA_ADVER'
    Left = 48
    Top = 88
    object TblAdversarioscodadver: TIntegerField
      FieldName = 'codadver'
      Origin = 'codadver'
      Required = True
      DisplayFormat = '00000'
    end
    object TblAdversariosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object TblAdversarioscodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
    object TblAdversariosrival: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'rival'
      Origin = 'rival'
    end
    object TblAdversariosescudo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'escudo'
      Origin = 'escudo'
      Size = 200
    end
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 296
    Top = 16
  end
  object DtsAdversarios: TDataSource
    DataSet = TblAdversarios
    Left = 48
    Top = 72
  end
  object TblArbitros: TFDTable
    Active = True
    IndexFieldNames = 'codarbitro'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_ARBIT'
    TableName = 'zanittic_software.CA_ARBIT'
    Left = 48
    Top = 144
    object TblArbitroscodarbitro: TIntegerField
      FieldName = 'codarbitro'
      Origin = 'codarbitro'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object TblArbitrosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 40
    end
  end
  object DtsArbitros: TDataSource
    DataSet = TblArbitros
    Left = 48
    Top = 136
  end
  object DtsTitulos: TDataSource
    DataSet = TblTitulos
    Left = 216
    Top = 288
  end
  object DtsResumo: TDataSource
    DataSet = TblResumo
    Left = 216
    Top = 232
  end
  object DtsEstTitulares: TDataSource
    DataSet = TblEstTitulares
    Left = 216
    Top = 184
  end
  object DtsEstReservas: TDataSource
    DataSet = TblEstReservas
    Left = 216
    Top = 128
  end
  object DtsAno: TDataSource
    DataSet = TblAno
    Left = 136
    Top = 352
  end
  object DtsUf: TDataSource
    DataSet = TblUf
    Left = 136
    Top = 296
  end
  object DtsRival: TDataSource
    DataSet = TblRival
    Left = 136
    Top = 240
  end
  object DtsPais: TDataSource
    DataSet = TblPais
    Left = 136
    Top = 128
  end
  object DtsPosicao: TDataSource
    DataSet = TblPosicao
    Left = 136
    Top = 184
  end
  object DtsJogos: TDataSource
    DataSet = TblJogos
    Left = 136
    Top = 72
  end
  object DtsJogadores: TDataSource
    DataSet = TblJogadores
    Left = 48
    Top = 416
  end
  object DtsFase: TDataSource
    DataSet = TblFase
    Left = 48
    Top = 360
  end
  object DtsEstadio: TDataSource
    DataSet = TblEstadio
    Left = 48
    Top = 304
  end
  object DtsCompeticao: TDataSource
    DataSet = TblCompeticao
    Left = 48
    Top = 248
  end
  object TblCidade: TFDTable
    Active = True
    IndexFieldNames = 'codcidade'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_CIDAD'
    TableName = 'zanittic_software.CA_CIDAD'
    Left = 48
    Top = 200
    object TblCidadecodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
    object TblCidadenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 40
    end
    object TblCidadecodpais: TIntegerField
      FieldName = 'codpais'
      Origin = 'codpais'
      Required = True
    end
    object TblCidadecoduf: TIntegerField
      FieldName = 'coduf'
      Origin = 'coduf'
      Required = True
    end
  end
  object TblCompeticao: TFDTable
    Active = True
    IndexFieldNames = 'nome'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_COMPE'
    TableName = 'zanittic_software.CA_COMPE'
    Left = 48
    Top = 256
    object TblCompeticaocodcompeticao: TIntegerField
      FieldName = 'codcompeticao'
      Origin = 'codcompeticao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object TblCompeticaonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 35
    end
    object TblCompeticaotipocompeticao: TWideStringField
      FieldName = 'tipocompeticao'
      Origin = 'tipocompeticao'
      Required = True
      Size = 1
    end
  end
  object TblEstadio: TFDTable
    Active = True
    IndexFieldNames = 'codestadio'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_ESTAD'
    TableName = 'zanittic_software.CA_ESTAD'
    Left = 48
    Top = 312
    object TblEstadiocodestadio: TIntegerField
      FieldName = 'codestadio'
      Origin = 'codestadio'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object TblEstadionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object TblEstadiocodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
  end
  object TblFase: TFDTable
    Active = True
    IndexFieldNames = 'codfase'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_FASE'
    TableName = 'zanittic_software.CA_FASE'
    Left = 48
    Top = 368
    object TblFasecodfase: TIntegerField
      FieldName = 'codfase'
      Origin = 'codfase'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object TblFasenome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
  end
  object TblJogadores: TFDTable
    Active = True
    IndexFieldNames = 'codjogador'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_JOGAD'
    TableName = 'zanittic_software.CA_JOGAD'
    Left = 48
    Top = 424
    object TblJogadorescodjogador: TIntegerField
      FieldName = 'codjogador'
      Origin = 'codjogador'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '000000'
    end
    object TblJogadoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object TblJogadoresnomecompleto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomecompleto'
      Origin = 'nomecompleto'
      Size = 50
    end
    object TblJogadoresfoto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'foto'
      Origin = 'foto'
      Size = 150
    end
    object TblJogadoresdtnasc: TDateField
      FieldName = 'dtnasc'
      Origin = 'dtnasc'
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object TblJogadorescodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
    object TblJogadoressituacao: TIntegerField
      FieldName = 'situacao'
      Origin = 'situacao'
      Required = True
    end
    object TblJogadorescodposicao: TIntegerField
      FieldName = 'codposicao'
      Origin = 'codposicao'
      Required = True
    end
  end
  object TblJogos: TFDTable
    Active = True
    IndexFieldNames = 'codjogo'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_JOGOS'
    TableName = 'zanittic_software.CA_JOGOS'
    Left = 136
    Top = 80
    object TblJogoscodjogo: TIntegerField
      FieldName = 'codjogo'
      Origin = 'codjogo'
      Required = True
      DisplayFormat = '000000'
    end
    object TblJogosdata: TDateField
      FieldName = 'data'
      Origin = '`data`'
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object TblJogoshora: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'hora'
      Origin = 'hora'
      Size = 5
    end
    object TblJogoscodadvervisit: TIntegerField
      FieldName = 'codadvervisit'
      Origin = 'codadvervisit'
      Required = True
    end
    object TblJogoscodadvermand: TIntegerField
      FieldName = 'codadvermand'
      Origin = 'codadvermand'
      Required = True
    end
    object TblJogosplacar1: TIntegerField
      Alignment = taCenter
      FieldName = 'placar1'
      Origin = 'placar1'
      Required = True
    end
    object TblJogosplacar2: TIntegerField
      Alignment = taCenter
      FieldName = 'placar2'
      Origin = 'placar2'
      Required = True
    end
    object TblJogoscodestadio: TIntegerField
      FieldName = 'codestadio'
      Origin = 'codestadio'
      Required = True
    end
    object TblJogoscodcompeticao: TIntegerField
      FieldName = 'codcompeticao'
      Origin = 'codcompeticao'
      Required = True
    end
    object TblJogoscodarbitro: TIntegerField
      FieldName = 'codarbitro'
      Origin = 'codarbitro'
      Required = True
    end
    object TblJogospublico: TIntegerField
      FieldName = 'publico'
      Origin = 'publico'
      Required = True
      DisplayFormat = '###,###'
    end
    object TblJogoscodfase: TIntegerField
      FieldName = 'codfase'
      Origin = 'codfase'
      Required = True
    end
    object TblJogospenalty1: TIntegerField
      Alignment = taCenter
      FieldName = 'penalty1'
      Origin = 'penalty1'
      Required = True
    end
    object TblJogospenalty2: TIntegerField
      Alignment = taCenter
      FieldName = 'penalty2'
      Origin = 'penalty2'
      Required = True
    end
    object TblJogoscontra: TIntegerField
      FieldName = 'contra'
      Origin = 'contra'
      Required = True
    end
    object TblJogoswo: TIntegerField
      FieldName = 'wo'
      Origin = 'wo'
      Required = True
    end
    object TblJogosvideos: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'videos'
      Origin = 'videos'
      Size = 200
    end
    object TblJogoscodtatica: TIntegerField
      FieldName = 'codtatica'
      Origin = 'codtatica'
      Required = True
    end
    object TblJogoscoduniforme: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'coduniforme'
      Origin = 'coduniforme'
    end
    object TblJogosportaofechado: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'portaofechado'
      Origin = 'portaofechado'
      Size = 1
    end
    object TblJogostemporada: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'temporada'
      Origin = 'temporada'
    end
  end
  object TblPais: TFDTable
    Active = True
    IndexFieldNames = 'codpais'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_PAIS'
    TableName = 'zanittic_software.CA_PAIS'
    Left = 136
    Top = 136
    object TblPaiscodpais: TIntegerField
      FieldName = 'codpais'
      Origin = 'codpais'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblPaissigla: TWideStringField
      FieldName = 'sigla'
      Origin = 'sigla'
      Required = True
      Size = 3
    end
    object TblPaisnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 45
    end
    object TblPaisbandeira: TWideStringField
      FieldName = 'bandeira'
      Origin = 'bandeira'
      Required = True
      Size = 100
    end
  end
  object TblPosicao: TFDTable
    Active = True
    IndexFieldNames = 'codposicao'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_POSIC'
    TableName = 'zanittic_software.CA_POSIC'
    Left = 136
    Top = 192
    object TblPosicaocodposicao: TIntegerField
      FieldName = 'codposicao'
      Origin = 'codposicao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblPosicaoabreviatura: TWideStringField
      FieldName = 'abreviatura'
      Origin = 'abreviatura'
      Required = True
      Size = 3
    end
    object TblPosicaodescricao: TWideStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
    end
  end
  object TblRival: TFDTable
    Active = True
    IndexFieldNames = 'codrival'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_RIVAL'
    TableName = 'zanittic_software.CA_RIVAL'
    Left = 136
    Top = 248
    object TblRivalcodrival: TIntegerField
      FieldName = 'codrival'
      Origin = 'codrival'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblRivalcodadver: TIntegerField
      FieldName = 'codadver'
      Origin = 'codadver'
      Required = True
    end
  end
  object TblUf: TFDTable
    Active = True
    IndexFieldNames = 'coduf'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_UF'
    TableName = 'zanittic_software.CA_UF'
    Left = 136
    Top = 304
    object TblUfcoduf: TIntegerField
      FieldName = 'coduf'
      Origin = 'coduf'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblUfsigla: TWideStringField
      FieldName = 'sigla'
      Origin = 'sigla'
      Required = True
      Size = 2
    end
    object TblUfnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 40
    end
    object TblUfbandeira: TWideStringField
      FieldName = 'bandeira'
      Origin = 'bandeira'
      Required = True
      Size = 100
    end
  end
  object TblAno: TFDTable
    Active = True
    IndexFieldNames = 'ano'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ES_ANOS'
    TableName = 'zanittic_software.ES_ANOS'
    Left = 136
    Top = 360
    object TblAnoano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object TblEstReservas: TFDTable
    Active = True
    IndexFieldNames = 'coditem;codjogador'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ES_RESER'
    TableName = 'zanittic_software.ES_RESER'
    Left = 216
    Top = 136
    object TblEstReservascoditem: TIntegerField
      FieldName = 'coditem'
      Origin = 'coditem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblEstReservascodjogador: TIntegerField
      FieldName = 'codjogador'
      Origin = 'codjogador'
      Required = True
    end
    object TblEstReservascodjogo: TIntegerField
      FieldName = 'codjogo'
      Origin = 'codjogo'
      Required = True
    end
    object TblEstReservascodjogadorsaiu: TIntegerField
      FieldName = 'codjogadorsaiu'
      Origin = 'codjogadorsaiu'
      Required = True
    end
    object TblEstReservascamarelo: TIntegerField
      FieldName = 'camarelo'
      Origin = 'camarelo'
      Required = True
    end
    object TblEstReservascvermelho: TIntegerField
      FieldName = 'cvermelho'
      Origin = 'cvermelho'
      Required = True
    end
    object TblEstReservasgols: TIntegerField
      FieldName = 'gols'
      Origin = 'gols'
      Required = True
    end
    object TblEstReservasano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
      Required = True
    end
    object TblEstReservasv: TIntegerField
      FieldName = 'v'
      Origin = 'v'
      Required = True
    end
    object TblEstReservase: TIntegerField
      FieldName = 'e'
      Origin = 'e'
      Required = True
    end
    object TblEstReservasd: TIntegerField
      FieldName = 'd'
      Origin = 'd'
      Required = True
    end
  end
  object TblEstTitulares: TFDTable
    Active = True
    IndexFieldNames = 'coditem;codjogador'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ES_TITUL'
    TableName = 'zanittic_software.ES_TITUL'
    Left = 216
    Top = 192
    object TblEstTitularescoditem: TIntegerField
      FieldName = 'coditem'
      Origin = 'coditem'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblEstTitularescodjogador: TIntegerField
      FieldName = 'codjogador'
      Origin = 'codjogador'
      Required = True
    end
    object TblEstTitularescodjogo: TIntegerField
      FieldName = 'codjogo'
      Origin = 'codjogo'
      Required = True
    end
    object TblEstTitularescamarelo: TIntegerField
      FieldName = 'camarelo'
      Origin = 'camarelo'
      Required = True
    end
    object TblEstTitularescvermelho: TIntegerField
      FieldName = 'cvermelho'
      Origin = 'cvermelho'
      Required = True
    end
    object TblEstTitularesgols: TIntegerField
      FieldName = 'gols'
      Origin = 'gols'
      Required = True
    end
    object TblEstTitularesano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
      Required = True
    end
    object TblEstTitularesv: TIntegerField
      FieldName = 'v'
      Origin = 'v'
      Required = True
    end
    object TblEstTitularese: TIntegerField
      FieldName = 'e'
      Origin = 'e'
      Required = True
    end
    object TblEstTitularesd: TIntegerField
      FieldName = 'd'
      Origin = 'd'
      Required = True
    end
  end
  object TblResumo: TFDTable
    Active = True
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ES_RESUM'
    TableName = 'zanittic_software.ES_RESUM'
    Left = 216
    Top = 240
    object TblResumocodjogo: TIntegerField
      FieldName = 'codjogo'
      Origin = 'codjogo'
      Required = True
    end
    object TblResumocodadver: TIntegerField
      FieldName = 'codadver'
      Origin = 'codadver'
      Required = True
    end
    object TblResumoj: TIntegerField
      FieldName = 'j'
      Origin = 'j'
      Required = True
    end
    object TblResumov: TIntegerField
      FieldName = 'v'
      Origin = 'v'
      Required = True
    end
    object TblResumoe: TIntegerField
      FieldName = 'e'
      Origin = 'e'
      Required = True
    end
    object TblResumod: TIntegerField
      FieldName = 'd'
      Origin = 'd'
      Required = True
    end
    object TblResumogp: TIntegerField
      FieldName = 'gp'
      Origin = 'gp'
      Required = True
    end
    object TblResumogc: TIntegerField
      FieldName = 'gc'
      Origin = 'gc'
      Required = True
    end
    object TblResumosg: TIntegerField
      FieldName = 'sg'
      Origin = 'sg'
      Required = True
    end
    object TblResumoano: TIntegerField
      FieldName = 'ano'
      Origin = 'ano'
      Required = True
    end
  end
  object TblTitulos: TFDTable
    Active = True
    IndexFieldNames = 'ano;codcompeticao'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ES_TITULOS'
    TableName = 'zanittic_software.ES_TITULOS'
    Left = 216
    Top = 296
    object TblTitulosano: TIntegerField
      Alignment = taCenter
      FieldName = 'ano'
      Origin = 'ano'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblTituloscodcompeticao: TIntegerField
      FieldName = 'codcompeticao'
      Origin = 'codcompeticao'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object DtsCidade: TDataSource
    DataSet = TblCidade
    Left = 48
    Top = 192
  end
  object QrGeral: TFDQuery
    Connection = BDMySQL
    Left = 304
    Top = 72
  end
  object DtsQrGeral: TDataSource
    DataSet = QrGeral
    Left = 304
    Top = 64
  end
  object TblTatica: TFDTable
    Active = True
    IndexFieldNames = 'esquema;codtatica'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.CA_TATIC'
    TableName = 'zanittic_software.CA_TATIC'
    Left = 136
    Top = 416
    object TblTaticacodtatica: TIntegerField
      FieldName = 'codtatica'
      Origin = 'codtatica'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object TblTaticaesquema: TWideStringField
      FieldName = 'esquema'
      Origin = 'esquema'
      Required = True
      Size = 5
    end
  end
  object DtsTatica: TDataSource
    DataSet = TblTatica
    Left = 136
    Top = 408
  end
  object QrEstatisticas: TFDQuery
    Connection = BDMySQL
    Left = 304
    Top = 136
  end
  object DtsQrEstatisticas: TDataSource
    DataSet = QrEstatisticas
    Left = 304
    Top = 128
  end
  object QrContador: TFDQuery
    Connection = BDMySQL
    Left = 304
    Top = 208
  end
  object DtsQrContador: TDataSource
    DataSet = QrContador
    Left = 304
    Top = 200
  end
  object DtsUsuario: TDataSource
    DataSet = TblUsuario
    Left = 216
    Top = 72
  end
  object TblUsuario: TFDTable
    Active = True
    IndexFieldNames = 'codusuario'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ca_user'
    TableName = 'zanittic_software.ca_user'
    Left = 216
    Top = 80
    object TblUsuariocodusuario: TIntegerField
      FieldName = 'codusuario'
      Origin = 'codusuario'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object TblUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 40
    end
    object TblUsuariosenha: TIntegerField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
    end
    object TblUsuarioperfil: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'perfil'
      Origin = 'perfil'
    end
  end
  object DtsBackup: TDataSource
    DataSet = TblBackup
    Left = 216
    Top = 472
  end
  object TblBackup: TFDTable
    Active = True
    IndexFieldNames = 'id_backup'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ca_backup'
    TableName = 'zanittic_software.ca_backup'
    Left = 216
    Top = 480
    object TblBackupid_backup: TIntegerField
      FieldName = 'id_backup'
      Origin = 'id_backup'
      Required = True
    end
    object TblBackuptipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 1
    end
    object TblBackupdata: TDateField
      FieldName = 'data'
      Origin = '`data`'
      Required = True
    end
  end
  object DtsQrBackup: TDataSource
    DataSet = QrBackup
    Left = 304
    Top = 272
  end
  object QrBackup: TFDQuery
    Connection = BDMySQL
    Left = 304
    Top = 280
  end
  object TblPatroc: TFDTable
    Active = True
    IndexFieldNames = 'codpatroc'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ca_patroc'
    TableName = 'zanittic_software.ca_patroc'
    Left = 216
    Top = 424
    object TblPatroccodpatroc: TIntegerField
      FieldName = 'codpatroc'
      Origin = 'codpatroc'
      Required = True
      DisplayFormat = '00000'
    end
    object TblPatrocnomepatroc: TWideStringField
      FieldName = 'nomepatroc'
      Origin = 'nomepatroc'
      Required = True
    end
    object TblPatroccodcidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codcidade'
      Origin = 'codcidade'
    end
    object TblPatrocdt_inicio: TDateField
      FieldName = 'dt_inicio'
      Origin = 'dt_inicio'
      Required = True
      EditMask = '!99/99/9999;1;_'
    end
    object TblPatrocdt_fim: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'dt_fim'
      Origin = 'dt_fim'
      EditMask = '!99/99/9999;1;_'
    end
    object TblPatroclogo_patroc: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'logo_patroc'
      Origin = 'logo_patroc'
      Size = 200
    end
  end
  object DtsPatroc: TDataSource
    DataSet = TblPatroc
    Left = 216
    Top = 416
  end
  object DtsFornec: TDataSource
    DataSet = TblFornec
    Left = 216
    Top = 352
  end
  object TblFornec: TFDTable
    Active = True
    IndexFieldNames = 'codfornec'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ca_fornec'
    TableName = 'zanittic_software.ca_fornec'
    Left = 216
    Top = 360
    object TblForneccodfornec: TIntegerField
      FieldName = 'codfornec'
      Origin = 'codfornec'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblFornecnomefornec: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomefornec'
      Origin = 'nomefornec'
    end
    object TblForneccodcidade: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codcidade'
      Origin = 'codcidade'
    end
    object TblFornecdt_inicio: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_inicio'
      Origin = 'dt_inicio'
      EditMask = '!99/99/9999;1;_'
    end
    object TblFornecdt_fim: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'dt_fim'
      Origin = 'dt_fim'
      EditMask = '!99/99/9999;1;_'
    end
    object TblForneclogo_fornec: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'logo_fornec'
      Origin = 'logo_fornec'
      Size = 200
    end
  end
  object TblUniformes: TFDTable
    Active = True
    IndexFieldNames = 'coduniforme'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ca_uniformes'
    TableName = 'zanittic_software.ca_uniformes'
    Left = 304
    Top = 352
    object TblUniformescoduniforme: TIntegerField
      FieldName = 'coduniforme'
      Origin = 'coduniforme'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object TblUniformesdescricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricao'
      Origin = 'descricao'
    end
    object TblUniformesfoto_uniforme: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'foto_uniforme'
      Origin = 'foto_uniforme'
      Size = 200
    end
  end
  object DtsUniformes: TDataSource
    DataSet = TblUniformes
    Left = 304
    Top = 344
  end
  object TblCarreira: TFDTable
    Active = True
    IndexFieldNames = 'coditem'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ca_carreira'
    TableName = 'zanittic_software.ca_carreira'
    Left = 48
    Top = 480
    object TblCarreiracodjogador: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codjogador'
      Origin = 'codjogador'
    end
    object TblCarreiracodclube: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codclube'
      Origin = 'codclube'
    end
    object TblCarreiraanoini: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'anoini'
      Origin = 'anoini'
    end
    object TblCarreiraanofim: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'anofim'
      Origin = 'anofim'
    end
  end
  object dtsCarreira: TDataSource
    DataSet = TblCarreira
    Left = 48
    Top = 496
  end
  object tblTiposGols: TFDTable
    IndexFieldNames = 'codtipo'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.es_tipogol'
    TableName = 'zanittic_software.es_tipogol'
    Left = 304
    Top = 416
    object tblTiposGolscodtipo: TFDAutoIncField
      FieldName = 'codtipo'
      Origin = 'codtipo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblTiposGolstipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
    end
  end
  object dtsTiposGols: TDataSource
    DataSet = tblTiposGols
    Left = 304
    Top = 440
  end
  object tblGolsporpartida: TFDTable
    IndexFieldNames = 'coditem'
    Connection = BDMySQL
    UpdateOptions.UpdateTableName = 'zanittic_software.es_gols'
    TableName = 'zanittic_software.es_gols'
    Left = 304
    Top = 496
  end
  object dtsGolsporpartida: TDataSource
    DataSet = tblGolsporpartida
    Left = 304
    Top = 512
  end
  object tblEscudos: TFDTable
    Active = True
    IndexFieldNames = 'codadver;ano_inicio'
    Connection = BDMySQL
    Transaction = TransacaoSQL
    UpdateOptions.UpdateTableName = 'zanittic_software.ca_escudos'
    TableName = 'zanittic_software.ca_escudos'
    Left = 400
    Top = 16
    object tblEscudoscoditem: TFDAutoIncField
      FieldName = 'coditem'
      Origin = 'coditem'
      ReadOnly = True
    end
    object tblEscudoscodadver: TIntegerField
      FieldName = 'codadver'
      Origin = 'codadver'
      Required = True
    end
    object tblEscudosano_inicio: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ano_inicio'
      Origin = 'ano_inicio'
    end
    object tblEscudosano_fim: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ano_fim'
      Origin = 'ano_fim'
    end
    object tblEscudosescudo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'escudo'
      Origin = 'escudo'
      Size = 200
    end
  end
  object dtsEscudos: TDataSource
    DataSet = tblEscudos
    Left = 400
    Top = 40
  end
end
