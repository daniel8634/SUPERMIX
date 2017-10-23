unit UDM;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSequence;

type
  TDM = class(TDataModule)
    ZAdicionais: TZQuery;
    Conexao: TZConnection;
    ZFormasPGTO: TZQuery;
    ZAdicionaisCODIGO: TIntegerField;
    ZAdicionaisDESCRICAO: TStringField;
    ZAdicionaisVALOR: TFloatField;
    ZAdicionaisESTOQUE: TFloatField;
    ZFormasPGTOCODIGO: TIntegerField;
    ZFormasPGTODESCRICAO: TStringField;
    ZVendas: TZQuery;
    ZItensVenda: TZQuery;
    ZVendasCODIGO: TIntegerField;
    ZVendasDATA_VENDA: TDateTimeField;
    ZVendasCODCLIENTE: TIntegerField;
    ZVendasTOTAL: TFloatField;
    ZVendasDESCONTO: TFloatField;
    ZVendasFORMA_PGTO: TIntegerField;
    ZItensVendaCODIGO: TIntegerField;
    ZItensVendaCODVENDA: TIntegerField;
    ZItensVendaCODPRODUTO: TIntegerField;
    ZItensVendaQTDE: TFloatField;
    ZItensVendaVALOR_UNIT: TFloatField;
    ZItensVendaTOTAL: TFloatField;
    ZItensVendaDESCONTO: TFloatField;
    ZSeqVenda: TZSequence;
    ZProdutos: TZQuery;
    ZProdutosCODIGO: TIntegerField;
    ZProdutosDESCRICAO: TStringField;
    ZProdutosDATA_CADASTRO: TDateTimeField;
    ZProdutosVALOR_COMPRA: TFloatField;
    ZProdutosVALOR_VENDA: TFloatField;
    ZProdutosESTOQUE: TFloatField;
    ZProdutosIMAGEM: TStringField;
    ZAdicionais_Prod: TZQuery;
    ZAdicionais_ProdDESCRICAO: TStringField;
    ZAdicionais_ProdVALOR: TFloatField;
    ZAdicionais_ProdESTOQUE: TFloatField;
    ZAdicionais_ProdUNIDADE: TStringField;
    ZAdicionais_ProdPESO_LIQUIDO: TFloatField;
    ZAdicionais_ProdPESO_BRUTO: TFloatField;
    ZAdicionais_ProdCODPROD: TIntegerField;
    ZAdicionais_ProdCODADICIONAL: TIntegerField;
    ZEmpresa: TZQuery;
    ZEmpresaCODIGO: TIntegerField;
    ZEmpresaRAZAO_SOCIAL: TStringField;
    ZEmpresaNOME_FANTASIA: TStringField;
    ZEmpresaENDERECO: TStringField;
    ZEmpresaNUMERO: TStringField;
    ZEmpresaBAIRRO: TStringField;
    ZEmpresaCIDADE: TStringField;
    ZEmpresaUF: TStringField;
    ZEmpresaCEP: TStringField;
    ZEmpresaTELEFONE: TStringField;
    ZSeqItensVenda: TZSequence;
    ZCategorias: TZQuery;
    ZCategoriasCODIGO: TIntegerField;
    ZCategoriasDESCRICAO: TStringField;
    dsCategorias: TDataSource;
    ZProdutosMARGEM_LUCRO: TFloatField;
    ZProdutosDT_ULT_COMPRA: TDateTimeField;
    ZProdutosDT_ULT_VENDA: TDateTimeField;
    ZProdutosPESO_BRUTO: TFloatField;
    ZProdutosPESO_LIQUIDO: TFloatField;
    ZProdutosUNIDADE: TStringField;
    ZProdutosBARATO_DIA: TStringField;
    ZProdutosCODCATEGORIA: TIntegerField;
    ZAdicionalSimples: TZQuery;
    ZAdicionalEspecial: TZQuery;
    ZAdicionalMega: TZQuery;
    ZAdicionalSimplesCODIGO: TIntegerField;
    ZAdicionalSimplesDESCRICAO: TStringField;
    ZAdicionalSimplesVALOR: TFloatField;
    ZAdicionalSimplesESTOQUE: TFloatField;
    ZAdicionalSimplesUNIDADE: TStringField;
    ZAdicionalSimplesDATA_CADASTRO: TDateTimeField;
    ZAdicionalSimplesPESO_LIQUIDO: TFloatField;
    ZAdicionalSimplesPESO_BRUTO: TFloatField;
    ZAdicionalSimplesTIPO: TStringField;
    ZAdicionalEspecialCODIGO: TIntegerField;
    ZAdicionalEspecialDESCRICAO: TStringField;
    ZAdicionalEspecialVALOR: TFloatField;
    ZAdicionalEspecialESTOQUE: TFloatField;
    ZAdicionalEspecialUNIDADE: TStringField;
    ZAdicionalEspecialDATA_CADASTRO: TDateTimeField;
    ZAdicionalEspecialPESO_LIQUIDO: TFloatField;
    ZAdicionalEspecialPESO_BRUTO: TFloatField;
    ZAdicionalEspecialTIPO: TStringField;
    ZAdicionalMegaCODIGO: TIntegerField;
    ZAdicionalMegaDESCRICAO: TStringField;
    ZAdicionalMegaVALOR: TFloatField;
    ZAdicionalMegaESTOQUE: TFloatField;
    ZAdicionalMegaUNIDADE: TStringField;
    ZAdicionalMegaDATA_CADASTRO: TDateTimeField;
    ZAdicionalMegaPESO_LIQUIDO: TFloatField;
    ZAdicionalMegaPESO_BRUTO: TFloatField;
    ZAdicionalMegaTIPO: TStringField;
    ZProdutosADICIONAL_SIMPLES: TFloatField;
    ZProdutosADICIONAL_ESPECIAL: TFloatField;
    ZProdutosADICIONAL_MEGA: TFloatField;
    ZProdutosPOSSUI_ADICIONAL: TStringField;
    ZCategoriasIMAGEM: TStringField;
    ZVendasNOME_PGTO: TStringField;
    ZVendasTIPO: TStringField;
    ZVendasNOME_COMPUTADOR: TStringField;
    ZVendasVALOR_PAGO: TFloatField;
    ZCombos: TZQuery;
    ZCombosCODIGO: TIntegerField;
    ZCombosCOD_PRODUTO: TIntegerField;
    ZCombosDESCRICAO: TStringField;
    ZCombosVALOR: TFloatField;
    ZCombosESTOQUE: TFloatField;
    ZCombosCODADICIONAL: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
