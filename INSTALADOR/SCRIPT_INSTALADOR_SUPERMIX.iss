; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SUPERMIX"
#define MyAppVersion "1.0.4"
#define MyAppPublisher "CONTROLD INFORMATICA"
#define MyAppURL "http://www.controldinformatica.com.br"
#define MyAppExeName "SuperMixPDV.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{18C5A6C3-2204-41D6-A645-D9DB90CEA9D1}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\CONTROLD\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=INSTALA_SUPERMIX
Compression=lzma
SolidCompression=yes

[Languages]
Name: brazilianportuguese; MessagesFile: compiler:Languages\BrazilianPortuguese.isl

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: ..\FONTES\PDV\SuperMixPDV.exe; DestDir: {app}; Flags: ignoreversion replacesameversion
Source: ..\FONTES\SuperMix.exe; DestDir: {app}; Flags: ignoreversion replacesameversion
Source: ..\..\SUPERMIX\BD\SUPERMIX.FDB; DestDir: {app}\BD\; Flags: ignoreversion replacesameversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: C:\CONTROLD\SUPERMIX_ESTOQUE\FONTES\RELATORIOS\Adicionais.fr3; DestDir: {app}\RELATORIOS
Source: C:\CONTROLD\SUPERMIX_ESTOQUE\FONTES\RELATORIOS\Prod_Adicional.fr3; DestDir: {app}\RELATORIOS\
Source: C:\CONTROLD\SUPERMIX_ESTOQUE\FONTES\RELATORIOS\Produtos.fr3; DestDir: {app}\RELATORIOS\
Source: C:\CONTROLD\SUPERMIX_ESTOQUE\FONTES\RELATORIOS\Vendas_Periodo.fr3; DestDir: {app}\RELATORIOS\
Source: ..\..\..\Users\Daniel\Downloads\Firebird-2.1.7.18553_0_Win32.exe; DestDir: {tmp}
Source: ..\..\..\Program Files (x86)\Firebird\Firebird_2_1\bin\fbclient.dll; DestDir: {app}

[Icons]
Name: {commonprograms}\{#MyAppExeName}; Filename: {app}\SuperMixPDV.exe; IconFilename: {app}\SuperMixPDV.exe; IconIndex: 0; WorkingDir: {app}
Name: {userdesktop}\{#MyAppExeName}; Filename: {app}\SuperMixPDV.exe; Tasks: desktopicon; IconFilename: {app}\SuperMixPDV.exe; IconIndex: 0; WorkingDir: {app}
Name: {commonprograms}\{#MyAppName}; Filename: {app}\SuperMix.exe; IconFilename: {app}\SuperMix.exe; IconIndex: 0; WorkingDir: {app}
Name: {userdesktop}\{#MyAppName}; Filename: {app}\SuperMix.exe; IconFilename: {app}\SuperMix.exe; IconIndex: 0; WorkingDir: {app}

[Run]
Filename: {app}\{#MyAppExeName}; Description: {cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}; Flags: nowait postinstall skipifsilent
Filename: {tmp}\Firebird-2.1.7.18553_0_Win32.exe; Parameters: """/SILENT /NOICONS /COMPONENTS=""""ClientComponent"""""""; WorkingDir: {tmp}

[Dirs]
Name: {app}\BD
Name: {app}\RELATORIOS
