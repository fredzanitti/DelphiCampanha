object fraSelNacionalidade: TfraSelNacionalidade
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
    Caption = 'Nacionalidade'
    TabOrder = 0
    object lblSelecionarPais: TLabel
      Left = 10
      Top = 48
      Width = 117
      Height = 13
      Caption = 'Selecionar nacionalidade'
    end
    object chbTodos: TCheckBox
      Left = 10
      Top = 22
      Width = 201
      Height = 17
      Caption = ' Todas nacionalidades'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chbTodosClick
    end
    object dblPais: TDBLookupComboBox
      Left = 10
      Top = 68
      Width = 201
      Height = 21
      KeyField = 'codpais'
      ListField = 'nome'
      ListSource = FrmDm.DtsPais
      TabOrder = 1
      OnClick = dblPaisClick
    end
  end
end
