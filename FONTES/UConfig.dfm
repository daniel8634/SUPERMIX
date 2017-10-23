object FrmConfig: TFrmConfig
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es'
  ClientHeight = 227
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 455
    Height = 182
    Align = alTop
    Caption = 'Configura'#231#245'es de impress'#227'o'
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 26
      Width = 54
      Height = 13
      Caption = 'Impressora'
    end
    object Label2: TLabel
      Left = 17
      Top = 135
      Width = 88
      Height = 13
      Caption = 'Mensagem rodap'#233
    end
    object cbImpressora: TComboBox
      Left = 17
      Top = 41
      Width = 240
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Bematech'
        'Daruma'
        'Outra')
    end
    object chbSenha: TCheckBox
      Left = 17
      Top = 68
      Width = 168
      Height = 17
      Caption = 'Imprimir senha de atendimento'
      TabOrder = 1
    end
    object chbEndereco: TCheckBox
      Left = 17
      Top = 90
      Width = 120
      Height = 17
      Caption = 'Imprimir Endere'#231'o'
      TabOrder = 2
    end
    object chbOndeTomar: TCheckBox
      Left = 17
      Top = 112
      Width = 136
      Height = 17
      Caption = 'Imprimir onde tomar'
      TabOrder = 3
    end
    object EditMensagem: TEdit
      Left = 16
      Top = 153
      Width = 409
      Height = 21
      TabOrder = 4
    end
  end
  object BitBtn1: TBitBtn
    Left = 372
    Top = 194
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 291
    Top = 194
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 210
    Top = 194
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object ZConfig: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Params = <>
    Left = 248
    Top = 80
    object ZConfigSENHA_ATUAL: TIntegerField
      FieldName = 'SENHA_ATUAL'
    end
    object ZConfigIMPRESSORA: TStringField
      FieldName = 'IMPRESSORA'
    end
    object ZConfigIMP_SENHA_ATEND: TStringField
      FieldName = 'IMP_SENHA_ATEND'
      Size = 1
    end
    object ZConfigIMP_END: TStringField
      FieldName = 'IMP_END'
      Size = 1
    end
    object ZConfigIMP_ONDE_TOMAR: TStringField
      FieldName = 'IMP_ONDE_TOMAR'
      Size = 1
    end
    object ZConfigMSG_RODAPE: TStringField
      FieldName = 'MSG_RODAPE'
      Size = 100
    end
  end
end
