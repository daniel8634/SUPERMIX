unit UCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadPadrao, DB, StdCtrls, Buttons, sBitBtn, Grids, Wwdbigrd,
  Wwdbgrid, RzTabs, RzGroupBar, ComCtrls, Mask, DBCtrls, DBGrids, ExtCtrls,
  JvExMask, JvToolEdit, JvDBControls, ZSequence, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, JvComponentBase, JvEnterTab, JvBaseDlg,
  JvImageDlg, Jpeg, ExtDlgs, Printers, UCBase, JvBaseEdits, RxToolEdit,
  RxDBCtrl, RxCurrEdit;

type
  TFrmCadProduto = class(TFrmCadPadrao)
    dsAdicionais: TDataSource;
    dsAdicionais_Prod: TDataSource;
    ZProdutos: TZQuery;
    ZProdutosCODIGO: TIntegerField;
    ZProdutosDESCRICAO: TStringField;
    ZProdutosDATA_CADASTRO: TDateTimeField;
    ZProdutosVALOR_COMPRA: TFloatField;
    ZProdutosVALOR_VENDA: TFloatField;
    ZProdutosESTOQUE: TFloatField;
    ZAdicionais_Prod: TZQuery;
    ZAdicionais_ProdCODIGO: TIntegerField;
    ZAdicionais_ProdCODPROD: TIntegerField;
    ZAdicionais_ProdCODADICIONAL: TIntegerField;
    ZAdicionais_ProdDESCRICAO: TStringField;
    ZAdicionais_ProdESTOQUE: TFloatField;
    ZAdicionais_ProdVALOR: TFloatField;
    ZSeqAdicionais_Prod: TZSequence;
    dsProdutos: TDataSource;
    ZSeqProdutos: TZSequence;
    ZProdutosMARGEM_LUCRO: TFloatField;
    ZProdutosDT_ULT_COMPRA: TDateTimeField;
    ZProdutosDT_ULT_VENDA: TDateTimeField;
    ZProdutosPESO_BRUTO: TFloatField;
    ZProdutosPESO_LIQUIDO: TFloatField;
    ZProdutosUNIDADE: TStringField;
    ZAdicionais: TZQuery;
    ZAdicionaisCODIGO: TIntegerField;
    ZAdicionaisDESCRICAO: TStringField;
    ZAdicionaisVALOR: TFloatField;
    ZAdicionaisESTOQUE: TFloatField;
    ZAdicionaisUNIDADE: TStringField;
    ZAdicionaisDATA_CADASTRO: TDateTimeField;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel6: TPanel;
    Label18: TLabel;
    EditPesquisa: TEdit;
    RGCampos: TRadioGroup;
    btnBuscar: TBitBtn;
    UCControls1: TUCControls;
    ZProdutosBARATO_DIA: TStringField;
    ZProdutosIMAGEM: TStringField;
    ZCategorias: TZQuery;
    dsCategorias: TDataSource;
    ZCategoriasCODIGO: TIntegerField;
    ZCategoriasDESCRICAO: TStringField;
    ZProdutosCODCATEGORIA: TIntegerField;
    ZProdutosADICIONAL_SIMPLES: TFloatField;
    ZProdutosADICIONAL_ESPECIAL: TFloatField;
    ZProdutosADICIONAL_MEGA: TFloatField;
    pnl3: TPanel;
    lbl3: TLabel;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lblEstoque: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    dbedtCODIGO: TDBEdit;
    dbedtDESCRICAO: TDBEdit;
    dbedtMARGEM_LUCRO: TDBEdit;
    dbedtPESO_LIQUIDO: TDBEdit;
    dblkcbbCODCATEGORIA: TDBLookupComboBox;
    lbl11: TLabel;
    dbedtPESO_BRUTO: TDBEdit;
    lbl12: TLabel;
    dbcbbBARATO_DIA: TDBComboBox;
    lbl13: TLabel;
    dbcbbUNIDADE: TDBComboBox;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    grp1: TGroupBox;
    img1: TImage;
    pnl4: TPanel;
    btnAdicionarFoto: TSpeedButton;
    btnExcluirFoto: TSpeedButton;
    rgPossuiAdicionais: TRadioGroup;
    Label1: TLabel;
    ZProdutosPOSSUI_ADICIONAL: TStringField;
    TabSheet3: TRzTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    DBNavigator1: TDBNavigator;
    dsCombo: TDataSource;
    RxDBCalcEdit1: TRxDBCalcEdit;
    RxDBCalcEdit2: TRxDBCalcEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    dbedtEstoque: TRxDBCalcEdit;
    RxDBCalcEdit4: TRxDBCalcEdit;
    RxDBCalcEdit5: TRxDBCalcEdit;
    RxDBCalcEdit6: TRxDBCalcEdit;
    procedure btnNovoAdicionaisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarAdicionaisClick(Sender: TObject);
    procedure GridVisualizacaoDblClick(Sender: TObject);
    procedure btnAlterarAdicionaisClick(Sender: TObject);
    procedure btnExcluirAdicionaisClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure dbedtMARGEM_LUCROExit(Sender: TObject);
    procedure btnAdicionarFotoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dsProdutosStateChange(Sender: TObject);
    procedure btnExcluirFotoClick(Sender: TObject);
    procedure dsAdicionais_ProdStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure RGCamposClick(Sender: TObject);
    procedure btnCancelarAdicionaisClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

