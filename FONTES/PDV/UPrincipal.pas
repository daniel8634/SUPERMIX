unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, dbcgrids, ZAbstractConnection,
  ZConnection, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, DBCtrls,
  jpeg, Grids, DBGrids, RxMemDS, Buttons, Mask, rxToolEdit, rxCurrEdit,
  sSkinManager, sButton, LMDCustomButton, LMDButton, sPanel, sEdit,
  Wwdbigrd, Wwdbgrid, UCBase, UCDataConnector, UCZEOSConn, Menus,
  JvExStdCtrls, JvEdit, JvValidateEdit, RDprint;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    rxTemp: TRxMemoryData;
    rxTempITEM: TIntegerField;
    rxTempDESCRICAO: TStringField;
    rxTempVALOR: TFloatField;
    rxTempTOTAL: TFloatField;
    dsTemp: TDataSource;
    rxTempQTDE: TFloatField;
    rxTempCODIGO: TIntegerField;
    rxTempADICIONAL: TStringField;
    sSkinManager1: TsSkinManager;
    btnFinalizarVenda: TsButton;
    btnBuscar: TsButton;
    btnSair: TsButton;
    Panel4: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Image1: TImage;
    PCancelaItem: TPanel;
    Panel5: TPanel;
    EditCancelarItem: TsEdit;
    Label1: TLabel;
    btnCancelarItem: TsButton;
    wwDBGrid1: TwwDBGrid;
    Panel6: TPanel;
    Label3: TLabel;
    rxTotal: TLabel;
    MainMenu1: TMainMenu;
    Usuarios1: TMenuItem;
    Cadastrar1: TMenuItem;
    AlterarSenha1: TMenuItem;
    rocarUsuario1: TMenuItem;
    pnlPeso: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    btnAdicionais: TsButton;
    btnCancelarVenda: TsButton;
    rxTempCODKIT: TIntegerField;
    UserControl1: TUserControl;
    UCZEOSConn1: TUCZEOSConn;
    btnRelVendaDia: TsButton;
    Relatorios1: TMenuItem;
    RDprint1: TRDprint;
    QryVendasDoDia: TZQuery;
    QryVendasDoDiaNOME_PGTO: TStringField;
    QryVendasDoDiaTOTAL: TFloatField;
    QryVendasDoDiaDATA_VENDA: TDateField;
    QryVendasDoDiaDESCONTO: TFloatField;
    jvPeso: TRxCalcEdit;
    procedure FormCreate(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
      Index: Integer);
    procedure DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFinalizarVendaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure ZAdosAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure EditCancelarItemChange(Sender: TObject);
    procedure EditCancelarItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure jvPesoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvPesoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAdicionaisClick(Sender: TObject);
    procedure btnCancelarVendaClick(Sender: TObject);
    function SerialNum(FDrive: string): string;
    function Cript(Action, Src: string): string;
    function DiaExtenso(dData: TDateTime): string;
    //procedure sButton1Click(Sender: TObject);
    procedure PRelVendaDia;
    procedure btnRelVendaDiaClick(Sender: TObject);
    procedure RDprint1BeforeNewPage(Sender: TObject; Pagina: Integer);
    procedure RDprint1BeforePrint(Sender: TObject; var Continuar: Boolean);
    procedure RDprint1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    VItem: Integer;
    VTotalGeral: Real;
    function FBaixaEstoqueProd(VQuantidade: Real; VCodProduto: Integer): Boolean;
    function FBaixaEstoqueAdicional(VQuantidade: Real; vCodAdicional: Integer): Boolean;

    function FDevolveEstoqueProd(VQuantidade: Real; VCodProduto: Integer): Boolean;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UFechaVenda, UDM, UAdicionais, Math, uResolucao, UBuscaProduto,
  URegistro, UProdutos;

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  VArquivo: TextFile;
  VLinha, VRetorno: string;
  vArq:TStringList;
  vIndice:Integer;
  vDiasPassado,VQTDAtual:Real;
