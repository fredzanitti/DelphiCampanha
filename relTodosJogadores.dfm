object frmRelJogador: TfrmRelJogador
  Left = 0
  Top = 0
  Caption = 'frmRelJogador'
  ClientHeight = 201
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
  object frxDBRelJogadores: TfrxDBDataset
    UserName = 'frxDBRelJogadores'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Codigo=Codigo'
      'Apelido=Apelido'
      'NomeCompleto=NomeCompleto'
      'DataNascimento=DataNascimento'
      'LocalNascimento=LocalNascimento'
      'Estado=Estado'
      'Pais=Pais'
      'Posicao=Posicao'
      'Situacao=Situacao'
      'Bandeira=Bandeira')
    DataSet = qryJogadores
    BCDToCurrency = False
    Left = 48
    Top = 32
  end
  object frxRelJogadores: TfrxReport
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
    Left = 144
    Top = 32
    Datasets = <
      item
        DataSet = frxDBRelJogadores
        DataSetName = 'frxDBRelJogadores'
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
        Height = 30.236240000000000000
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
            'RELA'#199#195'O DOS JOGADORES')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        DataSet = frxDBRelJogadores
        DataSetName = 'frxDBRelJogadores'
        RowCount = 0
        object frxDBRelJogadoresCodigo: TfrxMemoView
          Left = 9.559060000000000000
          Width = 37.795275590000000000
          Height = 18.897650000000000000
          DataField = 'Codigo'
          DataSet = frxDBRelJogadores
          DataSetName = 'frxDBRelJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelJogadores."Codigo"]')
          ParentFont = False
        end
        object frxDBRelJogadoresApelido: TfrxMemoView
          Left = 54.913420000000000000
          Width = 151.181102360000000000
          Height = 18.897650000000000000
          DataField = 'Apelido'
          DataSet = frxDBRelJogadores
          DataSetName = 'frxDBRelJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelJogadores."Apelido"]')
          ParentFont = False
        end
        object frxDBRelJogadoresNomeCompleto: TfrxMemoView
          Left = 213.653680000000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          DataField = 'NomeCompleto'
          DataSet = frxDBRelJogadores
          DataSetName = 'frxDBRelJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelJogadores."NomeCompleto"]')
          ParentFont = False
        end
        object frxDBRelJogadoresPais: TfrxMemoView
          Left = 444.189240000000000000
          Width = 128.503946770000000000
          Height = 18.897650000000000000
          DataField = 'Pais'
          DataSet = frxDBRelJogadores
          DataSetName = 'frxDBRelJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelJogadores."Pais"]')
          ParentFont = False
        end
        object frxDBRelJogadoresPosicao: TfrxMemoView
          Left = 582.134200000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'Posicao'
          DataSet = frxDBRelJogadores
          DataSetName = 'frxDBRelJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelJogadores."Posicao"]')
          ParentFont = False
        end
        object imgBandeira: TfrxPictureView
          Left = 410.748300000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          FileLink = '[frxDBRelJogadores."Bandeira"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 71.811070000000000000
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
          Top = 24.236239999999990000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 302.362400000000000000
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
            'P'#225'gina [Page] de [TotalPages#]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        object COUNT: TfrxMemoView
          Left = 11.338590000000000000
          Top = 9.000000000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 12.338590000000000000
          Top = 4.000000000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object qryJogadores: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      ''
      '')
    Left = 240
    Top = 32
  end
end
