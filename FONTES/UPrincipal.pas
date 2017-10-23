unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, TeeProcs, TeEngine, Chart,
  sSkinManager, JvComponentBase, JvEnterTab, Buttons, ImgList, jpeg,
  frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UCBase, UCDataConnector, UCZEOSConn, StdCtrls, AppEvnts, sBitBtn, ToolWin;

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
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    btn6: TToolButton;
    btn7: TToolButton;
    btn8: TToolButton;
    btn9: TToolButton;
    ilListMenu: TImageList;
    btn10: TToolButton;
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
  UCadCategorias;

{$R *.dfm}

procedure TFrmPrincipal.CadastrodeProdutos1Click(Sender: TObject);
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
  vArq:TStringList;
  vIndice:Integer;
  vDiasPassado,VQTDAtual:Real;
begin

    UserControl1.UserSettings.WindowsPosition := poScreenCenter;
    VCaminho := ExtractFilePath(Application.ExeName);

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

// Inicio validação

    // Verifica se tem arquivo de registro, caso tenha é registrado entao verificar serialhd,
    //pra ver se  maquina é liberada pra uso.

  {if FileExists('C:\CONTROLD\SUPERMIX\SUPFile.dll') then
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
  end
  else
  begin
    FrmAtivar := TFrmAtivar.Create(Application);
    FrmAtivar.ShowModal;
  end; }
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

end.