begin
  //Resolucao(self);

    UserControl1.UserSettings.WindowsPosition := poScreenCenter;
    //VCaminho := ExtractFilePath(Application.ExeName);

    if FileExists('C:\CONTROLD\SUPERMIX\SUPFile.dll') then
    begin
      try
      vArq := TStringList.Create;
      vArq.LoadFromFile('C:\CONTROLD\SUPERMIX\SUPFile.dll');

      for vIndice := 0 to vArq.Count - 1 do
      begin
          if vArq.Count = 1 then
          begin
            vArq.Add(FrmPrincipal.CRIPT('C',DateToStr(Date))); // Data Instalação
            vArq.Add(FrmPrincipal.CRIPT('C',DateToStr(Date))); // Data Atual
          end;
      end;

      VRetorno := FrmPrincipal.CRIPT('D', vArq.Strings[0]); //VLinha;
      if (VRetorno <> SerialNum('C')) then
      begin
          Application.MessageBox(PChar('Sistema não registrado para este terminal. ' + #13 +
                                   'Entre em contato com o suporte da CONTROLD INFORMÁTICA'),
                                   'Atenção', MB_ICONINFORMATION + mb_ok);
          Application.Terminate;
      end;

      VQTDAtual := StrToDate(FrmPrincipal.CRIPT('D',vArq.Strings[1])) - StrToDate(FrmPrincipal.CRIPT('D',vArq.Strings[2]));
      vArq.Add(FrmPrincipal.CRIPT('C',FloatToStr(VQTDAtual))); // Quantidade atual de dias
      vDiasPassado := VQTDAtual + 1;
      if VQTDAtual = 0 then VQTDAtual := 1;

      vArq.Add(FrmPrincipal.CRIPT('C',FloatToStr(vDiasPassado))); // Dias Passados

      if vDiasPassado < VQTDAtual then
      begin
          Application.MessageBox(PWideChar('Violação de licença ao acessar o sistema.'+#13+
                                           'Entre em contato com o suporte da CONTROLD.'+#13+
                                           'Tel.: (31) 3397 - 6524 '+#13+
                                           'E-mail: controldinformatica@gmail.com'),'Informaçao',
                             MB_ICONWARNING+MB_OK);

          Application.Terminate;

      end;

      if vDiasPassado > 365 then
      begin
          Application.MessageBox(PWideChar('Licença anual do sistema expirada.'+#13+
                                           'Entre em contato com o suporte da CONTROLD, '+#13+
                                           'para renovação anual da licença.'+#13+
                                           'Tel.: (31) 3397 - 6524 '+#13+
                                           'E-mail: controldinformatica@gmail.com'),'Informaçao',
                             MB_ICONWARNING+MB_OK);
          Application.Terminate;
      end;
      vArq.SaveToFile('C:\CONTROLD\SUPERMIX\SUPFile.dll');
      vArq.Free;
      except on E:Exception do
      begin
        Application.MessageBox('Erro ao iniciar sistema de licenças.','Informação',MB_ICONWARNING+MB_OK);
        Application.Terminate;
      end;
      end;
    end
    else
    begin
        FrmAtivar := TFrmAtivar.Create(Application);
        FrmAtivar.ShowModal;
    end;

end;

