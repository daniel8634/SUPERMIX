unit UBuscaProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Grids, DBGrids, ExtCtrls, Wwdbigrd, Wwdbgrid,
  StdCtrls, sLabel, sEdit, sButton;

type
  TFrmBuscarProdutos = class(TForm)
    dsProdutos: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    GridProduto: TwwDBGrid;
    Panel2: TPanel;
    GridAdicionais: TwwDBGrid;
    dsAdicionais: TDataSource;
    EditPesquisa: TsEdit;
    sLabel1: TsLabel;
    btnSair: TsButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditPesquisaChange(Sender: TObject);
    procedure EditPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure GridProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBuscarProdutos: TFrmBuscarProdutos;

implementation

uses UPrincipal, UDM;

{$R *.dfm}

procedure TFrmBuscarProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmBuscarProdutos.EditPesquisaChange(Sender: TObject);
begin
    DM.ZProdutos.Locate('DESCRICAO',EditPesquisa.Text,[loPartialKey,loCaseInsensitive]);
end;

procedure TFrmBuscarProdutos.EditPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_Return) then
        GridProduto.SetFocus;
end;

procedure TFrmBuscarProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_ESCAPE) then
   begin
       btnSairClick(Sender);
   end;
end;

procedure TFrmBuscarProdutos.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmBuscarProdutos.GridProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_Return) then
      btnSairClick(Sender);
end;

procedure TFrmBuscarProdutos.FormShow(Sender: TObject);
begin
    GridProduto.SetFocus;
end;

end.
