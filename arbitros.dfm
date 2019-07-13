object CA_ARBIT: TCA_ARBIT
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Cadastro de '#193'rbitros'
  ClientHeight = 262
  ClientWidth = 557
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
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 34
    Width = 84
    Height = 13
    Caption = 'C'#243'digo do '#193'rbitro'
    FocusControl = EdtCodigo
  end
  object Label2: TLabel
    Left = 32
    Top = 106
    Width = 78
    Height = 13
    Caption = 'Nome do '#193'rbitro'
    FocusControl = EdtNome
  end
  object EdtCodigo: TDBEdit
    Left = 32
    Top = 55
    Width = 96
    Height = 41
    DataField = 'codarbitro'
    DataSource = FrmDm.DtsArbitros
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
    Left = 32
    Top = 128
    Width = 486
    Height = 27
    DataField = 'nome'
    DataSource = FrmDm.DtsArbitros
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
  inline fraBotoes: TfraBotoes
    Left = 28
    Top = 168
    Width = 481
    Height = 53
    TabOrder = 2
    ExplicitLeft = 28
    ExplicitTop = 168
    inherited BtnCancelar: TBitBtn
      Left = 384
      OnClick = fraBotoesBtnCancelarClick
      ExplicitLeft = 384
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
      Left = 131
      OnClick = fraBotoesBtnUltimoClick
      ExplicitLeft = 131
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
    Left = 168
    Top = 58
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
