${SegmentFile}

${SegmentPreExecPrimary}
	${GetParent} $EXEDIR $0
          
       IfFileExists "$EXEDIR\..\CommonFiles\MinGW\msys\1.0" +2
       ExecWait "$EXEDIR\App\MSYS\msys-install.bat"
	${If} ${FileExists} "$EXEDIR\Data\settings\fstab"
		CopyFiles /SILENT "$EXEDIR\Data\settings\fstab" "$EXEDIR\..\CommonFiles\MinGW\msys\1.0\etc"
	${Else} 
		FileOpen $1 "$EXEDIR\..\CommonFiles\MinGW\msys\1.0\etc\fstab" w
		FileWrite $1 "$EXEDIR\..\CommonFiles\MinGW	/mingw$\n"
		FileWrite $1 "$EXEDIR\Data\usr\local	/usr/local$\n"
		FileWrite $1 "$EXEDIR\Data\home	/home$\n"
		FileClose $1
              CopyFiles /SILENT "$EXEDIR\..\CommonFiles\MinGW\msys\1.0\etc\fstab" "$EXEDIR\Data\settings"
	${EndIf}

!macroend