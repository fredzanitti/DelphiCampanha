object h_editafoto: Th_editafoto
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Editar Foto'
  ClientHeight = 473
  ClientWidth = 702
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
  object Label1: TLabel
    Left = 469
    Top = 272
    Width = 70
    Height = 13
    Caption = 'INSTRU'#199#213'ES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 469
    Top = 296
    Width = 193
    Height = 150
    AutoSize = False
    Caption = 
      'Mova a foto a ser cortada com as setas direcionais do teclado, a' +
      ' miniatura da visualiza'#231#227'o ser'#225' mostrada na VISUALIZA'#199#195'O DO CORT' +
      'E. Ap'#243's posicionar a imagem para corte, pressione ENTER para fec' +
      'har o editor e voltar ao cadastro dos jogadores. Para cancelar a' +
      ' inclus'#227'o da imagem pressone ESC. Um clique sobre a imagem selec' +
      'onada permite buscar nova imagem para corte.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object GroupBox1: TGroupBox
    Left = 25
    Top = 10
    Width = 425
    Height = 436
    Caption = '    FOTO SELECIONADA    '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnDblClick = GroupBox1DblClick
    object ImgSelecionada: TImage
      Left = 10
      Top = 25
      Width = 23
      Height = 24
      Hint = 'Clique aqui para selecionar outra imagem'
      AutoSize = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ImgSelecionadaClick
    end
    object Delimitador: TShape
      Left = 96
      Top = 48
      Width = 209
      Height = 313
      Brush.Style = bsClear
      Pen.Color = clMaroon
      Pen.Style = psDot
    end
  end
  object GroupBox2: TGroupBox
    Left = 469
    Top = 10
    Width = 193
    Height = 249
    Caption = '    VISUALIZA'#199#195'O DO CORTE    '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object ImgFinal: TImage
      Left = 30
      Top = 25
      Width = 134
      Height = 200
      Stretch = True
    end
  end
  object OpenFoto: TOpenPictureDialog
    Left = 28
    Top = 411
  end
end
