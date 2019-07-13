object fraSelPosicao: TfraSelPosicao
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
    Caption = 'Posi'#231#227'o'
    TabOrder = 0
    object lblSelecionarPosicao: TLabel
      Left = 8
      Top = 47
      Width = 88
      Height = 13
      Caption = 'Selecionar posi'#231#227'o'
    end
    object dblPosicao: TDBLookupComboBox
      Left = 8
      Top = 66
      Width = 201
      Height = 21
      KeyField = 'codposicao'
      ListField = 'descricao'
      ListSource = FrmDm.DtsPosicao
      TabOrder = 0
      OnClick = dblPosicaoClick
    end
    object chbTodos: TCheckBox
      Left = 8
      Top = 21
      Width = 201
      Height = 17
      Caption = ' Todas as posi'#231#245'es'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = chbTodosClick
    end
  end
end
