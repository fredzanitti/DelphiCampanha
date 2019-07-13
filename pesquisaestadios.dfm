object h_estadios: Th_estadios
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Pesquisar Est'#225'dios'
  ClientHeight = 351
  ClientWidth = 604
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 193
    Height = 13
    Caption = 'Digite o nome do est'#225'dio (ou parte dele)'
  end
  object EdtPesquisa: TEdit
    Left = 16
    Top = 32
    Width = 257
    Height = 21
    TabOrder = 0
    OnKeyUp = EdtPesquisaKeyUp
  end
  object DbGridEstadio: TDBGrid
    Left = 16
    Top = 72
    Width = 561
    Height = 193
    BorderStyle = bsNone
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgRowLines, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clInfoText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = DbGridEstadioDrawColumnCell
    OnDblClick = DbGridEstadioDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
        Title.Caption = 'COD'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'estadio'
        Title.Caption = 'Est'#225'dio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Title.Caption = 'Cidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'uf'
        Title.Alignment = taCenter
        Title.Caption = 'UF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pais'
        Title.Caption = 'Pa'#237's'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end>
  end
  object BtnSelecionar: TBitBtn
    Left = 462
    Top = 271
    Width = 115
    Height = 45
    Caption = 'Selecionar'
    Glyph.Data = {
      0E220000424D0E2200000000000036000000280000004C000000260000000100
      180000000000D8210000232E0000232E00000000000000000000FEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF9F9F9E4E2DCA0957E8A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60
      8A7D608A7D60A0957EE4E1DCF9F9F9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEF9F9F9EFEFEECDCBCAC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCDCBCAEFEFEEF9F9
      F9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE4E1DC8D81648A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608D8164E4E2DCFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEEFEFEEC3C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3
      C1BFEFEFEEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEA0967E8A7D608A7D60
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D60A0967EFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFECDCBCAC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD
      C1BFBDC1BFBDCDCBCAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D
      608A7D60A69C86C3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3
      BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCAD
      C3BCADC3BCADC3BCADC3BCADC3BCADA59A848A7D608A7D608A7D60FEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDD0CFCDDFDEDDDFDEDDDF
      DEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDD
      DFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDE
      DDCFCECCC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A
      7D608A7D608A7D60C3BCADFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3BCAD8A7D608A7D608A7D60FE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDFDEDDFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFE8A7D608A7D608A7D60C3BCADFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3BCAD8A7D608A7D60
      8A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDFDE
      DDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFE8A7D608A7D608A7D60C3BCADFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3BCAD8A7D
      608A7D608A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1
      BFBDDFDEDDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C2BBACFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3
      BCAD8A7D608A7D608A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBD
      C1BFBDC1BFBDDFDEDDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C2BBACFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEC3BCAD8A7D608A7D608A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEC1BFBDC1BFBDC1BFBDDFDEDDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BF
      BDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C2BBACFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE0DCD5AFA692
      FAFAF9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEC3BCAD8A7D608A7D608A7D60FEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEC1BFBDC1BFBDC1BFBDDFDEDDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEEEEEEDD4D3D2FCFCFCFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1
      BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60
      C2BBACFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDBD38E82
      658A7D60AAA08BFAFAF9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEC3BCAD8A7D608A7D608A7D60FEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDFDEDCFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEEEEDEDC3C1C0C1BFBDD2D0CFFCFCFCFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDD
      C1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D
      608A7D60C2BBACFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDDD9D08E
      81658A7D608A7D608A7D60A99F8AFAF9F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3BCAD8A7D608A7D608A7D60FEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDFDEDCFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEEDECECC3C1BFC1BFBDC1BFBDC1BFBDD1D0CE
      FCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A
      7D608A7D608A7D60C2BBACFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDBD7CF
      8D81648A7D608A7D608A7D608A7D608A7D60A89F89FAF9F8FEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3BCAD8A7D608A7D608A7D60FE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDFDEDCFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEECEBEBC3C1BFC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDD1D0CEFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFE8A7D608A7D608A7D60C2BBACFEFEFEFEFEFEFEFEFEFEFEFEFEFEFED9D5
      CB8D80648A7D608A7D608A7D608A7D608A7D608A7D608A7D60A79D88F9F9F8FE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3BCAE8A7D608A7D60
      8A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDFDE
      DCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEBEAEAC3C1BFC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDD0CFCDFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFE8A7D608A7D608A7D60C1BAABFEFEFEFEFEFEFEFEFEFEFEFED8
      D3CA8C80638A7D608A7D608A7D60BFB8A9DFDBD38F82668A7D608A7D608A7D60
      A69C86F9F8F7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3BCAE8A7D
      608A7D608A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1
      BFBDDEDDDCFEFEFEFEFEFEFEFEFEFEFEFEEAE9E9C2C0BFC1BFBDC1BFBDC1BFBD
      DDDCDBEEEDEDC4C2C0C1BFBDC1BFBDC1BFBDD0CECDFCFCFBFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C1BAABFEFEFEFEFEFEFEFEFE
      D6D1C78C7F628A7D608A7D608A7D60CDC7BBFEFEFEFEFEFEE1DED78F83678A7D
      608A7D608A7D60A59B85F9F8F6FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC3
      BCAE8A7D608A7D608A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBD
      C1BFBDC1BFBDDEDDDCFEFEFEFEFEFEFEFEFEE9E8E8C2C0BEC1BFBDC1BFBDC1BF
      BDE4E3E3FEFEFEFEFEFEEFEFEEC4C2C0C1BFBDC1BFBDC1BFBDD0CECDFBFBFBFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BFBDFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C1BAABFEFEFEFEFE
      FED5D0C68B7F628A7D608A7D608A7D60CDC8BBFEFEFEFEFEFEFEFEFEFEFEFEE2
      DFD78F83678A7D608A7D608A7D60A59A84F8F7F6FEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEC3BCAE8A7D608A7D608A7D60FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEC1BFBDC1BFBDC1BFBDDEDDDCFEFEFEFEFEFEE9E8E7C2C0BEC1BFBDC1BFBDC1
      BFBDE5E4E3FEFEFEFEFEFEFEFEFEFEFEFEEFEFEEC4C2C0C1BFBDC1BFBDC1BFBD
      CFCECCFBFBFBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEDFDEDDC1BFBDC1BFBDC1BF
      BDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C1BAABFE
      FEFEFEFEFEE3E0D99084698A7D608A7D60C9C3B5FEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEE3E0D99083678A7D608A7D608A7D60A49983F8F7F5FEFEFEFEFE
      FEFEFEFEFEFEFED2CDC2A79D88A79D88A79D88FEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDDDCFEFEFEFEFEFEF0F0EFC5C3C1C1BFBD
      C1BFBDE2E1E0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0EFEFC4C2C0C1BF
      BDC1BFBDC1BFBDCFCDCCFBFBFBFEFEFEFEFEFEFEFEFEFEFEFEE7E6E5D1CFCED1
      CFCED1CFCEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60
      C1BAABFEFEFEFEFEFEFEFEFEE6E3DD92866AC6C0B1FEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEE3E0D99084688A7D608A7D608A7D60A39982F8
      F7F5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDDDCFEFEFEFEFEFEFEFEFEF2F1
      F1C5C3C2E1E0DFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF0
      EFEFC4C2C1C1BFBDC1BFBDC1BFBDCECDCBFBFBFBFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D
      608A7D60C1BAABFEFEFEFEFEFEFEFEFEFEFEFEF4F3F0FEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE3E0D99084688A7D608A7D60
      8A7D60A29881F7F6F5FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDDDCFEFEFEFEFEFEFE
      FEFEFEFEFEF9F9F9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEF0F0EFC5C3C1C1BFBDC1BFBDC1BFBDCECCCBFBFBFAFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A
      7D608A7D608A7D60C1BAABFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE4E1DA9084
      698A7D608A7D608A7D60A29780F7F6F4FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDDDCFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEF1F0F0C5C3C1C1BFBDC1BFBDC1BFBDCECCCBFA
      FAFAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFE8A7D608A7D608A7D60C0B9AAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEE4E2DB9084698A7D608A7D608A7D60A1967FF6F5F3FEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDD
      DCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF1F0F0C5C3C1C1BFBDC1BFBD
      C1BFBDCDCCCAFAFAFAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFE8A7D608A7D608A7D60C0B9AAFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEE5E2DC9185698A7D608A7D608A7D60A0957EF6F5F3FEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1
      BFBDDEDDDCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF1F1F0C5C3
      C1C1BFBDC1BFBDC1BFBDCDCBCAFAFAFAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C0B9AAFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE5E3DC9185698A7D608A7D608A7D60A0
      957EF5F4F2FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBD
      C1BFBDC1BFBDDEDDDCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEF1F1F0C5C3C1C1BFBDC1BFBDC1BFBDCDCBCAFAFAF9FEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C0B9AAFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE6E4DE91856A8A7D60
      8A7D608A7D609F947CF5F4F1FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEC1BFBDC1BFBDC1BFBDDEDDDBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEF2F1F1C5C3C1C1BFBDC1BFBDC1BFBDCCCBC9F9F9F9FEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60C0B9A9FE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE6E4
      DE92866A8A7D608A7D608A7D609F947CF4F3F1FEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDDDBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF2F2F1C5C3C2C1BFBDC1BFBDC1BFBDCC
      CAC9F9F9F9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D608A7D60
      C0B9A9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEE7E5DF92866B8A7D608A7D608A7D60A39982FEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDDDBFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF2F2F1C6C4C2C1BFBD
      C1BFBDC1BFBDCECDCBFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A7D608A7D
      608A7D60C0B9A9FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEE8E5DF92866B8A7D60908469E4E1DAFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDDEDDDBFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF2F2
      F2C6C4C2C1BFBDC5C3C1F0F0EFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE8A
      7D608A7D608A7D60A49A83C3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCAD
      C3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADC3BCADEDEB
      E7FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE8E5DF9E937BE9E6E1FEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEC1BFBDC1BFBDC1BFBDCFCDCCDFDEDD
      DFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDDFDE
      DDDFDEDDDFDEDDDFDEDDDFDEDDDFDEDDF5F5F5FEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEF2F2F2CCCAC9F3F3F2FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEA0967E8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D60DDD9D0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFECDCBCAC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEDECECFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEE4E1DC8D81648A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60
      8A7D608A7D60DDD9D0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEEFEFEEC3C1BFC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEDECECFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEF9F9F9E4E2DCA0957E8A7D608A7D608A7D608A7D60
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D60DDD9D0FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEF9F9F9
      F0EFEFCDCBCAC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEDECECFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BtnSelecionarClick
  end
  object BtnIncluir: TBitBtn
    Left = 411
    Top = 271
    Width = 45
    Height = 45
    Hint = 'Adionar e/ou Editar Est'#225'dio'
    Glyph.Data = {
      36180000424D3618000000000000360000002800000040000000200000000100
      18000000000000180000232E0000232E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE2DFD7C5BF
      B1A89F898D81648A7D608A7D608D8064A69C85BFB8A8DAD6CCFBFBFAFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF0EFEFE1E0
      DFD1D0CEC3C1BFC1BFBDC1BFBDC3C1BFD0CECDDEDCDBEBEBEAFDFDFDFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F0ECBAB3A291856A8A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60908468BAB2A1EF
      EDE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F7DBD9D8C5C3C1C1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC4C3C1DBD9D8F7
      F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFDFDFCC5BEAF8D80648A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608C
      7F62BEB6A6F9F8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE0DFDEC3C1BFC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC2
      C0BEDDDBDAFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF5F4F2A49A838A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D609B9077EBE8E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFAFAFACFCDCCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDCAC9C7F5F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF0EEEA9A8E758A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D6091856AE5E2DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF7F7F7CAC8C6C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC5C3C1F1F1F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF4F3F09A8F768A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D6092866BEDEBE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFAF9F9CAC8C6C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC5C4C2F6F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FDFDFCA399828A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608E8164B5AD9AB5AD9A8E81648A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D609F947CFCFBFAFFFFFFFFFFFFFFFFFFFFFFFF
      FEFEFECFCDCCC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC3C1BFD8D7D6D8D7D6C3C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDCCCBC9FEFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      C3BCAD8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      609A8F75FCFBFAFEFEFEFEFEFEFCFBFB9B90778A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D60C6C0B1FFFFFFFFFFFFFFFFFFFFFFFF
      E0DEDDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDCAC8C7FDFDFDFEFEFEFEFEFEFDFDFDCAC9C7C1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1E0DFFFFFFFFFFFFFFFFFFFF1F0EC
      8D81648A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60DFDBD4FEFEFEFEFEFEFEFEFEFEFEFEE0DCD58A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D60918569F9F8F6FFFFFFFFFFFFF8F7F7
      C3C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDEEEEEDFEFEFEFEFEFEFEFEFEFEFEFEEFEEEDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC5C3C1FCFCFCFFFFFFFFFFFFBBB4A3
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F0EFEBFEFEFEFEFEFEFEFEFEFEFEFEF1EFEC8A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D60C9C3B5FFFFFFFFFFFFDBDAD9
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDF7F7F7FEFEFEFEFEFEFEFEFEFEFEFEF7F7F7C1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE2E2E1FFFFFFFDFDFC918569
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F6F6F4FEFEFEFEFEFEFEFEFEFEFEFEF7F6F48A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D609B9077FFFFFFFEFEFEC5C3C1
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDFAFAFAFEFEFEFEFEFEFEFEFEFEFEFEFBFBFAC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCAC9C7FFFFFFE3E0D98A7D60
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F9F8F7FEFEFEFEFEFEFEFEFEFEFEFEF9F9F78A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60E8E6E0F0F0EFC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFCFCFCC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDF3F3F3C2BBAC8A7D60
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F9F9F7FEFEFEFEFEFEFEFEFEFEFEFEF9F9F78A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60C5BFB1DFDEDDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFCFCFCC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1E0DF9F957D8A7D60
      8A7D608A7D608A7D608A7D608A7D609A8F75E7E5DFF8F7F5FAFAF9FAFAF9FAF9
      F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAFAF9FBFBFAF9F9F7F6F5F2E3
      E0D99A8F758A7D608A7D608A7D608A7D608A7D608A7D60A29780CCCBC9C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCAC8C7F2F2F2FBFBFBFCFCFCFCFCFCFCFC
      FCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFCFCFDFDFDFCFCFCFAFAFAF0
      F0EFCAC8C7C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCECCCA8A7D608A7D60
      8A7D608A7D608A7D608A7D608B7E61FAF9F8FEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFBFBFA8E81648A7D608A7D608A7D608A7D608A7D608B7E61C1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC2C0BEFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFDFDFDC3C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC2C0BE8A7D608A7D60
      8A7D608A7D608A7D608A7D60B0A793FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEB3AA978A7D608A7D608A7D608A7D608A7D608A7D60C1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDD5D4D3FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFED7D6D4C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD8A7D608A7D60
      8A7D608A7D608A7D608A7D60B0A793FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEB3AB988A7D608A7D608A7D608A7D608A7D608A7D60C1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDD5D4D3FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFED7D6D5C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBD8A7D608A7D60
      8A7D608A7D608A7D608A7D608B7E61FAF9F8FEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFCFBFA8E81648A7D608A7D608A7D608A7D608A7D608B7E61C1BFBDC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC2C0BEFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFDFDFDC3C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC2C0BE9E947B8A7D60
      8A7D608A7D608A7D608A7D608A7D609B9077E7E5DFF8F7F5FAFAF9FAFAF9FAF9
      F8FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFAF9F8FAF9F8F8F7F5F2F0EDE1
      DDD69C90778A7D608A7D608A7D608A7D608A7D608A7D609F947CCCCAC9C1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCAC9C7F2F2F2FBFBFBFCFCFCFCFCFCFCFC
      FCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFCFCFCFCFCFCFBFBFBF8F8F7EF
      EFEECBC9C7C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDCCCBC9BFB8A88A7D60
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F9F9F7FEFEFEFEFEFEFEFEFEFEFEFEF9F9F78A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60C0B9A9DDDCDBC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFCFCFCC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDEDDDCDCD8CF8A7D60
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F9F8F7FEFEFEFEFEFEFEFEFEFEFEFEF9F9F78A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D60DDD9D1ECECEBC1BFBD
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDFCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFCFCFCC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDEDEDECFCFBFA91856A
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F6F6F4FEFEFEFEFEFEFEFEFEFEFEFEF7F6F48A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D6091856AFBFBFAFEFDFDC5C3C1
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDFAFAFAFEFEFEFEFEFEFEFEFEFEFEFEFBFBFAC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC5C3C1FDFDFDFFFFFFBBB3A2
      8A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60F0EFEBFEFEFEFEFEFEFEFEFEFEFEFEF1EFEC8A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608A7D60BDB5A5FFFFFFFFFFFFDBDAD9
      C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDF7F7F7FEFEFEFEFEFEFEFEFEFEFEFEF7F7F7C1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDDCDBDAFFFFFFFFFFFFF1EFEB
      8C80638A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      60DFDBD4FEFEFEFEFEFEFEFEFEFEFEFEE0DCD58A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D608E8165F3F2EFFFFFFFFFFFFFF7F7F7
      C2C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDEEEEEDFEFEFEFEFEFEFEFEFEFEFEFEEFEEEDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC3C1BFF9F9F8FFFFFFFFFFFFFFFFFF
      BFB7A78A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      609A8F75FCFBFAFEFEFEFEFEFEFCFBFB9B90778A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D608A7D60C5BFB1FFFFFFFFFFFFFFFFFFFFFFFF
      DDDCDBC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDCAC8C7FDFDFDFEFEFEFEFEFEFDFDFDCAC9C7C1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDE1E0DFFFFFFFFFFFFFFFFFFFFFFFFF
      FAFAF99C90788A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608E8164B5AD9AB5AD9A8E81648A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D608A7D60A29881FDFCFCFFFFFFFFFFFFFFFFFFFFFFFF
      FDFDFDCBC9C7C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC3C1BFD8D7D6D8D7D6C3C1BFC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC1BFBDCECDCBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFECEAE59185698A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D608A7D60968B71F2F1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF5F5F4C5C3C1C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC1BFBDC8C6C5F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE5E2DC9185698A7D608A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D608A7D60978B71EEECE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF2F1F1C5C3C1C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDC1BFBDC8C6C5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFEDEBE69D927A8A7D608A7D608A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A
      7D608A7D60A39982F3F2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF5F5F5CBCAC8C1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1
      BFBDC1BFBDCFCDCCF9F9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFCFBFAC4BDAE8F82668A7D608A7D608A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D608F
      8367C7C1B3FEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFDFDE0DFDEC4C2C0C1BFBDC1BFBDC1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC4
      C2C0E1E1E0FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F5F3C7C1B3998D748A7D608A7D
      608A7D608A7D608A7D608A7D608A7D608A7D608A7D608A7D6092866BBFB7A7F4
      F3F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFAE2E1E0C9C7C6C1BFBDC1BF
      BDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC1BFBDC5C4C2DDDCDBF9
      F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E6E0C8C2
      B4ABA18C8E81658A7D608A7D608D8164A89E89C0B9A9DCD9D0FBFBFAFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3E2E1
      E0D3D1D0C3C1BFC1BFBDC1BFBDC3C1BFD1D0CEDEDDDCEDECECFDFDFDFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BtnIncluirClick
  end
end
