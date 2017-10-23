object DM: TDM
  OldCreateOrder = False
  Height = 456
  Width = 699
  object ZAdicionais: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ADICIONAIS')
    Params = <>
    Left = 32
    Top = 56
    object ZAdicionaisCODIGO: TIntegerField
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'CODIGO'
      Required = True
    end
    object ZAdicionaisDESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZAdicionaisVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object ZAdicionaisESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
  end
  object Conexao: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = True
    Properties.Strings = (
      'controls_cp=GET_ACP')
    TransactIsolationLevel = tiReadCommitted
    Port = 0
    Database = 'C:\CONTROLD\SUPERMIX\BD\SUPERMIX.FDB'
    User = 'SYSDBA'
    Password = 'masterkey'
    Protocol = 'firebird-2.1'
    Left = 24
    Top = 8
  end
  object ZFormasPGTO: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM FORMAS_PGTO')
    Params = <>
    Left = 32
    Top = 104
    object ZFormasPGTODESCRICAO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZFormasPGTOCODIGO: TIntegerField
      DisplayWidth = 10
      FieldName = 'CODIGO'
      Required = True
      Visible = False
      DisplayFormat = '000000'
    end
  end
  object ZVendas: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM VENDAS'
      'ORDER BY DATA_VENDA ASC')
    Params = <>
    Sequence = ZSeqVenda
    SequenceField = 'CODIGO'
    Left = 104
    Top = 16
    object ZVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZVendasDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
    end
    object ZVendasCODCLIENTE: TIntegerField
      FieldName = 'CODCLIENTE'
    end
    object ZVendasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object ZVendasDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object ZVendasFORMA_PGTO: TIntegerField
      FieldName = 'FORMA_PGTO'
    end
    object ZVendasNOME_PGTO: TStringField
      FieldName = 'NOME_PGTO'
    end
    object ZVendasTIPO: TStringField
      FieldName = 'TIPO'
    end
    object ZVendasNOME_COMPUTADOR: TStringField
      FieldName = 'NOME_COMPUTADOR'
      Size = 100
    end
    object ZVendasVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
    end
  end
  object ZItensVenda: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ITENS_VENDA'
      'ORDER BY CODVENDA ASC')
    Params = <>
    Sequence = ZSeqItensVenda
    SequenceField = 'CODIGO'
    Left = 104
    Top = 64
    object ZItensVendaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZItensVendaCODVENDA: TIntegerField
      FieldName = 'CODVENDA'
    end
    object ZItensVendaCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object ZItensVendaQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object ZItensVendaVALOR_UNIT: TFloatField
      FieldName = 'VALOR_UNIT'
    end
    object ZItensVendaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object ZItensVendaDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
  end
  object ZSeqVenda: TZSequence
    Connection = Conexao
    SequenceName = 'G_VENDAS'
    Left = 176
    Top = 24
  end
  object ZProdutos: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM PRODUTOS'
      'ORDER BY CODIGO ASC')
    Params = <>
    Left = 24
    Top = 160
    object ZProdutosCODIGO: TIntegerField
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object ZProdutosDESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZProdutosDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'DATA CADASTRO'
      FieldName = 'DATA_CADASTRO'
    end
    object ZProdutosVALOR_COMPRA: TFloatField
      DisplayLabel = 'VALOR COMPRA'
      FieldName = 'VALOR_COMPRA'
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object ZProdutosVALOR_VENDA: TFloatField
      DisplayLabel = 'VALOR VENDA'
      FieldName = 'VALOR_VENDA'
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object ZProdutosESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
      DisplayFormat = 'R$ ###,###,##0.00'
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
      DisplayFormat = '0.0000'
    end
    object ZProdutosPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '0.0000'
    end
    object ZProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZProdutosBARATO_DIA: TStringField
      FieldName = 'BARATO_DIA'
    end
    object ZProdutosCODCATEGORIA: TIntegerField
      FieldName = 'CODCATEGORIA'
    end
    object ZProdutosADICIONAL_SIMPLES: TFloatField
      FieldName = 'ADICIONAL_SIMPLES'
    end
    object ZProdutosADICIONAL_ESPECIAL: TFloatField
      FieldName = 'ADICIONAL_ESPECIAL'
    end
    object ZProdutosADICIONAL_MEGA: TFloatField
      FieldName = 'ADICIONAL_MEGA'
    end
    object ZProdutosPOSSUI_ADICIONAL: TStringField
      FieldName = 'POSSUI_ADICIONAL'
      Size = 1
    end
  end
  object ZAdicionais_Prod: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'select '
      '    adicionais.descricao,'
      '    adicionais.valor,'
      '    adicionais.estoque,'
      '    adicionais.unidade,'
      '    adicionais.peso_liquido,'
      '    adicionais.peso_bruto,'
      '    adicionais_prod.codprod,'
      '    adicionais_prod.codadicional'
      'from adicionais_prod'
      
        '   inner join adicionais on (adicionais_prod.codadicional = adic' +
        'ionais.codigo)'
      'where '
      '   ('
      '      (codprod = 1)'
      '   )')
    Params = <>
    Left = 192
    Top = 96
    object ZAdicionais_ProdDESCRICAO: TStringField
      DisplayLabel = 'DESCRI'#199#195'O'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZAdicionais_ProdVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object ZAdicionais_ProdESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ZAdicionais_ProdUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZAdicionais_ProdPESO_LIQUIDO: TFloatField
      DisplayLabel = 'PESO LIQUIDO'
      FieldName = 'PESO_LIQUIDO'
    end
    object ZAdicionais_ProdPESO_BRUTO: TFloatField
      DisplayLabel = 'PESO BRUTO'
      FieldName = 'PESO_BRUTO'
    end
    object ZAdicionais_ProdCODPROD: TIntegerField
      DisplayLabel = 'C'#211'D. PROD.'
      FieldName = 'CODPROD'
    end
    object ZAdicionais_ProdCODADICIONAL: TIntegerField
      DisplayLabel = 'C'#211'D. ADICIONAL'
      FieldName = 'CODADICIONAL'
    end
  end
  object ZEmpresa: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM EMPRESA ORDER BY NOME_FANTASIA')
    Params = <>
    Left = 120
    Top = 168
    object ZEmpresaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object ZEmpresaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 60
    end
    object ZEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object ZEmpresaNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 60
    end
    object ZEmpresaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 60
    end
    object ZEmpresaCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object ZEmpresaUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object ZEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
    object ZEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 15
    end
  end
  object ZSeqItensVenda: TZSequence
    Connection = Conexao
    SequenceName = 'G_ITENS_VENDA'
    Left = 104
    Top = 104
  end
  object ZCategorias: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM CATEGORIAS ORDER BY DESCRICAO')
    Params = <>
    Left = 360
    Top = 64
    object ZCategoriasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZCategoriasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZCategoriasIMAGEM: TStringField
      FieldName = 'IMAGEM'
      Size = 200
    end
  end
  object dsCategorias: TDataSource
    DataSet = ZCategorias
    Left = 360
    Top = 112
  end
  object ZAdicionalSimples: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ADICIONAIS'
      'WHERE TIPO = '#39'SIMPLES'#39
      'ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 40
    Top = 232
    object ZAdicionalSimplesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZAdicionalSimplesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZAdicionalSimplesVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object ZAdicionalSimplesESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ZAdicionalSimplesUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZAdicionalSimplesDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object ZAdicionalSimplesPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object ZAdicionalSimplesPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object ZAdicionalSimplesTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object ZAdicionalEspecial: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ADICIONAIS'
      'WHERE TIPO = '#39'ESPECIAL'#39
      'ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 40
    Top = 280
    object ZAdicionalEspecialCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZAdicionalEspecialDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZAdicionalEspecialVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object ZAdicionalEspecialESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ZAdicionalEspecialUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZAdicionalEspecialDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object ZAdicionalEspecialPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object ZAdicionalEspecialPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object ZAdicionalEspecialTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object ZAdicionalMega: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ADICIONAIS'
      'WHERE TIPO = '#39'MEGA'#39
      'ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 40
    Top = 328
    object ZAdicionalMegaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZAdicionalMegaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZAdicionalMegaVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = 'R$ ###,###,##0.00'
    end
    object ZAdicionalMegaESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ZAdicionalMegaUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZAdicionalMegaDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object ZAdicionalMegaPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object ZAdicionalMegaPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object ZAdicionalMegaTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object ZCombos: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM COMBOS ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 296
    Top = 232
    object ZCombosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZCombosCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object ZCombosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZCombosVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object ZCombosESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ZCombosCODADICIONAL: TIntegerField
      FieldName = 'CODADICIONAL'
    end
  end
end
