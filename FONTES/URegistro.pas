unit URegistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, TFlatPanelUnit, AdvGlowButton, StrUtils;

type
  TFrmAtivar = class(TForm)
    Label3: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Label13: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    bitbtn1: TAdvGlowButton;
    bitbtn2: TAdvGlowButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lcodigo: TLabel;
    lempresa: TLabel;
    lcnpj: TLabel;
    label2: TFlatPanel;
    procedure BitBtn1Click(Sender: TObject);
    function Gera_Senha(Name: string; Key: string): string;
    function SerialNum(FDrive: string): string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bitbtn2Click(Sender: TObject);
    procedure ChangeByteOrder(var Data; Size: Integer);
    function GetIdeDiskSerialNumber: string;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure S(Sender: TObject);
  private
    { Private declarations }
    function PKV_GetKeyByte(const Seed: Int64; a, b, c: Byte): Byte;
    function PKV_GetChecksum(const s: string): string;
    function PKV_CheckKeyChecksum(const Key: string): Boolean;
    function PKV_CheckKey(const S: string): Integer;
    function StrZero(Zeros: string; Quant: integer): string;
    function PegarNumeros(const S: string): string;

  public
    { Public declarations }
  end;

var
  FrmAtivar: TFrmAtivar;

const
  KEY_GOOD = 0;
  KEY_INVALID = 1;
  KEY_BLACKLISTED = 2;
  KEY_PHONY = 3;

  BL: array[0..0] of string = (
    '11111111'
    );

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFrmAtivar.BitBtn1Click(Sender: TObject);
var
  VArquivo: TextFile;
  vSerialHD: string;
  vArq:TStringList;
begin

  if PKV_CheckKey(Edit1.Text) = 0 then
  begin
    vArq := TStringList.Create;
    vArq.Add(frmprincipal.CRIPT('C',SerialNum('C')));
    vArq.Add(frmprincipal.CRIPT('C',DateToStr(Date))); // Data Instalação
    vArq.Add(frmprincipal.CRIPT('C',DateToStr(Date))); // Data Atual

   // AssignFile(VArquivo, 'C:\CONTROLD\SUPERMIX\SUPFile.dll');
    //Rewrite(VArquivo);
  //  Writeln(VArquivo, frmprincipal.CRIPT('C',SerialNum('C')));
   // CloseFile(VArquivo);

    vArq.SaveToFile('C:\CONTROLD\SUPERMIX\SUPFile.dll');
    vArq.Free;

    Application.MessageBox('Sistema registrado com sucesso.', 'Informação', MB_ICONINFORMATION + MB_OK);
    //frmnotafiscal_menu := Tfrmnotafiscal_menu.Create(Application);
    //frmnotafiscal_menu.ShowModal;
    Close;
    //Application.Terminate;
  end
  else
  begin
    Application.MessageBox('A chave de ativação não é válida, entre em contato com o Suporte da CONTROLD INFORMÁTICA.', 'Informação', MB_ICONINFORMATION + MB_OK);
    Application.Terminate;
  end;
end;

