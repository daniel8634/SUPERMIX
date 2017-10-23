unit UAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, DB, StdCtrls, Buttons, sEdit, sButton;

type
  TFrmAdicionais = class(TForm)
    Panel1: TPanel;
    GridAdicionais: TDBGrid;
    dsAdicionais: TDataSource;
    GroupBox1: TGroupBox;
    EditPesquisa: TsEdit;
    btnBuscar: TsButton;
    btnAdicionar: TsButton;
    btnSair: TsButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditPesquisaChange(Sender: TObject);
    procedure EditPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridAdicionaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAdicionais: TFrmAdicionais;

implementation

uses UDM, UPrincipal;

{$R *.dfm}

procedure TFrmAdicionais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TFrmAdicionais.FormCreate(Sender: TObject);
begin
 //   GridAdicionais.SetFocus;
end;

procedure TFrmAdicionais.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
    btnBuscarClick(Sender);
  end;

  if (Key = VK_F6) then
  begin
    btnAdicionarClick(Sender);
    Exit;
  end;

  if (Key = VK_ESCAPE) then
  begin
    btnSairClick(Sender);
  end;

end;

procedure TFrmAdicionais.EditPesquisaChange(Sender: TObject);
begin
  DM.ZAdicionais.Locate('DESCRICAO', EditPesquisa.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TFrmAdicionais.EditPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_Return) then
    GridAdicionais.SetFocus;
end;

procedure TFrmAdicionais.GridAdicionaisKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    btnAdicionar.Click;

end;

procedure TFrmAdicionais.btnBuscarClick(Sender: TObject);
begin
  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

procedure TFrmAdicionais.btnAdicionarClick(Sender: TObject);
begin
  if FrmPrincipal.rxTemp.Locate('CODIGO;ADICIONAL', Vararrayof([DM.ZAdicionais_Prod.FieldByName('CODADICIONAL').AsString, 'S']), []) then
    FrmPrincipal.rxTemp.Edit
  else
    FrmPrincipal.rxTemp.Append;

  if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
    FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

  FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZAdicionais_Prod.FieldByName('CODADICIONAL').AsInteger;
  FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZAdicionais_Prod.FieldByName('DESCRICAO').AsString;
  FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString := 'S';
  FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := DM.ZAdicionais_Prod.FieldByName('VALOR').AsFloat;
  if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
    FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;
  FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat + 1;

  if FrmPrincipal.rxTemp.State in [dsEdit] then
    FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := (DM.ZAdicionais_Prod.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat)
  else
    FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := DM.ZAdicionais_Prod.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat;

  FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat;//DM.ZAdicionais_Prod.FieldByName('VALOR').AsFloat;

  FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //FrmPrincipal.rxTotal.Value  + FrmPrincipal.VTotalGeral;

  FrmPrincipal.rxTemp.Post;
  
  FrmPrincipal.DBCtrlGrid1.SetFocus;
end;

procedure TFrmAdicionais.btnSairClick(Sender: TObject);
begin
  Close;
  FrmPrincipal.DBCtrlGrid1.SetFocus;
end;

end.

