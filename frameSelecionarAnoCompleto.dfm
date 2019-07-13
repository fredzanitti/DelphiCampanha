object fraSelAnoCompleto: TfraSelAnoCompleto
  Left = 0
  Top = 0
  Width = 136
  Height = 77
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 2
    Top = 2
    Width = 127
    Height = 71
    Caption = 'Ano'
    TabOrder = 0
    DesignSize = (
      127
      71)
    object lblSelecionarJogador: TLabel
      Left = 11
      Top = 18
      Width = 63
      Height = 13
      Anchors = []
      Caption = 'Informar ano'
    end
    object edtAno: TEdit
      Left = 11
      Top = 37
      Width = 103
      Height = 21
      TabOrder = 0
      OnExit = edtAnoExit
      OnKeyPress = edtAnoKeyPress
    end
  end
end
