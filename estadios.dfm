object CA_ESTAD: TCA_ESTAD
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Cadastro de Est'#225'dios'
  ClientHeight = 346
  ClientWidth = 509
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 10
    Width = 86
    Height = 13
    Caption = 'C'#243'digo do Est'#225'dio'
    FocusControl = EdtCodigo
  end
  object Label2: TLabel
    Left = 13
    Top = 82
    Width = 80
    Height = 13
    Caption = 'Nome do Est'#225'dio'
    FocusControl = EdtNome
  end
  object EdtCodigo: TDBEdit
    Left = 13
    Top = 29
    Width = 98
    Height = 41
    DataField = 'codestadio'
    DataSource = FrmDm.DtsEstadio
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object EdtNome: TDBEdit
    Left = 13
    Top = 98
    Width = 474
    Height = 27
    DataField = 'nome'
    DataSource = FrmDm.DtsEstadio
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnEnter = EdtNomeEnter
    OnExit = EdtNomeExit
  end
  object EdtCidade: TDBEdit
    Left = 385
    Top = 45
    Width = 37
    Height = 21
    DataField = 'codcidade'
    DataSource = FrmDm.DtsEstadio
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  inline fraCidades: TfraCidades
    Left = 13
    Top = 141
    Width = 477
    Height = 131
    TabOrder = 2
    ExplicitLeft = 13
    ExplicitTop = 141
    ExplicitWidth = 477
    inherited GroupBox2: TGroupBox
      Top = -3
      Width = 474
      ExplicitTop = -3
      ExplicitWidth = 474
      inherited BtnLocCidade: TBitBtn
        OnClick = fraCidades1BtnLocCidadeClick
      end
    end
  end
  inline fraBotoes: TfraBotoes
    Left = 9
    Top = 278
    Width = 481
    Height = 53
    TabOrder = 3
    ExplicitLeft = 9
    ExplicitTop = 278
    inherited BtnCancelar: TBitBtn
      OnClick = fraBotoesBtnCancelarClick
    end
    inherited BtnExcluir: TBitBtn
      OnClick = fraBotoesBtnExcluirClick
    end
    inherited BtnEditar: TBitBtn
      OnClick = fraBotoesBtnEditarClick
    end
    inherited BtnIncluir: TBitBtn
      OnClick = fraBotoesBtnIncluirClick
    end
    inherited BtnUltimo: TBitBtn
      OnClick = fraBotoesBtnUltimoClick
    end
    inherited BtnProximo: TBitBtn
      OnClick = fraBotoesBtnProximoClick
    end
    inherited BtnAnterior: TBitBtn
      OnClick = fraBotoesBtnAnteriorClick
    end
    inherited BtnPrimeiro: TBitBtn
      OnClick = fraBotoesBtnPrimeiroClick
    end
    inherited BtnGravar: TBitBtn
      OnClick = fraBotoesBtnGravarClick
    end
    inherited BtnPesquisar: TBitBtn
      OnClick = fraBotoesBtnPesquisarClick
    end
  end
  object MainMenu: TMainMenu
    Left = 447
    Top = 36
    object MnArquivo: TMenuItem
      Caption = 'Arquivo'
      object MnCadastrar: TMenuItem
        Caption = '&Inserir ( F5 )'
        OnClick = MnCadastrarClick
      end
      object MnEditar: TMenuItem
        Caption = 'E&ditar'
        OnClick = MnEditarClick
      end
      object MnExcluir: TMenuItem
        Caption = '&Excluir'
        OnClick = MnExcluirClick
      end
    end
    object MnSair: TMenuItem
      Caption = 'Sair'
      OnClick = MnSairClick
    end
  end
end
