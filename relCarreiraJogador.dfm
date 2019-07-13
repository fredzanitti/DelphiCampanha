object frmRelCarreiraJogador: TfrmRelCarreiraJogador
  Left = 0
  Top = 0
  Caption = 'Carreira'
  ClientHeight = 515
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxDBRelCarreiraJogadores: TfrxDBDataset
    UserName = 'frxDBRelCarreiraJogadores'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Jogador=Jogador'
      'NomeCompleto=NomeCompleto'
      'Foto=Foto'
      'Posicao=Posicao'
      'Escudo=Escudo'
      'Clube=Clube'
      'Cidade=Cidade'
      'BandeiraPais=BandeiraPais'
      'Pais=Pais'
      'anoini=anoini'
      'anofim=AnoFIm')
    DataSet = qryCarreiraJogadores
    BCDToCurrency = False
    Left = 64
    Top = 128
  end
  object frxRelCarreiraJogadores: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43499.068739456000000000
    ReportOptions.LastChange = 43533.752946111110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 56
    Top = 16
    Datasets = <
      item
        DataSet = frxDBEstreia
        DataSetName = 'frxDBEstreia'
      end
      item
        DataSet = frxDBRelCarreiraJogadores
        DataSetName = 'frxDBRelCarreiraJogadores'
      end
      item
        DataSet = frxDBTotalClubes
        DataSetName = 'frxDBTotalClubes'
      end
      item
        DataSet = frxDBUltimo
        DataSetName = 'frxDBUltimo'
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
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Rich1: TfrxRichView
          Align = baCenter
          Left = 102.047310000000000000
          Width = 514.016080000000000000
          Height = 18.897650000000000000
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C6663686172736574302043616C696272693B7D7B5C66315C66
            6E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C67656E
            657261746F722052696368656432302031302E302E31373736337D5C76696577
            6B696E64345C756331200D0A5C706172645C71635C625C66305C667332342046
            4943484120494E444956494455414C20444F204A4F4741444F525C66315C6673
            32305C7061720D0A7D0D0A00}
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        DataSet = frxDBRelCarreiraJogadores
        DataSetName = 'frxDBRelCarreiraJogadores'
        RowCount = 0
        object frxDBRelJogadoresNomeCompleto: TfrxMemoView
          Left = 42.574830000000000000
          Top = 10.559060000000000000
          Width = 166.299197950000000000
          Height = 18.897650000000000000
          DataField = 'Clube'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."Clube"]')
          ParentFont = False
        end
        object frxDBRelJogadoresPais: TfrxMemoView
          Left = 213.637910000000000000
          Top = 10.582677170000000000
          Width = 166.299246770000000000
          Height = 18.897650000000000000
          DataField = 'Cidade'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."Cidade"]')
          ParentFont = False
        end
        object frxDBRelJogadoresPosicao: TfrxMemoView
          Left = 597.252320000000000000
          Top = 10.582677170000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'anoini'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."anoini"]')
          ParentFont = False
        end
        object imgBandeira: TfrxPictureView
          Left = 6.559040470000000000
          Top = 4.559060000000000000
          Width = 30.236220470000000000
          Height = 30.236220470000000000
          FileLink = '[frxDBRelCarreiraJogadores."Escudo"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo6: TfrxMemoView
          Left = 653.858690000000000000
          Top = 10.582677170000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'AnoFIm'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."AnoFIm"]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 385.826947400000000000
          Top = 8.559060000000000000
          Width = 34.015733390000000000
          Height = 22.677143390000000000
          FileLink = '[frxDBRelCarreiraJogadores."BandeiraPais"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo7: TfrxMemoView
          Left = 426.291590000000000000
          Top = 10.582677170000000000
          Width = 162.519716770000000000
          Height = 18.897650000000000000
          DataField = 'Pais'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."Pais"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 249.448980000000000000
        Top = 75.590600000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          Left = 3.779527559055118000
          Top = 179.196970000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 151.181200000000000000
          Top = 7.559060000000000000
          Width = 544.252246770000000000
          Height = 30.236240000000000000
          DataField = 'Jogador'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."Jogador"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 151.181200000000000000
          Top = 39.236240000000000000
          Width = 264.000000000000000000
          Height = 18.897650000000000000
          DataField = 'NomeCompleto'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."NomeCompleto"]')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 124.724453390000000000
          Height = 158.740223390000000000
          FileLink = '[frxDBRelCarreiraJogadores."Foto"]'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBEstreiatipo: TfrxMemoView
          Left = 151.181102360000000000
          Top = 106.149606300000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'tipo'
          DataSet = frxDBEstreia
          DataSetName = 'frxDBEstreia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBEstreia."tipo"]')
          ParentFont = False
        end
        object frxDBEstreiadata: TfrxMemoView
          Left = 245.448980000000000000
          Top = 106.149606300000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'data'
          DataSet = frxDBEstreia
          DataSetName = 'frxDBEstreia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBEstreia."data"]')
          ParentFont = False
        end
        object frxDBEstreiaJogo: TfrxMemoView
          Left = 331.598640000000000000
          Top = 106.149606300000000000
          Width = 302.362204720000000000
          Height = 18.897650000000000000
          DataField = 'Jogo'
          DataSet = frxDBEstreia
          DataSetName = 'frxDBEstreia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBEstreia."Jogo"]')
          ParentFont = False
        end
        object frxDBUltimotipo: TfrxMemoView
          Left = 151.181102360000000000
          Top = 128.503937010000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'tipo'
          DataSet = frxDBUltimo
          DataSetName = 'frxDBUltimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBUltimo."tipo"]')
          ParentFont = False
        end
        object frxDBUltimodata: TfrxMemoView
          Left = 244.669450000000000000
          Top = 128.503937010000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'data'
          DataSet = frxDBUltimo
          DataSetName = 'frxDBUltimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBUltimo."data"]')
          ParentFont = False
        end
        object frxDBUltimoJogo: TfrxMemoView
          Left = 331.598640000000000000
          Top = 128.503937010000000000
          Width = 302.362204720000000000
          Height = 18.897650000000000000
          DataField = 'Jogo'
          DataSet = frxDBUltimo
          DataSetName = 'frxDBUltimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBUltimo."Jogo"]')
          ParentFont = False
        end
        object frxDBRelCarreiraJogadoresPosicao: TfrxMemoView
          Left = 151.181200000000000000
          Top = 61.913420000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'Posicao'
          DataSet = frxDBRelCarreiraJogadores
          DataSetName = 'frxDBRelCarreiraJogadores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBRelCarreiraJogadores."Posicao"]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 151.181200000000000000
          Top = 95.370130000000000000
          Width = 559.370078740000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Rich2: TfrxRichView
          Align = baCenter
          Left = 151.181200000000000000
          Top = 186.756030000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C6663686172736574302043616C696272693B7D7B5C66315C66
            6E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C67656E
            657261746F722052696368656432302031302E302E31373736337D5C76696577
            6B696E64345C756331200D0A5C706172645C71635C625C66305C667332322043
            415252454952415C66315C667332305C7061720D0A7D0D0A00}
        end
        object Rich3: TfrxRichView
          Left = 6.425196850000000000
          Top = 219.212740000000000000
          Width = 200.314960630000000000
          Height = 18.897650000000000000
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31373736337D5C76
            6965776B696E64345C756331200D0A5C706172645C625C66305C667331382043
            6C7562655C62305C667331365C7061720D0A7D0D0A00}
        end
        object Rich4: TfrxRichView
          Left = 213.543307090000000000
          Top = 219.212740000000000000
          Width = 370.393810630000000000
          Height = 18.897650000000000000
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31373736337D5C76
            6965776B696E64345C756331200D0A5C706172645C625C66305C667331382043
            69646164652F50615C2765647320646F20436C7562655C62305C667331365C70
            61720D0A7D0D0A00}
        end
        object Rich5: TfrxRichView
          Left = 589.606680000000000000
          Top = 219.212740000000000000
          Width = 117.165395830000000000
          Height = 18.897650000000000000
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C
            67656E657261746F722052696368656432302031302E302E31373736337D5C76
            6965776B696E64345C756331200D0A5C706172645C71635C625C66305C667331
            38205065725C2765646F646F5C62305C667331365C7061720D0A7D0D0A00}
        end
        object Line6: TfrxLineView
          Left = 3.779527560000000000
          Top = 245.669450000000000000
          Width = 710.551181100000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 544.252320000000000000
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
        Top = 449.764070000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          Left = 3.779527559055118000
          Top = 4.000000000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Rich6: TfrxRichView
          Left = 7.559060000000000000
          Top = 9.448818900000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6E6F
            7569636F6D7061745C6465666C616E67313034367B5C666F6E7474626C7B5C66
            305C666E696C5C6663686172736574302043616C696272693B7D7B5C66315C66
            6E696C5C6663686172736574302043614C696272693B7D7B5C66325C666E696C
            5C666368617273657430205461686F6D613B7D7D0D0A7B5C2A5C67656E657261
            746F722052696368656432302031302E302E31373736337D5C766965776B696E
            64345C756331200D0A5C706172645C625C66305C6673323220544F54414C2044
            4520434C55424553204E412043415252454952413A5C66315C667332305C7061
            720D0A5C62305C66325C667331365C7061720D0A7D0D0A00}
        end
        object frxDBTotalClubesqtde: TfrxMemoView
          Left = 228.551330000000000000
          Top = 9.448818900000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'qtde'
          DataSet = frxDBTotalClubes
          DataSetName = 'frxDBTotalClubes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBTotalClubes."qtde"]')
          ParentFont = False
        end
      end
    end
  end
  object qryCarreiraJogadores: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select ca_jogad.nome as Jogador,'
      '       ca_jogad.nomecompleto as NomeCompleto,'
      '       ca_jogad.foto as Foto,'
      '       ca_posic.descricao as Posicao,'
      '       ca_adver.escudo as Escudo,'
      '       ca_adver.nome as Clube,'
      '       ca_cidad.nome as Cidade,'
      '       ca_pais.bandeira as BandeiraPais,'
      '       ca_pais.nome as Pais,'
      '       ca_carreira.anoini,'
      
        '       case when ca_carreira.anofim is null then '#39'Atual'#39' else ca' +
        '_carreira.anofim end as anofim'
      'from ca_jogad'
      'inner join ca_posic on ca_posic.codposicao = ca_jogad.codposicao'
      
        'inner join ca_carreira on ca_carreira.codjogador = ca_jogad.codj' +
        'ogador'
      'inner join ca_adver on ca_adver.codadver = ca_carreira.codclube'
      'inner join ca_cidad on ca_cidad.codcidade = ca_adver.codcidade'
      'inner join ca_pais on ca_pais.codpais = ca_cidad.codpais'
      'where ca_jogad.codjogador = :codjogador'
      ''
      '')
    Left = 64
    Top = 176
    ParamData = <
      item
        Name = 'CODJOGADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qryCarreiraJogadoresJogador: TWideStringField
      FieldName = 'Jogador'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object qryCarreiraJogadoresNomeCompleto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'NomeCompleto'
      Origin = 'nomecompleto'
      Size = 50
    end
    object qryCarreiraJogadoresFoto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Foto'
      Origin = 'foto'
      Size = 150
    end
    object qryCarreiraJogadoresPosicao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Posicao'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCarreiraJogadoresEscudo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Escudo'
      Origin = 'escudo'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryCarreiraJogadoresClube: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Clube'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryCarreiraJogadoresCidade: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cidade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 40
    end
    object qryCarreiraJogadoresBandeiraPais: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'BandeiraPais'
      Origin = 'bandeira'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryCarreiraJogadoresPais: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pais'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
    object qryCarreiraJogadoresanoini: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'anoini'
      Origin = 'anoini'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryCarreiraJogadoresanofim: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'anofim'
      Origin = 'anofim'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
  end
  object qryEstreia: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select primeiro.tipo, primeiro.data, primeiro.jogo'
      'from ('
      'select '#39'Estr'#233'ia'#39' as Tipo, a.data,'
      
        '       concat(a.mand," ",a.placar1,"x",a.placar2," ", a.visit) a' +
        's Jogo'
      #9'   from('
      
        #9#9#9'select j.codjogo, j.data, am.nome mand, j.placar1, j.placar2,' +
        ' av.nome visit'
      
        '            from es_titul t, ca_jogos j, ca_adver am, ca_adver a' +
        'v'
      
        '            where t.codjogo = j.codjogo and j.codadvermand = am.' +
        'codadver'
      
        '            and j.codadvervisit = av.codadver and t.codjogador =' +
        ' :codjogador'
      '            union'
      
        '            select j.codjogo, j.data, am.nome mand, j.placar1, j' +
        '.placar2, av.nome visit'
      
        '            from es_reser t, ca_jogos j, ca_adver am, ca_adver a' +
        'v'
      
        '            where t.codjogo = j.codjogo and j.codadvermand = am.' +
        'codadver'
      
        '            and j.codadvervisit = av.codadver and t.codjogador =' +
        ' :codjogador'
      '        ) as a  order by data limit 1 offset 0'
      ') as primeiro'
      ''
      ''
      '')
    Left = 168
    Top = 176
    ParamData = <
      item
        Name = 'CODJOGADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qryEstreiatipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object qryEstreiadata: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryEstreiajogo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'jogo'
      Origin = 'jogo'
      ProviderFlags = []
      ReadOnly = True
      Size = 85
    end
  end
  object frxDBEstreia: TfrxDBDataset
    UserName = 'frxDBEstreia'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tipo=tipo'
      'data=data'
      'jogo=Jogo')
    DataSet = qryEstreia
    BCDToCurrency = False
    Left = 168
    Top = 128
  end
  object frxRichObject1: TfrxRichObject
    Left = 152
    Top = 16
  end
  object qryUltimo: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select ultimo.tipo, ultimo.data, ultimo.jogo'
      'from ('
      'select '#39#218'ltimo Jogo'#39' as Tipo, a.data,'
      
        '       concat(a.mand," ",a.placar1,"x",a.placar2," ", a.visit) a' +
        's Jogo'
      #9'   from('
      
        #9#9#9'select j.codjogo, j.data, am.nome mand, j.placar1, j.placar2,' +
        ' av.nome visit'
      
        '            from es_titul t, ca_jogos j, ca_adver am, ca_adver a' +
        'v'
      
        '            where t.codjogo = j.codjogo and j.codadvermand = am.' +
        'codadver'
      
        '            and j.codadvervisit = av.codadver and t.codjogador =' +
        ' :codjogador'
      '            union'
      
        '            select j.codjogo, j.data, am.nome mand, j.placar1, j' +
        '.placar2, av.nome visit'
      
        '            from es_reser t, ca_jogos j, ca_adver am, ca_adver a' +
        'v'
      
        '            where t.codjogo = j.codjogo and j.codadvermand = am.' +
        'codadver'
      
        '            and j.codadvervisit = av.codadver and t.codjogador =' +
        ' :codjogador'
      '        ) as a  order by data desc limit 1 offset 0'
      ') as ultimo'
      ''
      '')
    Left = 232
    Top = 176
    ParamData = <
      item
        Name = 'CODJOGADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object WideStringField1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipo'
      Origin = 'tipo'
      ProviderFlags = []
      ReadOnly = True
      Size = 11
    end
    object DateField1: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
      ProviderFlags = []
      ReadOnly = True
    end
    object WideStringField2: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'jogo'
      Origin = 'jogo'
      ProviderFlags = []
      ReadOnly = True
      Size = 85
    end
  end
  object frxDBUltimo: TfrxDBDataset
    UserName = 'frxDBUltimo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'tipo=tipo'
      'data=data'
      'jogo=Jogo')
    DataSet = qryUltimo
    BCDToCurrency = False
    Left = 232
    Top = 128
  end
  object qryTotalClubes: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select count(*) as qtde from ('
      'select distinct ca_carreira.codclube'
      'from ca_carreira'
      'where ca_carreira.codjogador = :codjogador'
      ') as clubesCarreira'
      ''
      ''
      '')
    Left = 296
    Top = 184
    ParamData = <
      item
        Name = 'CODJOGADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qryTotalClubesqtde: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'qtde'
      Origin = 'qtde'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object frxDBTotalClubes: TfrxDBDataset
    UserName = 'frxDBTotalClubes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'qtde=qtde')
    DataSet = qryTotalClubes
    BCDToCurrency = False
    Left = 296
    Top = 136
  end
end
