object frmProgresso: TfrmProgresso
  Left = 575
  Top = 276
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Progresso'
  ClientHeight = 114
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 14
  object gauProgresso: TGauge
    Left = 12
    Top = 88
    Width = 333
    Height = 17
    ForeColor = 4452606
    Progress = 0
  end
  object lblMensagem: TLabel
    Left = 12
    Top = 74
    Width = 333
    Height = 13
    AutoSize = False
  end
  object aniProgresso: TAnimate
    Left = 12
    Top = 12
    Width = 333
    Height = 52
    Active = True
    AutoSize = False
    CommonAVI = aviCopyFile
    StopFrame = 22
  end
end
