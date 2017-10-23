unit UProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZAbstractRODataset, ZAbstractDataset, ZDataset, UCDataConnector,
  UCZEOSConn, UCBase, Menus, sSkinManager, DB, RxMemDS, JvExStdCtrls,
  JvEdit, JvValidateEdit, StdCtrls, sEdit, ExtCtrls, DBCtrls, dbcgrids,
  sButton, Grids, Wwdbigrd, Wwdbgrid;

type
  TFrmProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel6: TPanel;
    Label3: TLabel;
    rxTotal: TLabel;
    Panel3: TPanel;
    btnFinalizarVenda: TsButton;
    btnBuscar: TsButton;
    btnSair: TsButton;
    btnCancelarItem: TsButton;
    btnAdicionais: TsButton;
    btnCancelarVenda: TsButton;
    Panel4: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Image1: TImage;
    PCancelaItem: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    EditCancelarItem: TsEdit;
    pnlPeso: TPanel;
    Label2: TLabel;
    Panel8: TPanel;
    jvPeso: TJvValidateEdit;
    dsProdutos: TDataSource;
    sSkinManager1: TsSkinManager;
    ZCategorias: TZQuery;
    ZCategoriasCODIGO: TIntegerField;
    ZCategoriasDESCRICAO: TStringField;
    dsCategorias: TDataSource;
    DBText2: TDBText;
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    function DiaExtenso(dData: TDateTime): string;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCtrlGrid1Click(Sender: TObject);
//    procedure btnCancelarItemClick(Sender: TObject);
    //procedure btnFinalizarVendaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnAdicionaisClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditCancelarItemChange(Sender: TObject);
    procedure EditCancelarItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvPesoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure PGravaCombo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProdutos: TFrmProdutos;

implementation

uses UDM, UPrincipal, UBuscaProduto, UAdicionais, UListaAdicionais,
  UFechaVenda;

{$R *.dfm}

procedure TFrmProdutos.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if DM.ZProdutos.FieldByName('IMAGEM').AsString <> '' then
  begin
    if FileExists(DM.ZProdutos.FieldByName('IMAGEM').AsString) then
    begin
      Image1.Picture.LoadFromFile(DM.ZProdutos.FieldByName('IMAGEM').AsString);
        //DBCtrlGrid1.Canvas.Draw(20,6,Image1.Picture.Graphic);
  //  DBCtrlGrid1.Canvas.Draw(20,6, Image1.Picture.Graphic);
    end
    else
    begin
      Image1.Picture := nil;
    end;
  end
  else
  begin
    Image1.Picture := nil;
  end;

  if (DM.ZProdutos.FieldByName('BARATO_DIA').AsString = DiaExtenso(Now)) then
    DBCtrlGrid.Color := $00004000
  else
    DBCtrlGrid.Color := clWindow;
end;

function TFrmProdutos.DiaExtenso(dData: TDateTime): string;
var
  xDia: string;
begin
  case DayOfWeek(dData) of
    1: xDia := 'Domingo';
    2: xDia := 'Segunda-feira';
    3: xDia := 'Terça-feira';
    4: xDia := 'Quarta-feira';
    5: xDia := 'Quinta-feira';
    6: xDia := 'Sexta-feira';
    7: xDia := 'Sábado';
  end;
  DiaExtenso := xDia;

end;

procedure TFrmProdutos.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    btnCancelarItemClick(Sender);
  end;

  if Key = VK_F3 then
  begin
    btnBuscarClick(Sender);
  end;

  if Key = VK_F4 then
  begin
    btnSairClick(Sender);
  end;


  if Key = VK_F6 then
  begin
    btnFinalizarVendaClick(Sender);
  end;


  if Key = VK_F7 then
  begin
    btnAdicionaisClick(Sender);
  end;

  if Key = VK_F8 then
  begin
    btnCancelarVendaClick(Sender);
  end;

  if Key = VK_ESCAPE then
  begin
    btnSairClick(Sender);
  end;

end;

