object FrmBuscarProdutos: TFrmBuscarProdutos
  Left = 295
  Top = 87
  Width = 824
  Height = 566
  ActiveControl = EditPesquisa
  BorderIcons = [biSystemMenu]
  Caption = 'Buscar Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 816
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Produto'
    Color = clPurple
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 452
    Width = 816
    Height = 83
    Align = alBottom
    BevelOuter = bvNone
    Color = clPurple
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object sLabel1: TsLabel
      Left = 9
      Top = 11
      Width = 244
      Height = 18
      Caption = 'Informe o nome do produto'
      Color = clWhite
      ParentColor = False
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
    end
    object EditPesquisa: TsEdit
      Left = 8
      Top = 32
      Width = 386
      Height = 31
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
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
    object btnSair: TsButton
      Left = 688
      Top = 16
      Width = 111
      Height = 57
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSairClick
      SkinData.SkinSection = 'BUTTON'
    end
  end
  object GridProduto: TwwDBGrid
    Left = 0
    Top = 41
    Width = 816
    Height = 160
    DittoAttributes.ShortCutDittoField = 0
    DittoAttributes.ShortCutDittoRecord = 0
    DittoAttributes.Options = []
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    Color = 16766975
    DataSource = dsProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ReadOnly = True
    TabOrder = 2
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    OnKeyDown = GridProdutoKeyDown
  end
  object Panel2: TPanel
    Left = 0
    Top = 201
    Width = 816
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Adicionais'
    Color = clPurple
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object GridAdicionais: TwwDBGrid
    Left = 0
    Top = 242
    Width = 816
    Height = 183
    DittoAttributes.ShortCutDittoField = 0
    DittoAttributes.ShortCutDittoRecord = 0
    DittoAttributes.Options = []
    DisableThemesInTitle = False
    Selected.Strings = (
      'CODIGO'#9'10'#9'CODIGO'
      'COD_PRODUTO'#9'10'#9'COD_PRODUTO'
      'DESCRICAO'#9'60'#9'DESCRICAO'
      'VALOR'#9'10'#9'VALOR'
      'ESTOQUE'#9'10'#9'ESTOQUE')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alTop
    Color = 16766975
    DataSource = dsAdicionais
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ReadOnly = True
    TabOrder = 4
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object dsProdutos: TDataSource
    DataSet = DM.ZProdutos
    Left = 88
    Top = 64
  end
  object dsAdicionais: TDataSource
    DataSet = DM.ZAdicionais
    Left = 104
    Top = 272
  end
end
