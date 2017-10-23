object FrmAdicionais: TFrmAdicionais
  Left = 330
  Top = 180
  Width = 838
  Height = 438
  ActiveControl = GridAdicionais
  BorderIcons = [biSystemMenu]
  Caption = 'Adicionais'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 311
    Width = 830
    Height = 96
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 2
      Top = 2
      Width = 343
      Height = 92
      Align = alLeft
      Caption = 'Buscar Adicionais por nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object EditPesquisa: TsEdit
        Left = 8
        Top = 27
        Width = 329
        Height = 28
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = EditPesquisaChange
        OnKeyDown = EditPesquisaKeyDown
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
    object btnBuscar: TsButton
      Left = 352
      Top = 16
      Width = 121
      Height = 65
      Caption = 'F3 - Buscar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnBuscarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnAdicionar: TsButton
      Left = 480
      Top = 16
      Width = 121
      Height = 65
      Caption = 'F6 - Adicionar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnAdicionarClick
      SkinData.SkinSection = 'BUTTON'
    end
    object btnSair: TsButton
      Left = 694
      Top = 16
      Width = 121
      Height = 65
      Caption = 'Esc - Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object GridAdicionais: TDBGrid
    Left = 0
    Top = 0
    Width = 830
    Height = 311
    Align = alClient
    DataSource = dsAdicionais
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = GridAdicionaisKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTOQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO_LIQUIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO_BRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODPROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODADICIONAL'
        Visible = True
      end>
  end
  object dsAdicionais: TDataSource
    DataSet = DM.ZAdicionais_Prod
    Left = 32
    Top = 96
  end
end
