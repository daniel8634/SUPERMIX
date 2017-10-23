unit UListaAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExStdCtrls, JvEdit, JvValidateEdit, StdCtrls, sEdit, DBCtrls,
  dbcgrids, sSkinManager, sButton, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DB,
  Menus;

type
  TFrmListaAdicionais = class(TForm)
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
    sSkinManager1: TsSkinManager;
    pnlAdicionalMega: TPanel;
    pnlAdicionalSimples: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    pnlAdicionalEspecial: TPanel;
    DBCtrlGrid3: TDBCtrlGrid;
    DBCtrlGrid1: TDBCtrlGrid;
    PCancelaItem: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    EditCancelarItem: TsEdit;
    pnlPeso: TPanel;
    Label2: TLabel;
    Panel8: TPanel;
    jvPeso: TJvValidateEdit;
    dsSimples: TDataSource;
    dsEspecial: TDataSource;
    dsMega: TDataSource;
    dbtxtDESCRICAO: TDBText;
    dbtxtDESCRICAO1: TDBText;
    dbtxtDESCRICAO2: TDBText;
    lbl1: TLabel;
    lbl2: TLabel;
    PopupMenu1: TPopupMenu;
    FecharVenda1: TMenuItem;
    Sair1: TMenuItem;
    CancelarItem1: TMenuItem;
    Buscar1: TMenuItem;
    Adicionais1: TMenuItem;
    CancelarVenda1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBCtrlGrid2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure DBCtrlGrid3Click(Sender: TObject);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAdicionaisClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCtrlGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCtrlGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditCancelarItemChange(Sender: TObject);
    procedure EditCancelarItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvPesoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FecharVenda1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure CancelarItem1Click(Sender: TObject);
    procedure Buscar1Click(Sender: TObject);
    procedure Adicionais1Click(Sender: TObject);
    procedure CancelarVenda1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    vQtde_Simples,vQtde_Especial,vQtde_Mega:Real;
    { Public declarations }
  end;

var
  FrmListaAdicionais: TFrmListaAdicionais;

implementation

uses
  UDM, UPrincipal, UFechaVenda, UBuscaProduto, UAdicionais, UProdutos;

{$R *.dfm}

procedure TFrmListaAdicionais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := Cafree;
end;

procedure TFrmListaAdicionais.FormShow(Sender: TObject);
begin
  // Zera variaveis de adicionais, caso seja um novo kit (produto).
  {if not (FrmPrincipal.rxTemp.Locate('CODKIT', DM.ZProdutos.FieldByName('CODIGO').AsString,[])) then
  begin
     vQtde_Simples  :=  0;
     vQtde_Especial :=  0;
     vQtde_Mega     :=  0;
  end; }


    // Pega total da tela princippal
    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);

    DM.ZAdicionalSimples.Close;
    DM.ZAdicionalSimples.Open;

    DM.ZAdicionalEspecial.Close;
    DM.ZAdicionalEspecial.Open;

    DM.ZAdicionalMega.Close;
    DM.ZAdicionalMega.Open;

    //Exibe quantide de adicionais disponiveis para o kit (produto) selecionado.
    lbl1.Font.Color := clWhite;
    lbl1.Caption := FormatFloat('0',DM.ZProdutos.FieldByName('ADICIONAL_SIMPLES').AsFloat) +' Adicional Simples'+ ' Ou '+#13+
                    FormatFloat('0',DM.ZProdutos.FieldByName('ADICIONAL_ESPECIAL').AsFloat) + ' Adicional Especial'+ ' Ou '+#13+
                    FormatFloat('0',DM.ZProdutos.FieldByName('ADICIONAL_ESPECIAL').AsFloat) +' Adicional Mega';

    lbl2.Caption := DM.ZProdutos.FieldByName('DESCRICAO').AsString;


    pnlAdicionalSimples.Caption := 'ADICIONAIS SIMPLES '+' - '+FormatFloat('R$ ###,###,##0.00',DM.ZAdicionalSimples.FieldByName('VALOR').AsFloat);
    pnlAdicionalEspecial.Caption := 'ADICIONAIS ESPECIAIS '+' - '+FormatFloat('R$ ###,###,##0.00',DM.ZAdicionalEspecial.FieldByName('VALOR').AsFloat);
    pnlAdicionalMega.Caption := 'ADICIONAIS MEGA '+' - '+FormatFloat('R$ ###,###,##0.00',DM.ZAdicionalMega.FieldByName('VALOR').AsFloat);
end;

