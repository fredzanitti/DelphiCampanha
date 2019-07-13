object frmRelJogadorComFoto: TfrmRelJogadorComFoto
  Left = 0
  Top = 0
  Caption = 'frmRelJogadorComFoto'
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
  object frxDBRelJogadoresComFoto: TfrxDBDataset
    UserName = 'frxDBRelJogadoresComFoto'
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
      'Bandeira=Bandeira'
      'Foto=Foto')
    DataSet = qryJogadores
    BCDToCurrency = False
    Left = 88
    Top = 24
  end
  object qryJogadores: TFDQuery
    Connection = FrmDm.BDMySQL
    Left = 296
    Top = 32
    object qryJogadoresCodigo: TIntegerField
      FieldName = 'Codigo'
      Origin = 'codjogador'
      Required = True
    end
    object qryJogadoresApelido: TWideStringField
      FieldName = 'Apelido'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object qryJogadoresNomeCompleto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NomeCompleto'
      Origin = 'nomecompleto'
      Size = 50
    end
    object qryJogadoresDataNascimento: TDateField
      FieldName = 'DataNascimento'
      Origin = 'dtnasc'
      Required = True
    end
    object qryJogadoresLocalNascimento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'LocalNascimento'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryJogadoresEstado: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Estado'
      Origin = 'Estado'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryJogadoresPais: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pais'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
    object qryJogadoresPosicao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Posicao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryJogadoresSituacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Situacao'
      Origin = 'Situacao'
      ProviderFlags = []
      ReadOnly = True
      Size = 22
    end
    object qryJogadoresBandeira: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Bandeira'
      Origin = 'bandeira'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryJogadoresFoto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Foto'
      Origin = 'Foto'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
  end
  object frxRelJogadoresComFoto: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43499.068739456000000000
    ReportOptions.LastChange = 43502.987465138890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 80
    Top = 88
    Datasets = <
      item
        DataSet = frxDBRelJogadoresComFoto
        DataSetName = 'frxDBRelJogadoresComFoto'
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
        object Memo6: TfrxMemoView
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
        Height = 230.551330000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        DataSet = frxDBRelJogadoresComFoto
        DataSetName = 'frxDBRelJogadoresComFoto'
        RowCount = 0
        object Shape1: TfrxShapeView
          Left = 7.559060000000000000
          Top = 6.338589999999996000
          Width = 151.181200000000000000
          Height = 215.433063540000000000
          Fill.BackColor = clBtnFace
        end
        object Picture1: TfrxPictureView
          Left = 16.118120000000000000
          Top = 11.118120000000000000
          Width = 142.110285040000000000
          Height = 205.606367560000000000
          FileLink = '[frxDBRelJogadoresComFoto."Foto"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Line1: TfrxLineView
          Left = 179.196970000000000000
          Top = 221.110390000000000000
          Width = 532.913730000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          Left = 170.078740160000000000
          Top = 7.559060000000000000
          Width = 491.338582680000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Nome: [frxDBRelJogadoresComFoto."Apelido"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 170.078740160000000000
          Top = 45.795300000000000000
          Width = 491.338582680000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Nome completo: [frxDBRelJogadoresComFoto."NomeCompleto"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 170.078740160000000000
          Top = 72.472480000000000000
          Width = 491.338582680000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Data de nascimento: [frxDBRelJogadoresComFoto."DataNascimento"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 170.078740160000000000
          Top = 95.149660000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Nacionalidade:')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          Left = 264.905690000000000000
          Top = 95.149660000000010000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          FileLink = '[frxDBRelJogadoresComFoto."Bandeira"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBRelJogadoresComFotoPais: TfrxMemoView
          Left = 301.362400000000000000
          Top = 95.149660000000010000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          DataSet = frxDBRelJogadoresComFoto
          DataSetName = 'frxDBRelJogadoresComFoto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelJogadoresComFoto."Pais"]')
          ParentFont = False
        end
        object frxDBRelJogadoresComFotoLocalNascimento: TfrxMemoView
          Left = 170.078850000000000000
          Top = 121.606370000000000000
          Width = 491.338582680000000000
          Height = 18.897650000000000000
          DataSet = frxDBRelJogadoresComFoto
          DataSetName = 'frxDBRelJogadoresComFoto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            
              'Naturalidade: [frxDBRelJogadoresComFoto."LocalNascimento"] / [fr' +
              'xDBRelJogadoresComFoto."Estado"]')
          ParentFont = False
        end
        object frxDBRelJogadoresComFotoPosicao: TfrxMemoView
          Left = 170.078850000000000000
          Top = 175.283550000000000000
          Width = 491.338582680000000000
          Height = 30.236220470000000000
          DataSet = frxDBRelJogadoresComFoto
          DataSetName = 'frxDBRelJogadoresComFoto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelJogadoresComFoto."Posicao"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 170.078850000000000000
          Top = 153.063080000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            'Posi'#231#227'o:')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 457.323130000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 5.779530000000023000
          Width = 702.992580000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'P'#225'gina [Page] de [TotalPages#]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 362.834880000000000000
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
end
