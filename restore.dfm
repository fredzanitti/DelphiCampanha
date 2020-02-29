object FrmRestore: TFrmRestore
  Left = 0
  Top = 0
  Caption = 'Par'#226'metros para Restore'
  ClientHeight = 511
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
    Left = 16
    Top = 64
    Width = 596
    Height = 13
    Caption = 
      'Selecione o arquivo *.sql a ser restaurado (encontra-se na pasta' +
      ' BackupCampanha do diret'#243'rio onde foi realizado o backup)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 319
    Height = 13
    Caption = 'Diret'#243'rio do Sistema onde ser'#227'o armazenados os dados do restore'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 17
    Top = 113
    Width = 175
    Height = 13
    Caption = 'Subdiret'#243'rios que ser'#227'o restaurados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 264
    Top = 113
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 391
    Top = 113
    Width = 30
    Height = 13
    Caption = 'Senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 264
    Top = 163
    Width = 219
    Height = 13
    Caption = 'Inst'#226'ncia do BD onde ser'#225' realizado o restore'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EdtOrigem: TEdit
    Left = 16
    Top = 83
    Width = 641
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object BtnDestino: TBitBtn
    Left = 663
    Top = 83
    Width = 25
    Height = 25
    Hint = 'Selecionar Diret'#243'rio'
    Caption = '...'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = BtnDestinoClick
  end
  object EdtRestaurar: TEdit
    Left = 16
    Top = 35
    Width = 672
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'C:\Program Files\Campanha Ano a Ano\Seu Time\DBAcompanhamento'
  end
  object MemScript: TMemo
    Left = 17
    Top = 256
    Width = 672
    Height = 247
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object BtnGerar: TBitBtn
    Left = 594
    Top = 124
    Width = 95
    Height = 25
    Hint = 'Gerar script de backup para posterior execu'#231#227'o'
    Caption = 'Gerar Script'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = BtnGerarClick
  end
  object BtnSalvar: TBitBtn
    Left = 593
    Top = 155
    Width = 96
    Height = 25
    Hint = 'Executar o script de backup gerado'
    Caption = 'Executar Script'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BtnSalvarClick
  end
  object ChkEscudos: TCheckBox
    Left = 17
    Top = 136
    Width = 84
    Height = 17
    Caption = 'Escudos'
    TabOrder = 6
  end
  object ChkJogadores: TCheckBox
    Left = 17
    Top = 166
    Width = 84
    Height = 17
    Caption = 'Jogadores'
    TabOrder = 7
  end
  object ChkBandPais: TCheckBox
    Left = 123
    Top = 136
    Width = 126
    Height = 17
    Caption = 'Bandeira dos Pa'#237'ses'
    TabOrder = 8
  end
  object ChkBandUf: TCheckBox
    Left = 123
    Top = 166
    Width = 126
    Height = 17
    Caption = 'Bandeira dos Estados'
    TabOrder = 9
  end
  object EdtUser: TEdit
    Left = 264
    Top = 132
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object EdtSenha: TEdit
    Left = 391
    Top = 132
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object EdtInstancia: TEdit
    Left = 264
    Top = 184
    Width = 248
    Height = 21
    TabOrder = 12
  end
  object ChkFornecedores: TCheckBox
    Left = 17
    Top = 194
    Width = 97
    Height = 17
    Caption = 'Fornecedores'
    TabOrder = 13
  end
  object ChkPatrocinadores: TCheckBox
    Left = 123
    Top = 194
    Width = 97
    Height = 17
    Caption = 'Patrocinadores'
    TabOrder = 14
  end
  object ChkUniformes: TCheckBox
    Left = 17
    Top = 222
    Width = 97
    Height = 17
    Caption = 'Uniformes'
    TabOrder = 15
  end
  object OpenDialog1: TOpenDialog
    Left = 576
    Top = 8
  end
end
