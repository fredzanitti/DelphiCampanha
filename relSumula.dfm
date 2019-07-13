object frmRelSumula: TfrmRelSumula
  Left = 0
  Top = 0
  Caption = 'frmRelSumula'
  ClientHeight = 268
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxDBRelSumula: TfrxDBDataset
    UserName = 'frxDBRelSumula'
    CloseDataSource = False
    FieldAliases.Strings = (
      'codcompeticao=codcompeticao'
      'NomeCompeticao=NomeCompeticao'
      'codadvermand=codadvermand'
      'NomeMandante=NomeMandante'
      'EscudoMandante=EscudoMandante'
      'placar1=placar1'
      'penalty1=penalty1'
      'penalty2=penalty2'
      'placar2=placar2'
      'codadvervisit=codadvervisit'
      'NomeVisitante=NomeVisitante'
      'EscudoVisitante=EscudoVisitante'
      'data=data'
      'hora=hora'
      'codestadio=codestadio'
      'NomeEstadio=NomeEstadio'
      'publico=publico'
      'codarbitro=codarbitro'
      'NomeArbitro=NomeArbitro'
      'codtatica=codtatica'
      'DescricaoTatica=DescricaoTatica'
      'contra=contra'
      'codfase=codfase'
      'NomeFase=NomeFase'
      'coduniforme=coduniforme'
      'FotoUniforme=FotoUniforme')
    DataSet = qrySumula
    BCDToCurrency = False
    Left = 48
    Top = 32
  end
  object frxRelSumula: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43499.068739456000000000
    ReportOptions.LastChange = 43499.105687534700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 224
    Top = 40
    Datasets = <
      item
        DataSet = frxDBRelReservas
        DataSetName = 'frxDBRelReservas'
      end
      item
        DataSet = frxDBRelSumula
        DataSetName = 'frxDBRelSumula'
      end
      item
        DataSet = frxDBRelTitulares
        DataSetName = 'frxDBRelTitulares'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 230.551330000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object reportTitulo: TfrxMemoView
          Left = 7.559060000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'S '#218' M U L A')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelSumula."NomeCompeticao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 60.149660000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Est'#225'dio: [frxDBRelSumula."NomeEstadio"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 7.559060000000000000
          Top = 79.149660000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data: [frxDBRelSumula."data"]')
          ParentFont = False
          VAlign = vaCenter
          Formats = <
            item
            end
            item
            end>
        end
        object Memo9: TfrxMemoView
          Left = 7.559060000000000000
          Top = 100.047310000000000000
          Width = 680.315400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #193'rbitro: [frxDBRelSumula."NomeArbitro"]'
            '')
          ParentFont = False
          VAlign = vaCenter
        end
        object Picture1: TfrxPictureView
          Left = 181.181200000000000000
          Top = 133.299320000000000000
          Width = 75.590551180000000000
          Height = 75.590551180000000000
          FileLink = '[frxDBRelSumula."EscudoMandante"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture2: TfrxPictureView
          Left = 458.559370000000000000
          Top = 134.078850000000000000
          Width = 75.590551180000000000
          Height = 75.590551180000000000
          FileLink = '[frxDBRelSumula."EscudoVisitante"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo10: TfrxMemoView
          Left = 266.008040000000000000
          Top = 134.078850000000000000
          Width = 71.811070000000000000
          Height = 75.590600000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelSumula."placar1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 377.953000000000000000
          Top = 134.078850000000000000
          Width = 71.811070000000000000
          Height = 75.590600000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelSumula."placar2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 343.937230000000000000
          Top = 161.315090000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'vs')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 9.559060000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'C'#243'd.')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 54.913420000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Jogador')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 213.653680000000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome Completo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 410.189240000000000000
          Width = 113.385826770000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nacionalidade')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 582.134200000000000000
          Width = 120.944857480000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Posi'#231#227'o')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 9.559060000000000000
          Top = 24.236240000000010000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 453.543600000000000000
        Width = 718.110700000000000000
        object TotalPages1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.000000000000000000
          Width = 699.212805910000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            
              'Todos os direitos reservados - (C) Frederico Zanitti Silva, [Yea' +
              'rOf(Now)]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        DataSet = frxDBRelTitulares
        DataSetName = 'frxDBRelTitulares'
        RowCount = 0
        object Picture3: TfrxPictureView
          Left = 11.338590000000000000
          Top = 3.779530000000022000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          FileLink = '[frxDBRelTitulares."bandeira"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBRelTitularesNomeJogador: TfrxMemoView
          Left = 49.133890000000000000
          Top = 3.779530000000022000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'NomeJogador'
          DataSet = frxDBRelTitulares
          DataSetName = 'frxDBRelTitulares'
          Memo.UTF8W = (
            '[frxDBRelTitulares."NomeJogador"]')
        end
        object frxDBRelTitularescamarelo: TfrxMemoView
          Left = 219.212740000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'camarelo'
          DataSet = frxDBRelTitulares
          DataSetName = 'frxDBRelTitulares'
          Memo.UTF8W = (
            '[frxDBRelTitulares."camarelo"]')
        end
        object frxDBRelTitularescvermelho: TfrxMemoView
          Left = 306.141930000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'cvermelho'
          DataSet = frxDBRelTitulares
          DataSetName = 'frxDBRelTitulares'
          Memo.UTF8W = (
            '[frxDBRelTitulares."cvermelho"]')
        end
        object frxDBRelTitularesgols: TfrxMemoView
          Left = 393.071120000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'gols'
          DataSet = frxDBRelTitulares
          DataSetName = 'frxDBRelTitulares'
          Memo.UTF8W = (
            '[frxDBRelTitulares."gols"]')
        end
      end
    end
  end
  object qrySumula: TFDQuery
    OnCalcFields = qrySumulaCalcFields
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      ''
      '')
    Left = 144
    Top = 32
    object qrySumulacodcompeticao: TIntegerField
      FieldName = 'codcompeticao'
    end
    object qrySumulaNomeCompeticao: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'NomeCompeticao'
      Size = 300
      Calculated = True
    end
    object qrySumulacodadvermand: TIntegerField
      FieldName = 'codadvermand'
    end
    object qrySumulaNomeMandante: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'NomeMandante'
      Size = 300
      Calculated = True
    end
    object qrySumulaEscudoMandante: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'EscudoMandante'
      Size = 300
      Calculated = True
    end
    object qrySumulaplacar1: TIntegerField
      FieldName = 'placar1'
    end
    object qrySumulapenalty1: TIntegerField
      FieldName = 'penalty1'
    end
    object qrySumulapenalty2: TIntegerField
      FieldName = 'penalty2'
    end
    object qrySumulaplacar2: TIntegerField
      FieldName = 'placar2'
    end
    object qrySumulacodadvervisit: TIntegerField
      FieldName = 'codadvervisit'
    end
    object qrySumulaNomeVisitante: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'NomeVisitante'
      Size = 300
      Calculated = True
    end
    object qrySumulaEscudoVisitante: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'EscudoVisitante'
      Size = 300
      Calculated = True
    end
    object qrySumuladata: TDateField
      FieldName = 'data'
    end
    object qrySumulahora: TWideStringField
      FieldName = 'hora'
      Size = 0
    end
    object qrySumulacodestadio: TIntegerField
      FieldName = 'codestadio'
    end
    object qrySumulaNomeEstadio: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'NomeEstadio'
      Size = 300
      Calculated = True
    end
    object qrySumulapublico: TIntegerField
      FieldName = 'publico'
    end
    object qrySumulacodarbitro: TIntegerField
      FieldName = 'codarbitro'
    end
    object qrySumulaNomeArbitro: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'NomeArbitro'
      Size = 300
      Calculated = True
    end
    object qrySumulacodtatica: TIntegerField
      FieldName = 'codtatica'
    end
    object qrySumulaDescricaoTatica: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescricaoTatica'
      Calculated = True
    end
    object qrySumulacontra: TIntegerField
      FieldName = 'contra'
    end
    object qrySumulacodfase: TIntegerField
      FieldName = 'codfase'
    end
    object qrySumulaNomeFase: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'NomeFase'
      Size = 300
      Calculated = True
    end
    object qrySumulacoduniforme: TIntegerField
      FieldName = 'coduniforme'
    end
    object qrySumulaFotoUniforme: TStringField
      DisplayWidth = 300
      FieldKind = fkCalculated
      FieldName = 'FotoUniforme'
      Size = 300
      Calculated = True
    end
  end
  object qryTitulares: TFDQuery
    OnCalcFields = qryTitularesCalcFields
    Connection = FrmDm.BDMySQL
    Left = 144
    Top = 80
    object qryTitularescodjogador: TIntegerField
      FieldName = 'codjogador'
    end
    object qryTitularesNomeJogador: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeJogador'
      Calculated = True
    end
    object qryTitularescamarelo: TIntegerField
      FieldName = 'camarelo'
    end
    object qryTitularescvermelho: TIntegerField
      FieldName = 'cvermelho'
    end
    object qryTitularesgols: TIntegerField
      FieldName = 'gols'
    end
    object qryTitularesbandeira: TWideStringField
      FieldName = 'bandeira'
      Size = 0
    end
  end
  object qryReservas: TFDQuery
    OnCalcFields = qryReservasCalcFields
    Connection = FrmDm.BDMySQL
    Left = 144
    Top = 136
    object qryReservascodjogador: TIntegerField
      FieldName = 'codjogador'
    end
    object qryReservasNomeJogador: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeJogador'
      Calculated = True
    end
    object qryReservascamarelo: TIntegerField
      FieldName = 'camarelo'
    end
    object qryReservascvermelho: TIntegerField
      FieldName = 'cvermelho'
    end
    object qryReservasgols: TIntegerField
      FieldName = 'gols'
    end
    object qryReservascodjogadorsaiu: TIntegerField
      FieldName = 'codjogadorsaiu'
    end
    object qryReservasNomeJogadorSaiu: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeJogadorSaiu'
      Calculated = True
    end
    object qryReservasbandeira: TWideStringField
      FieldName = 'bandeira'
      Size = 0
    end
  end
  object frxDBRelTitulares: TfrxDBDataset
    UserName = 'frxDBRelTitulares'
    CloseDataSource = False
    FieldAliases.Strings = (
      'codjogador=codjogador'
      'NomeJogador=NomeJogador'
      'camarelo=camarelo'
      'cvermelho=cvermelho'
      'gols=gols'
      'bandeira=bandeira')
    DataSet = qryTitulares
    BCDToCurrency = False
    Left = 48
    Top = 80
  end
  object frxDBRelReservas: TfrxDBDataset
    UserName = 'frxDBRelReservas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'codjogador=codjogador'
      'NomeJogador=NomeJogador'
      'camarelo=camarelo'
      'cvermelho=cvermelho'
      'gols=gols'
      'codjogadorsaiu=codjogadorsaiu'
      'NomeJogadorSaiu=NomeJogadorSaiu'
      'bandeira=bandeira')
    DataSet = qryReservas
    BCDToCurrency = False
    Left = 48
    Top = 136
  end
end
