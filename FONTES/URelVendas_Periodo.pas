unit URelVendas_Periodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, rxToolEdit, Buttons, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, frxClass, frxDBSet;

type
  TFrmVendasPeriodo = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DataIni: TDateEdit;
    Label2: TLabel;
    DataFim: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    frxVendas: TfrxReport;
    frxDBVendas: TfrxDBDataset;
    ZVendas: TZQuery;
    dsVendas: TDataSource;
    ZVendasCODIGO: TIntegerField;
    ZVendasDATA_VENDA: TDateTimeField;
    ZVendasNOME_PGTO: TStringField;
    ZVendasFORMA_PGTO: TIntegerField;
    ZVendasNOME_COMPUTADOR: TStringField;
    ZVendasVALOR_PAGO: TFloatField;
    ZVendasDESCONTO: TFloatField;
    ZVendasTOTAL: TFloatField;
    ZVendasCODPRODUTO: TIntegerField;
    ZVendasQTDE: TFloatField;
    ZVendasVALOR_UNIT: TFloatField;
    ZVendasTOTAL_1: TFloatField;
    ZVendasDESCONTO_1: TFloatField;
    ZVendasDESCRICAO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVendasPeriodo: TFrmVendasPeriodo;

implementation

uses
  UDM, UPrincipal;

{$R *.dfm}

procedure TFrmVendasPeriodo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := Cafree;
end;

procedure TFrmVendasPeriodo.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmVendasPeriodo.BitBtn1Click(Sender: TObject);
begin
    ZVendas.Close;
    ZVendas.ParamByName('D1').AsDateTime := DataIni.Date;
    ZVendas.ParamByName('D2').AsDateTime := DataFim.Date;
    ZVendas.Open;


    FrmPrincipal.VCaminho  := ExtractFilePath(Application.ExeName);
    frxVendas.LoadFromFile(FrmPrincipal.vCaminho+'RELATORIOS\Vendas_Periodo.fr3');
    frxVendas.ShowReport();
end;

end.
