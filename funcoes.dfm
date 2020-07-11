object f_gerais: Tf_gerais
  Left = 0
  Top = 0
  Caption = 'f_gerais'
  ClientHeight = 482
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object QrFunctions: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 32
    Top = 16
  end
  object DtsQrFunctions: TDataSource
    DataSet = QrFunctions
    Left = 112
    Top = 16
  end
  object QrTitulares: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 32
    Top = 80
  end
  object DtsQrTitulares: TDataSource
    DataSet = QrTitulares
    Left = 112
    Top = 80
  end
  object QrReservas: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 32
    Top = 144
  end
  object DtsQrReservas: TDataSource
    DataSet = QrReservas
    Left = 112
    Top = 144
  end
  object QrSubst: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 32
    Top = 200
  end
  object DtsQrSubst: TDataSource
    DataSet = QrSubst
    Left = 112
    Top = 200
  end
  object QrDisponivel: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 32
    Top = 264
  end
  object DtsQrDisponivel: TDataSource
    DataSet = QrDisponivel
    Left = 112
    Top = 264
  end
  object QrCidades: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 32
    Top = 328
  end
  object DtsQrCidades: TDataSource
    DataSet = QrCidades
    Left = 112
    Top = 328
  end
  object QrUltimo: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 208
    Top = 16
  end
  object DtsQrUltimo: TDataSource
    DataSet = QrUltimo
    Left = 288
    Top = 16
  end
  object QrEditaEscalacao: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 208
    Top = 80
  end
  object DtsQrEditaEscalacao: TDataSource
    DataSet = QrEditaEscalacao
    Left = 288
    Top = 80
  end
  object QrEstat: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 208
    Top = 144
  end
  object DtsQrEstat: TDataSource
    DataSet = QrEstat
    Left = 288
    Top = 144
  end
  object QrSumula: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 208
    Top = 200
  end
  object DtsQrSumula: TDataSource
    DataSet = QrSumula
    Left = 288
    Top = 200
  end
  object QrSequencias: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 208
    Top = 264
  end
  object DtsQrSequencias: TDataSource
    DataSet = QrSequencias
    Left = 288
    Top = 264
  end
  object QrMelhorPior: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 208
    Top = 320
  end
  object DtsQrMelhorPior: TDataSource
    DataSet = QrMelhorPior
    Left = 288
    Top = 320
  end
  object QrEstat2: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 72
  end
  object DtsQrEstat2: TDataSource
    DataSet = QrEstat2
    Left = 504
    Top = 72
  end
  object QrEstat3: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 128
  end
  object DtsQrEstat3: TDataSource
    DataSet = QrEstat3
    Left = 504
    Top = 128
  end
  object QrEstat4: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 184
  end
  object DtsQrEstat4: TDataSource
    DataSet = QrEstat4
    Left = 504
    Top = 184
  end
  object QrEstat1: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 16
  end
  object DtsQrEstat1: TDataSource
    DataSet = QrEstat1
    Left = 504
    Top = 16
  end
  object QrContador: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 240
  end
  object DtsQrContador: TDataSource
    DataSet = QrContador
    Left = 504
    Top = 240
  end
  object QrTitulos: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 296
  end
  object DtsQrTitulos: TDataSource
    DataSet = QrTitulos
    Left = 504
    Top = 296
  end
  object QrData: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 360
  end
  object DtsQrData: TDataSource
    DataSet = QrData
    Left = 504
    Top = 360
  end
  object QrNome: TFDQuery
    Connection = FrmDm.BDMySQL
    Left = 32
    Top = 392
  end
  object DtsQrNome: TDataSource
    DataSet = QrNome
    Left = 112
    Top = 392
  end
  object QrEstGerais: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 208
    Top = 384
  end
  object DtsQrEstGerais: TDataSource
    DataSet = QrEstGerais
    Left = 288
    Top = 384
  end
  object QrRivais: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 424
    Top = 416
  end
  object DtsQrRivais: TDataSource
    DataSet = QrRivais
    Left = 504
    Top = 416
  end
  object QrTotais: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 616
    Top = 16
  end
  object DtsQrTotais: TDataSource
    DataSet = QrTotais
    Left = 688
    Top = 16
  end
  object qryGolsJogo: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT'
      
        '    CASE WHEN es_gols.codjogador = 0 THEN '#39'Contra'#39' ELSE ca_jogad' +
        '.nome END AS nome,'
      '    CASE WHEN es_gols.fracao = '#39'Minutos'#39
      
        '     '#9'   THEN CONCAT('#39' ( '#39', CAST(es_gols.tempo AS CHAR), '#39'\'#39'\ '#39',' +
        ' es_gols.periodo, '#39' ) '#39', CASE WHEN es_tipogol.tipo = '#39'Penalti'#39' T' +
        'HEN '#39' ( Penalti )'#39' ELSE '#39#39' END, '#39'; '#39')'
      
        '         ELSE CONCAT('#39' ( '#39', CAST(es_gols.tempo AS CHAR), '#39'" '#39', e' +
        's_gols.periodo, '#39' ) '#39', CASE WHEN es_tipogol.tipo = '#39'Penalti'#39' THE' +
        'N '#39' ( Penalti )'#39' ELSE '#39#39' END, '#39'; '#39')'
      #9'  END tempoTipo'
      'FROM es_gols'
      'LEFT JOIN ca_jogad ON ca_jogad.codjogador = es_gols.codjogador'
      'INNER JOIN es_tipogol ON es_tipogol.codtipo = es_gols.codtipogol'
      'WHERE es_gols.codjogo = :CodigoJogo'
      'ORDER BY es_gols.coditem')
    Left = 616
    Top = 80
    ParamData = <
      item
        Name = 'CODIGOJOGO'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end>
    object qryGolsJogonome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryGolsJogotempoTipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tempoTipo'
      Origin = 'tempoTipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
  end
  object qryMinutosGolsPorJogador: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT'
      '    CASE WHEN es_gols.fracao = '#39'Minutos'#39
      
        #9#9'    THEN CONCAT(CAST(es_gols.tempo AS CHAR), '#39'\'#39'\ ('#39', es_gols.' +
        'periodo, '#39') '#39', CASE WHEN es_tipogol.tipo = '#39'Penalti'#39' THEN '#39' ( Pe' +
        'nalti )'#39' ELSE '#39#39' END)'
      
        '        ELSE CONCAT(CAST(es_gols.tempo AS CHAR), '#39'" ('#39', es_gols.' +
        'periodo, '#39') '#39', CASE WHEN es_tipogol.tipo = '#39'Penalti'#39' THEN '#39' ( Pe' +
        'nalti )'#39' ELSE '#39#39' END)'
      #9'  END tempoTipo'
      'FROM es_gols'
      'LEFT JOIN ca_jogad ON ca_jogad.codjogador = es_gols.codjogador'
      'INNER JOIN es_tipogol ON es_tipogol.codtipo = es_gols.codtipogol'
      'WHERE es_gols.codjogo = :CodigoJogo'
      'AND es_gols.codjogador = :CodigoJogador'
      'ORDER BY es_gols.coditem;')
    Left = 616
    Top = 136
    ParamData = <
      item
        Name = 'CODIGOJOGO'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'CODIGOJOGADOR'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end>
    object qryMinutosGolsPorJogadortempoTipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tempoTipo'
      Origin = 'tempoTipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 27
    end
  end
end
