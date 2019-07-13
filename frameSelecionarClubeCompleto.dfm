object fraSelClubeCompleto: TfraSelClubeCompleto
  Left = 0
  Top = 0
  Width = 223
  Height = 80
  Anchors = []
  TabOrder = 0
  DesignSize = (
    223
    80)
  object GroupBox1: TGroupBox
    Left = 4
    Top = 2
    Width = 213
    Height = 71
    Anchors = []
    Caption = 'Clube'
    TabOrder = 0
    DesignSize = (
      213
      71)
    object lblSelecionarJogador: TLabel
      Left = 9
      Top = 20
      Width = 77
      Height = 27
      Anchors = []
      Caption = 'Selecionar clube'
      ExplicitLeft = 12
    end
    object dblClube: TDBLookupComboBox
      Left = 6
      Top = 37
      Width = 200
      Height = 21
      Anchors = []
      KeyField = 'codadver'
      ListField = 'nome'
      ListSource = FrmDm.DtsAdversarios
      TabOrder = 0
      OnClick = dblClubeClick
      ExplicitLeft = 12
    end
  end
end
