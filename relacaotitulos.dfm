object r_titulos: Tr_titulos
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'r_titulos'
  ClientHeight = 671
  ClientWidth = 854
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulosNacionais: TLabel
    Left = 32
    Top = 38
    Width = 321
    Height = 30
    AutoSize = False
    Caption = 'T'#237'tulos Nacionais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblTitNacional: TLabel
    Left = 32
    Top = 87
    Width = 380
    Height = 455
    AutoSize = False
    Caption = 'Estr'#233'ia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object LblTitInter: TLabel
    Left = 433
    Top = 87
    Width = 380
    Height = 455
    AutoSize = False
    Caption = 'Estr'#233'ia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblTitulosInternacionais: TLabel
    Left = 433
    Top = 38
    Width = 321
    Height = 30
    AutoSize = False
    Caption = 'T'#237'tulos Internacionais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape2: TShape
    Left = -26
    Top = 74
    Width = 884
    Height = 2
    Brush.Color = clMoneyGreen
    Pen.Style = psClear
  end
  object LblTempo: TLabel
    Left = 122
    Top = 601
    Width = 691
    Height = 25
    AutoSize = False
    Caption = 'T'#237'tulos conquistados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Shape1: TShape
    Left = 26
    Top = 560
    Width = 85
    Height = 85
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object ImgEscudoSeutime: TImage
    Left = 32
    Top = 571
    Width = 73
    Height = 73
    Stretch = True
  end
  object Shape3: TShape
    Left = -19
    Top = 550
    Width = 884
    Height = 2
    Brush.Color = clMoneyGreen
    Pen.Style = psClear
  end
  object LblQtdeTitulos: TLabel
    Left = 122
    Top = 566
    Width = 691
    Height = 27
    AutoSize = False
    Caption = '100 t'#237'tulos entre 1902 e 2012'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object LblUltimoTitulo: TLabel
    Left = 122
    Top = 632
    Width = 691
    Height = 18
    AutoSize = False
    Caption = 'LblUltimoTitulo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
