SetWorkingDir %A_ScriptDir%
#NoEnv
#Persistent
#WinActivateForce
#SingleInstance force
#Include config.ahk
#Include <Include>
#Include lib/utils.ahk

; Assign Shift+` to setup qbinds and macros
+`::SetupKeyboard()

; Assign Ctrl-Alt-R as a hotkey to restart the script.
+!r::
  Suspend, Permit ; allow reloading while suspended
  Reload()
return

; Assign Ctrl-Alt-E as a hotkey to prompt loading a player script
+!e::LoadPlayerScript()

; Assign Ctrl-Alt-S as a hotkey to suspend the script.
+!s::Suspend

GuiClose:
GuiEscape:
ButtonCancel:
  Gui, Destroy
return
