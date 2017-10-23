object DM: TDM
  OldCreateOrder = False
  Height = 333
  Width = 501
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
    Top = 80
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
  end
  object ZItensVenda: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ITENS_VENDA'
      'ORDER BY CODVENDA ASC')
    Params = <>
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
  object ZCombos: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM COMBOS ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 24
    Top = 152
    object ZCombosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object ZCombosCOD_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'd. Produto'
      FieldName = 'COD_PRODUTO'
      DisplayFormat = '000000'
    end
    object ZCombosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZCombosVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.00'
    end
    object ZCombosESTOQUE: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE'
      DisplayFormat = '###,###,##0.00'
    end
    object ZCombosCODADICIONAL: TIntegerField
      DisplayLabel = 'C'#243'd. Adicional'
      FieldName = 'CODADICIONAL'
      DisplayFormat = '000000'
    end
  end
  object ZAdicionais: TZQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM ADICIONAIS ORDER BY DESCRICAO ASC')
    Params = <>
    Left = 96
    Top = 120
    object ZAdicionaisCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZAdicionaisDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZAdicionaisVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object ZAdicionaisESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
    end
    object ZAdicionaisUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZAdicionaisDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
    object ZAdicionaisPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object ZAdicionaisPESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object ZAdicionaisTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
end