uses
  UDM, UPrincipal, ULocAdicionais, UCadCombo;

{$R *.dfm}

procedure TFrmCadProduto.btnNovoAdicionaisClick(Sender: TObject);
begin
  inherited;
  if ZProdutos.IsEmpty then
  begin
    Application.MessageBox('Cadastre um produto antes de incluir um item adicional!', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  if dbedtCODIGO.Text = '' then
  begin
    Application.MessageBox('Informe um produto!', 'Informação', MB_ICONINFORMATION + MB_OK);
    RzPageControl1.ActivePageIndex := 1;
    Exit;
  end;

  ZAdicionais_Prod.Close;
  ZAdicionais_Prod.SQL.Clear;
  ZAdicionais_Prod.SQL.Add('select');
  ZAdicionais_Prod.SQL.Add('adicionais_prod.codigo,');
  ZAdicionais_Prod.SQL.Add('adicionais_prod.codprod,');
  ZAdicionais_Prod.SQL.Add('adicionais_prod.codadicional');
   // DM.ZAdicionais_Prod.SQL.Add('adicionais.valor,      ');
   // DM.ZAdicionais_Prod.SQL.Add('adicionais.descricao,');
    //DM.ZAdicionais_Prod.SQL.Add('adicionais.estoque');
  ZAdicionais_Prod.SQL.Add('from adicionais_prod');
   // DM.ZAdicionais_Prod.SQL.Add('inner join adicionais_prod on (adicionais.codigo = adicionais_prod.codadicional)');
   // DM.ZAdicionais_Prod.SQL.Add('inner join produtos on (adicionais_prod.codprod = produtos.codigo)');
  ZAdicionais_Prod.SQL.Add('where ');
  ZAdicionais_Prod.SQL.Add('( ');
  ZAdicionais_Prod.SQL.Add('   (adicionais_prod.codprod = :pcod)');
  ZAdicionais_Prod.SQL.Add(') ');
  ZAdicionais_Prod.ParamByName('pcod').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
  ZAdicionais_Prod.Open;
  //Panel4.Enabled := True;
  ZAdicionais_Prod.Append;
  //DBLookupComboBox1.SetFocus;
end;

procedure TFrmCadProduto.FormCreate(Sender: TObject);
var
  VIndice: Integer;
begin
  ZAdicionais.Close;
  ZAdicionais.SQL.Clear;
  ZAdicionais.SQL.Add('SELECT * FROM ADICIONAIS');
  ZAdicionais.SQL.Add('ORDER BY DESCRICAO ASC');
  ZAdicionais.Open;

  ZProdutos.Close;
  ZProdutos.Open;



  //for VIndice := 0 to ZProdutos.FieldCount - 1 do
 // begin
  //  ComboBox1.Items.Add(ZProdutos.Fields[VIndice]);
 // end;

  inherited;
end;

procedure TFrmCadProduto.btnGravarAdicionaisClick(Sender: TObject);
begin
  inherited;
  {if DBLookupComboBox1.Text = '' then
  begin
    Application.MessageBox('Informe o adicional!','Informação',MB_ICONWARNING+MB_OK);
    DBLookupComboBox1.SetFocus;
    Exit;
  end;}

  if not (ZProdutos.IsEmpty) then
  begin
    ZAdicionais.Append;

    ZAdicionais_ProdCODPROD.AsInteger := ZProdutosCODIGO.AsInteger;
 //ZAdicionais_ProdCODADICIONAL.AsInteger := ZAdicionaisCODIGO.AsInteger;

    if Application.MessageBox('Incluir valor do adicional?', 'Confirmação', MB_ICONQUESTION + mb_yesno) = id_yes then
    begin
      if not (ZProdutos.State in [dsEdit, dsInsert]) then
        ZProdutos.Edit;

      ZProdutos.FieldByName('VALOR_VENDA').AsFloat := ZProdutos.FieldByName('VALOR_VENDA').AsFloat +
        ZAdicionais_Prod.FieldByName('VALOR').AsFloat;

      ZProdutos.Post;
      ZProdutos.ApplyUpdates;
    end;

    ZAdicionais_Prod.Post;
    ZAdicionais_Prod.ApplyUpdates;
    //ZAdicionais_Prod.Refresh;
  end
  else
  begin
    Application.MessageBox('Selecione/Busque um produtos antes de incluir um adicional!', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;
end;

procedure TFrmCadProduto.GridVisualizacaoDblClick(Sender: TObject);
begin
  inherited;
  if ZProdutos.FieldByName('ESTOQUE').AsFloat < 0 then
  begin
    lblEstoque.Font.Color := clRed;
    dbedtEstoque.Font.Color := clRed;
  end;

  if ZProdutos.FieldByName('ESTOQUE').AsFloat > 0 then
  begin
    lblEstoque.Font.Color := clGreen;
    dbedtEstoque.Font.Color := clGreen;
  end;

  if ZProdutos.FieldByName('IMAGEM').AsString <> '' then
  begin
    if FileExists(ZProdutos.FieldByName('IMAGEM').AsString) then
      img1.Picture.LoadFromFile(ZProdutos.FieldByName('IMAGEM').AsString)
    else
      img1.Picture := nil;
  end
  else
  begin
    img1.Picture := nil;
  end;

  if ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = 'S' then
    rgPossuiAdicionais.ItemIndex := 0
  else
    if ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = 'N' then
      rgPossuiAdicionais.ItemIndex := 1;


  ZAdicionais_Prod.Close;
  ZAdicionais_Prod.ParamByName('pcod').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
  ZAdicionais_Prod.Open;


  DM.ZCombos.Close;
  dm.ZCombos.SQL.Clear;
  DM.ZCombos.SQL.Add('SELECT * FROM COMBOS WHERE COD_PRODUTO =:PCODIGO');
  DM.ZCombos.ParamByName('PCODIGO').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
  DM.ZCombos.Open;  

  RzPageControl1.ActivePageIndex := 0;
  //Panel4.Enabled := True;

end;

procedure TFrmCadProduto.btnAlterarAdicionaisClick(Sender: TObject);
begin
  inherited;
  //Panel4.Enabled := True;
  //ZAdicionais_Prod.Edit;
end;

procedure TFrmCadProduto.btnExcluirAdicionaisClick(Sender: TObject);
begin
  inherited;
  {if ZAdicionais_Prod.IsEmpty then
  begin
    Application.MessageBox('Sem registro para excluir.','Informação',MB_ICONINFORMATION+MB_OK);
    Exit;
  end;

  if Application.MessageBox('Confirma exclusão do registro?', 'Informação', MB_ICONQUESTION + MB_YESNO) = id_YES then
  begin
    ZAdicionais_Prod.Delete;
    ZAdicionais_Prod.ApplyUpdates;
  end; }
end;

procedure TFrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  RzPageControl1.ActivePageIndex := 0;
  ZProdutos.Close;
  ZProdutos.SQL.Clear;
  ZProdutos.SQL.Add('SELECT * FROM PRODUTOS');
  ZProdutos.Open;
  ZProdutos.Append;
  ZProdutos.FieldByName('DATA_CADASTRO').AsDateTime := Date;
  dbedtDESCRICAO.SetFocus;
end;

procedure TFrmCadProduto.btnGravarClick(Sender: TObject);
begin
  inherited;
  try
    if rgPossuiAdicionais.ItemIndex = 0 then
      ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString := 'S'
    else
      if rgPossuiAdicionais.ItemIndex = 1 then
        ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString := 'N';

    ZProdutos.Post;
    ZProdutos.ApplyUpdates;
    Application.MessageBox('Dados salvos com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao gravar dados. ' + #13 +
        'Informações do Erro: ' + E.Message)
        , 'Erro', MB_ICONERROR + MB_OK);
      ZProdutos.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadProduto.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ZProdutos.CancelUpdates;
end;

procedure TFrmCadProduto.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if ZProdutos.IsEmpty then
  begin
    Application.MessageBox('Sem registro para excluir.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;

  if not (ZProdutos.IsEmpty) then
  begin
    if Application.MessageBox('Confirma exclusão do registro?', 'Informação', MB_ICONQUESTION + MB_YESNO) = id_YES then
    begin
      try
        ZAdicionais_Prod.Close;
        ZAdicionais_Prod.SQL.Clear;
        ZAdicionais_Prod.SQL.Add('DELETE FROM ADICIONAIS_PROD WHERE CODPROD=:PCOD');
        ZAdicionais_Prod.ParamByName('PCOD').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
        ZAdicionais_Prod.ExecSQL;


        ZProdutos.Delete;
        ZProdutos.ApplyUpdates;
        Application.MessageBox('Registro excluido com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
      except on E: Exception do
        begin
          Application.MessageBox(PChar('Erro ao excluir registro. ' + #13 +
            'Informações do Erro: ' + E.Message)
            , 'Erro', MB_ICONERROR + MB_OK);
          ZProdutos.CancelUpdates;
        end;
      end;

    end;
  end
  else
  begin
    Application.MessageBox('Nenhum registro a ser excluido!', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;
end;

procedure TFrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  inherited;
  try
    ZProdutos.Edit;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao alterar registro. ' + #13 +
        'Informações do Erro: ' + E.Message)
        , 'Erro', MB_ICONERROR + MB_OK);
      ZProdutos.CancelUpdates;
    end;
  end;
end;

procedure TFrmCadProduto.dbedtMARGEM_LUCROExit(Sender: TObject);
begin
  inherited;
  if ZProdutos.FieldByName('VALOR_COMPRA').AsFloat > 0 then
    if ZProdutos.FieldByName('MARGEM_LUCRO').AsFloat > 0 then
      ZProdutos.FieldByName('VALOR_VENDA').AsFloat := ZProdutos.FieldByName('VALOR_COMPRA').AsFloat + ((ZProdutos.FieldByName('VALOR_COMPRA').AsFloat * ZProdutos.FieldByName('MARGEM_LUCRO').AsFloat) / 100)
end;

procedure TFrmCadProduto.btnAdicionarFotoClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
  begin
    img1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'IMAGENS') then
      CreateDir(ExtractFilePath(Application.ExeName) + 'IMAGENS');

    if DirectoryExists(ExtractFilePath(Application.ExeName) + 'IMAGENS') then
      CopyFile(Pchar(OpenPictureDialog1.FileName), PChar(ExtractFilePath(Application.ExeName) + 'IMAGENS\' + ExtractFileName(OpenPictureDialog1.FileName)), False);

    ZProdutos.FieldByName('IMAGEM').AsString := ExtractFilePath(Application.ExeName) + 'IMAGENS\' + ExtractFileName(OpenPictureDialog1.FileName); //OpenPictureDialog1.FileName;
  end;

end;

procedure TFrmCadProduto.btnLocalizarClick(Sender: TObject);
begin
  inherited;
  ZProdutos.Close;
  ZProdutos.Open;
  RzPageControl1.ActivePageIndex := 2;
  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

procedure TFrmCadProduto.dsProdutosStateChange(Sender: TObject);
begin
  inherited;
  btnNovo.Enabled := dsProdutos.State in [dsBrowse]; // Inserir
  btnExcluir.Enabled := dsProdutos.State in [dsBrowse]; // Excluir
  btnAlterar.Enabled := dsProdutos.State in [dsBrowse]; //Alterar
  btnGravar.Enabled := dsProdutos.State in [dsInsert, dsEdit]; //Gravar
  btnCancelar.Enabled := dsProdutos.State in [dsInsert, dsEdit]; //Cancelar
  btnAdicionarFoto.Enabled := dsProdutos.State in [dsInsert, dsEdit]; //Cancelar
  btnExcluirFoto.Enabled := dsProdutos.State in [dsInsert, dsEdit]; //Cancelar
end;

procedure TFrmCadProduto.btnExcluirFotoClick(Sender: TObject);
begin
  inherited;
  if not (ZProdutos.IsEmpty) then
  begin
    ZProdutos.Edit;
    ZProdutos.FieldByName('IMAGEM').AsString := '';
    ZProdutos.Post;
    ZProdutos.ApplyUpdates;

  end
  else
  begin
    Application.MessageBox('Busque um produtos antes.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Exit;
  end;
end;

procedure TFrmCadProduto.dsAdicionais_ProdStateChange(Sender: TObject);
begin
  inherited;
 // if (ZProdutos.IsEmpty) then
  //  btnNovoAdicionais.Enabled := False // Inserir
  //else
  //  btnNovoAdicionais.Enabled := dsAdicionais_Prod.State in [dsBrowse]; // Inserir

 // btnExcluirAdicionais.Enabled := dsAdicionais_Prod.State in [dsBrowse]; // Excluir
 // btnAlterarAdicionais.Enabled := dsAdicionais_Prod.State in [dsBrowse]; //Alterar
 // btnGravarAdicionais.Enabled := dsAdicionais_Prod.State in [dsInsert, dsEdit]; //Gravar
 // btnCancelarAdicionais.Enabled := dsAdicionais_Prod.State in [dsInsert, dsEdit]; //Cancelar
end;

procedure TFrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  ZAdicionais_Prod.Close;
  ZAdicionais_Prod.ParamByName('pcod').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
  ZAdicionais_Prod.Open;

  ZCategorias.Close;
  ZCategorias.Open;

  DM.ZCombos.Close;
  dm.ZCombos.SQL.Clear;
  DM.ZCombos.SQL.Add('SELECT * FROM COMBOS WHERE COD_PRODUTO =:PCODIGO');
  DM.ZCombos.ParamByName('PCODIGO').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
  DM.ZCombos.Open;


  if ZProdutos.FieldByName('IMAGEM').AsString <> '' then
  begin
    if FileExists(ZProdutos.FieldByName('IMAGEM').AsString) then
      img1.Picture.LoadFromFile(ZProdutos.FieldByName('IMAGEM').AsString)
    else
      img1.Picture := nil;
  end
  else
  begin
    img1.Picture := nil;
  end;

  if ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = 'S' then
    rgPossuiAdicionais.ItemIndex := 0
  else
    if ZProdutos.FieldByName('POSSUI_ADICIONAL').AsString = 'N' then
      rgPossuiAdicionais.ItemIndex := 1;

end;

procedure TFrmCadProduto.btnBuscarClick(Sender: TObject);
begin
  inherited;
  ZProdutos.Close;
  ZProdutos.SQL.Clear;
  ZProdutos.SQL.Add('SELECT * FROM PRODUTOS');

  if RGCampos.ItemIndex = 0 then
  begin
    ZProdutos.SQL.Add(' WHERE CODIGO =:PCODIGO');
    ZProdutos.SQL.Add(' ORDER BY CODIGO ASC');
    ZProdutos.ParamByName('PCODIGO').AsInteger := StrToInt(EditPesquisa.Text);

  end;

  if RGCampos.ItemIndex = 1 then
  begin
    ZProdutos.SQL.Add(' WHERE DESCRICAO LIKE :PDESCRICAO');
    ZProdutos.SQL.Add(' ORDER BY DESCRICAO ASC');
    ZProdutos.ParamByName('PDESCRICAO').AsString := '%' + EditPesquisa.Text + '%';
  end;

  ZProdutos.Open;

end;

procedure TFrmCadProduto.RGCamposClick(Sender: TObject);
begin
  inherited;
  EditPesquisa.Clear;
  EditPesquisa.SetFocus;
end;

procedure TFrmCadProduto.btnCancelarAdicionaisClick(Sender: TObject);
begin
  inherited;
 // ZAdicionais_Prod.Cancel;
  //Panel4.Enabled := False;
end;

procedure TFrmCadProduto.BitBtn1Click(Sender: TObject);
begin
  inherited;
    DM.ZCombos.Append;
    DM.ZCombos.FieldByName('CODIGO').AsInteger := DM.fGeraCodigo('COMBOS','CODIGO');
    DM.ZCombos.FieldByName('COD_PRODUTO').AsInteger := ZProdutos.FieldByName('CODIGO').AsInteger;
    FrmCadCombo := TFrmCadCombo.Create(Application);
    FrmCadCombo.ShowModal;
end;

procedure TFrmCadProduto.BitBtn4Click(Sender: TObject);
begin
  inherited;
    DM.ZCombos.Edit;
    FrmCadCombo := TFrmCadCombo.Create(Application);
    FrmCadCombo.ShowModal;
end;

procedure TFrmCadProduto.BitBtn3Click(Sender: TObject);
begin
  inherited;
    try
      if Application.MessageBox('Confirma exclusão do registro?','Confirmação',MB_ICONQUESTION+MB_YESNO)=ID_YES then
      begin
          DM.ZCombos.Delete;
          DM.ZCombos.ApplyUpdates;
          Application.MessageBox('Registro excluido com sucesso.','Informação',MB_ICONINFORMATION+MB_OK);
      end;
    except  on e:Exception do
    begin
       Application.MessageBox(PChar('Erro ao excluir registro, verifique e tente novamente. '+#13+
                                    'Informações do erro: '+e.Message)
                                    ,'Erro',MB_ICONERROR+MB_OK);
       DM.ZCombos.CancelUpdates;

    end;
    end;
end;

procedure TFrmCadProduto.BitBtn5Click(Sender: TObject);
begin
  inherited;
      DM.ZCombos.CancelUpdates;
end;

end.

