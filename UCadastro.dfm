object FormCadastro: TFormCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 367
  ClientWidth = 303
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 37
    Top = 23
    Width = 239
    Height = 290
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label_Cadastro: TLabel
      Left = 77
      Top = 25
      Width = 86
      Height = 30
      Alignment = taCenter
      Caption = 'Cadastro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object editUsername: TEdit
      Left = 18
      Top = 92
      Width = 197
      Height = 21
      CharCase = ecUpperCase
      Color = 14599344
      TabOrder = 0
      TextHint = 'Username'
    end
    object editPassword: TEdit
      Left = 18
      Top = 131
      Width = 197
      Height = 21
      CharCase = ecUpperCase
      Color = 14599344
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Password'
    end
    object btnCadastrar: TButton
      Left = 125
      Top = 250
      Width = 90
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 2
      OnClick = btnCadastrarClick
    end
    object btnCancelar: TButton
      Left = 18
      Top = 250
      Width = 90
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object editRepeatPassword: TEdit
      Left = 18
      Top = 171
      Width = 197
      Height = 21
      CharCase = ecUpperCase
      Color = 14599344
      PasswordChar = '*'
      TabOrder = 4
      TextHint = 'Repeat Password'
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 303
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 1
  end
end
