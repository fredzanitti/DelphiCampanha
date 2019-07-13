object frmCarreiraJogador: TfrmCarreiraJogador
  Left = 0
  Top = 0
  Anchors = []
  Caption = 'Carreira'
  ClientHeight = 475
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  DesignSize = (
    551
    475)
  PixelsPerInch = 96
  TextHeight = 13
  object LblApelido: TLabel
    Left = 8
    Top = 17
    Width = 535
    Height = 28
    Alignment = taCenter
    AutoSize = False
    Caption = 'WELLINGTON MONTEIRO'
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  inline fraSelAnoInicial: TfraSelAnoCompleto
    Left = 213
    Top = 65
    Width = 136
    Height = 77
    TabOrder = 1
    ExplicitLeft = 213
    ExplicitTop = 65
    inherited GroupBox1: TGroupBox
      Caption = 'Ano Inicial'
    end
  end
  inline fraSelAnoFinal: TfraSelAnoCompleto
    Left = 348
    Top = 65
    Width = 136
    Height = 77
    TabOrder = 2
    ExplicitLeft = 348
    ExplicitTop = 65
    inherited GroupBox1: TGroupBox
      Caption = 'Ano Final'
    end
  end
  inline fraSelClubeCompleto: TfraSelClubeCompleto
    Left = 6
    Top = 64
    Width = 203
    Height = 80
    Anchors = []
    TabOrder = 0
    ExplicitLeft = 6
    ExplicitTop = 64
    ExplicitWidth = 203
    inherited GroupBox1: TGroupBox
      Left = 3
      Top = 3
      Width = 199
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 199
      inherited lblSelecionarJogador: TLabel
        Left = 10
        Top = 19
        ExplicitLeft = 10
        ExplicitTop = 19
      end
      inherited dblClube: TDBLookupComboBox
        Left = 8
        Width = 177
        ExplicitLeft = 8
        ExplicitWidth = 177
      end
    end
  end
  object DbGridClubesCarreira: TDBGrid
    Left = 9
    Top = 161
    Width = 533
    Height = 296
    BiDiMode = bdLeftToRight
    BorderStyle = bsNone
    Ctl3D = True
    DataSource = dtsCarreira
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clGrayText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnCellClick = DbGridClubesCarreiraCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'coditem'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nomeClube'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Clube'
        Title.Color = clWhite
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'Pa'#237's'
        Width = 150
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'anoini'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'In'#237'cio'
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'anofim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Fim'
        Width = 80
        Visible = True
      end>
  end
  object BtnGravar: TBitBtn
    Left = 497
    Top = 55
    Width = 45
    Height = 45
    Hint = 'Adicionar clube'
    Glyph.Data = {
      36180000424D3618000000000000360000002800000040000000200000000100
      18000000000000180000232E0000232E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FBF1C6E1A79CCB
      6680BD3C65AE1259A80059A80063AD0F7FBC3AA1CE6EC9E3ACF8FBF3FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCEAE9E9DAD9
      D8D0CECDC6C4C2C1BFBDC1BFBDC5C3C1CFCECCDCDBDAEBEBEAFDFCFCFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF4DE9BCB655FAC0A59A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A8005FAB099DCC68E9
      F4DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7DAD9D7C4C2C0C1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C2C0DBD9D8F7
      F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFAFDF7AAD37C5DAA0659A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A8005D
      AB07ABD37EFAFDF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFDFDE0DEDDC3C1BFC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3
      C1BFE0DFDEFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE9F4DD77B82E59A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80078B82FEBF5E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF7F7F7CCCBC9C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDCDCBC9F8F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE1F0D168B01759A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80067B016E1EFD0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF4F4F4C7C5C3C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC7C5C3F4F4F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE9F4DC68B01759A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80067B016E7F3DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF7F7F6C7C5C3C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC7C5C3F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FAFDF778B93059A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80075B72BF9FCF5FFFFFFFFFFFFFFFFFFFFFFFF
      FEFDFDCDCBCAC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDCCCAC8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      A9D27A59A80059A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80059A800A3CF71FFFFFFFFFFFFFFFFFFFFFFFF
      DFDEDDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDDDCDBFFFFFFFFFFFFFFFFFFE9F4DC
      5CAA0559A80059A80059A80059A80059A80059A80059A80059A80059A80068B0
      17EAF4DE87C04659A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80059A8005BAA04E8F3DBFFFFFFFFFFFFF7F7F6
      C2C0BEC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5
      C3F7F7F7D2D1CFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC2C0BEF7F6F6FFFFFFFFFFFF9CCB66
      59A80059A80059A80059A80059A80059A80059A80059A80059A80065AF13F4F9
      EEFEFEFEFDFEFC85C04459A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80059A80059A8009BCB65FFFFFFFFFFFFDAD9D8
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FBFB
      FBFEFEFEFEFEFED2D1CFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDAD9D7FFFFFFF9FCF561AC0C
      59A80059A80059A80059A80059A80059A80059A80059A80065AF13F4F9EEFEFE
      FEFEFEFEFEFEFEFDFEFC87C04659A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80059A80059A80060AC0BF8FCF4FDFDFDC4C2C0
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFE
      FEFEFEFEFEFEFEFEFEFED3D1D0C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC4C2C0FDFDFDC9E3AB59A800
      59A80059A80059A80059A80059A80059A80059A80067B015F4F9EFFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFDFEFC87C14859A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80059A80059A80059A800C9E3ACEBEAE9C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFED3D1D0C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEBEBEA9FCD6C59A800
      59A80059A80059A80059A80059A80059A80068B017F5FAF0FEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFC89C24959A80059A80059A80059A80059
      A80059A80059A80059A80059A80059A80059A80059A800A4D073DBDAD9C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED3D2D1C1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDDDCDB7DBB3859A800
      59A80059A80059A80059A80059A80068B017F6FAF1FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFC89C24959A80059A80059A80059
      A80059A80059A80059A80059A80059A80059A80059A80081BD3DCFCDCCC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED3D2D1C1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDD0CFCD67B01659A800
      59A80059A80059A80059A80067B015F5FAF0FEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEEEF6E6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFC89C24959A80059A80059
      A80059A80059A80059A80059A80059A80059A80059A80065AF13C6C5C3C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEF9F9F9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED3D2D1C1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC6C4C259A80059A800
      59A80059A80059A80065AF13F5FAF0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDBEC
      C759A800B1D787FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFC89C24959A80059
      A80059A80059A80059A80059A80059A80059A80059A80059A800C1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF1F1
      F1C1BFBDE2E2E0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED3D2D1C1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD5BA90359A800
      59A80059A80059A80065AF13F4F9EEFEFEFEFEFEFEFEFEFEFEFEFEDAECC659A8
      0059A80059A800B0D685FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFC89C24959
      A80059A80059A80059A80059A80059A80059A80059A80059A800C2C0BEC1BFBD
      C1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFEFEFEFEFEFEFEFEFEFEFEF1F1F0C1BF
      BDC1BFBDC1BFBDE2E1E0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED3D2D1C1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC2C0BE6AB11A59A800
      59A80059A80059A80059A80068B017F5FAF0FEFEFEFEFEFEDAECC659A80059A8
      0059A80059A80059A800AFD584FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFDFEFC89
      C24959A80059A80059A80059A80059A80059A80059A80069B018C7C6C4C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FBFBFBFEFEFEFEFEFEF1F1F0C1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDE1E1E0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED3
      D2D1C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5C37DBB3759A800
      59A80059A80059A80059A80059A80067B015F2F8EBD9EBC559A80059A80059A8
      0059A80059A80059A80059A800AFD584FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFD
      FEFC89C24959A80059A80059A80059A80059A80059A8007DBB37CECDCBC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC7C5C3FAFAFAF1F1F0C1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDE1E1E0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFED3D2D1C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCFCDCC9CCB6759A800
      59A80059A80059A80059A80059A80059A8005DAB0759A80059A80059A80059A8
      0059A80059A80059A80059A80059A800AFD584FEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFDFEFC85C04459A80059A80059A80059A80059A8009CCB66DAD9D8C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C1BFC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1E1E0FEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFED2D1CFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDAD9D8C7E2A959A800
      59A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A800AFD584FEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFDFEFB70B52459A80059A80059A80059A800C7E2A9EBEAE9C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1E1E0FEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFECAC8C7C1BFBDC1BFBDC1BFBDC1BFBDEBEAE9F8FBF360AC0B
      59A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A800AED582FEFEFEFEFEFEFE
      FEFEFEFEFEDBECC859A80059A80059A80059A8005FAC0AF6FBF1FDFCFCC4C2C0
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1E0DFFEFEFEFEFEFEFE
      FEFEFEFEFEF2F1F1C1BFBDC1BFBDC1BFBDC1BFBDC4C2C0FCFCFCFFFFFF9CCB67
      59A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A800ADD481FEFEFEFE
      FEFEDAECC659A80059A80059A80059A80059A8009BCB65FFFFFFFFFFFFDAD9D8
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1DFDFFEFEFEFE
      FEFEF1F1F0C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDAD9D8FFFFFFFFFFFFE9F4DD
      5CAA0559A80059A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A800ACD480D7
      EAC259A80059A80059A80059A80059A8005CAA05E9F4DDFFFFFFFFFFFFF7F7F7
      C2C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1DFDFF0
      F0EFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C1BFF7F7F7FFFFFFFFFFFFFFFFFF
      A5D07559A80059A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80059A800A6D176FFFFFFFFFFFFFFFFFFFFFFFF
      DEDCDBC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDEDDDCFFFFFFFFFFFFFFFFFFFFFFFF
      FAFCF674B72A59A80059A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80059A80078B82FFAFCF6FFFFFFFFFFFFFFFFFFFFFFFF
      FDFDFDCBCAC8C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDCDCBCAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE7F2D967AF1559A80059A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80059A80067B016E9F4DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF6F6F6C6C5C3C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC7C5C3F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE1F0D167B01659A80059A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80059A80067AF15E1F0D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF4F4F4C7C5C3C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC6C5C3F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE8F3DB74B72A59A80059A80059A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A80059
      A80059A80074B629E7F2D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF7F6F6CCCAC8C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDCBCAC8F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF9FCF5A4D0735CAA0559A80059A80059A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80059A80059A8005D
      AA06A5D075F9FCF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDDDDCDBC2C1BFC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3
      C1BFDEDDDCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9F4DC9DCC6861AC0C59A80059A8
      0059A80059A80059A80059A80059A80059A80059A80059A80060AC0B9ECC6AEA
      F4DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F6DBD9D8C4C2C0C1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC4C2C0DBDAD9F7
      F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FCF4C9E3AB9DCC
      697EBC3968B0175AA90159A80066AF147CBB369CCB66C7E2A8F8FBF3FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEBEAEADBDA
      D9CFCDCCC7C5C3C2C0BEC1BFBDC6C4C2CECDCBDAD9D8EAEAE9FDFCFCFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BtnGravarClick
  end
  object BtnCancelar: TBitBtn
    Left = 497
    Top = 106
    Width = 45
    Height = 45
    Hint = 'Remover clube'
    Glyph.Data = {
      36180000424D3618000000000000360000002800000040000000200000000100
      18000000000000180000232E0000232E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FFC1C0FA908D
      F55955F13732ED3732ED3732ED3732ED5955F1908DF5C1C0FAF8F8FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDECECEBDDDC
      DBCCCAC9C1BFBDC1BFBDC1BFBDC1BFBDCCCAC9DDDCDBECECEBFDFDFDFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9FE8E8BF5433FEF3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED433EEE8D8AF5E9
      E8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8F8DCDBDAC5C3C1C1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC5C3C1DCDBDAF8
      F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFCFBFF9E9BF73E39EE3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3D
      38EE9794F6FAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE1E0DFC3C2C0C1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3
      C1BFDFDEDDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE9E9FE635FF13732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED5A56F1E3E2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF9F8F8CFCDCCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDCCCBC9F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDFDEFD4E49EF3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED4540EFD5D4FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF6F5F5C8C7C5C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC6C4C2F2F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE8E7FD4C47EF3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED3732ED433FEFDFDEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF8F8F8C8C6C4C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC5C3C1F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FBFBFF5F5BF13732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED3732ED3732ED5753F0F8F7FFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFEFECECCCAC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDCBC9C8FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      9A97F63732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED3732ED3732ED3732ED9491F6FFFFFFFFFFFFFFFFFFFFFFFF
      E0DFDEC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDEDDDCFFFFFFFFFFFFFFFFFFE9E8FD
      3E39EE3732ED3732ED3732ED3732ED3732ED3732ED3732ED817EF4AEACF8605C
      F13732ED3732ED3732ED3732ED3732ED3732ED635FF2A9A7F87875F43732ED37
      32ED3732ED3732ED3732ED3732ED3732ED3C37EEE9E9FEFFFFFFFFFFFFF8F8F8
      C3C2C0C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDD8D7D6E6E5E4CECC
      CCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDD0CECCE5E4E3D5D5D3C1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C1BFF9F8F8FFFFFFFFFFFF928FF6
      3732ED3732ED3732ED3732ED3732ED3732ED3732EDD1D0FBFEFEFEFEFEFEFEFE
      FFBAB9F93732ED3732ED3732ED3732EDC8C6FAFEFEFFFEFEFEFFFFFFCBCAFA37
      32ED3732ED3732ED3732ED3732ED3732ED3732ED9997F6FFFFFFFFFFFFDEDCDB
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDF0F0F0FEFEFEFEFEFEFEFE
      FEEAE9E9C1BFBDC1BFBDC1BFBDC1BFBDEEEDECFEFEFEFEFEFEFFFFFFEFEFEEC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE0DFDEFFFFFFF9F9FF4540EF
      3732ED3732ED3732ED3732ED3732ED3732ED817EF4FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFED0CEFB3732ED3B36EFE1E0FDFEFEFEFEFEFEFEFEFEFEFEFEFFFFFF7B
      77F43732ED3732ED3732ED3732ED3732ED3732ED5753F0FFFFFFFEFDFDC6C4C2
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDD8D7D6FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEF0F0EFC1BFBDC3C1BFF5F5F4FEFEFEFEFEFEFEFEFEFEFEFEFFFFFFD7
      D5D4C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCBCAC8FFFFFFC7C5FA3732ED
      3732ED3732ED3732ED3732ED3732ED3732EDADABF8FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFED8D7FCDFDFFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEAA
      A8F83732ED3732ED3732ED3732ED3732ED3732ED3732EDDDDCFCEEEEEDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE6E5E4FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEF3F3F3F5F5F4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE5
      E5E4C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDF5F4F4918FF63732ED
      3732ED3732ED3732ED3732ED3732ED3732ED605CF1FEFEFFFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFF62
      5DF13732ED3732ED3732ED3732ED3732ED3732ED3732ED9D9BF7DDDCDBC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCECCCAFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFEFED0
      CECCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1E0DF5D59F13732ED
      3732ED3732ED3732ED3732ED3732ED3732ED3732EDBAB9F9FEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC9C7FA37
      32ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED6864F2CDCCCAC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEAE9E9FEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEEEEEDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDD0CFCD3732ED3732ED
      3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732EDD0CEFBFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE1E0FC3732ED37
      32ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3C37EEC1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDF0F0EFFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF6F6F5C1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C1BF3732ED3732ED
      3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732EDD9D8FCFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDFFC3B36EF3732ED37
      32ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732EDC1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDF3F3F2FEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF5F5F5C3C1BFC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD3732ED3732ED
      3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3B36EFDFDFFCFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED8D7FC3732ED3732ED37
      32ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732EDC1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C1BFF5F5F5FEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF3F3F2C1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD3732ED3732ED
      3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732EDE1E0FCFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED0CEFB3732ED37
      32ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3833EEC1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDF6F6F5FEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0F0F0C1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD5955F13732ED
      3732ED3732ED3732ED3732ED3732ED3732ED3732EDC9C7FAFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEBBBAF937
      32ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED5E5AF1CCCAC9C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEEEEEDFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEAEAE9C1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCDCCCA918FF63732ED
      3732ED3732ED3732ED3732ED3732ED3732ED635FF2FEFEFFFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFF60
      5CF13732ED3732ED3732ED3732ED3732ED3732ED3732ED9390F6DDDCDBC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCECECCFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECE
      CCCCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDEDCDBC2C1FA3732ED
      3732ED3732ED3732ED3732ED3732ED3732EDABA9F8FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEDFDEFCD9D8FCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEAE
      ACF83732ED3732ED3732ED3732ED3732ED3732ED3732EDC8C6FAECECEBC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE5E4E3FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEF5F5F5F3F3F2FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE6
      E6E4C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEEEEEDF8F8FF433EEE
      3732ED3732ED3732ED3732ED3732ED3732ED7C79F4FFFFFFFEFEFEFEFEFEFEFE
      FEFEFEFEDFDFFC3934EF3732EDD0CEFBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE81
      7EF43732ED3732ED3732ED3732ED3732ED3732ED443FEFFAFAFFFDFDFDC5C3C1
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDD7D5D4FFFFFFFEFEFEFEFEFEFEFE
      FEFEFEFEF5F5F5C3C1BFC1BFBDF0F0EFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED9
      D8D6C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC5C4C2FEFDFDFFFFFF8D8AF5
      3732ED3732ED3732ED3732ED3732ED3732ED3732EDCDCBFAFFFFFFFEFEFEFEFE
      FFC7C6FA3732ED3732ED3732ED3732EDBAB9F9FEFEFFFEFEFEFEFEFED0CFFB37
      32ED3732ED3732ED3732ED3732ED3732ED3732ED9491F6FFFFFFFFFFFFDCDBDA
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDF0EFEFFEFEFEFEFEFEFEFE
      FEEEEEEDC1BFBDC1BFBDC1BFBDC1BFBDEAE9E9FEFEFEFEFEFEFEFEFEF1F1F0C1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDEDDDCFFFFFFFFFFFFE9E8FD
      3E39EE3732ED3732ED3732ED3732ED3732ED3732ED3732ED7C79F4A9A7F8635F
      F23732ED3732ED3732ED3732ED3732ED3732ED5F5AF1ACAAF8807DF43732ED37
      32ED3732ED3732ED3732ED3732ED3732ED3E39EEE9E9FEFFFFFFFFFFFFF8F8F8
      C3C2C0C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDD7D6D4E5E4E3D0CE
      CCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCECCCAE5E5E4D8D7D6C1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C2C0F8F8F8FFFFFFFFFFFFFFFFFF
      9B98F63732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED3732ED3732ED3732ED9896F6FFFFFFFFFFFFFFFFFFFFFFFF
      E1E0DFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDFDEDDFFFFFFFFFFFFFFFFFFFFFFFF
      FCFBFF605CF13732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED3732ED3732ED5955F1F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFEFECECDCBC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDCCCAC9FEFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFE9E9FE4D48EF3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED3732ED4540EFE2E1FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF9F8F8C8C6C5C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC5C4C2F6F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE0DFFD4E49EF3732ED3732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED3732ED443FEFD6D5FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF6F6F5C9C7C5C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC5C3C1F2F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFE9E9FE6460F13732ED3732ED3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED37
      32ED3732ED5652F0DFDEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF9F8F8CFCDCCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDCBC9C7F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFCFBFF9F9DF73F3AEE3732ED3732ED3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3C
      37EE9492F6F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE1E0DFC4C2C0C1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3
      C1BFDEDDDCFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBFE908EF6433FEF3732ED3732
      ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED3732ED5550F09895F6E9
      E8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DDDCDBC5C3C1C1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCBC9C7DFDEDDF8
      F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9FFC1C0FA9693
      F66864F23B37EE3732ED3732ED3B37EE6662F29B98F6DBDAFCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDECECEBDFDE
      DDD0CFCDC3C1BFC1BFBDC1BFBDC3C1BFD0CECDE0DFDEF4F4F4FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BtnCancelarClick
  end
  object qryCarreira: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select ca_adver.nome as nomeClube,'
      #9'     ca_pais.nome as pais,'
      '       ca_carreira.anoini as anoini,'
      '       ca_carreira.anofim as anofim,'
      '       ca_carreira.coditem'
      'from ca_carreira'
      
        'inner join ca_jogad on ca_jogad.codjogador = ca_carreira.codjoga' +
        'dor'
      'inner join ca_adver on ca_adver.codadver = ca_carreira.codclube'
      'inner join ca_cidad on ca_cidad.codcidade = ca_adver.codcidade'
      'inner join ca_pais on ca_pais.codpais = ca_cidad.codpais'
      'where ca_jogad.codjogador = :codjogador'
      'order by ca_carreira.coditem'
      '')
    Left = 23
    Top = 207
    ParamData = <
      item
        Name = 'CODJOGADOR'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCarreiranomeClube: TWideStringField
      FieldName = 'nomeClube'
      Origin = 'nomeClube'
      Required = True
      Size = 30
    end
    object qryCarreirapais: TWideStringField
      FieldName = 'pais'
      Origin = 'pais'
      Required = True
      Size = 45
    end
    object qryCarreiraanoini: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'anoini'
      Origin = 'anoini'
    end
    object qryCarreiraanofim: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'anofim'
      Origin = 'anofim'
    end
    object qryCarreiracoditem: TFDAutoIncField
      FieldName = 'coditem'
      Origin = 'coditem'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object dtsCarreira: TDataSource
    DataSet = qryCarreira
    Left = 55
    Top = 207
  end
  object qryGravarCarreira: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT * FROM ca_carreira')
    Left = 384
    Top = 422
    object qryGravarCarreiracodjogador: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codjogador'
      Origin = 'codjogador'
    end
    object qryGravarCarreiracodclube: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codclube'
      Origin = 'codclube'
    end
    object qryGravarCarreiraanoini: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'anoini'
      Origin = 'anoini'
    end
    object qryGravarCarreiraanofim: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'anofim'
      Origin = 'anofim'
    end
  end
  object qryDeletarCarreira: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT * FROM ca_carreira'
      'where ca_carreira.coditem = :coditem'
      '')
    Left = 472
    Top = 422
    ParamData = <
      item
        Name = 'CODITEM'
        ParamType = ptInput
      end>
  end
end
