#SingleInstance, Force                           ; Determines whether a script is allowed to run again when it is already running.
;                                                  ^ Force, replaces the old instance automatically.
#Persistent                                      ; Keeps a script permanently running, until user terminates it.
#InstallKeybdHook                                ; Forces the unconditional installation of the keyboard hook.
#UseHook, On  
tester = 1

F6::
FileSelectFile, datfile
datfile := strreplace(datfile,.svg,.dat)
msgbox % datfile
return
CoordMode, mouse,screen

F7::
clipboard = 

mousegetpos,posx,posy
mouseclick,left
winactivate,ahk_exe illustrator.exe
sleep 100
send {ALT}
sleep 100
send o
sleep 100
send z
winwait,Rasterize
send {ENTER}
winwait,Progress,,1
while (winexist(Progress))
{
	sleep 500
}
sleep 500
mousemove,posx-5,0,0
while (x1 = ""){
	controlgettext,x1,Edit7,ahk_exe illustrator.exe
	controlgettext,y1,Edit6,ahk_exe illustrator.exe
	controlgettext,x2,Edit3,ahk_exe illustrator.exe
	controlgettext,y2,Edit2,ahk_exe illustrator.exe
	sleep 500
}
if (x1 = "" or y1 = "" or x2 = "" or y2 = "")
{
	msgbox,edit box capture failure
}
x1 := strreplace(x1," px")/64
x2 := x1+strreplace(x2," px")/64
y1 := (strreplace(y1," px")/64)*-1
y2 := y1+(strreplace(y2," px")/64)*-1

Fullcoords := "[[" y1 ", " x1 "], [" y2 ", " x2 "]]"
sleep 100
winactivate,ahk_exe illustrator.exe
sleep 100
send ^z
;InputBox, trackname,Trackname Name?, Please enter the Track's exact name.

if (test = 0){
	FileSelectFile, datfile
	datfile := strreplace(datfile,.svg,.dat)
}

	;mousemove,-234
	winactivate,ahk_exe illustrator.exe
	mousemove,1579,posy,0
	sleep 10
	mouseclick,left,,,2,5
	sleep 100
	send ^c
	sleep 10
filename := clipboard
;msgbox % filename
if (tester = 1)
{
	;msgbox preboop
	loop, Files, %filename%.svg,RF
	{
		;msgbox % A_LoopFileFullPath
		datfile := strreplace(A_LoopFileFullPath,.svg,.dat)
	}
}
filedelete,%datfile%
fileappend,%Fullcoords%,%datfile%
;msgbox % Fullcoords
x1 =
x2 =
y1 =
y2 =
filename = 
clipboard = 
mousemove,posx,posy+21,0
return


F8::
winactivate,ahk_exe illustrator.exe

reload
