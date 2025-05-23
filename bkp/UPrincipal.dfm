object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 512
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 836
    Height = 471
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 836
      Height = 471
      Align = alClient
      TabOrder = 0
      object cxGridAgendamentos: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = ds
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GridLineColor = 7346457
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        Styles.ContentEven = cxStyle2
        Styles.ContentOdd = cxStyle1
        object cxGridAgendamentosID_CLIENTE: TcxGridDBColumn
          DataBinding.FieldName = 'ID_CLIENTE'
          Width = 108
        end
        object cxGridAgendamentosDATA_AGENDAMENTO: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_AGENDAMENTO'
          Width = 124
        end
        object cxGridAgendamentosDATA_AGENDADA: TcxGridDBColumn
          DataBinding.FieldName = 'DATA_AGENDADA'
          Width = 212
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGridAgendamentos
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 836
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object maskEditData: TMaskEdit
      Left = 0
      Top = 0
      Width = 120
      Height = 41
      Align = alLeft
      EditMask = '99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
      ExplicitHeight = 21
    end
    object btnRefresh: TButton
      Left = 120
      Top = 0
      Width = 75
      Height = 41
      Align = alLeft
      TabOrder = 1
      OnClick = btnRefreshClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 152
    object Module11: TMenuItem
      Caption = 'Novo Agendamento'
      OnClick = Module11Click
    end
  end
  object qryAgendamentos: TFDQuery
    Connection = dtm.con
    SQL.Strings = (
      'select * from agendamentos')
    Left = 704
    Top = 88
    object qryAgendamentosID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAgendamentosDATA_AGENDAMENTO: TDateField
      FieldName = 'DATA_AGENDAMENTO'
      Origin = 'DATA_AGENDAMENTO'
      Required = True
    end
    object qryAgendamentosDATA_AGENDADA: TDateField
      FieldName = 'DATA_AGENDADA'
      Origin = 'DATA_AGENDADA'
      Required = True
    end
  end
  object ds: TDataSource
    DataSet = qryAgendamentos
    Left = 704
    Top = 137
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 96
    Top = 232
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 168
    Top = 224
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14599344
      TextColor = clBlack
    end
  end
end
