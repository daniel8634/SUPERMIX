unit USobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFrmSobre = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function GetVersionApp(const AFileName: String): String;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.dfm}

procedure TFrmSobre.BitBtn1Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

function TFrmSobre.GetVersionApp(const AFileName: String): String;
var 
  FileName: string; 
  InfoSize, Wnd: DWORD; 
  VerBuf: Pointer; 
  FI: PVSFixedFileInfo; 
  VerSize: DWORD; 
begin 
  Result := EmptyStr; 
  FileName := AFileName; 
  UniqueString(FileName); 
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd); 
  if InfoSize <> 0 then 
  begin 
    GetMem(VerBuf, InfoSize); 
    try 
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then 
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then 
          Result:= Concat(IntToStr(FI.dwFileVersionMS shr 16), '.', 
                          IntToStr(FI.dwFileVersionMS and $FFFF), '.', 
                          IntToStr(FI.dwFileVersionLS shr 16), '.', 
                          IntToStr(FI.dwFileVersionLS and $FFFF)); 
    finally 
      FreeMem(VerBuf); 
    end; 
  end;
end;

procedure TFrmSobre.FormShow(Sender: TObject);
begin
    Label2.Caption := GetVersionApp(Application.ExeName); 
end;

end.
