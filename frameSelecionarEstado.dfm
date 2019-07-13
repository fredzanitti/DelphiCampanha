object fraSelUf: TfraSelUf
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
    Caption = 'Estado'
    TabOrder = 0
    object lblSelecionarPais: TLabel
      Left = 10
      Top = 48
      Width = 85
      Height = 13
      Caption = 'Selecionar estado'
    end
    object chbTodos: TCheckBox
      Left = 10
      Top = 22
      Width = 201
      Height = 17
      Caption = ' Todas estados'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chbTodosClick
    end
    object dblEstado: TDBLookupComboBox
      Left = 10
      Top = 68
      Width = 201
      Height = 21
      KeyField = 'coduf'
      ListField = 'nome'
      ListSource = FrmDm.DtsUf
      TabOrder = 1
      OnClick = dblEstadoClick
    end
  end
end
