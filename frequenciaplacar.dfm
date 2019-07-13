object h_freqplacar: Th_freqplacar
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Frequ'#234'ncia de Placares'
  ClientHeight = 478
  ClientWidth = 730
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
  object LblTitulo: TLabel
    Left = 28
    Top = 17
    Width = 659
    Height = 22
    Alignment = taCenter
    AutoSize = False
    Caption = 'FREQU'#202'NCIA DE PLACARES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 255
    Top = 51
    Width = 209
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = 'A FAVOR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 478
    Top = 51
    Width = 209
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = 'CONTRA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 28
    Top = 51
    Width = 209
    Height = 19
    Alignment = taCenter
    AutoSize = False
    Caption = 'GERAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LtFavor: TListBox
    Left = 255
    Top = 80
    Width = 209
    Height = 372
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object LtContra: TListBox
    Left = 478
    Top = 80
    Width = 209
    Height = 372
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object LtGeral: TListBox
    Left = 28
    Top = 80
    Width = 209
    Height = 372
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object QrEst: TFDQuery
    Connection = FrmDm.BDMySQL
    Transaction = FrmDm.TransacaoSQL
    Left = 624
    Top = 368
  end
  object DtsQrEst: TDataSource
    DataSet = QrEst
    Left = 688
    Top = 368
  end
end
