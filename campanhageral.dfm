object r_campanhageral: Tr_campanhageral
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'r_campanhageral'
  ClientHeight = 725
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
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LblCidade: TLabel
    Left = 191
    Top = 217
    Width = 115
    Height = 16
    Alignment = taRightJustify
    Caption = 'Campanha em Casa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 165
    Top = 241
    Width = 141
    Height = 16
    Alignment = taRightJustify
    Caption = 'Campanha Fora de Casa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 211
    Top = 190
    Width = 95
    Height = 16
    Alignment = taRightJustify
    Caption = 'Campanha Geral'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape1: TShape
    Left = 16
    Top = 57
    Width = 85
    Height = 85
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object ImgSeutime: TImage
    Left = 22
    Top = 63
    Width = 73
    Height = 73
    Stretch = True
  end
  object LblDtIniSeq1: TLabel
    Left = 778
    Top = 403
    Width = 60
    Height = 13
    Caption = 'LblDtIniSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblDtFimSeq1: TLabel
    Left = 778
    Top = 410
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblSequencia1: TLabel
    Left = 455
    Top = 420
    Width = 365
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a lista dos jogos'
    AutoSize = False
    Caption = 'LblSequencia1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblSequencia1Click
  end
  object Label3: TLabel
    Left = 455
    Top = 401
    Width = 180
    Height = 16
    Caption = 'Maior Sequ'#234'ncia de Vit'#243'rias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDtIniSeq2: TLabel
    Left = 780
    Top = 455
    Width = 60
    Height = 13
    Caption = 'LblDtIniSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblDtFimSeq2: TLabel
    Left = 780
    Top = 463
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblSequencia2: TLabel
    Left = 455
    Top = 469
    Width = 365
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    AutoSize = False
    Caption = 'LblSequencia1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblSequencia2Click
  end
  object Label6: TLabel
    Left = 455
    Top = 449
    Width = 115
    Height = 16
    Caption = 'Sequ'#234'ncia Invicta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDtIniSeq3: TLabel
    Left = 742
    Top = 639
    Width = 60
    Height = 13
    Caption = 'LblDtIniSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblDtFimSeq3: TLabel
    Left = 742
    Top = 631
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblSequencia3: TLabel
    Left = 453
    Top = 648
    Width = 368
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    AutoSize = False
    Caption = 'LblSequencia1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblSequencia3Click
  end
  object Label7: TLabel
    Left = 453
    Top = 629
    Width = 188
    Height = 16
    Caption = 'Maior Sequ'#234'ncia de Derrotas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblDtIniSeq4: TLabel
    Left = 742
    Top = 691
    Width = 60
    Height = 13
    Caption = 'LblDtIniSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblDtFimSeq4: TLabel
    Left = 742
    Top = 683
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblSequencia4: TLabel
    Left = 453
    Top = 697
    Width = 368
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    AutoSize = False
    Caption = 'LblSequencia1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblSequencia4Click
  end
  object Label11: TLabel
    Left = 453
    Top = 677
    Width = 187
    Height = 16
    Caption = 'Maior Sequ'#234'ncia Sem Vencer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape11: TShape
    Left = 451
    Top = 395
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape12: TShape
    Left = 451
    Top = 443
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape14: TShape
    Left = 451
    Top = 623
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape15: TShape
    Left = 451
    Top = 671
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape4: TShape
    Left = 448
    Top = 269
    Width = 374
    Height = 28
    Brush.Color = cl3DDkShadow
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object Label4: TLabel
    Left = 462
    Top = 275
    Width = 346
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'RESULTADOS POSITIVOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Shape5: TShape
    Left = 448
    Top = 499
    Width = 374
    Height = 28
    Brush.Color = clMaroon
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object Label5: TLabel
    Left = 462
    Top = 503
    Width = 346
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'RESULTADOS NEGATIVOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object LblMelhorResult1: TLabel
    Left = 456
    Top = 325
    Width = 82
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    Caption = 'LblSequencia1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblMelhorResult1Click
  end
  object Label10: TLabel
    Left = 456
    Top = 303
    Width = 135
    Height = 16
    Caption = 'Melhores Resultados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPiorResultado1: TLabel
    Left = 454
    Top = 553
    Width = 60
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    Caption = 'N'#227'o houve'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblPiorResultado1Click
  end
  object Label15: TLabel
    Left = 454
    Top = 531
    Width = 116
    Height = 16
    Caption = 'Piores Resultados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblCodMelhorResult1: TLabel
    Left = 764
    Top = 325
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblCodPiorResultado1: TLabel
    Left = 757
    Top = 553
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblMelhorResult2: TLabel
    Left = 455
    Top = 347
    Width = 82
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    Caption = 'LblSequencia1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblMelhorResult2Click
  end
  object LblPiorResultado2: TLabel
    Left = 453
    Top = 575
    Width = 60
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    Caption = 'N'#227'o houve'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblPiorResultado2Click
  end
  object LblCodMelhorResult2: TLabel
    Left = 763
    Top = 347
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblCodPiorResultado2: TLabel
    Left = 756
    Top = 575
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblMelhorResult3: TLabel
    Left = 456
    Top = 371
    Width = 82
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    Caption = 'LblSequencia1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblMelhorResult3Click
  end
  object LblPiorResultado3: TLabel
    Left = 454
    Top = 599
    Width = 60
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    Caption = 'N'#227'o houve'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblPiorResultado3Click
  end
  object LblCodMelhorResult3: TLabel
    Left = 764
    Top = 371
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object LblCodPiorResultado3: TLabel
    Left = 757
    Top = 599
    Width = 64
    Height = 13
    Caption = 'LblDtFimSeq1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label8: TLabel
    Left = 8
    Top = 277
    Width = 425
    Height = 16
    AutoSize = False
    Caption = 'Distribui'#231#227'o dos gols por per'#237'odos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DbGridCasa: TDBGrid
    Left = 319
    Top = 216
    Width = 505
    Height = 24
    BorderStyle = bsNone
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgRowLines, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'j'
        Title.Alignment = taCenter
        Title.Caption = 'J'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'v'
        Title.Alignment = taCenter
        Title.Caption = 'V'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'e'
        Title.Alignment = taCenter
        Title.Caption = 'E'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'd'
        Title.Alignment = taCenter
        Title.Caption = 'D'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gp'
        Title.Alignment = taCenter
        Title.Caption = 'GP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gc'
        Title.Alignment = taCenter
        Title.Caption = 'GC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sg'
        Title.Alignment = taCenter
        Title.Caption = 'SG'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'APR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end>
  end
  object DbGridEstatisticas: TDBGrid
    Left = 126
    Top = 14
    Width = 698
    Height = 139
    BorderStyle = bsNone
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgRowLines, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DbGridEstatisticasDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ImeName = '135'
        Title.Caption = 'Campeonato / Torneio'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 200
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'j'
        Title.Alignment = taCenter
        Title.Caption = 'J'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'v'
        Title.Alignment = taCenter
        Title.Caption = 'V'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'e'
        Title.Alignment = taCenter
        Title.Caption = 'E'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'd'
        Title.Alignment = taCenter
        Title.Caption = 'D'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gp'
        Title.Alignment = taCenter
        Title.Caption = 'GP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gc'
        Title.Alignment = taCenter
        Title.Caption = 'GC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sg'
        Title.Alignment = taCenter
        Title.Caption = 'SG'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'APR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end>
  end
  object DbGridFora: TDBGrid
    Left = 319
    Top = 240
    Width = 505
    Height = 24
    BorderStyle = bsNone
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgRowLines, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'j'
        Title.Alignment = taCenter
        Title.Caption = 'J'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'v'
        Title.Alignment = taCenter
        Title.Caption = 'V'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'e'
        Title.Alignment = taCenter
        Title.Caption = 'E'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'd'
        Title.Alignment = taCenter
        Title.Caption = 'D'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gp'
        Title.Alignment = taCenter
        Title.Caption = 'GP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gc'
        Title.Alignment = taCenter
        Title.Caption = 'GC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sg'
        Title.Alignment = taCenter
        Title.Caption = 'SG'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'APR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end>
  end
  object DbGridGeral: TDBGrid
    Left = 319
    Top = 166
    Width = 505
    Height = 44
    BorderStyle = bsNone
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgRowLines, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DbGridGeralDrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'j'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'J'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'v'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'V'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'e'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'E'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'D'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'GP'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'gc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'GC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'sg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'SG'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'apr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'APR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clGrayText
        Title.Font.Height = -12
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 80
        Visible = True
      end>
  end
  object CbxAnos: TComboBox
    Left = 16
    Top = 14
    Width = 98
    Height = 33
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = CbxAnosChange
  end
  object DBChart1: TDBChart
    Left = 8
    Top = 299
    Width = 418
    Height = 414
    Legend.Visible = False
    View3D = False
    TabOrder = 5
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: THorizBarSeries
      BarBrush.Gradient.Direction = gdLeftRight
      ColorEachPoint = True
      Marks.Frame.Visible = False
      Marks.Style = smsPercent
      DataSource = qryGolsPorPeriodo
      PercentFormat = '##0.# %'
      XLabelsSource = 'Intervalo'
      Gradient.Direction = gdLeftRight
      XValues.Name = 'Bar'
      XValues.Order = loNone
      XValues.ValueSource = 'Gols'
      YValues.Name = 'Y'
      YValues.Order = loAscending
    end
  end
  object qryGolsPorPeriodo: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'CALL sp_gols_por_periodo(:Temporada)')
    Left = 40
    Top = 304
    ParamData = <
      item
        Name = 'TEMPORADA'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end>
    object qryGolsPorPeriodoGols: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'Gols'
      Origin = 'Gols'
    end
    object qryGolsPorPeriodoIntervalo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Intervalo'
      Origin = 'Intervalo'
      Size = 50
    end
  end
end
