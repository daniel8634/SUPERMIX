inherited FrmCadEmpresa: TFrmCadEmpresa
  Caption = 'Cadastro de Empresa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPageControl1: TRzPageControl
    FixedDimension = 19
    inherited TabSheet1: TRzTabSheet
      object Label1: TLabel
        Left = 52
        Top = 39
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label2: TLabel
        Left = 16
        Top = 60
        Width = 72
        Height = 13
        Caption = 'Raza'#227'o Social:'
      end
      object Label3: TLabel
        Left = 14
        Top = 82
        Width = 74
        Height = 13
        Caption = 'Nome Fantasia:'
      end
      object Label4: TLabel
        Left = 39
        Top = 106
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
      end
      object Label5: TLabel
        Left = 413
        Top = 106
        Width = 40
        Height = 13
        Caption = 'N'#250'mero:'
      end
      object Label6: TLabel
        Left = 58
        Top = 128
        Width = 30
        Height = 13
        Caption = 'Bairro:'
      end
      object Label7: TLabel
        Left = 52
        Top = 151
        Width = 36
        Height = 13
        Caption = 'Cidade:'
      end
      object Label8: TLabel
        Left = 436
        Top = 151
        Width = 17
        Height = 13
        Caption = 'UF:'
      end
      object Label9: TLabel
        Left = 64
        Top = 174
        Width = 24
        Height = 13
        Caption = 'CEP:'
      end
      object Label10: TLabel
        Left = 202
        Top = 174
        Width = 45
        Height = 13
        Caption = 'Telefone:'
      end
      object dbedtCODIGO: TDBEdit
        Left = 91
        Top = 34
        Width = 121
        Height = 21
        Color = clInactiveBorder
        DataField = 'CODIGO'
        DataSource = dsEmpresa
        Enabled = False
        TabOrder = 0
      end
      object dbedtRAZAO_SOCIAL: TDBEdit
        Left = 91
        Top = 56
        Width = 455
        Height = 21
        DataField = 'RAZAO_SOCIAL'
        DataSource = dsEmpresa
        TabOrder = 1
      end
      object dbedtNOME_FANTASIA: TDBEdit
        Left = 91
        Top = 79
        Width = 405
        Height = 21
        DataField = 'NOME_FANTASIA'
        DataSource = dsEmpresa
        TabOrder = 2
      end
      object dbedtENDERECO: TDBEdit
        Left = 91
        Top = 102
        Width = 314
        Height = 21
        DataField = 'ENDERECO'
        DataSource = dsEmpresa
        TabOrder = 3
      end
      object dbedtNUMERO: TDBEdit
        Left = 456
        Top = 102
        Width = 89
        Height = 21
        DataField = 'NUMERO'
        DataSource = dsEmpresa
        TabOrder = 4
      end
      object dbedtBAIRRO: TDBEdit
        Left = 91
        Top = 124
        Width = 314
        Height = 21
        DataField = 'BAIRRO'
        DataSource = dsEmpresa
        TabOrder = 5
      end
      object dbedtCIDADE: TDBEdit
        Left = 91
        Top = 147
        Width = 314
        Height = 21
        DataField = 'CIDADE'
        DataSource = dsEmpresa
        TabOrder = 6
      end
      object dbedtUF: TDBEdit
        Left = 455
        Top = 147
        Width = 89
        Height = 21
        DataField = 'UF'
        DataSource = dsEmpresa
        TabOrder = 7
      end
      object dbedtCEP: TDBEdit
        Left = 91
        Top = 170
        Width = 109
        Height = 21
        DataField = 'CEP'
        DataSource = dsEmpresa
        TabOrder = 8
      end
      object dbedtTELEFONE: TDBEdit
        Left = 248
        Top = 170
        Width = 121
        Height = 21
        DataField = 'TELEFONE'
        DataSource = dsEmpresa
        TabOrder = 9
      end
    end
    inherited TabSheet2: TRzTabSheet
      inherited GridVisualizacao: TwwDBGrid
        DataSource = dsEmpresa
        OnDblClick = GridVisualizacaoDblClick
      end
    end
  end
  inherited btnNovo: TsBitBtn
    OnClick = btnNovoClick
  end
  inherited btnGravar: TsBitBtn
    OnClick = btnGravarClick
  end
  inherited btnCancelar: TsBitBtn
    OnClick = btnCancelarClick
  end
  inherited btnExcluir: TsBitBtn
    OnClick = btnExcluirClick
  end
  inherited btnLocalizar: TsBitBtn
    OnClick = btnLocalizarClick
  end
  inherited btnAlterar: TsBitBtn
    OnClick = btnAlterarClick
  end
  inherited dsPadrao: TDataSource
    Left = 608
    Top = 216
  end
  inherited JvEnterAsTab1: TJvEnterAsTab
    Left = 736
    Top = 184
  end
  object dsEmpresa: TDataSource
    DataSet = ZEmpresa
    OnStateChange = dsEmpresaStateChange
    Left = 306
    Top = 268
  end
  object ZEmpresa: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM EMPRESA'
      'ORDER BY NOME_FANTASIA ASC')
    Params = <>
    Sequence = ZSeqEmpresa
    SequenceField = 'CODIGO'
    Left = 306
    Top = 228
    object ZEmpresaCODIGO: TIntegerField
      DisplayLabel = 'C'#211'DIGO'
      FieldName = 'CODIGO'
      Required = True
      DisplayFormat = '000000'
    end
    object ZEmpresaRAZAO_SOCIAL: TStringField
      DisplayLabel = 'RAZ'#195'O SOCIAL'
      FieldName = 'RAZAO_SOCIAL'
      Size = 60
    end
    object ZEmpresaNOME_FANTASIA: TStringField
      DisplayLabel = 'NOME FANTASIA'
      FieldName = 'NOME_FANTASIA'
      Size = 60
    end
    object ZEmpresaNUMERO: TStringField
      DisplayLabel = 'N'#218'MERO'
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
      EditMask = '00000\-999;1;_'
      Size = 15
    end
    object ZEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      EditMask = '!\(99\)0000-0000;1;_'
      Size = 15
    end
    object ZEmpresaENDERECO: TStringField
      DisplayLabel = 'ENDERE'#199'O'
      FieldName = 'ENDERECO'
      Size = 60
    end
  end
  object ZSeqEmpresa: TZSequence
    Connection = DM.Conexao
    SequenceName = 'G_EMPRESA'
    Left = 306
    Top = 316
  end
  object UCControls1: TUCControls
    GroupName = 'Cadastro da Empresa'
    UserControl = FrmPrincipal.UserControl1
    NotAllowed = naDisabled
    Left = 386
    Top = 292
  end
end