procedure TFrmListaAdicionais.DBCtrlGrid2Click(Sender: TObject);
begin
    vQtde_Simples := vQtde_Simples + 1;
    
    //if FrmPrincipal.rxTemp.Locate('CODIGO;ADICIONAL', VarArrayOf([DM.ZProdutos.FieldByName('CODIGO').AsString,'S']), []) then
    //  FrmPrincipal.rxTemp.Edit
    //else
      FrmPrincipal.rxTemp.Append;

   // if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
   FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

    FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZAdicionalSimples.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('CODKIT').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZAdicionalSimples.FieldByName('DESCRICAO').AsString;

    if (vQtde_Simples > DM.ZProdutos.FieldByName('ADICIONAL_SIMPLES').AsFloat)or
       (vQtde_Especial > DM.ZProdutos.FieldByName('ADICIONAL_ESPECIAL').AsFloat) then
      FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := DM.ZAdicionalSimples.FieldByName('VALOR').AsFloat
    else
        if (vQtde_Simples <= DM.ZProdutos.FieldByName('ADICIONAL_SIMPLES').AsFloat)or
       (vQtde_Especial <= DM.ZProdutos.FieldByName('ADICIONAL_ESPECIAL').AsFloat) then
       FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := 0;


    //if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
    FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;


    FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := 1;//FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat + 1;

    if FrmPrincipal.rxTemp.State in [dsEdit] then
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := (DM.ZAdicionalSimples.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat)
    else
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := DM.ZAdicionalSimples.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat;

    FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);

    FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString := 'S';
    FrmPrincipal.rxTemp.Post;

    FrmPrincipal.rxTemp.First;

end;

procedure TFrmListaAdicionais.FormCreate(Sender: TObject);
begin
    vQtde_Simples   :=  0;
    vQtde_Especial  :=  0;
    vQtde_Mega      :=  0;
end;

procedure TFrmListaAdicionais.DBCtrlGrid1Click(Sender: TObject);
begin
    vQtde_Especial := vQtde_Especial + 1;
    
    //if FrmPrincipal.rxTemp.Locate('CODIGO', DM.ZProdutos.FieldByName('CODIGO').AsString, []) then
    //  FrmPrincipal.rxTemp.Edit
   // else
      FrmPrincipal.rxTemp.Append;

    //if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
      FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

    FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZAdicionalEspecial.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('CODKIT').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZAdicionalEspecial.FieldByName('DESCRICAO').AsString;

    if (vQtde_Simples > DM.ZProdutos.FieldByName('ADICIONAL_SIMPLES').AsFloat)or
       (vQtde_Especial > DM.ZProdutos.FieldByName('ADICIONAL_ESPECIAL').AsFloat) then
      FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := DM.ZAdicionalEspecial.FieldByName('VALOR').AsFloat
    else
       FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := 0;


   // if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
   FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;


    FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := 1;//FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat + 1;

    if FrmPrincipal.rxTemp.State in [dsEdit] then
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := (DM.ZAdicionalEspecial.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat)
    else
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := DM.ZAdicionalEspecial.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat;

    FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);

    FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString := 'S';
    FrmPrincipal.rxTemp.Post;
    FrmPrincipal.rxTemp.First;
end;

procedure TFrmListaAdicionais.DBCtrlGrid3Click(Sender: TObject);
begin
    vQtde_Mega := vQtde_Mega + 1;
    
    //if FrmPrincipal.rxTemp.Locate('CODIGO', DM.ZProdutos.FieldByName('CODIGO').AsString, []) then
   //   FrmPrincipal.rxTemp.Edit
   // else
      FrmPrincipal.rxTemp.Append;

    //if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
      FrmPrincipal.VItem := FrmPrincipal.VItem + 1;

    FrmPrincipal.rxTemp.FieldByName('CODIGO').AsInteger := DM.ZAdicionalMega.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('CODKIT').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmPrincipal.rxTemp.FieldByName('DESCRICAO').AsString := DM.ZAdicionalMega.FieldByName('DESCRICAO').AsString;

    
    if (vQtde_Simples > DM.ZProdutos.FieldByName('ADICIONAL_SIMPLES').AsFloat)or
       (vQtde_Especial > DM.ZProdutos.FieldByName('ADICIONAL_ESPECIAL').AsFloat) or
       (vQtde_Mega > DM.ZProdutos.FieldByName('ADICIONAL_MEGA').AsFloat)then
      FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := DM.ZAdicionalMega.FieldByName('VALOR').AsFloat
    else
       FrmPrincipal.rxTemp.FieldByName('VALOR').AsFloat := 0;


    //if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
    FrmPrincipal.rxTemp.FieldByName('ITEM').AsInteger := FrmPrincipal.VItem;


    FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat := 1;//FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat + 1;

    if FrmPrincipal.rxTemp.State in [dsEdit] then
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := (DM.ZAdicionalMega.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat)
    else
      FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat := DM.ZAdicionalMega.FieldByName('VALOR').AsFloat * FrmPrincipal.rxTemp.FieldByName('QTDE').AsFloat;

    FrmPrincipal.VTotalGeral := FrmPrincipal.VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral);

    FrmPrincipal.rxTemp.FieldByName('ADICIONAL').AsString := 'S';
    FrmPrincipal.rxTemp.Post;
    FrmPrincipal.rxTemp.First;
