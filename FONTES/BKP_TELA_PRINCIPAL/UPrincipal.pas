unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, TeeProcs, TeEngine, Chart,
  sSkinManager, JvComponentBase, JvEnterTab, Buttons, ImgList, jpeg,
  frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UCBase, UCDataConnector, UCZEOSConn, StdCtrls, AppEvnts, sBitBtn, ToolWin,
  Vcl.Ribbon, Vcl.ActnList, Vcl.ActnCtrls, Vcl.ActnMan, Vcl.ActnMenus,
  Vcl.RibbonActnMenus, Vcl.RibbonLunaStyleActnCtrls, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinsdxBarPainter, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxRibbonSkins, dxSkinsdxRibbonPainter,
  AdvOfficePager, AdvOfficePagerStylers, Vcl.RibbonSilverStyleActnCtrls,
  AdvMenus, AdvMenuStylers, Vcl.XPMan, AdvPanel, AdvOfficeHint, AdvToolBar,
  AdvToolBarStylers, dxSkinsForm, dxRibbon, dxBar, cxClasses,
  dxCustomTileControl, dxTileControl;

type
  TFrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Relatrios1: TMenuItem;
    Ajuda1: TMenuItem;
    N1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    Adicionais1: TMenuItem;
    ImageList1: TImageList;
    Empresa1: TMenuItem;
    N2: TMenuItem;
    Usurios1: TMenuItem;
    Cadastrar1: TMenuItem;
    Perfil1: TMenuItem;
    N3: TMenuItem;
    Sair1: TMenuItem;
    Produtos2: TMenuItem;
    Adicionais2: TMenuItem;
    ProdutosxAdicionais1: TMenuItem;
    N4: TMenuItem;
    Vendas1: TMenuItem;
    SobreoSistema1: TMenuItem;
    frxProdutos: TfrxReport;
    frxDBProdutos: TfrxDBDataset;
    ZProdutos: TZQuery;
    ZProdutosCODIGO: TIntegerField;
    ZProdutosDESCRICAO: TStringField;
    ZProdutosDATA_CADASTRO: TDateTimeField;
    ZProdutosVALOR_COMPRA: TFloatField;
    ZProdutosVALOR_VENDA: TFloatField;
    ZProdutosESTOQUE: TFloatField;
    ZProdutosMARGEM_LUCRO: TFloatField;
    ZProdutosDT_ULT_COMPRA: TDateTimeField;
    ZProdutosDT_ULT_VENDA: TDateTimeField;
    ZProdutosPESO_BRUTO: TFloatField;
    ZProdutosPESO_LIQUIDO: TFloatField;
    ZProdutosUNIDADE: TStringField;
    dsProdutos: TDataSource;
    dsAdicionais: TDataSource;
    ZAdicionais: TZQuery;
    ZAdicionaisCODIGO: TIntegerField;
    ZAdicionaisDESCRICAO: TStringField;
    ZAdicionaisVALOR: TFloatField;
    ZAdicionaisESTOQUE: TFloatField;
    ZAdicionaisUNIDADE: TStringField;
    ZAdicionaisDATA_CADASTRO: TDateTimeField;
    frxAdicionais: TfrxReport;
    frxDBAdicionais: TfrxDBDataset;
    ZProd_Adicional: TZQuery;
    dsProd_Adicional: TDataSource;
    ZProd_AdicionalDESCRICAO_ADICIONAL: TStringField;
    ZProd_AdicionalVALOR_ADICIONAL: TFloatField;
    ZProd_AdicionalESTOQUE_ADICIONAL: TFloatField;
    ZProd_AdicionalDESCRICAO_PRODUTO: TStringField;
    ZProd_AdicionalVALOR_VENDPROD: TFloatField;
    ZProd_AdicionalESTOQUE_PRODUTO: TFloatField;
    ZProd_AdicionalCODIGO_PRODUTO: TIntegerField;
    ZProd_AdicionalCODIGO_ADICIONAL: TIntegerField;
    frxProd_Adicional: TfrxReport;
    frxDBProd_Adicional: TfrxDBDataset;
    AlterarSenha1: TMenuItem;
    UserControl1: TUserControl;
    UCZEOSConn1: TUCZEOSConn;
    N5: TMenuItem;
    rocarUsurio1: TMenuItem;
    img1: TImage;
    ZProdutosIMAGEM: TStringField;
    ZProdutosBARATO_DIA: TStringField;
    Clientes1: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    Categorias1: TMenuItem;
    frxReportClientes: TfrxReport;
    frxDBClientes: TfrxDBDataset;
    ZClientes: TZQuery;
    ZClientesCODIGO: TIntegerField;
    ZClientesNOME: TStringField;
    ZClientesENDERECO: TStringField;
    ZClientesNUMERO: TStringField;
    ZClientesBAIRRO: TStringField;
    ZClientesCIDADE: TStringField;
    ZClientesUF: TStringField;
    ZClientesCEP: TStringField;
    ZClientesTELEFONE: TStringField;
    ZClientesCELULAR: TStringField;
    ZClientesDATA_CADASTRO: TDateTimeField;
    Clientes2: TMenuItem;
    ilListMenu: TImageList;
    ActionManager1: TActionManager;
    actEmpresa: TAction;
    actCliente: TAction;
    actProduto: TAction;
    actCategorias: TAction;
    actAdicionais: TAction;
    ImageList2: TImageList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    Action6: TAction;
    Action7: TAction;
    Action8: TAction;
    Action9: TAction;
    cxImageList1: TcxImageList;
    dxBarManager1: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarManager1Bar2: TdxBar;
    dxBarManager1Bar4: TdxBar;
    dxBarManager1Bar13: TdxBar;
    dxBarManager1Bar14: TdxBar;
    dxBarManager1Bar15: TdxBar;
    dxBarManager1Bar16: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarLargeButton16: TdxBarLargeButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarButton27: TdxBarButton;
    dxBarButton28: TdxBarButton;
    dxBarButton29: TdxBarButton;
    dxBarButton30: TdxBarButton;
    dxBarButton31: TdxBarButton;
    dxBarButton32: TdxBarButton;
    dxBarButton33: TdxBarButton;
    dxBarButton34: TdxBarButton;
    dxBarButton35: TdxBarButton;
    dxBarButton36: TdxBarButton;
    dxBarButton37: TdxBarButton;
    dxBarButton38: TdxBarButton;
    dxBarButton39: TdxBarButton;
    dxBarLargeButton17: TdxBarLargeButton;
    dxBarLargeButton18: TdxBarLargeButton;
    dxBarButton40: TdxBarButton;
    dxBarButton41: TdxBarButton;
    dxBarButton42: TdxBarButton;
    dxBarLargeButton19: TdxBarLargeButton;
    dxBarButton43: TdxBarButton;
    dxBarButton44: TdxBarButton;
    dxBarButton45: TdxBarButton;
    dxBarLargeButton20: TdxBarLargeButton;
    dxBarButton46: TdxBarButton;
    dxBarButton47: TdxBarButton;
    dxBarButton48: TdxBarButton;
    dxBarButton49: TdxBarButton;
    dxBarButton50: TdxBarButton;
    dxBarLargeButton21: TdxBarLargeButton;
    dxBarLargeButton22: TdxBarLargeButton;
    dxBarLargeButton23: TdxBarLargeButton;
    dxBarButton51: TdxBarButton;
    dxBarButton52: TdxBarButton;
    dxBarButton53: TdxBarButton;
    dxBarLargeButton24: TdxBarLargeButton;
    dxBarButton67: TdxBarButton;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbon1Tab6: TdxRibbonTab;
    dxRibbon1Tab7: TdxRibbonTab;
    ImageList4: TImageList;
    dxSkinController1: TdxSkinController;
    AdvToolBarOfficeStyler2: TAdvToolBarOfficeStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    botoes_menu: TImageList;
    AdvOfficeHint1: TAdvOfficeHint;
    AdvPanelStyler1: TAdvPanelStyler;
    XPManifest1: TXPManifest;
    AdvMenuOfficeStyler2: TAdvMenuOfficeStyler;
    ImageList3: TImageList;
    AdvPanelStyler2: TAdvPanelStyler;
    ActionManager2: TActionManager;
    Action10: TAction;
    Action11: TAction;
    Action12: TAction;
    Action13: TAction;
    Action14: TAction;
    Action15: TAction;
    Action16: TAction;
    Action17: TAction;
    Action18: TAction;
    Action19: TAction;
    Action20: TAction;
    Action21: TAction;
    Action22: TAction;
    Action23: TAction;
    Action24: TAction;
    Action25: TAction;
    Action26: TAction;
    Action27: TAction;
    Action28: TAction;
    Action29: TAction;
    Action30: TAction;
    Action31: TAction;
    Action32: TAction;
    Action33: TAction;
    Action34: TAction;
    Action35: TAction;
    Action36: TAction;
    Action37: TAction;
    Action38: TAction;
    Action39: TAction;
    Action40: TAction;
    Action41: TAction;
    Action76: TAction;
    trocausuario: TAction;
    trocasenha: TAction;
    mensagensinternas: TAction;
    Action42: TAction;
    Action43: TAction;
    Action44: TAction;
    Action45: TAction;
    Action46: TAction;
    Action47: TAction;
    Action48: TAction;
    Action49: TAction;
    Action50: TAction;
    Action51: TAction;
    Action52: TAction;
    Action53: TAction;
    Action54: TAction;
    Action55: TAction;
    Action56: TAction;
    Action57: TAction;
    Action58: TAction;
    Action59: TAction;
    Action60: TAction;
    Action61: TAction;
    Action62: TAction;
    Action63: TAction;
    Action64: TAction;
    Action65: TAction;
    Action66: TAction;
    Action67: TAction;
    Action68: TAction;
    Action69: TAction;
    Action70: TAction;
    Action71: TAction;
    Action72: TAction;
    Action73: TAction;
    Action74: TAction;
    Action75: TAction;
    Action77: TAction;
    Action78: TAction;
    Action79: TAction;
    Action80: TAction;
    Action81: TAction;
    Action82: TAction;
    Action83: TAction;
    Action84: TAction;
    Action85: TAction;
    Action86: TAction;
    Action87: TAction;
    Action88: TAction;
    AdvOfficePagerOfficeStyler1: TAdvOfficePagerOfficeStyler;
    dxBarLargeButton25: TdxBarLargeButton;
    dxBarLargeButton26: TdxBarLargeButton;
    dxBarLargeButton27: TdxBarLargeButton;
    dxBarLargeButton28: TdxBarLargeButton;
    UCControls1: TUCControls;
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure Adicionais1Click(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Adicionais2Click(Sender: TObject);
    procedure ProdutosxAdicionais1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure SobreoSistema1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function Cript(Action, Src: string): string;
    function SerialNum(FDrive: string): string;
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure spbProdutosClick(Sender: TObject);
    procedure spbAdicionaisClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure btnSobreClick(Sender: TObject);
    procedure btnEmpresaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    function GravaLogErro(sErro, sDirLog: string; sForm: TForm): Boolean;
    procedure FormResize(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure actEmpresaExecute(Sender: TObject);
    procedure actClienteExecute(Sender: TObject);
    procedure actCategoriasExecute(Sender: TObject);
    procedure actProdutoExecute(Sender: TObject);
    procedure actAdicionaisExecute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure Action6Execute(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure dxBarLargeButton16Click(Sender: TObject);
    procedure dxBarLargeButton18Click(Sender: TObject);
    procedure dxBarLargeButton27Click(Sender: TObject);
    procedure dxBarLargeButton19Click(Sender: TObject);
    procedure dxBarLargeButton25Click(Sender: TObject);
    procedure dxBarLargeButton28Click(Sender: TObject);
    procedure dxBarLargeButton26Click(Sender: TObject);
  private
    { Private declarations }
  public
    VCaminho: string;
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses UCadPadrao, UCadProdutos, UCadAdicionais, UCadEmpresa, UDM,
  URelVendas_Periodo, USobre, URegistro, UCat_x_Produtos, UCadCliente,
  UCadCategorias, UConfig;

{$R *.dfm}

procedure TFrmPrincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
  FrmCadProduto := TFrmCadProduto.Create(Self);
  FrmCadProduto.Show;
end;

procedure TFrmPrincipal.actAdicionaisExecute(Sender: TObject);
begin
  FrmCadAdicionais := TFrmCadAdicionais.Create(Self);
  FrmCadAdicionais.Show;
end;

procedure TFrmPrincipal.actCategoriasExecute(Sender: TObject);
begin
    FrmCadCategorias := TFrmCadCategorias.Create(Self);
    FrmCadCategorias.Show;
end;

procedure TFrmPrincipal.actClienteExecute(Sender: TObject);
begin
  FrmCadCliente := TFrmCadCliente.Create(Self);
  FrmCadCliente.Show;
end;

procedure TFrmPrincipal.actEmpresaExecute(Sender: TObject);
begin
  FrmCadEmpresa := TFrmCadEmpresa.Create(Application);
  FrmCadEmpresa.Show;
end;

procedure TFrmPrincipal.Action4Execute(Sender: TObject);
begin
  FrmCadProduto := TFrmCadProduto.Create(Self);
  FrmCadProduto.Show;

end;

procedure TFrmPrincipal.Action5Execute(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxAdicionais.LoadFromFile(vCaminho + 'RELATORIOS\Adicionais.fr3');
  frxAdicionais.ShowReport();
end;

procedure TFrmPrincipal.Action6Execute(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxProd_Adicional.LoadFromFile(vCaminho + 'RELATORIOS\Prod_Adicional.fr3');
  frxProd_Adicional.ShowReport();
end;

procedure TFrmPrincipal.Action7Execute(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxReportClientes.LoadFromFile(vCaminho + 'RELATORIOS\Clientes.fr3');
  frxReportClientes.ShowReport();
end;

procedure TFrmPrincipal.Action8Execute(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxReportClientes.LoadFromFile(vCaminho + 'RELATORIOS\Clientes.fr3');
  frxReportClientes.ShowReport();
end;

procedure TFrmPrincipal.Action9Execute(Sender: TObject);
begin
  FrmCadCliente := TFrmCadCliente.Create(Self);
  FrmCadCliente.Show;
end;

procedure TFrmPrincipal.actProdutoExecute(Sender: TObject);
begin
  FrmCadProduto := TFrmCadProduto.Create(Self);
  FrmCadProduto.Show;
end;

procedure TFrmPrincipal.Adicionais1Click(Sender: TObject);
begin
  FrmCadAdicionais := TFrmCadAdicionais.Create(Self);
  FrmCadAdicionais.Show;
end;

procedure TFrmPrincipal.Empresa1Click(Sender: TObject);
begin
  FrmCadEmpresa := TFrmCadEmpresa.Create(Application);
  FrmCadEmpresa.Show;
end;

procedure TFrmPrincipal.Produtos2Click(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxProdutos.LoadFromFile(vCaminho + 'RELATORIOS\Produtos.fr3');
  frxProdutos.ShowReport();
end;

procedure TFrmPrincipal.Adicionais2Click(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxAdicionais.LoadFromFile(vCaminho + 'RELATORIOS\Adicionais.fr3');
  frxAdicionais.ShowReport();
end;

procedure TFrmPrincipal.ProdutosxAdicionais1Click(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxProd_Adicional.LoadFromFile(vCaminho + 'RELATORIOS\Prod_Adicional.fr3');
  frxProd_Adicional.ShowReport();
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
var
  VArquivo: TextFile;
  VLinha, VRetorno: string;
begin
  UserControl1.UserSettings.WindowsPosition := poScreenCenter;
  VCaminho := ExtractFilePath(Application.ExeName);

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
     // FrmAtivar.ShowModalModal;

  end
  else
  begin
    FrmAtivar := TFrmAtivar.Create(Application);
    FrmAtivar.ShowModal;
  end;
end;

procedure TFrmPrincipal.Vendas1Click(Sender: TObject);
begin
  FrmVendasPeriodo := TFrmVendasPeriodo.Create(Application);
  FrmVendasPeriodo.ShowModal;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.SobreoSistema1Click(Sender: TObject);
begin
  FrmSobre := TFrmSobre.Create(Application);
  FrmSobre.ShowModal;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin

  //ZProdutos.Close;
  //ZProdutos.Open;
  //rxTemp.Open;

  //dbimage1.Picture.LoadFromFile(ZProdutos.fieldbyname('imagem').AsString);

 // VItem := 0;
 // VTotalGeral := 0;
 //

  UserControl1.StartLogin;
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

procedure TFrmPrincipal.SpeedButton4Click(Sender: TObject);
//var
  //VIndice:Integer;
begin
  { for VIndice := 0 to ComponentCount-1 do
   begin
     if (Components[VIndice] is TZQuery) then
        TZQuery(Components[VIndice]).Connection := DM.Conexao;

   end;}
  Application.Terminate;
end;

procedure TFrmPrincipal.btnUsuariosClick(Sender: TObject);
begin
  Cadastrar1.Click;
end;

procedure TFrmPrincipal.spbProdutosClick(Sender: TObject);
begin
  FrmCadProduto := TFrmCadProduto.Create(Self);
  FrmCadProduto.Show;
end;

procedure TFrmPrincipal.spbAdicionaisClick(Sender: TObject);
begin
  FrmCadAdicionais := TFrmCadAdicionais.Create(Self);
  FrmCadAdicionais.Show;
end;

procedure TFrmPrincipal.btnVendasClick(Sender: TObject);
begin
  FrmVendasPeriodo := TFrmVendasPeriodo.Create(Application);
  FrmVendasPeriodo.Show;
end;

procedure TFrmPrincipal.btnSobreClick(Sender: TObject);
begin
  FrmSobre := TFrmSobre.Create(Application);
  FrmSobre.Show;
end;

procedure TFrmPrincipal.btnEmpresaClick(Sender: TObject);
begin
  FrmCadEmpresa := TFrmCadEmpresa.Create(Application);
  FrmCadEmpresa.Show;
end;

procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  FrmCat_Prod := TFrmCat_Prod.Create(Self);
  FrmCat_Prod.ShowModal;

end;

procedure TFrmPrincipal.Clientes1Click(Sender: TObject);
begin
  FrmCadCliente := TFrmCadCliente.Create(Self);
  FrmCadCliente.Show;
end;

procedure TFrmPrincipal.ApplicationEventsException(Sender: TObject;
  E: Exception);
begin
  if E is Exception then
  begin
    ShowMessage(E.Message);
    if not GravaLogErro(E.Message, ExtractFilePath(Application.ExeName) + 'Log', Screen.ActiveForm) then
      ShowMessage('Erro ao gravar Log!');
  end;
end;

function TFrmPrincipal.GravaLogErro(sErro, sDirLog: string;
  sForm: TForm): Boolean;
var
  sFile: TextFile;
  sData: string;
  sArq: string;
  sFormName: string;
  i: Integer;
begin
  sData := FormatDateTime('dd-mm-yyyy', Date);

  
  if not DirectoryExists(sDirLog) then
    CreateDirectory(Pchar(sDirLog), 0);

  sArq := sDirLog + '\Log Erro ' + sData + '.log';

  try
    AssignFile(sFile, sArq);

    if FileExists(sArq) then
      Append(sFile)
    else
      Rewrite(sFile);

    WriteLn(sFile, 'Titulo da janela..: ' + sForm.Caption);
    WriteLn(sFile, 'Form..............: ' + sForm.Name);
    WriteLn(sFile, 'Data/Hora.........: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now));
    WriteLn(sFile, 'Erro..............: ' + sErro);
    WriteLn(sFile, '');
    WriteLn(sFile, '------------------');
    WriteLn(sFile, '');
    CloseFile(sFile);
  except
    Result := False;
    Exit;
  end;

  Result := True;

end;

procedure TFrmPrincipal.FormResize(Sender: TObject);
begin
  if (FrmPrincipal.WindowState = wsMaximized) and (FrmPrincipal.Focused) then
  begin
    FrmPrincipal.Width := FrmPrincipal.Constraints.MinWidth;
    FrmPrincipal.Height := FrmPrincipal.Constraints.MinHeight;
    FrmPrincipal.Top := 0;

    FrmPrincipal.Left := Screen.Width - FrmPrincipal.Constraints.MinWidth;
  end;
end;

procedure TFrmPrincipal.Categorias1Click(Sender: TObject);
begin
    FrmCadCategorias := TFrmCadCategorias.Create(Self);
    FrmCadCategorias.Show;
end;

procedure TFrmPrincipal.Clientes2Click(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxReportClientes.LoadFromFile(vCaminho + 'RELATORIOS\Clientes.fr3');
  frxReportClientes.ShowReport();
end;

procedure TFrmPrincipal.btn1Click(Sender: TObject);
begin
  FrmCadEmpresa := TFrmCadEmpresa.Create(Application);
  FrmCadEmpresa.Show;
end;

procedure TFrmPrincipal.btn2Click(Sender: TObject);
begin
Cadastrar1.Click;
end;

procedure TFrmPrincipal.btn3Click(Sender: TObject);
begin
  FrmCadProduto := TFrmCadProduto.Create(Self);
  FrmCadProduto.Show;
end;

procedure TFrmPrincipal.btn4Click(Sender: TObject);
begin
  FrmCadAdicionais := TFrmCadAdicionais.Create(Self);
  FrmCadAdicionais.Show;
end;

procedure TFrmPrincipal.btn5Click(Sender: TObject);
begin
  FrmVendasPeriodo := TFrmVendasPeriodo.Create(Application);
  FrmVendasPeriodo.Show;
end;

procedure TFrmPrincipal.btn7Click(Sender: TObject);
begin
  FrmSobre := TFrmSobre.Create(Application);
  FrmSobre.Show;
end;

procedure TFrmPrincipal.btn9Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.btn10Click(Sender: TObject);
begin
  FrmCadCliente := TFrmCadCliente.Create(Self);
  FrmCadCliente.Show;
end;

procedure TFrmPrincipal.dxBarLargeButton16Click(Sender: TObject);
begin
    FrmConfig := TFrmConfig.Create(Self);
    FrmConfig.Show;
end;

procedure TFrmPrincipal.dxBarLargeButton18Click(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxProdutos.LoadFromFile(vCaminho + 'RELATORIOS\Produtos.fr3');
  frxProdutos.ShowReport();
end;

procedure TFrmPrincipal.dxBarLargeButton19Click(Sender: TObject);
begin
  FrmVendasPeriodo := TFrmVendasPeriodo.Create(Application);
  FrmVendasPeriodo.ShowModal;
end;

procedure TFrmPrincipal.dxBarLargeButton25Click(Sender: TObject);
begin
  FrmCadEmpresa := TFrmCadEmpresa.Create(Application);
  FrmCadEmpresa.Show;
end;

procedure TFrmPrincipal.dxBarLargeButton26Click(Sender: TObject);
begin
  FrmCadAdicionais := TFrmCadAdicionais.Create(Self);
  FrmCadAdicionais.Show;
end;

procedure TFrmPrincipal.dxBarLargeButton27Click(Sender: TObject);
begin
  VCaminho := ExtractFilePath(Application.ExeName);
  frxProd_Adicional.LoadFromFile(vCaminho + 'RELATORIOS\Prod_Adicional.fr3');
  frxProd_Adicional.ShowReport();
end;

procedure TFrmPrincipal.dxBarLargeButton28Click(Sender: TObject);
begin
    FrmCadCategorias := TFrmCadCategorias.Create(Self);
    FrmCadCategorias.Show;
end;

end.

