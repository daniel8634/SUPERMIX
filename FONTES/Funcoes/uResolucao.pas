unit uResolucao;
interface
uses
Forms, Windows;
procedure Resolucao(form:TForm;cExibir:boolean=false);
 
implementation
uses
  Dialogs, SysUtils;
var
oldwidth:integer;
OldHeight :integer;
Auxwidth:integer;
Auxheight:integer ;
procedure SetScreenResolution(form:TForm;Width, Height: integer);
var
DeviceMode: TDeviceMode;
begin
with DeviceMode do begin
dmSize := SizeOf(TDeviceMode);
dmPelsWidth := Width;
dmPelsHeight := Height;
dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;
end;
ChangeDisplaySettings(DeviceMode, CDS_UPDATEREGISTRY);
end;
procedure Resolucao(form:TForm;cExibir:Boolean=False);
var
  Mens: String;
begin
 with form do
    begin
     // MessageBox(Handle, PChar(Mens), 'Ajuste de V�deo', MB_OK + MB_ICONWARNING);
      if (Screen.Width =1024) and (Screen.Height = 768) then
        begin
          Auxwidth :=1024;
          Auxheight :=768;
          end;
          if (Screen.Width <> 1024) and (Screen.Height <> 768) then
          begin
           EnableMenuItem(GetSystemMenu(handle, False), SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);
           OldWidth := Screen.Width;
           OldHeight := Screen.Height;
           Auxwidth:=oldwidth;
           Auxheight:=OldHeight;
           if cExibir then
             begin
               Mens := 'O Programa "Seu programa -"ir� ajustar sua resolu��o de v�deo para 1024 X 768'+sLineBreak;
               Mens := Mens + 'automaticamente para uma melhor visualisa��o, mas n�o se preocupe pois ao termino de uso ,'+sLineBreak;
               Mens := Mens + ' ele retornar� sua resolu��o novamente. Muito obrigado...';
               MessageBox(Handle, PChar(Mens), 'Ajuste de V�deo', MB_OK + MB_ICONWARNING);
             end;
           SetScreenResolution(form,1024, 768);
        end;
      end;
end;
end.