procedure TFrmPrincipal.DBCtrlGrid1Click(Sender: TObject);
begin
  Panel3.Caption := '';

  DM.ZProdutos.Close;
  dm.ZProdutos.SQL.Clear;
  DM.ZProdutos.SQL.Add(' SELECT * FROM PRODUTOS');
  DM.ZProdutos.SQL.Add(' WHERE CODCATEGORIA =:pcategoria');
  DM.ZProdutos.ParamByName('pcategoria').AsInteger := dm.ZCategorias.FieldByName('CODIGO').AsInteger;
  DM.ZProdutos.Open;

  if DM.ZProdutos.IsEmpty then
  begin
    Application.MessageBox('Categoria sem produto!', 'Informação', mb_iconinformation + mb_ok);
    Exit;
  end
  else
  begin
    if FrmProdutos = nil then
      FrmProdutos := TFrmProdutos.Create(Application);
    FrmProdutos.ShowModal;
  end;


    //Se produto tiver peso
  {if ZProdutos.FieldByName('PESO_LIQUIDO').AsFloat > 0 then
  begin
    pnlPeso.Visible := True;
    jvPeso.SetFocus;
  end
  else
  begin
    if rxTemp.Locate('CODIGO', ZProdutos.FieldByName('CODIGO').AsString, []) then
      rxTemp.Edit
    else
      rxTemp.Append;

    if not (rxTemp.State in [dsEdit]) then
      VItem := VItem + 1;

    rxTemp.FieldByName('CODIGO').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
    rxTemp.FieldByName('CODKIT').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
    rxTemp.FieldByName('DESCRICAO').AsString := ZProdutos.FieldByName('DESCRICAO').AsString;
    rxTemp.FieldByName('VALOR').AsFloat := ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
    if not (rxTemp.State in [dsEdit]) then
      rxTemp.FieldByName('ITEM').AsInteger := VItem;


    rxTemp.FieldByName('QTDE').AsFloat := rxTemp.FieldByName('QTDE').AsFloat + 1;

    if rxTemp.State in [dsEdit] then
      rxTemp.FieldByName('TOTAL').AsFloat := (ZProdutos.FieldByName('VALOR_VENDA').AsFloat * rxTemp.FieldByName('QTDE').AsFloat)
    else
      rxTemp.FieldByName('TOTAL').AsFloat := ZProdutos.FieldByName('VALOR_VENDA').AsFloat * rxTemp.FieldByName('QTDE').AsFloat;

    VTotalGeral := VTotalGeral + rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;

    rxTemp.Post;

    //FBaixaEstoqueProd(1,ZProdutos.FieldByName('CODIGO').AsInteger); //Baixa Estoque

    DM.ZAdicionais_Prod.Close;
    DM.ZAdicionais_Prod.SQL.Clear;
    DM.ZAdicionais_Prod.SQL.Add('select');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.descricao,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.valor,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.estoque,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.unidade,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.peso_liquido,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.peso_bruto,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais_prod.codprod,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais_prod.codadicional');
    DM.ZAdicionais_Prod.SQL.Add('from adicionais_prod');
    DM.ZAdicionais_Prod.SQL.Add('inner join adicionais on (adicionais_prod.codadicional = adicionais.codigo)');
    DM.ZAdicionais_Prod.SQL.Add('where');
    DM.ZAdicionais_Prod.SQL.Add('(');
    DM.ZAdicionais_Prod.SQL.Add('  (codprod = :pcodigo_prod)');
    DM.ZAdicionais_Prod.SQL.Add(')');
    DM.ZAdicionais_Prod.ParamByName('pcodigo_prod').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;

    DM.ZAdicionais_Prod.Open;


    if not (DM.ZAdicionais_Prod.IsEmpty) then
    begin
      DM.ZAdicionais_Prod.First;
      while not (DM.ZAdicionais_Prod.eof) do
      begin

        rxTemp.Append;

        if not (rxTemp.State in [dsEdit]) then
          VItem := VItem + 1;

        rxTemp.FieldByName('CODIGO').AsInteger := DM.ZAdicionais_Prod.FieldByName('CODADICIONAL').AsInteger;
        rxTemp.FieldByName('DESCRICAO').AsString := DM.ZAdicionais_Prod.FieldByName('DESCRICAO').AsString;
        rxTemp.FieldByName('CODKIT').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
        rxTemp.FieldByName('VALOR').AsFloat := 0; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
        rxTemp.FieldByName('ITEM').AsInteger := VItem;
        rxTemp.FieldByName('ADICIONAL').AsString := 'S';
        rxTemp.FieldByName('QTDE').AsFloat := 1;
        rxTemp.FieldByName('TOTAL').AsFloat := rxTemp.FieldByName('VALOR').AsFloat * rxTemp.FieldByName('QTDE').AsFloat;
        VTotalGeral := VTotalGeral + rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
        rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
        rxTemp.Post;
        DM.ZAdicionais_Prod.Next;
      end;
      {if Application.MessageBox('Deseja adicionais?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin
        FrmAdicionais := TFrmAdicionais.Create(Application);
        FrmAdicionais.ShowModal;
      end
      else
      begin
        DBCtrlGrid1.SetFocus;
        Exit;
      end;}
    //end;

  //end;

end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
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

  if Key = VK_F5 then
  begin
    btnRelVendaDiaClick(Sender);
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

procedure TFrmPrincipal.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if DM.ZCategorias.FieldByName('IMAGEM').AsString <> '' then
  begin
    if FileExists(DM.ZCategorias.FieldByName('IMAGEM').AsString) then
    begin
      Image1.Picture.LoadFromFile(DM.ZCategorias.FieldByName('IMAGEM').AsString);
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

//Image1.Picture.LoadFromFile(ZProdutos.FieldByName('IMAGEM').AsString);
end;

procedure TFrmPrincipal.DBCtrlGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    DBCtrlGrid1Click(Sender);

end;

procedure TFrmPrincipal.btnFinalizarVendaClick(Sender: TObject);
begin
  FrmFechamentoVenda := TFrmFechamentoVenda.Create(Application);
  FrmFechamentoVenda.ShowModal;
end;

procedure TFrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.btnBuscarClick(Sender: TObject);
begin
  FrmBuscarProdutos := TFrmBuscarProdutos.Create(Self);
  FrmBuscarProdutos.ShowModal;
  DBCtrlGrid1.SetFocus;
end;

procedure TFrmPrincipal.ZAdosAfterScroll(DataSet: TDataSet);
begin
  {DM.ZAdicionais_Prod.Close;
  DM.ZAdicionais_Prod.SQL.Clear;

  DM.ZAdicionais_Prod.Close;
  DM.ZAdicionais_Prod.SQL.Clear;
  DM.ZAdicionais_Prod.SQL.Add('select');
  DM.ZAdicionais_Prod.SQL.Add('adicionais.descricao,');
  DM.ZAdicionais_Prod.SQL.Add('adicionais.valor,');
  DM.ZAdicionais_Prod.SQL.Add('adicionais.estoque,');
  DM.ZAdicionais_Prod.SQL.Add('adicionais.unidade,');
  DM.ZAdicionais_Prod.SQL.Add('adicionais.peso_liquido,');
  DM.ZAdicionais_Prod.SQL.Add('adicionais.peso_bruto,');
  DM.ZAdicionais_Prod.SQL.Add('adicionais_prod.codprod,');
  DM.ZAdicionais_Prod.SQL.Add('adicionais_prod.codadicional');
  DM.ZAdicionais_Prod.SQL.Add('from adicionais_prod');
  DM.ZAdicionais_Prod.SQL.Add('inner join adicionais on (adicionais_prod.codadicional = adicionais.codigo)');
  DM.ZAdicionais_Prod.SQL.Add('where');
  DM.ZAdicionais_Prod.SQL.Add('(');
  DM.ZAdicionais_Prod.SQL.Add('  (codprod = :pcodigo_prod)');
  DM.ZAdicionais_Prod.SQL.Add(')');
  DM.ZAdicionais_Prod.ParamByName('pcodigo_prod').AsInteger := DM.ZProdutos.FieldByName('CODIGO').AsInteger;


  DM.ZAdicionais_Prod.ParamByName('pcodigo_prod').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
  DM.ZAdicionais_Prod.Open;}
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
var
  VArquivo: TextFile;
  VLinha, VRetorno: string;
begin
// Inicio validação

    // Verifica se tem arquivo de registro, caso tenha é registrado entao verificar serialhd,
    //pra ver se  maquina é liberada pra uso.

 // VLinha := '';
  if FileExists('C:\CONTROLD\SUPERMIX\SUPFile.dll') then
  begin
    AssignFile(VArquivo, 'C:\CONTROLD\SUPERMIX\SUPFile.dll');
    Reset(VArquivo);
    while not eof(VArquivo) do
    begin
      ReadLn(VArquivo, VLinha);
      VRetorno := FrmPrincipal.CRIPT('D', VLinha); //VLinha;
    end;
    if (VRetorno <> SerialNum('C')) then
    begin
      Application.MessageBox(PChar('Sistema não registrado para este terminal. ' + #13 +
        'Entre em contato com o suporte da CONTROLD INFORMÁTICA'),
        'Atenção', MB_ICONINFORMATION + mb_ok);
      Application.Terminate;
    end;
    //else
    //begin
   //   FrmAtivar := TFrmAtivar.Create(Application);
     // FrmAtivar.ShowModal;

  end
  else
  begin
    FrmAtivar := TFrmAtivar.Create(Application);
    FrmAtivar.ShowModal;
  end;

  DM.ZProdutos.Close;
  DM.ZProdutos.SQL.Clear;
  DM.ZProdutos.SQL.Add('  SELECT * FROM  PRODUTOS ');
  //ZProdutos.SQL.Add('  WHERE BARATO_DIA=:PBARATODIA AND');
  //ZProdutos.SQL.Add('  BARATO_DIA=:PSELECIONE OR BARATO_DIA IS NULL');
  //ZProdutos.SQL.Add(' ORDER BY BARATO_DIA ASC');
  //ZProdutos.ParamByName('PBARATODIA').AsString := DiaExtenso(Now);
  //ZProdutos.ParamByName('PSELECIONE').AsString := 'Selecione';
  DM.ZProdutos.SQL.Add(' ORDER BY BARATO_DIA ASC');

  DM.ZCategorias.Close;
  DM.ZCategorias.Open;

  DM.ZProdutos.Open;
  rxTemp.Open;

  //dbimage1.Picture.LoadFromFile(ZProdutos.fieldbyname('imagem').AsString);


  VItem := 0;
  VTotalGeral := 0;
end;

procedure TFrmPrincipal.EditCancelarItemChange(Sender: TObject);
begin
  if rxTemp.Locate('ITEM', EditCancelarItem.Text, []) then
  begin
       // EditCancelarItemKeyDown(Sender,VK_RETURN, );
  end
  else
  begin
    Application.MessageBox('Item não encontrado.', 'Informação', mb_iconinformation + mb_ok);
    EditCancelarItem.SetFocus;
  end;
end;

procedure TFrmPrincipal.EditCancelarItemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if Application.MessageBox(PChar('Cancelar Item ' + #13 +
      'Item: ' + rxTemp.FieldByName('ITEM').AsString + ' - ' +
      rxTemp.FieldByName('DESCRICAO').AsString + ' ? '), 'Confirmação', mb_iconquestion + mb_yesno) = id_yes then
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

      VTotalGeral := VTotalGeral - rxTemp.FieldByName('TOTAL').AsFloat;
      rxTemp.Delete;
      rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', VTotalGeral);
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

procedure TFrmPrincipal.btnCancelarItemClick(Sender: TObject);
begin
  PCancelaItem.Visible := True;
  EditCancelarItem.SetFocus;
end;

procedure TFrmPrincipal.jvPesoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {if (KEY = VK_ESCAPE) then
  begin
    jvPeso.Clear;
    pnlPeso.Visible := False;
  end;}

  {if (KEY = VK_RETURN) then
  begin
    if rxTemp.Locate('CODIGO', ZProdutos.FieldByName('CODIGO').AsString, []) then
      rxTemp.Edit
    else
      rxTemp.Append;

    if not (rxTemp.State in [dsEdit]) then
      VItem := VItem + 1;

    rxTemp.FieldByName('CODIGO').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
    rxTemp.FieldByName('CODKIT').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
    rxTemp.FieldByName('DESCRICAO').AsString := ZProdutos.FieldByName('DESCRICAO').AsString;
    rxTemp.FieldByName('VALOR').AsFloat := ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
    if not (rxTemp.State in [dsEdit]) then
      rxTemp.FieldByName('ITEM').AsInteger := VItem;


    rxTemp.FieldByName('QTDE').AsFloat := jvPeso.Value;

    if rxTemp.State in [dsEdit] then
      rxTemp.FieldByName('TOTAL').AsFloat := (ZProdutos.FieldByName('VALOR_VENDA').AsFloat * rxTemp.FieldByName('QTDE').AsFloat)
    else
      rxTemp.FieldByName('TOTAL').AsFloat := ZProdutos.FieldByName('VALOR_VENDA').AsFloat * rxTemp.FieldByName('QTDE').AsFloat;

    VTotalGeral := VTotalGeral + rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;

    rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;

    rxTemp.Post;

    //FBaixaEstoqueProd(jvPeso.Value,ZProdutos.FieldByName('CODIGO').AsInteger); //Baixa Estoque

    DM.ZAdicionais_Prod.Close;
    DM.ZAdicionais_Prod.SQL.Clear;
    DM.ZAdicionais_Prod.SQL.Add('select');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.descricao,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.valor,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.estoque,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.unidade,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.peso_liquido,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais.peso_bruto,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais_prod.codprod,');
    DM.ZAdicionais_Prod.SQL.Add('adicionais_prod.codadicional');
    DM.ZAdicionais_Prod.SQL.Add('from adicionais_prod');
    DM.ZAdicionais_Prod.SQL.Add('inner join adicionais on (adicionais_prod.codadicional = adicionais.codigo)');
    DM.ZAdicionais_Prod.SQL.Add('where');
    DM.ZAdicionais_Prod.SQL.Add('(');
    DM.ZAdicionais_Prod.SQL.Add('  (codprod = :pcodigo_prod)');
    DM.ZAdicionais_Prod.SQL.Add(')');
    DM.ZAdicionais_Prod.ParamByName('pcodigo_prod').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;

    DM.ZAdicionais_Prod.Open;


    if not (DM.ZAdicionais_Prod.IsEmpty) then
    begin
      DM.ZAdicionais_Prod.First;
      while not (DM.ZAdicionais_Prod.eof) do
      begin

        rxTemp.Append;

        if not (rxTemp.State in [dsEdit]) then
          VItem := VItem + 1;

        rxTemp.FieldByName('CODIGO').AsInteger := DM.ZAdicionais_Prod.FieldByName('CODADICIONAL').AsInteger;
        rxTemp.FieldByName('CODKIT').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
        rxTemp.FieldByName('DESCRICAO').AsString := DM.ZAdicionais_Prod.FieldByName('DESCRICAO').AsString;
        rxTemp.FieldByName('VALOR').AsFloat := 0; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
        rxTemp.FieldByName('ITEM').AsInteger := VItem;
        rxTemp.FieldByName('ADICIONAL').AsString := 'S';
        rxTemp.FieldByName('QTDE').AsFloat := 1;
        rxTemp.FieldByName('TOTAL').AsFloat := rxTemp.FieldByName('VALOR').AsFloat * rxTemp.FieldByName('QTDE').AsFloat;
        VTotalGeral := VTotalGeral + rxTemp.FieldByName('TOTAL').AsFloat; //ZProdutos.FieldByName('VALOR_VENDA').AsFloat;
        rxTotal.Caption := FormatFloat('R$ ###,###,##0.00', FrmPrincipal.VTotalGeral); //rxTotal.Value  + VTotalGeral;
        rxTemp.Post;
        DM.ZAdicionais_Prod.Next;
      end;

      {if Application.MessageBox('Deseja adicionais?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin
        FrmAdicionais := TFrmAdicionais.Create(Application);
        FrmAdicionais.ShowModal;
      end
      else
      begin
        DBCtrlGrid1.SetFocus;
        Exit;
      end;}
   { end;}
   { pnlPeso.Visible := False;
    DBCtrlGrid1.SetFocus;
    Exit;
  end; }
end;

procedure TFrmPrincipal.jvPesoKeyPress(Sender: TObject; var Key: Char);
begin
  if (KEY = #27) then
  begin
    jvPeso.Clear;
    pnlPeso.Visible := False;
    DBCtrlGrid1.SetFocus;
    Exit;
  end;
end;

function TFrmPrincipal.FBaixaEstoqueProd(VQuantidade: Real; VCodProduto: Integer): Boolean;
var
  Tabela: TZQuery;
begin
  Tabela := TZQuery.Create(Self);
  Tabela.Connection := DM.Conexao;
  Tabela.Close;
  Tabela.SQL.Clear;
  Tabela.SQL.Add(' UPDATE PRODUTOS SET ESTOQUE=ESTOQUE - :PQUANTIDADE');
  Tabela.SQL.Add(' WHERE CODIGO =:PCODIGO');
  Tabela.ParamByName('PCODIGO').AsInteger := VCodProduto;
  Tabela.ParamByName('PQUANTIDADE').AsFloat := VQuantidade;
  Tabela.ExecSQL;
  Tabela.Free;
end;

function TFrmPrincipal.FDevolveEstoqueProd(VQuantidade: Real;
  VCodProduto: Integer): Boolean;
var
  Tabela: TZQuery;
begin
  Tabela := TZQuery.Create(Self);
  Tabela.Connection := DM.Conexao;
  Tabela.Close;
  Tabela.SQL.Clear;
  Tabela.SQL.Add(' UPDATE PRODUTOS SET ESTOQUE=ESTOQUE + :PQUANTIDADE');
  Tabela.SQL.Add(' WHERE CODIGO =:PCODIGO');
  Tabela.ParamByName('PCODIGO').AsInteger := VCodProduto;
  Tabela.ParamByName('PQUANTIDADE').AsFloat := VQuantidade;
  Tabela.ExecSQL;
  Tabela.Free;

end;

procedure TFrmPrincipal.btnAdicionaisClick(Sender: TObject);
begin
  FrmAdicionais := TFrmAdicionais.Create(Application);
  FrmAdicionais.ShowModal;
end;

procedure TFrmPrincipal.btnCancelarVendaClick(Sender: TObject);
begin
  if Application.MessageBox('Cancelar Venda?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
  begin
    rxTemp.EmptyTable;
    FrmPrincipal.VTotalGeral := 0;
    FrmPrincipal.VItem := 0;
    FrmPrincipal.rxTotal.Caption := '0.00';
    DBCtrlGrid1.SetFocus;
  end;
end;

function TFrmPrincipal.SerialNum(FDrive: string): string;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: array[0..11] of Char;
begin
  try GetVolumeInformation(PChar(FDrive + ':\'), dLabel, 12, @Serial, DirLen, Flags, nil, 0);
    Result := IntToHex(Serial, 8);
  except Result := '';
  end;

end;

function TFrmPrincipal.Cript(Action, Src: string): string;
label Fim;
var KeyLen: Integer;
  KeyPos: Integer;
  OffSet: Integer;
  Dest, Key: string;
  SrcPos: Integer;
  SrcAsc: Integer;
  TmpSrcAsc: Integer;
  Range: Integer;
begin
  if (Src = '') then
  begin
    Result := '';
    goto Fim;
  end;
  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
//  Key := 'YUQL%%$#%3DF#0WI5E$JA$46#NM@XXL6JAOAUW%$#@0AOMM4$4VZYW&&HJUI23@7E%#@!DF34#4SKL K3LA@DJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x', [OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x', [SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  else
    if (Action = UpperCase('D')) then
    begin
      OffSet := StrToInt('$' + copy(Src, 1, 2));
      SrcPos := 3;
      repeat
        SrcAsc := StrToInt('$' + copy(Src, SrcPos, 2));
        if (KeyPos < KeyLen) then KeyPos := KeyPos + 1 else KeyPos := 1;
        TmpSrcAsc := SrcAsc xor Ord(Key[KeyPos]);
        if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
        else TmpSrcAsc := TmpSrcAsc - OffSet;
        Dest := Dest + Chr(TmpSrcAsc);
        OffSet := SrcAsc;
        SrcPos := SrcPos + 2;
      until (SrcPos >= Length(Src));
    end;
  Result := Dest;
  Fim:


end;

function TFrmPrincipal.DiaExtenso(dData: TDateTime): string;
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

function TFrmPrincipal.FBaixaEstoqueAdicional(VQuantidade: Real;
  vCodAdicional: Integer): Boolean;
var
  Tabela: TZQuery;
begin
  Tabela := TZQuery.Create(Self);
  Tabela.Connection := DM.Conexao;
  Tabela.Close;
  Tabela.SQL.Clear;
  Tabela.SQL.Add(' UPDATE ADICIONAIS SET ESTOQUE=ESTOQUE - :PQUANTIDADE');
  Tabela.SQL.Add(' WHERE CODIGO =:PCODIGO');
  Tabela.ParamByName('PCODIGO').AsInteger := vCodAdicional;
  Tabela.ParamByName('PQUANTIDADE').AsFloat := VQuantidade;
  Tabela.ExecSQL;
  Tabela.Free;
end;

procedure TFrmPrincipal.PRelVendaDia;
var
  total_dinheiro, total_cartao, total_desconto, total_venda, total_venda2,total_geral: currency;
  linha: integer;
  traco, vPGTO: string;
begin
  linha := 1;
  Traco := '---------------------------------------------';
     // Parametros para o CUPOM FISCAL
  rdprint1.TamanhoQteLinhas := 1; // Linhas (deve ser 1 quando for CUPOM)
  rdprint1.TamanhoQteColunas := 48; // Largura da Bobina aprox. 7 cm (7 / 2.54 * 20)
  RDprint1.Acentuacao := SemAcento;
  RDprint1.MostrarProgresso := false;
     //rdprint1.FonteTamanhoPadrao    := S10cpp;//s20cpp; // Fonte Comprimido em 20 cpp
  rdprint1.OpcoesPreview.Preview := false;




     // Cabeçalho do Cupom...
  with rdprint1 do
  begin
    abrir;

    RDprint1.Imp(Linha, 01, '---------------------------------------------');
    inc(Linha);
    RDprint1.Imp(Linha, 01, '         VENDAS DO DIA        ');
    inc(Linha);
    RDprint1.Imp(Linha, 01, '---------------------------------------------');
    inc(Linha);
//    RDprint1.Imp(Linha, 01, '            ESTACAO ACAI                ');
    RDprint1.Imp(Linha, 01, '            '+dm.ZEmpresa.FieldByName('RAZAO_SOCIAL').AsString);
    inc(Linha);
    RDprint1.Impc(Linha, 01, '                ' + datetimetostr(now), [negrito]);
    inc(Linha);
    RDprint1.Imp(Linha, 01, '---------------------------------------------');
  end;

  QryVendasDoDia.Close;
  QryVendasDoDia.SQL.Clear;

  QryVendasDoDia.SQL.Add('SELECT SUM(DESCONTO) AS DESCONTO, CAST(DATA_VENDA AS DATE) AS DATA_VENDA,NOME_PGTO,SUM(TOTAL) AS TOTAL FROM VENDAS');
  QryVendasDoDia.SQL.Add('WHERE CAST(DATA_VENDA AS DATE) >=:D1 AND CAST(DATA_VENDA AS DATE) <=:D2');

  QryVendasDoDia.SQL.Add('GROUP BY CAST(DATA_VENDA AS DATE),NOME_PGTO');
  QryVendasDoDia.SQL.Add('ORDER BY NOME_PGTO ASC');
  //QryVendasDoDia.SQL.Add('SELECT * FROM VENDAS');
  //QryVendasDoDia.SQL.Add(' WHERE CAST(DATA_VENDA AS DATE) >=:D1 AND CAST(DATA_VENDA AS DATE) <=:D2 ORDER BY NOME_PGTO ASC');
  QryVendasDoDia.ParamByName('D1').AsDate :=  Date;
  QryVendasDoDia.ParamByName('D2').AsDate := Date;
  QryVendasDoDia.Open;

  total_dinheiro := 0;
  total_cartao := 0;
  total_desconto := 0;
  total_geral    := 0;
  vPGTO := 'ABCD';

  QryVendasDoDia.First;
    //linha := 8;
  Inc(linha);
  while not QryVendasDoDia.eof do
  begin
       {if QryVendasDoDia.FieldByName('NOME_PGTO').AsString = 'DINHEIRO' then
         total_dinheiro := total_dinheiro + QryVendasDoDia.FieldByName('TOTAL').AsFloat;

       if QryVendasDoDia.FieldByName('NOME_PGTO').AsString = 'DEBITO' then
         total_cartao := total_cartao + QryVendasDoDia.FieldByName('TOTAL').AsFloat;
       }

    total_venda := total_venda + QryVendasDoDia.FieldByName('TOTAL').AsFloat;
    if QryVendasDoDia.FieldByName('NOME_PGTO').AsString <> vPGTO then
    begin
      if (QryVendasDoDia.FieldByName('NOME_PGTO').AsString = '') or
          (QryVendasDoDia.FieldByName('NOME_PGTO').IsNull) then
            RDPrint1.Impc(linha, 01, uppercase('OUTROS'), [negrito])
     else
        RDPrint1.Impc(linha, 01, uppercase(QryVendasDoDia.FieldByName('NOME_PGTO').AsString), [negrito]);
        
      RDprint1.impval(linha, 28, '###,###,##0.00', total_venda, [normal]);
      vPGTO := QryVendasDoDia.FieldByName('NOME_PGTO').AsString;
      total_venda := 0;
      //inc(linha);
      ///rdprint1.imp(linha, 01, '-------------------------------------------------');
      inc(linha);
    end;


    //RDprint1.imp(linha, 01, 'TOTAL VENDAS ' + QryVendasDoDia.FieldByName('NOME_PGTO').AsString + ' :');

    inc(linha);

     //vPGTO := QryVendasDoDia.FieldByName('NOME_PGTO').AsString;
    if QryVendasDoDia.FieldByName('DESCONTO').asFloat > 0 then
      total_desconto := total_desconto + QryVendasDoDia.FieldByName('DESCONTO').AsFloat;

    total_geral := total_geral + QryVendasDoDia.FieldByName('TOTAL').AsFloat;
    QryVendasDoDia.Next;
  end;

     // Imprime itens do pedido...

     // Parte final do Cupom... (daqui pra frente continuo incrementando a LINHA
  with rdprint1 do
  begin
        // Total...
        //imp(linha, 01, 'TOTAL VENDAS DINHEIRO: ');
       // impval(linha, 32, '###,###,##0.00', total_dinheiro, [normal]);
      //  inc(linha);
       // imp(linha, 01, 'TOTAL VENDAS CARTAO: ');
      //  impval(linha, 32, '###,###,##0.00', total_cartao, [normal]);
//        imp(linha, 01, ' ');
       // inc(linha);

    inc(linha);   
    rdprint1.imp(linha, 01, '-------------------------------------------------');
    inc(linha);
    imp(linha, 01, 'TOTAL DESCONTOS: ');
    impval(linha, 32, '###,###,##0.00', total_desconto, [normal]);
//        imp(linha, 01, ' ');
    inc(linha);

    imp(linha, 01, 'TOTAL GERAL: ');
    impval(linha, 32, '###,###,##0.00', total_geral, [normal]);
    inc(linha);
    inc(linha);
    inc(linha);
    inc(linha);
    imp(linha, 01, ' ');

        // Avança 7 linhas em Branco...
       // linha := linha + 2;
       // imp (linha,01,' '); // Para forçar impressão da página

   {===========================================================================}
   {        Mostra preview com tamanho variavel de um cupom nao Fiscal         }
   {                                                                           }
   {              ISTO NAO DEVERIA SER FEITO, NÃO ESTA PREVISTO NOS            }
   {               RECURSOS DO RDPRINT,  USE POR SUA CONTA E RISCO...          }
   {===========================================================================}
   {}rdprint1.OpcoesPreview.Preview := true; {}
   {}rdprint1.TamanhoQteLinhas := linha; // Qte de linhas do cupom {}
   {===========================================================================}

        //ImpASCII(01,01,'27,109');
    fechar;
  end;
    // Restaura valores normais para imprimir Cupom Não Fiscal...
  rdprint1.OpcoesPreview.Preview := false;
  rdprint1.TamanhoQteLinhas := 1;
end;

procedure TFrmPrincipal.btnRelVendaDiaClick(Sender: TObject);
begin
  PRelVendaDia;
end;

procedure TFrmPrincipal.RDprint1BeforeNewPage(Sender: TObject;
  Pagina: Integer);
begin
  RDprint1.Impressora := grafico;
end;

procedure TFrmPrincipal.RDprint1BeforePrint(Sender: TObject;
  var Continuar: Boolean);
begin
  RDprint1.Impressora := grafico;
end;

procedure TFrmPrincipal.RDprint1Preview(Sender: TObject);
begin
  RDprint1.Impressora := grafico;
end;

end.

