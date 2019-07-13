object fraSelecionarClube: TfraSelecionarClube
  Left = 0
  Top = 0
  Width = 232
  Height = 110
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 2
    Top = 2
    Width = 225
    Height = 105
    Caption = 'Clube'
    TabOrder = 0
    DesignSize = (
      225
      105)
    object lblSelecionarJogador: TLabel
      Left = 12
      Top = 51
      Width = 77
      Height = 13
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Selecionar clube'
    end
    object chbTodos: TCheckBox
      Left = 12
      Top = 24
      Width = 137
      Height = 14
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Todos clubes'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chbTodosClick
    end
    object dblClube: TDBLookupComboBox
      Left = 12
      Top = 70
      Width = 200
      Height = 21
      Anchors = []
      KeyField = 'codadver'
      ListField = 'nome'
      ListSource = FrmDm.DtsAdversarios
      TabOrder = 1
      OnClick = dblClubeClick
    end
  end
end
