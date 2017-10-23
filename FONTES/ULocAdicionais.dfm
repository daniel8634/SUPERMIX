object FrmLocAdicionais: TFrmLocAdicionais
  Left = 250
  Top = 113
  BorderIcons = [biSystemMenu]
  Caption = 'Localizar Adicionais'
  ClientHeight = 378
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 706
    Height = 337
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    object ts1: TTabSheet
      Caption = 'Pesquisa'
      object grp1: TGroupBox
        Left = 0
        Top = 0
        Width = 698
        Height = 81
        Align = alTop
        Caption = 'Pesquisar por'
        TabOrder = 0
        object lbl1: TLabel
          Left = 8
          Top = 32
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lbl2: TLabel
          Left = 168
          Top = 32
          Width = 46
          Height = 13
          Caption = 'Conteudo'
        end
        object cbbCodigo: TComboBox
          Left = 8
          Top = 48
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          Items.Strings = (
            'Descri'#231#227'o'
            'C'#243'digo')
        end
        object edtConteudo: TEdit
          Left = 168
          Top = 45
          Width = 337
          Height = 21
          TabOrder = 1
        end
        object btn1: TBitBtn
          Left = 515
          Top = 42
          Width = 75
          Height = 25
          Caption = 'Ok'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btn1Click
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 81
        Width = 698
        Height = 228
        Align = alClient
        DataSource = dsAdicionais
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrd1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 288
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end>
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 337
    Width = 706
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSair: TBitBtn
      Left = 632
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSairClick
    end
  end
  object dsAdicionais: TDataSource
    DataSet = DM.ZAdicionais
    Left = 68
    Top = 136
  end
end