procedure TFrmProdutos.DBCtrlGrid1Click(Sender: TObject);
begin
  if DM.ZProdutos.FieldByName('PESO_LIQUIDO').AsFloat > 0 then
  begin
    pnlPeso.Visible := True;
    jvPeso.SetFocus;
    Exit;
  end;

  DM.ZCombos.Close;
  DM.ZCombos.SQL.Clear;
  DM.ZCombos.SQL.Add('SELECT * FROM COMBOS WHERE COD_PRODUTO=:PCOD');
  DM.ZCombos.ParamByName('PCOD').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
  DM.ZCombos.Open;


  if DM.ZCombos.RecordCount > 0 then
  begin
    PGravaCombo;
    Exit;
  end
  else
  begin
    //if FrmPrincipal.rxTemp.Locate('CODIGO', DM.ZProdutos.FieldByName('CODIGO').AsString, []) then
      //FrmPrincipal.rxTemp.Edit
    //else
    if not (FrmPrincipal.rxTemp.IsEmpty) then // Grava novo produto em branco (Quebra de linha).
    begin
      FrmPrincipal.rxTemp.Append;
      FrmPrincipal.rxTemp.Post;
      FrmPrincipal.rxTemp.First;
    end;

    FrmPrincipal.rxTemp.Append;

    //if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
    FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

    FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('CODKIT').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZProdutos.FieldByName('DESCRICAO').AsString;
    FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
    //if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
    FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;


    FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := 1; //FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat + 1;

    if FrmPrincipal.rxTemp.State in [dsEdit] then
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := (DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat)
    else
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat;

    FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);

    FrmPrincipal.rxTemp.Post;
    FrmPrincipal.rxTemp.First;


    if (DM.ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = 'S') or
      (DM.ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = '') or
      (DM.ZProdutos.FieldByName('POSSUI_ADICIONAL').IsNull) then
    begin

      FrmListaAdicionais := TFrmListaAdicionais.Create(Application);
      FrmListaAdicionais.ShowModal;
       //FrmListaAdicionais.DBCtrlGrid2.SetFocus;
       //Exit;
    end;

    //FrmPrincipal.FBaixaEstoqueProd(1,ZProdutos.FieldByName('CODIGO').AsInteger); //Baixa Estoque
  end;
end;

procedure TFrmProdutos.btnBuscarClick(Sender: TObject);
begin
  FrmBuscarProdutos := TFrmBuscarProdutos.Create(Self);
  FrmBuscarProdutos.ShowModal;
  DBCtrlGrid1.SetFocus;
end;

procedure TFrmProdutos.btnAdicionaisClick(Sender: TObject);
begin
  FrmAdicionais := TFrmAdicionais.Create(Application);
  FrmAdicionais.ShowModal;
end;

procedure TFrmProdutos.btnCancelarVendaClick(Sender: TObject);
begin
  if Application.MessageBox('Cancelar Venda?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
  begin
    FrmPrincipal.rxTemp.EmptyTable;
    FrmPrincipal.VTotalGeral := 0;
    FrmPrincipal.VItem := 0;
    FrmPrincipal.rxTotal.Caption := 'R$ 0.00';
    rxTotal.Caption := 'R$ 0.00';
    //DBCtrlGrid1.SetFocus;

    Close;

   // if FrmPrincipal = nil then
   // FrmPrincipal := TFrmPrincipal.Create(Application);

   // FrmPrincipal.ShowModal;
  end;
end;

procedure TFrmProdutos.btnCancelarItemClick(Sender: TObject);
begin
  PCancelaItem.Visible := True;
  EditCancelarItem.SetFocus;
end;

procedure TFrmProdutos.btnFinalizarVendaClick(Sender: TObject);
begin
  FrmFechamentoVenda := TFrmFechamentoVenda.Create(Application);
  FrmFechamentoVenda.ShowModal;
end;

procedure TFrmProdutos.FormShow(Sender: TObject);
begin
  rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);
end;

procedure TFrmProdutos.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    DBCtrlGrid1Click(Sender);
end;

procedure TFrmProdutos.EditCancelarItemChange(Sender: TObject);
begin
  if FrmPrincipal.rxTemp.Locate('ITEM', EditCancelarItem.Text, []) then
  begin
       // EditCancelarItemKeyDown(Sender,VK_RETURN, );
  end
  else
  begin
    Application.MessageBox('Item não encontrado.', 'Informação', mb_iconinformation + mb_ok);
    EditCancelarItem.SetFocus;
  end;
