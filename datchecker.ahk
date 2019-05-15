#SingleInstance, Force                           ; Determines whether a script is allowed to run again when it is already running.
;                                                  ^ Force, replaces the old instance automatically.
#Persistent                                      ; Keeps a script permanently running, until user terminates it.
#InstallKeybdHook                                ; Forces the unconditional installation of the keyboard hook.
#UseHook, On  
tester = 1

loop,Files,*.svg,RF
{
	present = 0
	filecheck := strreplace(A_LoopFileFullPath,".svg","",filecheck)
	loop,Files,%filecheck%.dat,RF
	{
		present = 1
	}
	if present = 0
	{
		msgbox, Missing Dat file for %A_LoopFileFullPath%
	}
}




loop,Files,*.dat,RF
{
	fileread,datfile,%A_LoopFileFullPath%
	datfile := strreplace(datfile,"[","",datfile)
	datfile := strreplace(datfile,"]","",datfile)
	datfile := strreplace(datfile," ","",datfile)
	datarray := strsplit(datfile ,",")
	;msgbox % datfile
	Loop % datarray.MaxIndex()
	{
    checking := datarray[A_Index]
		if(checking = "")
		{
			msgbox, Error in %a_loopfilefullpath%
		}
	}
}


F8::reload
