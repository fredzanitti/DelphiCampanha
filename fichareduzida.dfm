object r_fichareduzida: Tr_fichareduzida
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'r_fichareduzida'
  ClientHeight = 464
  ClientWidth = 302
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
  object Shape1: TShape
    Left = 7
    Top = 6
    Width = 287
    Height = 449
    Brush.Color = clWindowFrame
    Pen.Color = clWhite
  end
  object Shape2: TShape
    Left = 14
    Top = 14
    Width = 273
    Height = 433
    Brush.Color = clInfoBk
    Pen.Color = clWhite
  end
  object ImgFotoJogador: TImage
    Left = 44
    Top = 25
    Width = 209
    Height = 313
    Hint = 'Para sair pressione ESC ou clique na foto'
    CustomHint = FrmPrincipal.BalloonHint1
    ParentShowHint = False
    ShowHint = False
    Stretch = True
  end
  object LblNomeCompleto: TLabel
    Left = 5
    Top = 353
    Width = 290
    Height = 38
    Alignment = taCenter
    AutoSize = False
    Caption = 'Wellington Monteiro de Oliveira Bastos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object ImgNacionalidade: TImage
    Left = 57
    Top = 396
    Width = 53
    Height = 33
    Stretch = True
  end
  object LblPosicao: TLabel
    Left = 122
    Top = 394
    Width = 115
    Height = 16
    AutoSize = False
    Caption = 'Lateral Esquerdo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object LblPeriodo: TLabel
    Left = 122
    Top = 413
    Width = 115
    Height = 16
    AutoSize = False
    Caption = '2013-2015'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Shape3: TShape
    Left = 27
    Top = 322
    Width = 243
    Height = 26
    Brush.Color = clWindowFrame
    Pen.Color = clWhite
  end
  object LblApelido: TLabel
    Left = 35
    Top = 327
    Width = 226
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = 'WELLINGTON MONTEIRO'
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
end
