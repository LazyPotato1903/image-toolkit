; ============================================================
;  Image Toolkit - Inno Setup installer script
;  Builds a Windows setup .exe that installs the app and adds
;  Start-menu + optional desktop shortcuts.
;
;  Prerequisite: run build.bat first so dist\ImageToolkit.exe exists.
;  Then open this file in Inno Setup Compiler and click "Compile".
;  Get Inno Setup (free): https://jrsoftware.org/isdl.php
; ============================================================

#define MyAppName "Image Toolkit"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Ace"
#define MyAppExeName "ImageToolkit.exe"

[Setup]
AppId={{B7B4E9A2-1C3D-4F5A-9E10-IMAGETOOLKIT01}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=ImageToolkit-Setup-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
WizardStyle=modern
SetupIconFile=assets\app.ico
; Install per-user so no admin rights are required:
PrivilegesRequired=lowest

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional icons:"

[Files]
Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "README.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
