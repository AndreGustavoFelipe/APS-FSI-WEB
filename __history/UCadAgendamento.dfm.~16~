object FormCadAgendamentos: TFormCadAgendamentos
  Left = 0
  Top = 0
  Caption = 'FormCadAgendamentos'
  ClientHeight = 778
  ClientWidth = 309
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 37
    Top = 32
    Width = 239
    Height = 633
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label_Cadastro: TLabel
      Left = 21
      Top = 33
      Width = 155
      Height = 21
      Alignment = taCenter
      Caption = 'Novo Agendamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSalvar: TButton
      Left = 117
      Top = 586
      Width = 90
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 21
      Top = 586
      Width = 90
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object editPlaca: TEdit
      Left = 18
      Top = 89
      Width = 197
      Height = 21
      Color = 14599344
      MaxLength = 7
      TabOrder = 2
    end
    object editModelo: TEdit
      Left = 18
      Top = 129
      Width = 197
      Height = 21
      Color = 14599344
      TabOrder = 3
    end
    object cbxTipoVeiculo: TComboBox
      Left = 18
      Top = 166
      Width = 196
      Height = 21
      Color = 14599344
      TabOrder = 4
      Items.Strings = (
        'Carro'#11
        'Moto'#11
        'Caminhonete'
        'Caminh'#227'o')
    end
    object editHora: TEdit
      Left = 18
      Top = 262
      Width = 197
      Height = 21
      Color = 14599344
      TabOrder = 5
    end
    object dbGridFuncionario: TDBGrid
      Left = 18
      Top = 289
      Width = 197
      Height = 120
      DataSource = dsFuncionarios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SENHA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Visible = True
        end>
    end
    object dbGridsServicos: TDBGrid
      Left = 18
      Top = 441
      Width = 197
      Height = 120
      DataSource = dsServicos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Visible = True
        end>
    end
    object dtAgendamento: TDateTimePicker
      Left = 18
      Top = 197
      Width = 197
      Height = 22
      Date = 45787.000000000000000000
      Time = 0.424101585645985300
      TabOrder = 8
    end
    object dtHora: TDateTimePicker
      Left = 18
      Top = 225
      Width = 197
      Height = 22
      BevelOuter = bvNone
      Date = 45787.000000000000000000
      Time = 0.424101585645985300
      Kind = dtkTime
      TabOrder = 9
    end
  end
  object queryServicos: TFDQuery
    Connection = dm.con
    SQL.Strings = (
      'select * from servicos')
    Left = 241
    Top = 55
    object queryServicosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryServicosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 200
    end
    object queryServicosVALOR: TSingleField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
    end
  end
  object dsServicos: TDataSource
    DataSet = queryServicos
    Left = 241
    Top = 103
  end
  object queryFuncionarios: TFDQuery
    Connection = dm.con
    SQL.Strings = (
      'select * from usuarios'
      'where tipo = 1')
    Left = 241
    Top = 147
    object queryFuncionariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object queryFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 200
    end
    object queryFuncionariosSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 200
    end
    object queryFuncionariosTIPO: TSmallintField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = queryFuncionarios
    Left = 241
    Top = 195
  end
end
