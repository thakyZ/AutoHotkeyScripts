#Requires AutoHotkey v2.0
;AutoGUI creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;EasyAutoGUI-AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

if ((A_LineFile = A_ScriptFullPath) &! A_IsCompiled)
{
    myGui := Constructor()
    myGui.Show("w278 h121")
}

Constructor()
{
    myGui := Gui()
    ButtonRUN := myGui.Add("Button", "x8 y80 w80 h23", "&RUN")
    ButtonCANCEL := myGui.Add("Button", "x176 y80 w80 h23", "&CANCEL")
    Edit1 := myGui.Add("Edit", "x136 y16 w120 h21", "0")
    Edit2 := myGui.Add("Edit", "x136 y48 w120 h21", "0")
    myGui.Add("Text", "x8 y16 w120 h23 +0x200", "Current Position")
    myGui.Add("Text", "x8 y48 w120 h23 +0x200", "Destination Position")
    ButtonRUN.OnEvent("Click", OnEventHandler)
    ButtonCANCEL.OnEvent("Click", OnEventHandler)
    Edit1.OnEvent("Change", OnEventHandler)
    Edit2.OnEvent("Change", OnEventHandler)
    myGui.OnEvent('Close', (*) => ExitApp())
    myGui.Title := "Click & Drag Item in List"

    OnEventHandler(*)
    {
        ToolTip("Click! This is a sample action.`n"
        . "Active GUI element values include:`n"
        . "ButtonRUN => " ButtonRUN.Text "`n"
        . "ButtonCANCEL => " ButtonCANCEL.Text "`n"
        . "Edit1 => " Edit1.Value "`n"
        . "Edit2 => " Edit2.Value "`n", 77, 277)
        SetTimer () => ToolTip(), -3000 ; tooltip timer
    }

    return myGui
}