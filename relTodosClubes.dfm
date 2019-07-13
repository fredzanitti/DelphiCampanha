object frmRelAdversarios: TfrmRelAdversarios
  Left = 0
  Top = 0
  Caption = 'frmRelAdversarios'
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
  object frxDBRelClubes: TfrxDBDataset
    UserName = 'frxDBRelClubes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Clube=Clube'
      'Cidade=Cidade'
      'Pais=Pais'
      'Escudo=Escudo'
      'Bandeira=Bandeira')
    DataSet = qryClubes
    BCDToCurrency = False
    Left = 48
    Top = 32
  end
  object frxRelClubes: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43499.068739456000000000
    ReportOptions.LastChange = 43501.058110138890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 144
    Top = 32
    Datasets = <
      item
        DataSet = frxDBRelClubes
        DataSetName = 'frxDBRelClubes'
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
            'RELA'#199#195'O DOS CLUBES CADASTRADOS')
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
        Height = 41.574830000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        DataSet = frxDBRelClubes
        DataSetName = 'frxDBRelClubes'
        RowCount = 0
        object frxDBRelJogadoresApelido: TfrxMemoView
          Left = 58.913420000000000000
          Top = 10.118120000000000000
          Width = 219.212642360000000000
          Height = 18.897650000000000000
          DataField = 'Clube'
          DataSet = frxDBRelClubes
          DataSetName = 'frxDBRelClubes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelClubes."Clube"]')
          ParentFont = False
        end
        object frxDBRelJogadoresNomeCompleto: TfrxMemoView
          Left = 285.464750000000000000
          Top = 9.338590000000000000
          Width = 188.976377950000000000
          Height = 18.897650000000000000
          DataField = 'Cidade'
          DataSet = frxDBRelClubes
          DataSetName = 'frxDBRelClubes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelClubes."Cidade"]')
          ParentFont = False
        end
        object frxDBRelJogadoresPais: TfrxMemoView
          Left = 519.338900000000000000
          Top = 9.338590000000000000
          Width = 188.976426770000000000
          Height = 18.897650000000000000
          DataField = 'Pais'
          DataSet = frxDBRelClubes
          DataSetName = 'frxDBRelClubes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelClubes."Pais"]')
          ParentFont = False
        end
        object imgBandeira: TfrxPictureView
          Left = 486.338900000000000000
          Top = 9.338590000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          FileLink = '[frxDBRelClubes."Bandeira"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Picture1: TfrxPictureView
          Left = 11.338590000000000000
          Top = 0.779530000000000000
          Width = 37.795275590000000000
          Height = 37.795275590000000000
          FileLink = '[frxDBRelClubes."Escudo"]'
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
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Clube')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 285.464750000000000000
          Width = 188.976426770000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 480.086890000000000000
          Width = 222.992167480000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Pa'#237's')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 9.559060000000000000
          Top = 24.236240000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 321.260050000000000000
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
        Top = 226.771800000000000000
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
  object qryClubes: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      '')
    Left = 240
    Top = 32
  end
end
