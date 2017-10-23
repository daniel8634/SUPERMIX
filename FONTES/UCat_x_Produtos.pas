unit UCat_x_Produtos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DBCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFrmCat_Prod = class(TForm)
    Label1: TLabel;
    DBListBox1: TDBListBox;
    Label2: TLabel;
    DBListBox2: TDBListBox;
    Label3: TLabel;
    DBListBox3: TDBListBox;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dsCategorias: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    ZCategorias: TZQuery;
    ZCategoriasCODIGO: TIntegerField;
    ZCategoriasDESCRICAO: TStringField;
    dsProdutos: TDataSource;
    ZProdutos: TZQuery;
    ZProdutosCODIGO: TIntegerField;
    ZProdutosDESCRICAO: TStringField;
    ZProdutosDATA_CADASTRO: TDateTimeField;
    ZProdutosVALOR_COMPRA: TFloatField;
    ZProdutosVALOR_VENDA: TFloatField;
    ZProdutosESTOQUE: TFloatField;
    ZProdutosIMAGEM: TStringField;
    ZProdutosMARGEM_LUCRO: TFloatField;
    ZProdutosDT_ULT_COMPRA: TDateTimeField;
    ZProdutosDT_ULT_VENDA: TDateTimeField;
    ZProdutosPESO_BRUTO: TFloatField;
    ZProdutosPESO_LIQUIDO: TFloatField;
    ZProdutosUNIDADE: TStringField;
    ZProdutosBARATO_DIA: TStringField;
    ZCat_Prod: TZQuery;
    dsCat_Prod: TDataSource;
    ZCat_ProdCOD_CAT: TIntegerField;
    ZCat_ProdCOD_PROD: TIntegerField;
    ZCat_ProdCATEGORIA: TStringField;
    ZCat_ProdPRODUTO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBListBox2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCat_Prod: TFrmCat_Prod;

implementation

uses UDM;

{$R *.dfm}

procedure TFrmCat_Prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := Cafree;
end;

procedure TFrmCat_Prod.FormCreate(Sender: TObject);
begin
    ZCategorias.Close;
    ZCategorias.Open;

    ZProdutos.Close;
    ZProdutos.Open;


    ZProdutos.First;

    while not ZProdutos.Eof do
    begin
        DBListBox2.Items.Add(ZProdutos.FieldByName('DESCRICAO').AsString);
        ZProdutos.Next;
    end;
end;

procedure TFrmCat_Prod.DBListBox2DblClick(Sender: TObject);
begin
    ShowMessage(zprodutos.fieldbyname('codigo').asstring);
end;

end.
