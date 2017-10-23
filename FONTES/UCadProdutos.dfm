inherited FrmCadProduto: TFrmCadProduto
  Left = 169
  Top = 76
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Produtos'
  ClientHeight = 447
  ClientWidth = 927
  OldCreateOrder = True
  OnShow = FormShow
  ExplicitTop = -16
  ExplicitWidth = 943
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 428
    Width = 927
    ExplicitTop = 428
    ExplicitWidth = 927
  end
  inherited RzGroupBar1: TRzGroupBar
    Height = 428
    ExplicitHeight = 428
  end
  inherited RzPageControl1: TRzPageControl
    Width = 782
    Height = 428
    ActivePage = TabSheet3
    TabIndex = 1
    ExplicitWidth = 782
    ExplicitHeight = 428
    FixedDimension = 19
    inherited TabSheet1: TRzTabSheet
      ExplicitLeft = 1
      ExplicitTop = 20
      ExplicitWidth = 778
      ExplicitHeight = 405
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 778
        Height = 405
        Align = alClient
        Caption = 'pnl3'
        TabOrder = 0
        ExplicitLeft = -2
        ExplicitTop = -3
        object lbl3: TLabel
          Left = 35
          Top = 290
          Width = 76
          Height = 13
          Caption = 'Adicional Mega:'
        end
        object lbl2: TLabel
          Left = 22
          Top = 266
          Width = 89
          Height = 13
          Caption = 'Adicional Especial:'
        end
        object lbl1: TLabel
          Left = 26
          Top = 242
          Width = 85
          Height = 13
          Caption = 'Adicional Simples:'
        end
        object lbl4: TLabel
          Left = 63
          Top = 218
          Width = 48
          Height = 13
          Caption = 'Categoria:'
        end
        object lbl5: TLabel
          Left = 47
          Top = 196
          Width = 64
          Height = 13
          Caption = 'Peso Liquido:'
        end
        object lblEstoque: TLabel
          Left = 69
          Top = 171
          Width = 42
          Height = 13
          Caption = 'Estoque:'
        end
        object lbl6: TLabel
          Left = 40
          Top = 145
          Width = 71
          Height = 13
          Caption = 'Margem Lucro:'
        end
        object lbl7: TLabel
          Left = 27
          Top = 119
          Width = 84
          Height = 13
          Caption = 'Data Ult. Compra:'
        end
        object lbl8: TLabel
          Left = 26
          Top = 93
          Width = 85
          Height = 13
          Caption = 'Pre'#231'o de Compra:'
        end
        object lbl9: TLabel
          Left = 60
          Top = 67
          Width = 51
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object lbl10: TLabel
          Left = 75
          Top = 42
          Width = 36
          Height = 13
          Caption = 'C'#243'digo:'
        end
        object lbl11: TLabel
          Left = 277
          Top = 196
          Width = 55
          Height = 13
          Caption = 'Peso Bruto:'
        end
        object lbl12: TLabel
          Left = 264
          Top = 171
          Width = 66
          Height = 13
          Caption = 'Barato do dia:'
        end
        object lbl13: TLabel
          Left = 288
          Top = 146
          Width = 43
          Height = 13
          Caption = 'Unidade:'
        end
        object lbl14: TLabel
          Left = 252
          Top = 119
          Width = 79
          Height = 13
          Caption = 'Data Ult. Venda:'
        end
        object lbl15: TLabel
          Left = 252
          Top = 93
          Width = 80
          Height = 13
          Caption = 'Pre'#231'o de Venda:'
        end
        object lbl16: TLabel
          Left = 252
          Top = 42
          Width = 86
          Height = 13
          Caption = 'Data de Cadastro:'
        end
        object Label1: TLabel
          Left = 21
          Top = 314
          Width = 88
          Height = 13
          Caption = 'Possui Adicionais?'
        end
        object dbedtCODIGO: TDBEdit
          Left = 115
          Top = 38
          Width = 132
          Height = 21
          Color = clInactiveBorder
          DataField = 'CODIGO'
          DataSource = dsProdutos
          Enabled = False
          TabOrder = 0
        end
        object dbedtDESCRICAO: TDBEdit
          Left = 115
          Top = 64
          Width = 443
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = dsProdutos
          TabOrder = 1
        end
        object dbedtMARGEM_LUCRO: TDBEdit
          Left = 115
          Top = 143
          Width = 132
          Height = 21
          DataField = 'MARGEM_LUCRO'
          DataSource = dsProdutos
          TabOrder = 5
          OnExit = dbedtMARGEM_LUCROExit
        end
        object dbedtPESO_LIQUIDO: TDBEdit
          Left = 115
          Top = 191
          Width = 132
          Height = 21
          DataField = 'PESO_LIQUIDO'
          DataSource = dsProdutos
          TabOrder = 7
        end
        object dblkcbbCODCATEGORIA: TDBLookupComboBox
          Left = 115
          Top = 215
          Width = 353
          Height = 21
          DataField = 'CODCATEGORIA'
          DataSource = dsProdutos
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dsCategorias
          TabOrder = 10
        end
        object dbedtPESO_BRUTO: TDBEdit
          Left = 335
          Top = 191
          Width = 132
          Height = 21
          DataField = 'PESO_BRUTO'
          DataSource = dsProdutos
          TabOrder = 9
        end
        object dbcbbBARATO_DIA: TDBComboBox
          Left = 335
          Top = 167
          Width = 133
          Height = 21
          Style = csDropDownList
          DataField = 'BARATO_DIA'
          DataSource = dsProdutos
          Items.Strings = (
            'Selecione'
            'Domingo'
            'Segunda-Feira'
            'Ter'#231'a-Feira'
            'Quarta-Feira'
            'Quinta-Feira'
            'Sexta-Feira'
            'S'#225'bado')
          TabOrder = 6
        end
        object dbcbbUNIDADE: TDBComboBox
          Left = 335
          Top = 140
          Width = 133
          Height = 21
          DataField = 'UNIDADE'
          DataSource = dsProdutos
          Items.Strings = (
            'UN'
            'KG')
          TabOrder = 8
        end
        object grp1: TGroupBox
          Left = 568
          Top = 1
          Width = 217
          Height = 224
          Caption = 'Imagem do Produto'
          TabOrder = 15
          object img1: TImage
            Left = 2
            Top = 15
            Width = 213
            Height = 174
            Align = alClient
            Stretch = True
          end
          object pnl4: TPanel
            Left = 2
            Top = 189
            Width = 213
            Height = 33
            Align = alBottom
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object btnAdicionarFoto: TSpeedButton
              Left = 19
              Top = 3
              Width = 81
              Height = 26
              Caption = 'Adicionar'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C1C1C1D1DFDF
                DFE8DDDDDEE7DDDDDEE7DDDDDEE7DDDDDEE7DDDDDEE7DDDDDEE7E2DFE1E7D9DA
                D9E7A8CEBCE88EC9AFE9A9CDBDE7D9D9D9E7E3E0E2E8C1C1C1D1E5E4E5ECFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEF3E7FF57CF
                9BFF2DC588FF4FCD97FF2DC381FF5CCF9CFFE4F5EAFFE9E5E7ECD5D9D3E7B7DF
                A7FFB2DCA2FFB3DCA3FFB3DCA3FFB3DCA3FFB1DBA2FFD7ECD1FF50CA92FF06BA
                74FF4CCD9CFFFFFCF6FF47C380FF06BB77FF55CB92FFD5D7D3E7C5D4C9E733B3
                4DFF25AD41FF28AE44FF28AE44FF26AE42FF33B14BFF8CD3A0FF37C78CFF42CB
                96FF78D9B3FFFFFCF8FF71D09CFF43CC98FF33C481FFA1C5ADE7C4D6CDE72ABF
                76FF21BA6FFF29BC74FF2ABD74FF27BC72FF43C384FF80D1A0FF76D9B0FFFCFE
                FDFFFFFEFEFFFFFFFFFFFEFEFDFFFCFDFBFF6BCD90FF85BD99E9D6DAD6E788D7
                AAFF43C586FF26BF79FF1DBC75FF1ABC73FF29C07FFF85CF99FF5CBD67FF7FCC
                8CFFA0DAAEFFFCFCF8FF96D299FF7FCC8CFF56BA5CFF9ABC9BE7DFDCDAE7FFF5
                E8FFF6EFDDFFD1E7CCFFA8DDB9FF86D6AAFF68D09EFFA5DBB8FF67AD3EFF49AA
                36FF7EC87FFFFFFFFFFF71BE66FF4AAA35FF66AE41FFCDCFC9E7DDDBD9E7FEF2
                E2FFFFF1E0FFFFF2E3FFFFF3E5FFFFF3E5FFFFF2E3FFFFF3E9FFCBDAB8FF5EA5
                35FF5AA42DFF7CB75AFF57A32AFF62A73AFFD0DCBEFFE2DDE1E7DDDBD9E7FEF2
                E1FFFCF0DFFFFCF0DFFFFCF0DFFFFCF0DFFFFCF0DFFFFDF0DEFFFFF2E8FFE7E6
                D6FFADC995FF91BA78FFADC793FFE8E6D6FFFFF5E9FFDDDBD9E7DDDBD9E7FFF3
                E3FFFDF1E1FFFDF1E2FFFDF1E1FFFDF1E2FFFCF0DFFFFCF0DFFFFCF0DFFFFFF2
                E3FFFFF3E9FFFAE5CDFFF7E0C3FFFCECD6FFFFF4E4FFDDDBD9E7DCDAD7E7F9EA
                D1FFF8E8CFFFF4E3C3FFF3E1C1FFF7E7CEFFFCEFDDFFFCF0E0FFFCF0DFFFFEF2
                E4FFF9EAD3FFEED8AFFFEDD8AEFFF0DDB9FFFDF0DDFFDDDBD9E7DBD9D3E7EED7
                ACFFECD3A6FFEBD3A4FFEBD3A5FFEBD2A3FFF5E4C7FFFEF4E6FFFDF2E3FFF9EA
                D3FFEED9B0FFEBD3A6FFECD4A7FFEBD2A5FFF0DAB1FFDCD9D5E7DBD9D3E7ECD3
                A3FFE9CE9CFFE9CF9DFFE9CF9DFFE9CE9CFFEBD3A4FFF5E2C4FFF2DDB9FFEACF
                9DFFE9CE9BFFE9CF9DFFE9CF9DFFE9CE9CFFECD3A2FFDBD9D2E7DAD8D1E7EACE
                98FFE7C990FFE7CA92FFE7CA92FFE7CA92FFE6C991FFE6C88EFFE6C88FFFE6C9
                91FFE7CA92FFE7CA92FFE7CA92FFE7C990FFEACE98FFDAD8D1E7E1DDD7ECEACD
                95FFE7C88CFFE7C98EFFE7C98EFFE7C98EFFE7C98EFFE7C98EFFE7C98EFFE7C9
                8EFFE7C98EFFE7C98EFFE7C98EFFE7C88CFFEACD95FFE1DDD7ECC1C0BFD1DBD7
                CFE8D9D5CCE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5
                CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CCE7DBD7CFE8C1C0BFD1}
              OnClick = btnAdicionarFotoClick
            end
            object btnExcluirFoto: TSpeedButton
              Left = 115
              Top = 3
              Width = 81
              Height = 26
              Caption = 'Excluir'
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000C1C1C1D1DFDF
                DFE8DDDDDEE7DDDDDEE7DDDDDEE7DDDDDEE7DDDDDEE7DDDDDEE7E3E2DEE7D1D5
                DAE798A6D4E88292D4E999A6D3E7D3D7D9E7E4E3E0E8C1C1C1D1E5E4E5ECFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D8F8FF3550
                E2FF072BDBFF0C31DDFF072BDCFF3A53E2FFD8DEF9FFEBEAE4ECD5D9D3E7B7DF
                A7FFB2DCA2FFB3DCA3FFB3DCA3FFB3DCA3FFB2DDA1FFD2E1D9FF3548E5FF7585
                E9FF7A90E0FF0442DAFF819DECFF6D79DDFF3A4BE0FFD2D2D8E7C5D4C9E733B3
                4DFF25AD41FF28AE44FF28AE44FF26AE42FF34B846FF85A1C8FF1832E3FF88A5
                F0FFFBFCFCFFAFC1ECFFFCFEFFFF7E9AEBFF142FDDFF9B9DCEE7C4D6CDE72ABF
                76FF21BA6FFF29BC74FF2ABD74FF27BC72FF44CC7EFF8192DDFF384EE3FF1635
                DCFFBDC6F5FFFFFFFFFFB2BAECFF1331D9FF394FE3FF858ACCE9D6DAD6E788D7
                AAFF43C586FF26BF79FF1DBC75FF1ABC73FF2AC778FF7FA1D0FF3B3FD7FF9FA1
                EDFFFAFAFFFFC7C9F5FFFAFAFCFF8F92DFFF363FD4FF9599C7E7DFDCDAE7FFF5
                E8FFF6EFDDFFD1E7CCFFA8DDB9FF86D6AAFF68D29AFFA3D3C6FF4F4FCDFF9A9D
                E2FF9EA1E7FF3D44D2FFA5A8E9FF9195DEFF4D54CAFFCBCCD1E7DDDBD9E7FEF2
                E2FFFFF1E0FFFFF2E3FFFFF3E5FFFFF3E5FFFFF2E3FFFFF8E1FFC5C4DFFF454D
                C4FF333BC0FF3B42C3FF343CC1FF4A52C5FFCBC9DFFFE2E2DAE7DDDBD9E7FEF2
                E1FFFCF0DFFFFCF0DFFFFCF0DFFFFCF0DFFFFCF0DFFFFDF0DFFFFFF7E0FFE4DF
                E1FFA4A6D5FF8B8ECCFFA4A5CFFFE6E0DEFFFFF9E3FFDDDBD9E7DDDBD9E7FFF3
                E3FFFDF1E1FFFDF1E2FFFDF1E1FFFDF1E2FFFCF0DFFFFCF0DFFFFCF0DFFFFFF4
                E0FFFFF8E0FFFCEAC3FFF8E5BAFFFCEDD3FFFFF4E4FFDDDBD9E7DCDAD7E7F9EA
                D1FFF8E8CFFFF4E3C3FFF3E1C1FFF7E7CEFFFCEFDDFFFCF0E0FFFCF0DFFFFEF2
                E4FFF9EAD3FFEED8AFFFEDD8AEFFF0DDB9FFFDF0DDFFDDDBD9E7DBD9D3E7EED7
                ACFFECD3A6FFEBD3A4FFEBD3A5FFEBD2A3FFF5E4C7FFFEF4E6FFFDF2E3FFF9EA
                D3FFEED9B0FFEBD3A6FFECD4A7FFEBD2A5FFF0DAB1FFDCD9D5E7DBD9D3E7ECD3
                A3FFE9CE9CFFE9CF9DFFE9CF9DFFE9CE9CFFEBD3A4FFF5E2C4FFF2DDB9FFEACF
                9DFFE9CE9BFFE9CF9DFFE9CF9DFFE9CE9CFFECD3A2FFDBD9D2E7DAD8D1E7EACE
                98FFE7C990FFE7CA92FFE7CA92FFE7CA92FFE6C991FFE6C88EFFE6C88FFFE6C9
                91FFE7CA92FFE7CA92FFE7CA92FFE7C990FFEACE98FFDAD8D1E7E1DDD7ECEACD
                95FFE7C88CFFE7C98EFFE7C98EFFE7C98EFFE7C98EFFE7C98EFFE7C98EFFE7C9
                8EFFE7C98EFFE7C98EFFE7C98EFFE7C88CFFEACD95FFE1DDD7ECC1C0BFD1DBD7
                CFE8D9D5CCE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5
                CDE7D9D5CDE7D9D5CDE7D9D5CDE7D9D5CCE7DBD7CFE8C1C0BFD1}
              OnClick = btnExcluirFotoClick
            end
          end
        end
        object rgPossuiAdicionais: TRadioGroup
          Left = 115
          Top = 309
          Width = 121
          Height = 39
          Columns = 2
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 14
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 115
          Top = 89
          Width = 121
          Height = 21
          DataField = 'VALOR_COMPRA'
          DataSource = dsProdutos
          NumGlyphs = 2
          TabOrder = 2
        end
        object DBDateEdit1: TDBDateEdit
          Left = 115
          Top = 116
          Width = 121
          Height = 21
          DataField = 'DT_ULT_COMPRA'
          DataSource = dsProdutos
          NumGlyphs = 2
          TabOrder = 3
        end
        object DBDateEdit2: TDBDateEdit
          Left = 334
          Top = 116
          Width = 121
          Height = 21
          DataField = 'DT_ULT_VENDA'
          DataSource = dsProdutos
          NumGlyphs = 2
          TabOrder = 4
        end
        object dbedtEstoque: TRxDBCalcEdit
          Left = 115
          Top = 168
          Width = 121
          Height = 21
          DataField = 'ESTOQUE'
          DataSource = dsProdutos
          NumGlyphs = 2
          TabOrder = 16
        end
        object RxDBCalcEdit4: TRxDBCalcEdit
          Left = 115
          Top = 239
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 11
        end
        object RxDBCalcEdit5: TRxDBCalcEdit
          Left = 115
          Top = 263
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 12
        end
        object RxDBCalcEdit6: TRxDBCalcEdit
          Left = 115
          Top = 287
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 13
        end
      end
    end
    object TabSheet3: TRzTabSheet [1]
      Caption = 'Combos'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 778
        Height = 337
        Align = alTop
        DataSource = dsCombo
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_PRODUTO'
            Visible = True
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
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODADICIONAL'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 364
        Width = 778
        Height = 41
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object BitBtn1: TBitBtn
          Left = 24
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Incluir novo combo'
          Caption = 'Novo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BitBtn1Click
        end
        object BitBtn3: TBitBtn
          Left = 264
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Excluir Combo'
          Caption = 'Excluir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = BitBtn3Click
        end
        object BitBtn4: TBitBtn
          Left = 184
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Alterar Combo'
          Caption = 'Alterar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BitBtn4Click
        end
        object BitBtn5: TBitBtn
          Left = 344
          Top = 8
          Width = 75
          Height = 25
          Hint = 'Cancelar altera'#231#245'es'
          Caption = 'Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = BitBtn5Click
        end
        object DBNavigator1: TDBNavigator
          Left = 433
          Top = 8
          Width = 112
          Height = 25
          DataSource = dsCombo
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Hints.Strings = (
            'Primeiro Registro'
            'Registro Anterior'
            'Pr'#243'ximo Registro'
            #218'ltimo Registro')
          Kind = dbnHorizontal
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
      end
    end
    inherited TabSheet2: TRzTabSheet
      ExplicitLeft = 1
      ExplicitTop = 20
      ExplicitWidth = 778
      ExplicitHeight = 405
      inherited GridVisualizacao: TwwDBGrid
        Top = 57
        Width = 778
        Height = 348
        DataSource = dsProdutos
        OnDblClick = GridVisualizacaoDblClick
        ExplicitTop = 57
        ExplicitWidth = 778
        ExplicitHeight = 348
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 778
        Height = 57
        Align = alTop
        TabOrder = 1
        object Label18: TLabel
          Left = 248
          Top = 9
          Width = 46
          Height = 13
          Caption = 'Conteudo'
        end
        object EditPesquisa: TEdit
          Left = 248
          Top = 25
          Width = 329
          Height = 21
          TabOrder = 0
        end
        object RGCampos: TRadioGroup
          Left = 1
          Top = 1
          Width = 232
          Height = 55
          Align = alLeft
          Caption = 'Buscar por'
          Columns = 2
          Items.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
          TabOrder = 1
          OnClick = RGCamposClick
        end
        object btnBuscar: TBitBtn
          Left = 596
          Top = 10
          Width = 121
          Height = 41
          Caption = 'Buscar'
          Glyph.Data = {
            36100000424D3610000000000000360000002800000020000000200000000100
            2000000000000010000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000505063D232323C81010117B00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000404053D2D2E30EF575450FF2F2E2EFF09090B7A000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000404053E2B2B2EEE6B6760FF54514CFF232425FF161619D3000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000404
            053E2B2B2EEF6B6760FF53514CFF1F2022FF272727ED0606073D000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000404053E2B2B
            2EEF6B6760FF53514CFF1F2022FF272727ED0707073B00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000404053E2B2B2EEF6B67
            60FF53514CFF1F2022FF272727ED0607073B0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000404053E2B2C2EEF6B6760FF5351
            4CFF1F2022FF272727ED0607073B000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000404053E2B2C2EEF6B6760FF53514CFF1F20
            22FF272727ED0607073B00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000404053E2B2C2EEF6B6760FF53514CFF1F2022FF2727
            27ED0607073B0000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000404053F2B2C2EEF6B6760FF53514CFF1F2022FF272627EC0607
            073B000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000405053E2D2E30EF6A6760FF53514CFF1F2022FF262627EC0606073A0000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000100F0E1D2E2B274B4441
            3B6A4B4842733D3A356022201C390706050C0000000000000000000000000404
            03092B2A29DF54514DFF54524DFF1F2022FF262627EC0606073A000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000272521437F7C74B1BEBBB3F1D0CCC5FFD2CE
            C7FFD2CEC7FFD2CEC7FFCFCBC4FFADA9A2DE5C5852890F0E0C1B00000000312E
            294E76736FFF1F2022FF1F2022FF262627EC0606073A00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000706050C6A665F9BD2CFC8FFD2CEC7FFD7D4CDFFE2DFDAFFE9E6
            E2FFE9E6E2FFE6E2DEFFDCD8D2FFD2CDC6FFD2CEC8FFB4B0A9E4756F66B1B6AF
            A4EFE0DBD4FF6C6B69FC161617D30506063A0000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000090908118E8A83C1D5D1CBFFD5D1CAFFF1EFEBFFFDFCFBFFFDFDFCFFFDFC
            FCFFFCFCFBFFFCFBFAFFFBFAF9FFF6F5F3FFE2DED9FFCCC7BFFFD6D3CDFFD0CB
            C3FFC5C0B9F026231F3C02010106000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000101
            0102817D75B4D4D1CAFFDCD9D3FFFCFCFBFFFDFCFCFFFCFCFBFFFCFBFAFFFBFB
            FAFFFBFBFAFFFBFAFAFFFAF9F8FFF9F8F7FFFAF9F7FFF1EFEBFFCBC6BEFFD8D4
            CFFF6E6961A70000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000004440
            3A6BD6D2CCFFD8D4CEFFFDFCFBFFFAF9F8FFF9F8F8FFF9F9F7FFFAF9F8FFFAF9
            F8FFFAF9F7FFF9F8F6FFF8F7F6FFF6F4F2FFF3F2EFFFF6F4F2FFF1EEEBFFCBC6
            BEFFB5B1AAE411100E1E00000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000808070FB3AE
            A7E4D1CCC4FFF6F4F2FFF7F5F4FFF7F6F5FFF9F8F6FFFAF9F9FFFBFAFAFFFBFA
            FAFFFBFAFAFFFAF9F8FFF8F8F6FFF6F5F4FFF2F0EDFFEDEAE7FFF2EFECFFE1DD
            D7FFD1CDC6FF6360599200000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000037342F59D2CE
            C8FFDED9D3FFF6F4F2FFF5F3F1FFF8F7F6FFFAF9F8FFFBFAFAFFFCFBFBFFFCFC
            FCFFFCFBFBFFFBFAFAFFFAF9F7FFF8F7F6FFF4F2F0FFEEECE8FFE9E6E1FFEDEA
            E5FFCEC9C1FFB7B2ACE809080710000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000006F6B649FD1CD
            C6FFE8E5E0FFF1EFECFFF5F4F2FFF8F7F6FFFAF9F8FFFBFAFAFFFCFCFCFFFEFD
            FDFFFCFCFBFFFBFAFAFFFAF9F7FFF8F7F6FFF4F3F1FFEFECE9FFEAE6E2FFE8E5
            E0FFD3CDC6FFD1CDC6FF28262243000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000948F88C6D1CD
            C6FFEBE8E4FFF0EDEAFFF5F4F2FFF8F7F6FFFAF9F7FFFBFAFAFFFCFCFBFFFDFC
            FCFFFCFBFBFFFCFBFAFFFAF9F8FFF8F7F6FFF3F1EFFFEEECE8FFE9E6E1FFE5E1
            DCFFD7D1CAFFD0CCC5FF45423D6C000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000A09C95D4D2CE
            C6FFEBE8E4FFEEECE8FFF3F1EFFFF8F7F5FFFBF9F8FFFCFBFAFFFCFCFBFFFCFC
            FCFFFCFBFBFFFCFBFAFFFBFAF9FFF9F8F7FFF4F2F0FFEDEAE6FFE8E4E0FFE4E0
            DBFFD7D2CBFFD0CBC4FF53504A7D000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000009B9790CED1CC
            C5FFE9E6E1FFECE9E5FFF1EFECFFF9F8F6FFFBFAFAFFFCFBFAFFFCFCFBFFFCFC
            FBFFFCFBFAFFFBFBFAFFFBFAF9FFF8F8F6FFF6F5F3FFF0EEEBFFE6E2DDFFE3DE
            D8FFD5D0C8FFD0CBC4FF4E4B4476000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000817E77B3CFCB
            C4FFE4DFDAFFE9E6E1FFF2F0EEFFF9F8F7FFFAFAF8FFFCFBFAFFFCFBFBFFFCFB
            FBFFFCFBFBFFFBFBFAFFFAF9F8FFF8F7F6FFF6F5F3FFF5F3F1FFE9E5E0FFE1DC
            D6FFD0CAC1FFD0CDC5FF36332E57000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000504D467AD1CE
            C7FFD9D4CDFFE8E4E0FFF6F4F3FFF9F8F7FFFAF9F8FFFBFAF9FFFBFBFAFFFBFB
            FAFFFBFBFAFFFBFAF9FFFAF9F8FFF9F7F6FFF7F6F4FFF7F6F4FFEEEBE8FFDFDA
            D3FFC9C3B9FFC9C5BEF915131124000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000001817142ACDC9
            C2FBCCC6BDFFE7E3DFFFF8F7F5FFFAFAF9FFFBFAF9FFFBFAF9FFFBFBFAFFFBFB
            FAFFFBFBFAFFFBFAF9FFFAFAF9FFFAF9F8FFF9F8F7FFFAF9F7FFF1EFECFFD5CF
            C7FFCBC6BEFF8C8881BE00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000007671
            6BA7D1CDC5FFD4CFC7FFF8F6F4FFFDFDFCFFFCFCFBFFFCFCFBFFFCFCFBFFFCFC
            FBFFFCFCFBFFFCFCFBFFFCFCFBFFFCFBFAFFFBFBFAFFFDFDFDFFEEEAE6FFC4BC
            B1FFD5D2CBFF2C2A264A00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000001311
            0F21BEBAB4ECC8C2B9FFE2DED9FFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFF
            FEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFEFEFFFFFFFFFFFFFFFEFFCCC5BCFFD2CE
            C6FF75716AA70000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00002C29254ACECBC4F9C7C2B9FFE1DDD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFAFFD0CAC1FFCFCBC4FF9894
            8CCA090807100000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000002C2A254BBAB6B0E8CEC9C2FFD0CBC3FFE9E7E3FFFAF9F8FFFFFF
            FFFFFFFFFFFFFFFFFEFFF6F5F3FFE1DED8FFCBC6BDFFD3CFC9FF85827BB80C0B
            0A16000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000013121022736F68A4C8C4BEF8CFCAC3FFCFCAC2FFD3CE
            C7FFD4D0C9FFD1CDC5FFCEC9C1FFCECAC2FFB3AEA8E349453F72020201030000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000001817142A4D4A44767F7B73B09A96
            8DCDA09B93D4938F87C66F6B649F3936315C0A09081200000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          TabOrder = 2
          OnClick = btnBuscarClick
        end
      end
    end
  end
  inherited btnNovo: TsBitBtn
    TabOrder = 4
    OnClick = btnNovoClick
  end
  inherited btnGravar: TsBitBtn
    TabOrder = 5
    OnClick = btnGravarClick
  end
  inherited btnCancelar: TsBitBtn
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  inherited btnExcluir: TsBitBtn
    TabOrder = 7
    OnClick = btnExcluirClick
  end
  inherited btnLocalizar: TsBitBtn
    TabOrder = 8
    OnClick = btnLocalizarClick
  end
  inherited btnSair: TsBitBtn
    TabOrder = 9
  end
  inherited btnAlterar: TsBitBtn
    TabOrder = 10
    OnClick = btnAlterarClick
  end
  object RxDBCalcEdit2: TRxDBCalcEdit [10]
    Left = 480
    Top = 109
    Width = 121
    Height = 21
    DataField = 'VALOR_VENDA'
    DataSource = dsProdutos
    NumGlyphs = 2
    TabOrder = 3
  end
  inherited dsPadrao: TDataSource
    Left = 632
    Top = 152
  end
  object dsAdicionais: TDataSource
    DataSet = ZAdicionais
    Left = 706
    Top = 324
  end
  object dsAdicionais_Prod: TDataSource
    DataSet = ZAdicionais_Prod
    OnStateChange = dsAdicionais_ProdStateChange
    Left = 586
    Top = 332
  end
  object ZProdutos: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM PRODUTOS'
      'ORDER BY CODIGO ASC')
    Params = <>
    Sequence = ZSeqProdutos
    SequenceField = 'CODIGO'
    Left = 488
    Top = 280
    object ZProdutosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object ZProdutosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZProdutosDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Data de Cadastro'
      FieldName = 'DATA_CADASTRO'
    end
    object ZProdutosVALOR_COMPRA: TFloatField
      DisplayLabel = 'Valor de Compra'
      FieldName = 'VALOR_COMPRA'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZProdutosVALOR_VENDA: TFloatField
      DisplayLabel = 'Valor de Venda'
      FieldName = 'VALOR_VENDA'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZProdutosESTOQUE: TFloatField
      DisplayLabel = 'Estoque'
      FieldName = 'ESTOQUE'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZProdutosMARGEM_LUCRO: TFloatField
      DisplayLabel = 'Margem de Lucro'
      FieldName = 'MARGEM_LUCRO'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZProdutosDT_ULT_COMPRA: TDateTimeField
      DisplayLabel = 'Dt. '#218'lt. Compra'
      FieldName = 'DT_ULT_COMPRA'
    end
    object ZProdutosDT_ULT_VENDA: TDateTimeField
      DisplayLabel = 'Dt. '#218'lt. Venda'
      FieldName = 'DT_ULT_VENDA'
    end
    object ZProdutosPESO_BRUTO: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZProdutosPESO_LIQUIDO: TFloatField
      DisplayLabel = 'Peso Liquido'
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZProdutosUNIDADE: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZProdutosBARATO_DIA: TStringField
      DisplayLabel = 'Barato do Dia'
      FieldName = 'BARATO_DIA'
    end
    object ZProdutosIMAGEM: TStringField
      DisplayLabel = 'Imagem'
      FieldName = 'IMAGEM'
      Size = 200
    end
    object ZProdutosCODCATEGORIA: TIntegerField
      DisplayLabel = 'C'#243'd. Categoria'
      FieldName = 'CODCATEGORIA'
    end
    object ZProdutosADICIONAL_SIMPLES: TFloatField
      DisplayLabel = 'Adicional Simples'
      FieldName = 'ADICIONAL_SIMPLES'
    end
    object ZProdutosADICIONAL_ESPECIAL: TFloatField
      DisplayLabel = 'Adicional Especial'
      FieldName = 'ADICIONAL_ESPECIAL'
    end
    object ZProdutosADICIONAL_MEGA: TFloatField
      DisplayLabel = 'Adicional Mega'
      FieldName = 'ADICIONAL_MEGA'
    end
    object ZProdutosPOSSUI_ADICIONAL: TStringField
      DisplayLabel = 'Possui Adicional'
      FieldName = 'POSSUI_ADICIONAL'
      Size = 1
    end
  end
  object ZAdicionais_Prod: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'select '
      '    adicionais_prod.codigo,'
      '    adicionais_prod.codprod,'
      '    adicionais_prod.codadicional'
      'from  adicionais_prod'
      ''
      'where '
      '   ('
      '      (adicionais_prod.codprod = :pcod)'
      '   )')
    Params = <
      item
        DataType = ftInteger
        Name = 'pcod'
        ParamType = ptInput
        Value = '0'
      end>
    Sequence = ZSeqAdicionais_Prod
    SequenceField = 'CODIGO'
    Left = 584
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pcod'
        ParamType = ptInput
        Value = '0'
      end>
    object ZAdicionais_ProdCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZAdicionais_ProdCODPROD: TIntegerField
      FieldName = 'CODPROD'
    end
    object ZAdicionais_ProdCODADICIONAL: TIntegerField
      FieldName = 'CODADICIONAL'
    end
    object ZAdicionais_ProdDESCRICAO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO'
      LookupDataSet = ZAdicionais
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODADICIONAL'
      Size = 60
      Lookup = True
    end
    object ZAdicionais_ProdESTOQUE: TFloatField
      FieldKind = fkLookup
      FieldName = 'ESTOQUE'
      LookupDataSet = ZAdicionais
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'ESTOQUE'
      KeyFields = 'CODADICIONAL'
      Lookup = True
    end
    object ZAdicionais_ProdVALOR: TFloatField
      FieldKind = fkLookup
      FieldName = 'VALOR'
      LookupDataSet = ZAdicionais
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'VALOR'
      KeyFields = 'CODADICIONAL'
      Lookup = True
    end
  end
  object ZSeqAdicionais_Prod: TZSequence
    Connection = DM.Conexao
    SequenceName = 'G_ADICIONAIS_PROD_ID'
    Left = 584
    Top = 368
  end
  object dsProdutos: TDataSource
    DataSet = ZProdutos
    OnStateChange = dsProdutosStateChange
    Left = 482
    Top = 327
  end
  object ZSeqProdutos: TZSequence
    Connection = DM.Conexao
    SequenceName = 'G_PRODUTOS'
    Left = 480
    Top = 352
  end
  object ZAdicionais: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM ADICIONAIS')
    Params = <>
    Left = 704
    Top = 296
    object ZAdicionaisCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object ZAdicionaisDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object ZAdicionaisVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZAdicionaisESTOQUE: TFloatField
      FieldName = 'ESTOQUE'
      DisplayFormat = '###,###,##0.0000'
    end
    object ZAdicionaisUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 10
    end
    object ZAdicionaisDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 
      'Todos os Arquivos (*.jpg,*.jpeg,*.bmp)|*..bmp,*.jpg,*.jpeg|JPEG ' +
      'Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps' +
      ' (*.bmp)|*.bmp'
    Left = 730
    Top = 76
  end
  object UCControls1: TUCControls
    GroupName = 'Cadastro de Produtos'
    UserControl = FrmPrincipal.UserControl1
    NotAllowed = naDisabled
    Left = 538
    Top = 39
  end
  object ZCategorias: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM CATEGORIAS ORDER BY DESCRICAO ASC')
    Params = <>
    Sequence = ZSeqAdicionais_Prod
    SequenceField = 'CODIGO'
    Left = 80
    Top = 288
    object ZCategoriasCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object ZCategoriasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  object dsCategorias: TDataSource
    DataSet = ZCategorias
    OnStateChange = dsAdicionais_ProdStateChange
    Left = 82
    Top = 324
  end
  object dsCombo: TDataSource
    DataSet = DM.ZCombos
    Left = 426
    Top = 380
  end
end
