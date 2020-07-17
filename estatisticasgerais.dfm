object r_estgerais: Tr_estgerais
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'ESTAT'#205'STICAS GERAIS CONTRA ADVERS'#193'RIO'
  ClientHeight = 671
  ClientWidth = 921
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
  object Shape9: TShape
    Left = -2
    Top = -1
    Width = 925
    Height = 106
    Brush.Color = cl3DDkShadow
    Pen.Style = psClear
  end
  object Shape8: TShape
    Left = 46
    Top = 335
    Width = 113
    Height = 28
    Brush.Color = cl3DDkShadow
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object Shape2: TShape
    Left = 475
    Top = 7
    Width = 85
    Height = 85
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object ImgAdver: TImage
    Left = 481
    Top = 13
    Width = 73
    Height = 73
    Stretch = True
  end
  object LblTimeMand: TLabel
    Left = 41
    Top = 39
    Width = 294
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'LblTimeMand'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape1: TShape
    Left = 346
    Top = 7
    Width = 85
    Height = 85
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object ImgSeutime: TImage
    Left = 352
    Top = 13
    Width = 73
    Height = 73
    Stretch = True
  end
  object LblDtIniSeq1: TLabel
    Left = 363
    Top = 535
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
    Left = 363
    Top = 543
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
    Left = 55
    Top = 541
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
  object Label2: TLabel
    Left = 55
    Top = 519
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
    Left = 365
    Top = 584
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
    Left = 365
    Top = 592
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
    Left = 55
    Top = 592
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
    Left = 55
    Top = 570
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
    Left = 775
    Top = 529
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
    Left = 775
    Top = 521
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
    Left = 486
    Top = 541
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
    Left = 486
    Top = 519
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
    Left = 775
    Top = 584
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
    Left = 775
    Top = 576
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
    Left = 486
    Top = 592
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
    Left = 486
    Top = 570
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
  object Label1: TLabel
    Left = 435
    Top = 39
    Width = 38
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = 'vs.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblTimeVisit: TLabel
    Left = 573
    Top = 39
    Width = 292
    Height = 21
    AutoSize = False
    Caption = 'LblDescricao1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape4: TShape
    Left = 47
    Top = 375
    Width = 374
    Height = 28
    Brush.Color = cl3DDkShadow
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object Label3: TLabel
    Left = 61
    Top = 381
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
  end
  object Shape5: TShape
    Left = 480
    Top = 375
    Width = 374
    Height = 28
    Brush.Color = clMaroon
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object Label4: TLabel
    Left = 494
    Top = 381
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
  end
  object LblUltimaVit1: TLabel
    Left = 55
    Top = 436
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
    WordWrap = True
    OnClick = LblUltimaVit1Click
  end
  object Label8: TLabel
    Left = 55
    Top = 414
    Width = 86
    Height = 16
    Caption = #218'ltima Vit'#243'ria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblMelhorResult1: TLabel
    Left = 55
    Top = 489
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
    WordWrap = True
    OnClick = LblMelhorResult1Click
  end
  object Label10: TLabel
    Left = 55
    Top = 467
    Width = 113
    Height = 16
    Caption = 'Melhor Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblUltimaDerrota1: TLabel
    Left = 486
    Top = 436
    Width = 368
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    AutoSize = False
    Caption = 'O Fluminense ainda n'#227'o perdeu ou empatou com este advers'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
    OnClick = LblUltimaDerrota1Click
  end
  object Label13: TLabel
    Left = 486
    Top = 414
    Width = 94
    Height = 16
    Caption = #218'ltima Derrota'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPiorResultado1: TLabel
    Left = 486
    Top = 489
    Width = 368
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    AutoSize = False
    Caption = 'O Fluminense ainda n'#227'o perdeu ou empatou com este advers'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
    OnClick = LblPiorResultado1Click
  end
  object Label15: TLabel
    Left = 486
    Top = 467
    Width = 94
    Height = 16
    Caption = 'Pior Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblUltimaVit2: TLabel
    Left = 359
    Top = 430
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
    Left = 363
    Top = 491
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
  object LblPiorResultado2: TLabel
    Left = 773
    Top = 477
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
  object LblUltimaDerrota2: TLabel
    Left = 769
    Top = 416
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
  object LblUltimoJogo1: TLabel
    Left = 176
    Top = 341
    Width = 683
    Height = 16
    Cursor = crHandPoint
    Hint = 'Clique aqui para ver a s'#250'mula do jogo'
    AutoSize = False
    Caption = 'LblUltimoJogo1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = LblUltimoJogo1Click
  end
  object LblUltimoJogo2: TLabel
    Left = 797
    Top = 343
    Width = 71
    Height = 13
    Caption = 'LblUltimoJogo1'
    Visible = False
  end
  object Label5: TLabel
    Left = 56
    Top = 341
    Width = 87
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #218'LTIMO JOGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape3: TShape
    Left = 47
    Top = 300
    Width = 821
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape6: TShape
    Left = 47
    Top = 328
    Width = 821
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape7: TShape
    Left = 47
    Top = 368
    Width = 821
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape10: TShape
    Left = 47
    Top = 460
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape11: TShape
    Left = 51
    Top = 513
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape12: TShape
    Left = 51
    Top = 564
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape13: TShape
    Left = 480
    Top = 460
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape14: TShape
    Left = 484
    Top = 513
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape15: TShape
    Left = 484
    Top = 564
    Width = 376
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Label9: TLabel
    Left = 303
    Top = 307
    Width = 39
    Height = 16
    Caption = 'Totais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape16: TShape
    Left = 51
    Top = 631
    Width = 166
    Height = 28
    Brush.Color = cl3DDkShadow
    Pen.Color = clWhite
    Shape = stRoundRect
  end
  object Label12: TLabel
    Left = 61
    Top = 637
    Width = 140
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'ESTAT'#205'STICAS GERAIS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape17: TShape
    Left = 52
    Top = 624
    Width = 821
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object Shape18: TShape
    Left = 52
    Top = 664
    Width = 821
    Height = 3
    Brush.Color = clBtnShadow
    Pen.Color = clWhite
  end
  object LblResumo: TLabel
    Left = 223
    Top = 635
    Width = 629
    Height = 21
    AutoSize = False
    Caption = 'LblResumo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = cl3DDkShadow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DbGridEstatisticas: TDBGrid
    Left = 53
    Top = 109
    Width = 804
    Height = 180
    BorderStyle = bsNone
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgRowLines, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
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
        Width = 300
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
  object DbGridTotais: TDBGrid
    Left = 356
    Top = 305
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
end
