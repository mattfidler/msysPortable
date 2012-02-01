CRCCheck On
RequestExecutionLevel user

; Best Compression
SetCompress Auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize On
;SetCompress off
;automatically close the installer when done.
AutoCloseWindow true

Var pa

; MUI2
!define VER "0.01"
!define mirror $PLUGINSDIR\mirrors.ini
!include "MUI2.nsh"
!include "FileFunc.nsh"

Name "MSYS Portable"
BrandingText "MSYS Portable"

OutFile "..\..\MSYSPortable-Installer-${VER}.exe"

!define MUI_HEADERIMAGE

!define MUI_ABORTWARNING
!define MUI_UNABORTWARNING
!define MUI_PAGE_HEADER_TEXT "MSYSPortable"
!define MUI_PAGE_HEADER_SUBTEXT "MSYSPortable"

!define MUI_COMPONENTSPAGE_SMALLDESC

;Installer pages

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "License.txt"

;MUI_PAGE_STARTMENU pageid variable
!insertmacro MUI_PAGE_INSTFILES


!insertmacro MUI_LANGUAGE "English"

Section 
  RmDir /r "$INSTDIR"
  SetOutPath "$INSTDIR"
  File  "..\..\MSYSPortable.exe"
  SetOutPath "$INSTDIR\App"
  File /r "..\..\App\*.*"
  CreateDirectory "$INSTDIR\Data\home"
  CreateDirectory "$INSTDIR\Data\usr\local"
  SetOutPath "$INSTDIR\Other"
  File /r "..\..\Other\*.*"
SectionEnd

Function GetDriveVars
  StrCmp $9 "c:\" spa
  StrCmp $8 "HDD" gpa
  StrCmp $9 "a:\" spa
  StrCmp $9 "b:\" spa
  
  gpa:
    IfFileExists "$9PortableApps" 0 spa
    StrCpy $PA "$9PortableApps"
  spa:
    Push $0
    
FunctionEnd

Function .onInit
  ${GetDrives} "FDD+HDD" "GetDriveVars"
  StrCpy "$INSTDIR" "$PA\MSYSPortable"
FunctionEnd
