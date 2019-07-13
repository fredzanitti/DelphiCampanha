object fraGrafico: TfraGrafico
  Left = 0
  Top = 0
  Width = 327
  Height = 357
  TabOrder = 0
  object dbcEstatisticas: TDBChart
    Left = 2
    Top = 3
    Width = 322
    Height = 353
    Title.Font.Name = 'Verdana'
    Legend.Alignment = laBottom
    Legend.TextStyle = ltsPercent
    Legend.Title.Alignment = taCenter
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object lblTituloGrafico: TLabel
      Left = 0
      Top = 14
      Width = 322
      Height = 35
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblTituloGrafico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Series1: TPieSeries
      DataSource = qryGrafico
      XLabelsSource = 'CLUBE'
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      YValues.ValueSource = 'PERC'
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      ExplodeBiggest = 30
      OtherSlice.Legend.Visible = False
    end
  end
  object qryRecuperaAdver: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select'
      'case when ca_jogos.codadvermand = 0 then ca_jogos.codadvervisit'
      '     else ca_jogos.codadvermand'
      'end as codadver'
      'from ca_jogos'
      'where ca_jogos.codjogo = :CodigoJogo')
    Left = 99
    Top = 8
    ParamData = <
      item
        Name = 'CODIGOJOGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryRecuperaAdvercodadver: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'codadver'
      Origin = 'codadver'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryGrafico: TFDQuery
    OnCalcFields = qryGraficoCalcFields
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      
        'select '#39'FLU'#39' as CLUBE, ROUND((sum(v)/sum(v+d+e)) * 100,1) as PER' +
        'C'
      'from es_resum'
      'inner join ca_adver on ca_adver.codadver = es_resum.codadver'
      'where ca_adver.codadver = :CodigoVitoria'
      'union'
      
        'select substring(upper(ca_adver.nome),1,3) as CLUBE, ROUND((sum(' +
        'd)/sum(v+d+e)) * 100,1) as PERC'
      'from es_resum'
      'inner join ca_adver on ca_adver.codadver = es_resum.codadver'
      'where ca_adver.codadver = :CodigoDerrota'
      'group by ca_adver.nome'
      'union'
      
        'select '#39'EMP'#39' as CLUBE, ROUND((sum(e)/sum(v+d+e)) * 100,1) as PER' +
        'C'
      'from es_resum'
      'inner join ca_adver on ca_adver.codadver = es_resum.codadver'
      'where ca_adver.codadver = :CodigoEmpate')
    Left = 59
    Top = 8
    ParamData = <
      item
        Name = 'CODIGOVITORIA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODIGODERROTA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODIGOEMPATE'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryGraficoCLUBE: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CLUBE'
      Origin = 'CLUBE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object qryGraficoPERC: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PERC'
      Origin = 'PERC'
      ProviderFlags = []
      ReadOnly = True
      Precision = 37
      Size = 1
    end
    object qryGraficoSIGLA: TStringField
      FieldKind = fkCalculated
      FieldName = 'SIGLA'
      Calculated = True
    end
  end
  object qryNomeTimesDoJogo: TFDQuery
    Connection = FrmDm.BDMySQL
    SQL.Strings = (
      'select m.nome as mandante, v.nome as visitante'
      'from ca_jogos'
      'inner join ca_adver as m on m.codadver = ca_jogos.codadvermand'
      'inner join ca_adver as v on v.codadver = ca_jogos.codadvervisit'
      'where ca_jogos.codjogo = :CodigoJogo')
    Left = 19
    Top = 8
    ParamData = <
      item
        Name = 'CODIGOJOGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryNomeTimesDoJogomandante: TWideStringField
      FieldName = 'mandante'
      Origin = 'mandante'
      Required = True
      Size = 30
    end
    object qryNomeTimesDoJogovisitante: TWideStringField
      FieldName = 'visitante'
      Origin = 'visitante'
      Required = True
      Size = 30
    end
  end
end
