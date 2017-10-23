unit UDM;

interface

uses
  SysUtils, Classes, ZSequence, DB, ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UCDataConnector,
  UCZEOSConn, UCBase, Printers;

type
  TDM = class(TDataModule)
    Conexao: TZConnection;
    ZFormasPGTO: TZQuery;
    ZFormasPGTODESCRICAO: TStringField;
    ZFormasPGTOCODIGO: TIntegerField;
    ZVendas: TZQuery;
    ZVendasCODIGO: TIntegerField;
    ZVendasDATA_VENDA: TDateTimeField;
    ZVendasCODCLIENTE: TIntegerField;
    ZVendasTOTAL: TFloatField;
    ZVendasDESCONTO: TFloatField;
    ZVendasFORMA_PGTO: TIntegerField;
    ZItensVenda: TZQuery;
    ZItensVendaCODIGO: TIntegerField;
    ZItensVendaCODVENDA: TIntegerField;
    ZItensVendaCODPRODUTO: TIntegerField;
    ZItensVendaQTDE: TFloatField;
    ZItensVendaVALOR_UNIT: TFloatField;
    ZItensVendaTOTAL: TFloatField;
    ZItensVendaDESCONTO: TFloatField;
    ZSeqVenda: TZSequence;
    ZCombos: TZQuery;
    ZAdicionais: TZQuery;
    ZAdicionaisCODIGO: TIntegerField;
    ZAdicionaisDESCRICAO: TStringField;
    ZAdicionaisVALOR: TFloatField;
    ZAdicionaisESTOQUE: TFloatField;
    ZAdicionaisUNIDADE: TStringField;
    ZAdicionaisDATA_CADASTRO: TDateTimeField;
    ZAdicionaisPESO_LIQUIDO: TFloatField;
    ZAdicionaisPESO_BRUTO: TFloatField;
    ZAdicionaisTIPO: TStringField;
    ZCombosCODIGO: TIntegerField;
    ZCombosCOD_PRODUTO: TIntegerField;
    ZCombosDESCRICAO: TStringField;
    ZCombosVALOR: TFloatField;
    ZCombosESTOQUE: TFloatField;
    ZCombosCODADICIONAL: TIntegerField;
  private
    { Private declarations }
  public
    function fGeraCodigo(vTabela,vCampo:String):Integer;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }

function TDM.fGeraCodigo( vTabela, vCampo: String): Integer;
var
  Query: TZQuery;
begin
    Query := TZQuery.Create(Self);
    Query.Connection := Conexao;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add(' SELECT MAX('+vCampo+') as CODIGO FROM '+vTabela);
    Query.Open;

    result := Query.FieldByName('CODIGO').AsInteger + 1;

    Query.Free;
end;

end.
