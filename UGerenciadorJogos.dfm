object frmGerenciadorJogos: TfrmGerenciadorJogos
  Left = 0
  Top = 0
  Caption = 'Gerenciador de Jogos'
  ClientHeight = 660
  ClientWidth = 1178
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    1178
    660)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 22
    Top = 40
    Width = 110
    Height = 13
    Caption = 'Vit'#243'rias do Fluminense:'
  end
  object Label6: TLabel
    Left = 272
    Top = 40
    Width = 110
    Height = 13
    Caption = 'Vit'#243'rias do Fluminense:'
  end
  object Label9: TLabel
    Left = 272
    Top = 78
    Width = 40
    Height = 13
    Caption = 'lblVitoria'
  end
  object Label10: TLabel
    Left = 22
    Top = 78
    Width = 110
    Height = 13
    Caption = 'Vit'#243'rias do Fluminense:'
  end
  object GroupBox1: TGroupBox
    Left = 218
    Top = 8
    Width = 620
    Height = 645
    Caption = '   Jogos   '
    TabOrder = 0
    DesignSize = (
      620
      645)
    object dbgJogos: TDBGrid
      Left = 3
      Top = 25
      Width = 614
      Height = 617
      Anchors = [akLeft, akTop, akRight, akBottom]
      Color = clBtnFace
      DataSource = dtsJogos
      GradientStartColor = clBtnFace
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgJogosCellClick
      OnDblClick = dbgJogosDblClick
      OnKeyUp = dbgJogosKeyUp
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'codjogo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'N'#186
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 35
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 70
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'Mandante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'placar1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '-'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 30
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'placar2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = '-'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Visitante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Competicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 190
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'publico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowFrame
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'P'#250'blico'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = cl3DDkShadow
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 0
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 645
    Caption = '  Sele'#231#227'o  '
    TabOrder = 1
    DesignSize = (
      201
      645)
    object ScrollBox1: TScrollBox
      Left = 0
      Top = 18
      Width = 201
      Height = 571
      VertScrollBar.Position = 5
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
      object panAdver: TPanel
        Left = 0
        Top = 189
        Width = 184
        Height = 94
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          184
          94)
        object lblSetaAdver: TLabel
          Left = 5
          Top = 4
          Width = 11
          Height = 12
          Cursor = crHandPoint
          Anchors = [akTop]
          Caption = 'p'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Wingdings 3'
          Font.Style = []
          ParentFont = False
          OnClick = lblAdverClick
          ExplicitLeft = 6
        end
        object lblAdver: TLabel
          Left = 20
          Top = 4
          Width = 147
          Height = 13
          Cursor = crHandPoint
          AutoSize = False
          Caption = 'Advers'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblAdverClick
        end
        object panSelectAdver: TPanel
          Left = 0
          Top = 22
          Width = 184
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object cmbAdver: TDBLookupComboBox
            Left = 7
            Top = 34
            Width = 160
            Height = 21
            Enabled = False
            KeyField = 'codadver'
            ListField = 'nome'
            ListSource = dtsAdversarios
            TabOrder = 0
          end
          object chkAdver: TCheckBox
            Left = 7
            Top = 9
            Width = 130
            Height = 17
            Caption = 'Todos os advers'#225'rios'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = chkAdverClick
          end
        end
      end
      object panJogo: TPanel
        Left = 0
        Top = -5
        Width = 184
        Height = 100
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          184
          100)
        object lblSetaJogo: TLabel
          Left = 5
          Top = 4
          Width = 11
          Height = 12
          Cursor = crHandPoint
          Anchors = [akTop]
          Caption = 'p'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Wingdings 3'
          Font.Style = []
          ParentFont = False
          OnClick = lblJogoClick
          ExplicitLeft = 6
        end
        object lblJogo: TLabel
          Left = 20
          Top = 4
          Width = 147
          Height = 13
          Cursor = crHandPoint
          AutoSize = False
          Caption = 'Jogo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblJogoClick
        end
        object panSelectJogo: TPanel
          Left = 0
          Top = 22
          Width = 184
          Height = 78
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object lblCodigodoJogo: TLabel
            Left = 7
            Top = 32
            Width = 72
            Height = 13
            Caption = 'C'#243'digo do jogo'
          end
          object chkJogos: TCheckBox
            Left = 7
            Top = 9
            Width = 130
            Height = 17
            Caption = 'Todos os jogos'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chkJogosClick
          end
          object edtCodJogo: TEdit
            Left = 7
            Top = 49
            Width = 160
            Height = 21
            TabOrder = 1
          end
        end
      end
      object panEstadio: TPanel
        Left = 0
        Top = 377
        Width = 184
        Height = 94
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          184
          94)
        object lblSetaEstadio: TLabel
          Left = 5
          Top = 4
          Width = 11
          Height = 12
          Cursor = crHandPoint
          Anchors = [akTop]
          Caption = 'p'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Wingdings 3'
          Font.Style = []
          ParentFont = False
          OnClick = lblEstadioClick
          ExplicitLeft = 6
        end
        object lblEstadio: TLabel
          Left = 20
          Top = 4
          Width = 147
          Height = 13
          Cursor = crHandPoint
          AutoSize = False
          Caption = 'Est'#225'dio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblEstadioClick
        end
        object panSelectEstadio: TPanel
          Left = 0
          Top = 22
          Width = 184
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object cmbEstadio: TDBLookupComboBox
            Left = 7
            Top = 34
            Width = 160
            Height = 21
            Enabled = False
            KeyField = 'codestadio'
            ListField = 'nome'
            ListSource = dtsEstadios
            TabOrder = 0
          end
          object chkEstadio: TCheckBox
            Left = 7
            Top = 9
            Width = 130
            Height = 17
            Caption = 'Todos os est'#225'dios'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = chkEstadioClick
          end
        end
      end
      object panPeriodo: TPanel
        Left = 0
        Top = 471
        Width = 184
        Height = 100
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 3
        DesignSize = (
          184
          100)
        object lblSetaPeriodo: TLabel
          Left = 5
          Top = 4
          Width = 11
          Height = 12
          Cursor = crHandPoint
          Anchors = [akTop]
          Caption = 'p'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Wingdings 3'
          Font.Style = []
          ParentFont = False
          OnClick = lblPeriodoClick
          ExplicitLeft = 6
        end
        object lblPeriodo: TLabel
          Left = 20
          Top = 4
          Width = 147
          Height = 13
          Cursor = crHandPoint
          AutoSize = False
          Caption = 'Per'#237'odo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblPeriodoClick
        end
        object panSelectPeriodo: TPanel
          Left = 0
          Top = 22
          Width = 184
          Height = 78
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Label11: TLabel
            Left = 7
            Top = 32
            Width = 13
            Height = 13
            Caption = 'De'
          end
          object Label12: TLabel
            Left = 92
            Top = 32
            Width = 17
            Height = 13
            Caption = 'At'#233
          end
          object chkPeriodo: TCheckBox
            Left = 7
            Top = 9
            Width = 130
            Height = 17
            Caption = 'Todas as datas'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chkPeriodoClick
          end
          object edtDataIni: TMaskEdit
            Left = 7
            Top = 49
            Width = 74
            Height = 21
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 1
            Text = '  /  /    '
          end
          object edtDataFim: TMaskEdit
            Left = 92
            Top = 49
            Width = 72
            Height = 21
            AutoSize = False
            EditMask = '!99/99/0000;1;_'
            MaxLength = 10
            TabOrder = 2
            Text = '  /  /    '
          end
        end
      end
      object panCampeonato: TPanel
        Left = 0
        Top = 95
        Width = 184
        Height = 94
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 4
        DesignSize = (
          184
          94)
        object lblSetaCampeonato: TLabel
          Left = 5
          Top = 4
          Width = 11
          Height = 12
          Cursor = crHandPoint
          Anchors = [akTop]
          Caption = 'p'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Wingdings 3'
          Font.Style = []
          ParentFont = False
          OnClick = lblCampeonatoClick
          ExplicitLeft = 6
        end
        object lblCampeonato: TLabel
          Left = 20
          Top = 4
          Width = 147
          Height = 13
          Cursor = crHandPoint
          AutoSize = False
          Caption = 'Campeonatos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblCampeonatoClick
        end
        object panSelectCampeonato: TPanel
          Left = 0
          Top = 22
          Width = 184
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object cmbCampeonato: TDBLookupComboBox
            Left = 7
            Top = 34
            Width = 160
            Height = 21
            Enabled = False
            KeyField = 'codcompeticao'
            ListField = 'nome'
            ListSource = dtsCampeonatos
            TabOrder = 0
          end
          object chkCampeonato: TCheckBox
            Left = 7
            Top = 9
            Width = 130
            Height = 17
            Caption = 'Todos os campeonatos'
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = chkCampeonatoClick
          end
        end
      end
      object panRivais: TPanel
        Left = 0
        Top = 283
        Width = 184
        Height = 94
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        DesignSize = (
          184
          94)
        object lblSetaRivais: TLabel
          Left = 5
          Top = 4
          Width = 11
          Height = 12
          Cursor = crHandPoint
          Anchors = [akTop]
          Caption = 'p'
          Font.Charset = SYMBOL_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Wingdings 3'
          Font.Style = []
          ParentFont = False
          OnClick = lblRivaisClick
          ExplicitLeft = 6
        end
        object Label2: TLabel
          Left = 20
          Top = 4
          Width = 147
          Height = 13
          Cursor = crHandPoint
          AutoSize = False
          Caption = 'Rivais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblRivaisClick
        end
        object panSelectRivais: TPanel
          Left = 0
          Top = 22
          Width = 184
          Height = 72
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object rbtTodos: TRadioButton
            Left = 7
            Top = 12
            Width = 160
            Height = 17
            Caption = ' Todos os advers'#225'rios'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbtRivais: TRadioButton
            Left = 7
            Top = 40
            Width = 113
            Height = 17
            Caption = ' Somente rivais'
            TabOrder = 1
          end
        end
      end
    end
    object btnSelecionar: TBitBtn
      Left = 4
      Top = 602
      Width = 192
      Height = 37
      Caption = 'Selecionar'
      TabOrder = 1
      OnClick = btnSelecionarClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 841
    Top = 8
    Width = 331
    Height = 377
    Anchors = [akLeft, akTop, akRight]
    Caption = '  Gr'#225'fico  '
    TabOrder = 2
    DesignSize = (
      331
      377)
    inline fraGrafico: TfraGrafico
      Left = 4
      Top = 15
      Width = 327
      Height = 357
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      ExplicitLeft = 4
      ExplicitTop = 15
    end
  end
  object GroupBox4: TGroupBox
    Left = 841
    Top = 391
    Width = 331
    Height = 262
    Caption = '  Estat'#237'sticas Gerais  '
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object lblDescVitorias: TLabel
      Left = 98
      Top = 86
      Width = 135
      Height = 13
      Caption = 'VIT'#211'RIAS DO FLUMINENSE:'
    end
    object lblVitoria: TLabel
      Left = 264
      Top = 86
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 98
      Top = 105
      Width = 49
      Height = 13
      Caption = 'EMPATES:'
    end
    object lblEmpate: TLabel
      Left = 264
      Top = 105
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 98
      Top = 124
      Width = 58
      Height = 13
      Caption = 'DERROTAS:'
    end
    object lblDerrotas: TLabel
      Left = 264
      Top = 124
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 98
      Top = 143
      Width = 77
      Height = 13
      Caption = 'GOLS A FAVOR:'
    end
    object lblGolsPro: TLabel
      Left = 264
      Top = 143
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 98
      Top = 162
      Width = 75
      Height = 13
      Caption = 'GOLS CONTRA:'
    end
    object lblGolsContra: TLabel
      Left = 264
      Top = 162
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 98
      Top = 181
      Width = 82
      Height = 13
      Caption = 'SALDO DE GOLS:'
    end
    object lblSaldoGols: TLabel
      Left = 264
      Top = 181
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 98
      Top = 200
      Width = 96
      Height = 13
      Caption = 'APROVEITAMENTO:'
    end
    object lblAproveitamento: TLabel
      Left = 264
      Top = 200
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 98
      Top = 67
      Width = 38
      Height = 13
      Caption = 'JOGOS:'
    end
    object lblJogos: TLabel
      Left = 264
      Top = 67
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'lblVitoria'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ImgAdver: TImage
      Left = 14
      Top = 67
      Width = 73
      Height = 73
      Stretch = True
    end
    object lblAdversario: TLabel
      Left = 14
      Top = 35
      Width = 45
      Height = 16
      Caption = 'JOGOS:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ImgBandPaisAdver: TImage
      Left = 23
      Top = 162
      Width = 56
      Height = 31
      Stretch = True
    end
  end
  object qryJogos: TFDQuery
    OnCalcFields = qryJogosCalcFields
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT j.codjogo,'
      '  '#9'   j.data,'
      '       j.codadvermand,'
      '       j.placar1,'
      '       j.placar2,'
      '       j.codadvervisit,'
      '       j.codcompeticao,'
      '       j.publico'
      'FROM ca_jogos j'
      'WHERE (j.codjogo > 0)'
      '-- Filtro'
      'ORDER BY j.codjogo DESC'
      '')
    Left = 280
    object qryJogoscodjogo: TIntegerField
      FieldName = 'codjogo'
      Origin = 'codjogo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '###,###'
      EditFormat = '###,###'
    end
    object qryJogosdata: TDateField
      FieldName = 'data'
      Origin = '`data`'
      Required = True
    end
    object qryJogoscodadvermand: TIntegerField
      FieldName = 'codadvermand'
      Origin = 'codadvermand'
      Required = True
    end
    object qryJogosMandante: TStringField
      DisplayWidth = 120
      FieldKind = fkCalculated
      FieldName = 'Mandante'
      Size = 120
      Calculated = True
    end
    object qryJogosplacar1: TIntegerField
      FieldName = 'placar1'
      Origin = 'placar1'
      Required = True
    end
    object qryJogosplacar2: TIntegerField
      FieldName = 'placar2'
      Origin = 'placar2'
      Required = True
    end
    object qryJogoscodadvervisit: TIntegerField
      FieldName = 'codadvervisit'
      Origin = 'codadvervisit'
      Required = True
    end
    object qryJogosVisitante: TStringField
      DisplayWidth = 120
      FieldKind = fkCalculated
      FieldName = 'Visitante'
      Size = 120
      Calculated = True
    end
    object qryJogoscodcompeticao: TIntegerField
      DisplayWidth = 190
      FieldName = 'codcompeticao'
      Origin = 'codcompeticao'
      Required = True
    end
    object qryJogosCompeticao: TStringField
      DisplayWidth = 190
      FieldKind = fkCalculated
      FieldName = 'Competicao'
      Size = 190
      Calculated = True
    end
    object qryJogospublico: TIntegerField
      FieldName = 'publico'
      Origin = 'publico'
      Required = True
      DisplayFormat = '###,###'
      EditFormat = '###,###'
    end
  end
  object dtsJogos: TDataSource
    DataSet = qryJogos
    Left = 282
    Top = 16
  end
  object qryCampeonatos: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select *'
      'from ca_compe'
      'order by ca_compe.nome')
    Left = 322
    object qryCampeonatoscodcompeticao: TIntegerField
      FieldName = 'codcompeticao'
      Required = True
    end
    object qryCampeonatosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 35
    end
    object qryCampeonatostipocompeticao: TWideStringField
      FieldName = 'tipocompeticao'
      Origin = 'tipocompeticao'
      Required = True
      Size = 1
    end
  end
  object dtsCampeonatos: TDataSource
    DataSet = qryCampeonatos
    Left = 322
    Top = 16
  end
  object dtsAdversarios: TDataSource
    DataSet = qryAdversarios
    Left = 354
    Top = 16
  end
  object qryAdversarios: TFDQuery
    Active = True
    OnCalcFields = qryJogosCalcFields
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select *'
      'from ca_adver'
      'where ca_adver.codadver <> 0'
      'order by ca_adver.nome')
    Left = 352
    object qryAdversarioscodadver: TIntegerField
      FieldName = 'codadver'
      Origin = 'codadver'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAdversariosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object qryAdversarioscodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
    object qryAdversariosrival: TSmallintField
      AutoGenerateValue = arDefault
      FieldName = 'rival'
      Origin = 'rival'
    end
    object qryAdversariosescudo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'escudo'
      Origin = 'escudo'
      Size = 200
    end
  end
  object qryEstatisticasGerais: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT (sum(r.v)+sum(r.e)+sum(r.d)) J,'
      '        sum(r.v) V,'
      '        sum(r.e) E,'
      '        sum(r.d) D,'
      '        sum(r.gp) GP,'
      '        sum(r.gc) GC,'
      '        (sum(gp)-sum(gc)) SG,'
      
        '        round((((sum(r.v)*3)+sum(r.e)) / ((sum(r.v)+sum(r.e)+sum' +
        '(r.d))*3)) * 100,1) APR'
      'FROM ca_jogos j, es_resum r'
      'WHERE j.codjogo = r.codjogo'
      
        'AND (j.codadvermand = :CodAdverM OR j.codadvervisit = :CodAdverV' +
        ')'
      '')
    Left = 1097
    Top = 343
    ParamData = <
      item
        Name = 'CODADVERM'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end
      item
        Name = 'CODADVERV'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end>
    object qryEstatisticasGeraisJ: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'J'
      Origin = 'J'
      ProviderFlags = []
      ReadOnly = True
      Precision = 34
      Size = 0
    end
    object qryEstatisticasGeraisV: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'V'
      Origin = 'V'
      ProviderFlags = []
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object qryEstatisticasGeraisE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'E'
      Origin = 'E'
      ProviderFlags = []
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object qryEstatisticasGeraisD: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'D'
      Origin = 'D'
      ProviderFlags = []
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object qryEstatisticasGeraisGP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'GP'
      Origin = 'GP'
      ProviderFlags = []
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object qryEstatisticasGeraisGC: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'GC'
      Origin = 'GC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 32
      Size = 0
    end
    object qryEstatisticasGeraisSG: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SG'
      Origin = 'SG'
      ProviderFlags = []
      ReadOnly = True
      Precision = 33
      Size = 0
    end
    object qryEstatisticasGeraisAPR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'APR'
      Origin = 'APR'
      ProviderFlags = []
      ReadOnly = True
      Precision = 39
      Size = 1
    end
  end
  object qryRecuperaAdver: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT'
      #9'CASE WHEN ca_jogos.codadvermand = 0 THEN ca_jogos.codadvervisit'
      '    ELSE ca_jogos.codadvermand'
      '    END AS CodigoAdversario'
      'FROM ca_jogos'
      'WHERE ca_jogos.codjogo = :CodigoJogo')
    Left = 1137
    Top = 343
    ParamData = <
      item
        Name = 'CODIGOJOGO'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end>
    object qryRecuperaAdverCodigoAdversario: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CodigoAdversario'
      Origin = 'CodigoAdversario'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryCidadeAdver: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'SELECT ca_adver.codcidade '
      'FROM ca_adver'
      'WHERE ca_adver.codadver = :CodAdver')
    Left = 1057
    Top = 344
    ParamData = <
      item
        Name = 'CODADVER'
        DataType = ftInteger
        Precision = 10
        ParamType = ptInput
        Size = 4
      end>
    object qryCidadeAdvercodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
  end
  object qryEstadios: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select *'
      'from ca_estad'
      'order by ca_estad.nome')
    Left = 402
    object qryEstadioscodestadio: TIntegerField
      FieldName = 'codestadio'
      Origin = 'codestadio'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEstadiosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 30
    end
    object qryEstadioscodcidade: TIntegerField
      FieldName = 'codcidade'
      Origin = 'codcidade'
      Required = True
    end
  end
  object dtsEstadios: TDataSource
    DataSet = qryEstadios
    Left = 402
    Top = 24
  end
end