function TFrmAtivar.Gera_Senha(Name, Key: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(Name) do
    Result := Result + IntToHex(Ord(Name[I]) xor Ord(Key[(I mod Length(Key) + 1)]), 2);

end;

function TFrmAtivar.SerialNum(FDrive: string): string;
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

procedure TFrmAtivar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtivar.bitbtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

function TFrmAtivar.PKV_GetKeyByte(const Seed: Int64; a, b, c: Byte): Byte;
begin
  a := a mod 25;
  b := b mod 3;

  if a mod 2 = 0 then
    result := ((Seed shr a) and $000000FF) xor ((Seed shr b) or c)
  else
    result := ((Seed shr a) and $000000FF) xor ((Seed shr b) and c);
end;

function TFrmAtivar.PKV_GetChecksum(const s: string): string;
var
  left, right, sum: Word;
  i: Integer;
begin
  left := $0056;
  right := $00AF;

  if Length(s) > 0 then
    for i := 1 to Length(s) do
    begin
      right := right + Byte(s[i]);
      if right > $00FF then
        Dec(right, $00FF);
      Inc(left, right);
      if left > $00FF then
        Dec(left, $00FF);
    end;
  sum := (left shl 8) + right;
  result := IntToHex(sum, 4);

end;

function TFrmAtivar.PKV_CheckKeyChecksum(const Key: string): Boolean;
var
  s, c: string;
begin
  result := False;
  // remove cosmetic hypens and normalize case
  s := UpperCase(StringReplace(Key, '-', '', [rfReplaceAll]));
  if Length(s) <> 20 then
    exit; // Our keys are always 20 characters long

  // last four characters are the checksum
  c := Copy(s, 17, 4);
  SetLength(s, 16);

  // compare the supplied checksum against the real checksum for
  // the key string.
  result := c = PKV_GetChecksum(s);

end;

function TFrmAtivar.PKV_CheckKey(const S: string): Integer;
var
  Key, kb: string;
  Seed: Int64;
  i: Integer;
  b: Byte;
begin
  result := KEY_INVALID;
  if not PKV_CheckKeyChecksum(S) then
    exit; // bad checksum or wrong number of characters

  // remove cosmetic hypens and normalize case
  Key := UpperCase(StringReplace(S, '-', '', [rfReplaceAll]));

  // test against blacklist
  if Length(BL) > 0 then
    for i := Low(BL) to High(BL) do
      if AnsiStartsStr(BL[i], Key) then //StartsStr
      begin
        result := KEY_BLACKLISTED;
        exit;
      end;

  result := KEY_PHONY;
  // extract the Seed from the supplied key string
  if not TryStrToInt64('$' + Copy(Key, 1, 8), Seed) then
    exit;

{$IFDEF KEY00}
  kb := Copy(Key, 9, 2);
  b := PKV_GetKeyByte(Seed, 24, 3, 200);
  if kb <> IntToHex(b, 2) then
    exit;
{$ENDIF}

{$IFDEF KEY01}
  kb := Copy(Key, 11, 2);
  b := PKV_GetKeyByte(Seed, 10, 0, 56);
  if kb <> IntToHex(b, 2) then
    exit;

{$ENDIF}

{$IFDEF KEY02}
  kb := Copy(Key, 13, 2);
  b := PKV_GetKeyByte(Seed, 1, 2, 91);
  if kb <> IntToHex(b, 2) then
    exit;
{$ENDIF}

{$IFDEF KEY03}
  kb := Copy(Key, 15, 2);
  b := PKV_GetKeyByte(Seed, 7, 1, 100);
  if kb <> IntToHex(b, 2) then
    exit;
{$ENDIF}

  result := KEY_GOOD;
end;

function TFrmAtivar.StrZero(Zeros: string; Quant: integer): string;
var
  I, Tamanho: integer;
  aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS := '';
  for I := 1 to quant - tamanho do ZEROS := ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;

end;

function TFrmAtivar.PegarNumeros(const S: string): string;
var x: Integer;
  Str: string; begin Str := ''; for x := 1 to Length(S) do
  begin
    if (S[x] in ['0'..'9']) then
    begin
      Str := Str + S[x];
    end;
  end;
  PegarNumeros := Str;
end;

procedure TFrmAtivar.ChangeByteOrder(var Data; Size: Integer);
var
  ptr: PChar;
  i: Integer;
  c: Char;
begin
  ptr := @Data;
  for i := 0 to (Size shr 1) - 1 do
  begin
    c := ptr^;
    ptr^ := (ptr + 1)^;
    (ptr + 1)^ := c;
    Inc(ptr, 2);
  end;

end;

function TFrmAtivar.GetIdeDiskSerialNumber: string;
type
  TSrbIoControl = packed record
    HeaderLength: ULONG;
    Signature: array[0..7] of Char;
    Timeout: ULONG;
    ControlCode: ULONG;
    ReturnCode: ULONG;
    Length: ULONG;
  end;
  SRB_IO_CONTROL = TSrbIoControl;
  PSrbIoControl = ^TSrbIoControl;

  TIDERegs = packed record
    bFeaturesReg: Byte; // especificar "comandos" SMART
    bSectorCountReg: Byte; // registro de contador de setor
    bSectorNumberReg: Byte; // registro de número de setores
    bCylLowReg: Byte; // valor de cilindro (byte mais baixo)
    bCylHighReg: Byte; // valor de cilindro (byte mais alto)
    bDriveHeadReg: Byte; // registro de drive/cabeça
    bCommandReg: Byte; // comando IDE
    bReserved: Byte; // reservado- tem que ser zero
  end;
  IDEREGS = TIDERegs;
  PIDERegs = ^TIDERegs;

  TSendCmdInParams = packed record
    cBufferSize: DWORD;
    irDriveRegs: TIDERegs;
    bDriveNumber: Byte;
    bReserved: array[0..2] of Byte;
    dwReserved: array[0..3] of DWORD;
    bBuffer: array[0..0] of Byte;
  end;
  SENDCMDINPARAMS = TSendCmdInParams;
  PSendCmdInParams = ^TSendCmdInParams;

  TIdSector = packed record
    wGenConfig: Word;
    wNumCyls: Word;
    wReserved: Word;
    wNumHeads: Word;
    wBytesPerTrack: Word;
    wBytesPerSector: Word;
    wSectorsPerTrack: Word;
    wVendorUnique: array[0..2] of Word;
    sSerialNumber: array[0..19] of Char;
    wBufferType: Word;
    wBufferSize: Word;
    wECCSize: Word;
    sFirmwareRev: array[0..7] of Char;
    sModelNumber: array[0..39] of Char;
    wMoreVendorUnique: Word;
    wDoubleWordIO: Word;
    wCapabilities: Word;
    wReserved1: Word;
    wPIOTiming: Word;
    wDMATiming: Word;
    wBS: Word;
    wNumCurrentCyls: Word;
    wNumCurrentHeads: Word;
    wNumCurrentSectorsPerTrack: Word;
    ulCurrentSectorCapacity: ULONG;
    wMultSectorStuff: Word;
    ulTotalAddressableSectors: ULONG;
    wSingleWordDMA: Word;
    wMultiWordDMA: Word;
    bReserved: array[0..127] of Byte;
  end;
  PIdSector = ^TIdSector;

const
  IDE_ID_FUNCTION = $EC;
  IDENTIFY_BUFFER_SIZE = 512;
  DFP_RECEIVE_DRIVE_DATA = $0007C088;
  IOCTL_SCSI_MINIPORT = $0004D008;
  IOCTL_SCSI_MINIPORT_IDENTIFY = $001B0501;
  DataSize = sizeof(TSendCmdInParams) - 1 + IDENTIFY_BUFFER_SIZE;
  BufferSize = SizeOf(SRB_IO_CONTROL) + DataSize;
  W9xBufferSize = IDENTIFY_BUFFER_SIZE + 16;
var
  hDevice: THandle;
  cbBytesReturned: DWORD;
  pInData: PSendCmdInParams;
  pOutData: Pointer; // PSendCmdOutParams
  Buffer: array[0..BufferSize - 1] of Byte;
  srbControl: TSrbIoControl absolute Buffer;

begin
  Result := '';
  FillChar(Buffer, BufferSize, #0);

  if Win32Platform = VER_PLATFORM_WIN32_NT then
    // Windows NT, Windows 2000, Windows XP
  begin
      // recuperar handle da porta SCSI
    hDevice := CreateFile('\\.\Scsi0:',
      // Nota: '\\.\C:' precisa de privilégios administrativos
      GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
    if hDevice = INVALID_HANDLE_VALUE then Exit;
    try
      srbControl.HeaderLength := SizeOf(SRB_IO_CONTROL);
      System.Move('SCSIDISK', srbControl.Signature, 8);
      srbControl.Timeout := 2;
      srbControl.Length := DataSize;
      srbControl.ControlCode := IOCTL_SCSI_MINIPORT_IDENTIFY;
      pInData := PSendCmdInParams(PChar(@Buffer)
        + SizeOf(SRB_IO_CONTROL));
      pOutData := pInData;
      with pInData^ do
      begin
        cBufferSize := IDENTIFY_BUFFER_SIZE;
        bDriveNumber := 0;
        with irDriveRegs do
        begin
          bFeaturesReg := 0;
          bSectorCountReg := 1;
          bSectorNumberReg := 1;
          bCylLowReg := 0;
          bCylHighReg := 0;
          bDriveHeadReg := $A0;
          bCommandReg := IDE_ID_FUNCTION;
        end;
      end;
      if not DeviceIoControl(hDevice, IOCTL_SCSI_MINIPORT, @Buffer, BufferSize, @Buffer, BufferSize, cbBytesReturned, nil) then Exit;
    finally
      CloseHandle(hDevice);
    end;
  end
  else
  begin
      // Windows 95 OSR2, Windows 98, Windows ME
    hDevice := CreateFile('\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0);
    if hDevice = INVALID_HANDLE_VALUE then Exit;
    try
      pInData := PSendCmdInParams(@Buffer);
      pOutData := @pInData^.bBuffer;
      with pInData^ do
      begin
        cBufferSize := IDENTIFY_BUFFER_SIZE;
        bDriveNumber := 0;
        with irDriveRegs do
        begin
          bFeaturesReg := 0;
          bSectorCountReg := 1;
          bSectorNumberReg := 1;
          bCylLowReg := 0;
          bCylHighReg := 0;
          bDriveHeadReg := $A0;
          bCommandReg := IDE_ID_FUNCTION;
        end;
      end;
      if not DeviceIoControl(hDevice, DFP_RECEIVE_DRIVE_DATA, pInData, SizeOf(TSendCmdInParams) - 1, pOutData, W9xBufferSize, cbBytesReturned, nil) then Exit;
    finally
      CloseHandle(hDevice);
    end;
  end;
  with PIdSector(PChar(pOutData) + 16)^ do
  begin
    ChangeByteOrder(sSerialNumber, SizeOf(sSerialNumber));
    SetString(Result, sSerialNumber, SizeOf(sSerialNumber));
  end;

end;

procedure TFrmAtivar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f4 then
    abort; 
end;

procedure TFrmAtivar.S(Sender: TObject);
begin
    label2.Caption := PegarNumeros(COPY(Gera_Senha(DatetoStr(NOW),
    DatetoStr(NOW) +  SerialNum('C')), 1, 10));
end;

end.