end;

procedure TFrmProdutos.EditCancelarItemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if Application.MessageBox(PChar('Cancelar Item ' + #13 +
      'Item: ' + FrmPrincipal.rxTemp.FieldByName('ITEM').AsString + ' - ' +
      FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString + ' ? '), 'Confirmação', mb_iconquestion + mb_yesno) = id_yes then
    begin
      {if rxTemp.Locate('ITEM',EditCancelarItem.Text,[]) then
      begin
        rxTemp.Delete
      end
      else
      begin
        Application.MessageBox('Item não encontrado.','Informação',MB_ICONINFORMATION+MB_OK);
        PCancelaItem.Visible := False;
        Exit;
      end; }

      FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral - FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat;
      FrmPrincipal.rxTemp.Delete;
      FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);
      rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);
      PCancelaItem.Visible := False;
      DBCtrlGrid1.SetFocus;
    end;
  end;

  if (KEY = VK_ESCAPE) then
  begin
    PCancelaItem.Visible := False;
    DBCtrlGrid1.SetFocus;
  end;
end;

procedure TFrmProdutos.jvPesoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (KEY = VK_RETURN) then
  begin
    if FrmPrincipal.rxTemp.Locate('CODIGO', DM.ZProdutos.FieldByName('CODIGO').AsString, []) then
      FrmPrincipal.rxTemp.Edit
    else
      FrmPrincipal.rxTemp.Append;

    if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
      FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

    FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('CODKIT').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZProdutos.FieldByName('DESCRICAO').AsString;
    FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
    if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
      FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;


    FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := jvPeso.Value;

    if FrmPrincipal.rxTemp.State in [dsEdit] then
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := (DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat)
    else
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat;

    FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;

    FrmPrincipal.rxTemp.Post;

    //FBaixaEstoqueProd(jvPeso.Value,ZProdutos.FieldByName('CODIGO').AsInteger); //Baixa Estoque

    pnlPeso.Visible := False;
    DBCtrlGrid1.SetFocus;
    Exit;
  end;
end;

procedure TFrmProdutos.PGravaCombo;
begin
  if not (FrmPrincipal.rxTemp.IsEmpty) then // Grava novo produto em branco (Quebra de linha).
  begin
    FrmPrincipal.rxTemp.Append;
    FrmPrincipal.rxTemp.Post;
    FrmPrincipal.rxTemp.First;
  end;

  FrmPrincipal.rxTemp.Append;

  FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

  FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
  FrmPrincipal.rxTemp.FieldByName('CODKIT').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
  FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZProdutos.FieldByName('DESCRICAO').AsString;
  FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
  FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;
  FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString := 'C';


  FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := 1; //FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat + 1;

  if FrmPrincipal.rxTemp.State in [dsEdit] then
    FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := (DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat)
  else
    FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat;

  FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

  FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
  rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);

  FrmPrincipal.rxTemp.Post;
  FrmPrincipal.rxTemp.First;

    // Grava itens do Combo

  DM.ZCombos.First;

  while not DM.ZCombos.Eof do
  begin
    FrmPrincipal.rxTemp.Append;

    FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

    FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZCombos.FieldByName('CODADICIONAL').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('CODKIT').AsInteger := DM.ZCombos.FieldByName('COD_PRODUTO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZCombos.FieldByName('DESCRICAO').AsString;
    FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := 0; //DM.ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
    FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;
    FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := 1; //FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat + 1;
    FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := 0;
    FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString := 'C';    
    FrmPrincipal.rxTemp.Post;

    DM.ZCombos.Next;

  end;
  FrmPrincipal.rxTemp.First;
    // Fim grava itens do combo


  if (DM.ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = 'S') or
    (DM.ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = '') or
    (DM.ZProdutos.FieldByName('POSSUI_ADICIONAL').IsNull) then
  begin

    FrmListaAdicionais := TFrmListaAdicionais.Create(Application);
    FrmListaAdicionais.ShowModal;
  end;
end;

end.

