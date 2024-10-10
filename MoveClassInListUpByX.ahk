#Requires AutoHotkey v2.0
#SingleInstance Force
SetTitleMatchMode "RegEx"

StartingPosition := 0
Direction := 0
MoveUpByX := 0
GuessedPosition := 0
EndingPosition := 0
Running := false

createWindow() {
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
    myGui.Opt("-MinimizeBox -MaximizeBox -SysMenu")
    ButtonBtnRun := myGui.Add("Button", "vBtnRun x8 y72 w80 h23 +Default", "&RUN")
    ButtonBtnCancel := myGui.Add("Button", "vBtnCancel x176 y72 w80 h23", "&CANCEL")
    myGui.Add("Text", "x8 y8 w120 h23 +0x200 -Background", "Starting Position")
    myGui.Add("Text", "x8 y40 w120 h23 +0x200 -Background", "Destination Position")
    EditEdtValue := myGui.Add("Edit", "vEdtValue x136 y8 w120 h21 +Number", "0")
    EditEdtValue2 := myGui.Add("Edit", "vEdtValue2 x136 y40 w120 h21 +Number", "0")
    ButtonBtnRun.OnEvent("Click", OnEventHandlerRun)
    ButtonBtnCancel.OnEvent("Click", OnEventHandlerCancel)
    myGui.OnEvent('Close', (*) => ExitApp())
    myGui.Title := "Window"

    OnEventHandlerCancel(*)
    {
      global Running := false
      myGui.Close()
    }

    OnEventHandlerRun(*)
    {
      global StartingPosition := EditEdtValue.Value
      global MaxCount := EditEdtValue2.Value - EditEdtValue.Value
      global GuessedPosition := EditEdtValue.Value
      global EndingPosition := EditEdtValue2.Value
      If (MaxCount < 0)
      {
        global Direction := -1
      }
      Else
      {
        global Direction := 1
      }
      RunLoop()
      myGui.Close()
    }

    return myGui
  }
}

RunLoop() {
  global StartingPosition
  global Direction
  global MaxCount
  global GuessedPosition
  global EndingPosition
  global Running := !Running
  If (!WinExist("^FINAL FANTASY XIV$"))
  {
    MsgBox("Game does not exist", "DBG", '52')
    global Running := false
  }

  Loop
  {
    If (Running == false || MoveUpByX == 0 || GuessedPosition >= EndingPosition)
    {
      Break
    }
    Send "{Num -}"
    Sleep 150
    Send "{Num -}"
    Sleep 150
    Send "{Num 2}"
    Sleep 150
    Send "{Num 2}"
    Sleep 150
    Send "{Num 2}"
    Sleep 150
    Send "{Num 2}"
    Sleep 150
    Send "{Num 2}"
    Sleep 150
    If (Direction < 0) {
      Send "{Num 2}"
      Sleep 150
    }
    Send "{Num 0}"
    Sleep 150
    global GuessedPosition := GuessedPosition + 1
  }
}

+z::
{
  global Running

  If (Running == false)
  {
    createWindow()
  }
}