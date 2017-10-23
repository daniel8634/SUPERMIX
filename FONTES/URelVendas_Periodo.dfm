object FrmVendasPeriodo: TFrmVendasPeriodo
  Left = 424
  Top = 211
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Relat'#243'rio de Vendas por Periodo'
  ClientHeight = 127
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 86
    Width = 405
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 405
    Height = 86
    Align = alClient
    Caption = 'Vendas por periodo'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 27
      Height = 13
      Caption = 'Inicial'
    end
    object Label2: TLabel
      Left = 152
      Top = 32
      Width = 22
      Height = 13
      Caption = 'Final'
    end
    object DataIni: TDateEdit
      Left = 16
      Top = 48
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DataFim: TDateEdit
      Left = 152
      Top = 46
      Width = 121
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object frxVendas: TfrxReport
    Version = '5.1.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42751.590445729200000000
    ReportOptions.LastChange = 42751.595892175900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 296
    Top = 16
    Datasets = <
      item
        DataSet = frxDBVendas
        DataSetName = 'frxDBVendas'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8 = (
            'Vendas por periodo')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 75.000000000000000000
          Width = 136.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Data da Venda')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 240.236240000000000000
          Width = 80.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Desconto')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 340.133890000000000000
          Width = 78.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = frxDBVendas
        DataSetName = 'frxDBVendas'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataField = 'CODIGO'
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBVendas."CODIGO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          Left = 78.000000000000000000
          Width = 136.000000000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          DisplayFormat.FormatStr = 'mm/dd/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBVendas."DATA_VENDA"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          Left = 244.236240000000000000
          Width = 80.000000000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBVendas."DESCONTO"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          Left = 343.133890000000000000
          Width = 78.000000000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendas
          DataSetName = 'frxDBVendas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxDBVendas."TOTAL"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo12: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo13: TfrxMemoView
          Align = baRight
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#]')
        end
        object Memo14: TfrxMemoView
          Left = 279.685220000000000000
          Top = 5.559060000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'www.controldinformatica.com.br')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 211.874150000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBVendas."DESCONTO">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 328.378170000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<frxDBVendas."TOTAL">,MasterData1)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBVendas: TfrxDBDataset
    UserName = 'frxDBVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DATA_VENDA=DATA_VENDA'
      'NOME_PGTO=NOME_PGTO'
      'FORMA_PGTO=FORMA_PGTO'
      'NOME_COMPUTADOR=NOME_COMPUTADOR'
      'VALOR_PAGO=VALOR_PAGO'
      'DESCONTO=DESCONTO'
      'TOTAL=TOTAL'
      'CODPRODUTO=CODPRODUTO'
      'QTDE=QTDE'
      'VALOR_UNIT=VALOR_UNIT'
      'TOTAL_1=TOTAL_1'
      'DESCONTO_1=DESCONTO_1'
      'DESCRICAO=DESCRICAO')
    DataSet = ZVendas
    BCDToCurrency = False
    Left = 344
    Top = 16
  end
  object ZVendas: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'select '
      '    vendas.codigo,'
      '    vendas.data_venda,'
      '    vendas.nome_pgto,'
      '    vendas.forma_pgto,'
      '    vendas.nome_computador,'
      '    vendas.valor_pago,'
      '    vendas.desconto,'
      '    vendas.total,'
      '    itens_venda.codproduto,'
      '    itens_venda.qtde,'
      '    itens_venda.valor_unit,'
      '    itens_venda.total,'
      '    itens_venda.desconto,'
      '    itens_venda.descricao'
      'from itens_venda'
      '   inner join vendas on (itens_venda.codvenda = vendas.codigo)'
      'where '
      '   ('
      '      (data_venda between :d1 and :d2)'
      '   )')
    Params = <
      item
        DataType = ftDateTime
        Name = 'd1'
        ParamType = ptInput
        Value = '12/12/2000'
      end
      item
        DataType = ftDateTime
        Name = 'd2'
        ParamType = ptInput
        Value = '12/12/2018'
      end>
    SequenceField = 'CODIGO'
    Left = 418
    Top = 20
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'd1'
        ParamType = ptInput
        Value = '12/12/2000'
      end
      item
        DataType = ftDateTime
        Name = 'd2'
        ParamType = ptInput
        Value = '12/12/2018'
      end>
    object ZVendasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZVendasDATA_VENDA: TDateTimeField
      FieldName = 'DATA_VENDA'
    end
    object ZVendasNOME_PGTO: TStringField
      FieldName = 'NOME_PGTO'
    end
    object ZVendasFORMA_PGTO: TIntegerField
      FieldName = 'FORMA_PGTO'
    end
    object ZVendasNOME_COMPUTADOR: TStringField
      FieldName = 'NOME_COMPUTADOR'
      Size = 100
    end
    object ZVendasVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
    end
    object ZVendasDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object ZVendasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object ZVendasCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
    end
    object ZVendasQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object ZVendasVALOR_UNIT: TFloatField
      FieldName = 'VALOR_UNIT'
    end
    object ZVendasTOTAL_1: TFloatField
      FieldName = 'TOTAL_1'
    end
    object ZVendasDESCONTO_1: TFloatField
      FieldName = 'DESCONTO_1'
    end
    object ZVendasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dsVendas: TDataSource
    DataSet = ZVendas
    Left = 450
    Top = 20
  end
end
