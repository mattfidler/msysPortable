SetCompress Auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize On
Icon "..\..\App\AppInfo\appicon.ico"
OutFile "..\..\App\MSYS\MSYS.exe"

CRCCheck On
WindowIcon Off
SilentInstall Silent
AutoCloseWindow True
RequestExecutionLevel user

Section 
  IfFileExists "$EXEDIR\..\..\..\CommonFiles\MinGW\msys\1.0\msys.bat" 0 +3
  Exec '$EXEDIR\..\..\..\CommonFiles\MinGW\msys\1.0\msys.bat'
  Goto +2
  MessageBox MB_OK "Could not find msys.bat in MinGW"
SectionEnd