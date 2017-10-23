object FrmCat_Prod: TFrmCat_Prod
  Left = 231
  Top = 110
  Width = 928
  Height = 480
  Caption = 'Categorias x Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 88
    Height = 20
    Caption = 'Categorias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 296
    Top = 25
    Width = 73
    Height = 20
    Caption = 'Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 584
    Top = 24
    Width = 134
    Height = 20
    Caption = 'Menu (Card'#225'pio)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 264
    Top = 200
    Width = 13
    Height = 24
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 552
    Top = 199
    Width = 13
    Height = 24
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton1: TSpeedButton
    Left = 536
    Top = 88
    Width = 41
    Height = 22
    Caption = '<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 536
    Top = 112
    Width = 41
    Height = 22
    Caption = '>>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBListBox1: TDBListBox
    Left = 16
    Top = 80
    Width = 233
    Height = 337
    DataField = 'DESCRICAO'
    DataSource = dsCategorias
    ItemHeight = 13
    TabOrder = 0
  end
  object DBListBox2: TDBListBox
    Left = 296
    Top = 80
    Width = 233
    Height = 337
    DataField = 'DESCRICAO'
    DataSource = dsProdutos
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = DBListBox2DblClick
  end
  object DBListBox3: TDBListBox
    Left = 584
    Top = 80
    Width = 233
    Height = 345
    DataSource = dsCat_Prod
    ItemHeight = 13
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 16
    Top = 56
    Width = 233
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 296
    Top = 56
    Width = 233
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object Edit3: TEdit
    Left = 584
    Top = 56
    Width = 233
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
  object dsCategorias: TDataSource
    DataSet = ZCategorias
    Left = 120
    Top = 120
  end
  object ZCategorias: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM CATEGORIAS ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 120
    Top = 80
    object ZCategoriasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZCategoriasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsProdutos: TDataSource
    DataSet = ZProdutos
    Left = 312
    Top = 128
  end
  object ZProdutos: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM PRODUTOS ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 312
    Top = 88
    object ZProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZProdutosDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object ZProdutosVALOR_COMPRA: TFloatField
      FieldName = 'VALOR_COMPRA'
    end
    object ZProdutosVALOR_VENDA: TFloatField
      FieldName = 'VALOR_VENDA'
    end
    object ZProdutosESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ZProdutosIMAGEM: TStringField
      FieldName = 'IMAGEM'
      Size = 60
    end
    object ZProdutosMARGEM_LUCRO: TFloatField
      FieldName = 'MARGEM_LUCRO'
    end
    object ZProdutosDT_ULT_COMPRA: TDateTimeField
      FieldName = 'DT_ULT_COMPRA'
    end
    object ZProdutosDT_ULT_VENDA: TDateTimeField
      FieldName = 'DT_ULT_VENDA'
    end
    object ZProdutosPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object ZProdutosPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object ZProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZProdutosBARATO_DIA: TStringField
      FieldName = 'BARATO_DIA'
    end
  end
  object ZCat_Prod: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM CAT_PROD ORDER BY COD_CAT ASC')
    Params = <>
    Left = 656
    Top = 168
    object ZCat_ProdCOD_CAT: TIntegerField
      FieldName = 'COD_CAT'
    end
    object ZCat_ProdCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object ZCat_ProdCATEGORIA: TStringField
      FieldKind = fkLookup
      FieldName = 'CATEGORIA'
      LookupDataSet = ZCategorias
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_CAT'
      Size = 60
      Lookup = True
    end
    object ZCat_ProdPRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'PRODUTO'
      LookupDataSet = ZProdutos
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'COD_PROD'
      Size = 60
      Lookup = True
    end
  end
  object dsCat_Prod: TDataSource
    DataSet = ZCat_Prod
    Left = 656
    Top = 216
  end
end