end;

procedure TFrmListaAdicionais.btnFinalizarVendaClick(Sender: TObject);
begin
  FrmFechamentoVenda := TFrmFechamentoVenda.Create(Application);
  FrmFechamentoVenda.ShowModal;
end;

procedure TFrmListaAdicionais.btnCancelarItemClick(Sender: TObject);
begin
  PCancelaItem.Visible := True;
  EditCancelarItem.SetFocus;
end;

procedure TFrmListaAdicionais.btnBuscarClick(Sender: TObject);
begin
  FrmBuscarProdutos := TFrmBuscarProdutos.Create(Self);
  FrmBuscarProdutos.ShowModal;
  DBCtrlGrid1.SetFocus;
end;

procedure TFrmListaAdicionais.btnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmListaAdicionais.btnAdicionaisClick(Sender: TObject);
begin
  FrmAdicionais := TFrmAdicionais.Create(Application);
  FrmAdicionais.ShowModal;
end;

procedure TFrmListaAdicionais.btnCancelarVendaClick(Sender: TObject);
begin
  if Application.MessageBox('Cancelar Venda?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
  begin
    FrmPrincipal.rxTemp.EmptyTable;
    FrmPrincipal.VTotalGeral          := 0;
    FrmPrincipal.VItem                := 0;
    FrmPrincipal.rxTotal.Caption      := 'R$ 0.00';
    rxTotal.Caption                   := 'R$ 0.00';
   // DBCtrlGrid2.SetFocus;
    Close;
    FrmProdutos.Close;

    //if FrmPrincipal = nil then
   // FrmPrincipal := TFrmPrincipal.Create(Application);

   // FrmPrincipal.ShowModal;
  end;
end;

procedure TFrmListaAdicionais.FormKeyDown(Sender: TObject; var Key: Word;
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
    
end;

procedure TFrmListaAdicionais.DBCtrlGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    DBCtrlGrid2Click(Sender);
end;

procedure TFrmListaAdicionais.DBCtrlGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    DBCtrlGrid2Click(Sender);
end;

procedure TFrmListaAdicionais.DBCtrlGrid3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    DBCtrlGrid3Click(Sender);
end;

procedure TFrmListaAdicionais.EditCancelarItemChange(Sender: TObject);
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

procedure TFrmListaAdicionais.EditCancelarItemKeyDown(Sender: TObject;
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

procedure TFrmListaAdicionais.jvPesoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {if (KEY = VK_RETURN) then
  begin
    if FrmPrincipal.rxTemp.Locate('CODIGO', DM.ZProdutos.FieldByName('CODIGO').AsString, []) then
      FrmPrincipal.rxTemp.Edit
    else
      FrmPrincipal.rxTemp.Append;

    if not (FrmPrincipal.rxTemp.State in [dsEdit]) then
      FrmPrincipal.VItem := VItem + 1;

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

    VTotalGeral := VTotalGeral + FrmPrincipal.rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    FrmPrincipal.rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;

    FrmPrincipal.rxTemp.Post;

    //FBaixaEstoqueProd(jvPeso.Value,ZProdutos.FieldByName('CODIGO').AsInteger); //Baixa Estoque

    pnlPeso.Visible := False;
    DBCtrlGrid1.SetFocus;
    Exit;
  end;}
end;

procedure TFrmListaAdicionais.FecharVenda1Click(Sender: TObject);
begin
  FrmFechamentoVenda := TFrmFechamentoVenda.Create(Application);
  FrmFechamentoVenda.ShowModal;
end;

procedure TFrmListaAdicionais.Sair1Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmListaAdicionais.CancelarItem1Click(Sender: TObject);
begin
  PCancelaItem.Visible := True;
  EditCancelarItem.SetFocus;
end;

procedure TFrmListaAdicionais.Buscar1Click(Sender: TObject);
begin
  FrmBuscarProdutos := TFrmBuscarProdutos.Create(Self);
  FrmBuscarProdutos.ShowModal;
  DBCtrlGrid1.SetFocus;
end;

procedure TFrmListaAdicionais.Adicionais1Click(Sender: TObject);
begin
  FrmAdicionais := TFrmAdicionais.Create(Application);
  FrmAdicionais.ShowModal;
end;

procedure TFrmListaAdicionais.CancelarVenda1Click(Sender: TObject);
begin
  if Application.MessageBox('Cancelar Venda?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
  begin
    FrmPrincipal.rxTemp.EmptyTable;
    FrmPrincipal.VTotalGeral          := 0;
    FrmPrincipal.VItem                := 0;
    FrmPrincipal.rxTotal.Caption      := 'R$ 0.00';
    rxTotal.Caption                   := 'R$ 0.00';
    DBCtrlGrid2.SetFocus;
  end;
end;

procedure TFrmListaAdicionais.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    btnSairClick(Sender);
    Key := #0;
  end;
end;

end.
