object FrmCadCombo: TFrmCadCombo
  Left = 301
  Top = 244
  ActiveControl = sEdtPesquisa
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Combos'
  ClientHeight = 178
  ClientWidth = 558
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 558
    Height = 137
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 34
        Top = 12
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 24
        Top = 33
        Width = 46
        Height = 13
        Caption = 'Adicional:'
      end
      object lbl1: TLabel
        Left = 43
        Top = 55
        Width = 27
        Height = 13
        Caption = 'Valor:'
      end
      object lbl2: TLabel
        Left = 179
        Top = 55
        Width = 42
        Height = 13
        Caption = 'Estoque:'
      end
      object dbedtCODIGO: TDBEdit
        Left = 72
        Top = 8
        Width = 121
        Height = 21
        DataField = 'CODIGO'
        DataSource = dsAdicionais
        Enabled = False
        TabOrder = 0
      end
      object dblkcbbCODADICIONAL: TDBLookupComboBox
        Left = 148
        Top = 31
        Width = 321
        Height = 21
        DataField = 'CODADICIONAL'
        DataSource = dsCombos
        KeyField = 'CODIGO'
        ListField = 'DESCRICAO'
        ListSource = dsAdicionais
        TabOrder = 1
      end
      object sEdtPesquisa: TsComboEdit
        Left = 72
        Top = 31
        Width = 73
        Height = 21
        AutoSize = False
        TabOrder = 2
        OnExit = sEdtPesquisaButtonClick
        OnKeyPress = sEdtPesquisaKeyPress
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        OnButtonClick = sEdtPesquisaButtonClick
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
      end
      object dbedtVALOR: TDBEdit
        Left = 72
        Top = 54
        Width = 104
        Height = 21
        DataField = 'VALOR'
        DataSource = dsAdicionais
        Enabled = False
        TabOrder = 3
      end
      object dbedtESTOQUE: TDBEdit
        Left = 224
        Top = 54
        Width = 104
        Height = 21
        DataField = 'ESTOQUE'
        DataSource = dsAdicionais
        Enabled = False
        TabOrder = 4
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 558
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 404
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 483
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object dsAdicionais: TDataSource
    DataSet = DM.ZAdicionais
    Left = 300
    Top = 40
  end
  object dsCombos: TDataSource
    DataSet = DM.ZCombos
    Left = 228
    Top = 112
  end
end
