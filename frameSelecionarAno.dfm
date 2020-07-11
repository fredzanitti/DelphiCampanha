object fraSelecionarAno: TfraSelecionarAno
  Left = 0
  Top = 0
  Width = 135
  Height = 102
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 2
    Top = 2
    Width = 127
    Height = 95
    Caption = 'Ano'
    TabOrder = 0
    DesignSize = (
      127
      95)
    object lblSelecionarJogador: TLabel
      Left = 14
      Top = 46
      Width = 70
      Height = 13
      Anchors = []
      Caption = 'Selecionar ano'
    end
    object chbTodos: TCheckBox
      Left = 14
      Top = 23
      Width = 96
      Height = 14
      Anchors = []
      Caption = ' Todos os anos'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chbTodosClick
    end
    object dblAno: TDBLookupComboBox
      Left = 14
      Top = 63
      Width = 93
      Height = 21
      Anchors = []
      KeyField = 'ano'
      ListField = 'ano'
      ListSource = dtsAnos
      TabOrder = 1
      OnClick = dblAnoClick
    end
  end
  object qryAnos: TFDQuery
    Active = True
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select distinct ca_jogos.temporada as ano'
      'from ca_jogos'
      'order by ano desc')
    Left = 74
    Top = 10
    object qryAnosano: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ano'
      Origin = 'ano'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dtsAnos: TDataSource
    DataSet = qryAnos
    Left = 96
    Top = 24
  end
end
