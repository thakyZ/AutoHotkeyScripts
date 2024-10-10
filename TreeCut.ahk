#Requires AutoHotkey v2.0
#SingleInstance Force
SetTitleMatchMode "RegEx"

Count := 0
MaxCount := 290
Toggle := false

+z::
{
  global Count
  global MaxCount
  global Toggle := !Toggle

  Loop
  {
    If (!WinExist("^Minecraft (?!Launcher).+$") || !WinActive("^Minecraft (?!Launcher).+$"))
    {
      global Toggle := false
    }

    If (Toggle == false || Count >= MaxCount)
    {
      Break
    }

    Send "{3}"
    Sleep 150
    Send "{RButton}"
    Sleep 150
    Send "{2}"
    Sleep 150
    Send "{RButton}"
    Sleep 150
    Count++
  }
}

Esc::
{
  global Toggle := false
}