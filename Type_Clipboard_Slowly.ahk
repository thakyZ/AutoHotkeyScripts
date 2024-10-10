#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Event  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

setkeydelay 240

^+v::GoTo, CMD

CMD:
;Send {Raw}%Clipboard%
vText := Clipboard
Clipboard := vText
Loop Parse, vText, % "`n", % "`r"
{
    Send, % "{Text}" A_LoopField
}
return
