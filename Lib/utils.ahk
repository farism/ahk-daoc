#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000

#Include <Include>

IsDaoc() {
  return WinActive("ahk_exe game.dll")
}

_Sleep(duration) {
  Sleep, %duration%
  return
}

Sleep(duration:=0, throttle:=0) {
  return Throttle(Func("_Sleep"), throttle, duration)
}

_Assist() {
  global assist
  global assist_wait
  Send, %assist%
  Sleep, %assist_wait%
}

Assist(throttle:=1000) {
  return Throttle(Func("_Assist"), throttle)
}

_Face() {
  global face
  global jump
  Send, %face%
}

Face(throttle:=1000) {
  return Throttle(Func("_Face"), throttle)
}

Stick(throttle:=1000) {
  global stick
  return Throttle(stick, throttle)
}

IsInCombat(){
  PixelGetColor, color, A_ScreenWidth - 10, A_ScreenHeight - 10
  return color = 0x0000FF
}

EquipCurrentWeapon() {
  return
}

EquipOneHanded() {
  global one_handed
  Send, %one_handed%
  return
}

EquipTwoHanded() {
  global two_handed
  Send, %two_handed%
  return
}

EquipRanged() {
  global ranged
  Send, %ranged%
  return
}

TargetPet() {
  global targe_pet
  Send, %target_pet%
  return
}

TargetGroup(position) {
  global target_group1
  global target_group2
  global target_group3
  global target_group4
  global target_group5
  global target_group6
  global target_group7
  global target_group8

  key := %target_group%%position%
  ; Send, %target_pet%

  return
}

Chain(keys, delay:=0) {
  keyCount := keys.MaxIndex()

  Loop, %keyCount%
  {
      key := keys[A_Index]
      %key%()
      Send, %key%
      Sleep, %delay%
  }

  return
}

StyleChain(styles, reactionary_style_chain:=false) {
  if(IsInCombat()) {
    Chain(styles, 10)
  } else {
    keyCount := styles.MaxIndex()

    ; we aren't in combat
    if (reactionary_style_chain) {
      ; it's a reactionary style, use the anytime style
      default_style := styles[keyCount]
    } else {
      ; not a reactionary style chain (so probably a positional), use the style before the anytime
      index := max(1, keyCount - 1)
      default_style := styles[index]
    }
    Send, %default_style%
  }

  return
}

SpellChain(spells) {
  Chain(spells)
  return
}

HotkeyHandler(send_key, styles, spells, equip_fn, reactionary_style_chain:=false) {
  if(IsDaoc()) {
    equipFn := Func(equip_fn)
    %equipFn%()

    Send, %send_key%

    spellChain := Func("SpellChain").Bind(spells, false)
    %spellChain%()

    styleChain := Func("StyleChain").Bind(styles, reactionary_style_chain)
    %styleChain%()
  } else {
    Send, %send_key%
  }

  return
}

Hotkey(hot_key, send_key, equip_fn, styles, spells, reactionary_style_chain:=false) {
  handler := Func("HotkeyHandler").Bind(send_key, styles, spells, equip_fn, reactionary_style_chain)
  Hotkey, %hot_key%, %handler%
  return
}

CurrentWeapon(hotkey, send_key, styles, spells, reactionary_style_chain:=false) {
  Hotkey(hotkey, send_key, "EquipCurrentWeapon", styles, spells, reactionary_style_chain)
  return
}

OneHanded(hotkey, send_key, styles, spells, reactionary_style_chain:=false) {
  Hotkey(hotkey, send_key, "EquipOneHanded", styles, spells, reactionary_style_chain)
  return
}

TwoHanded(hotkey, send_key, styles, spells, reactionary_style_chain:=false) {
  Hotkey(hotkey, send_key, "EquipTwoHanded", styles, spells, reactionary_style_chain)
  return
}

Ranged(hotkey, send_key, spells) {
  Hotkey(hotkey, send_key, "EquipRanged", [], spells)
  return
}

Pet(hotkey, send_key, spells) {
  Hotkey(hotkey, send_key, "TargetPet", [], spells)
  return
}

Click(button, x, y, speed:=0) {
  MouseClick, %button%, %x%, %y%, 1, %speed%
  return
}

GetSlotX(slot) {
  global qbar_frame_x
  global qbar_frame_slot_width
  return qbar_frame_x + 32 + (slot * qbar_frame_slot_width)
}

GetSlotY(slot) {
  global qbar_frame_y
  global qbar_frame_slot_width
  return qbar_frame_y + 8 + (qbar_frame_slot_width / 2)
}

GoToBank(bank) {
  if(bank = 10) {
    Send, +0
  } else {
    Send, +%bank%
  }
  return
}

GoToSlot(bank, slot) {
  x := GetSlotX(slot)
  y := GetSlotY(slot)
  MouseMove, %x%, %y%, 0
  GoToBank(bank)
  return
}

ClearMacro(bank, slot) {
  GoToSlot(bank, slot)
  Send, {Shift down}
  MouseClick, right
  Send, {Shift up}
  return
}

AddMacro(bank, slot) {
  GoToSlot(bank, slot)
  MouseClick
  return
}

AddQbind(bank, slot, key, bar:=1) {
  Send, /qbind %bank% %slot% %bar%{Enter}
  Send, %key%
  return
}

AddMacroAndQbind(bank, slot, key, bar:=1) {
  ClearMacro(bank, slot)
  AddMacro(bank, slot)
  AddQbind(bank, slot, key, bar)
}

AddStandardQbinds(bank, bar:=1) {
  AddQbind(bank, 1, "q", bar)
  AddQbind(bank, 2, "+q", bar)
  AddQbind(bank, 3, "e", bar)
  AddQbind(bank, 4, "+e", bar)
  AddQbind(bank, 5, "+f", bar)
  AddQbind(bank, 6, "+v", bar)
  AddQbind(bank, 7, "+c", bar)
  AddQbind(bank, 8, "+x", bar)
  AddQbind(bank, 9, "g", bar)
  AddQbind(bank, 10, "!q", bar)
}

AddFnQbindsToBar(bank, modifier="", bar:=1, count:=10) {
  Loop %count% {
    key := modifier . "{f" . A_Index . "}"
    AddQbind(bank, A_Index, key, bar)
  }
  return
}

AddPetTarget(bank, slot, key, bar:=1) {
  global pet_frame_x
  global pet_frame_y

  Send, {Shift down}
  Click(left, pet_frame_x, pet_frame_y)
  Send, {Shift up}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddStickToQbar(bank, slot, key, bar:=1) {
  Send, /macro stick /stick{Enter}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddFaceToQbar(bank, slot, key, bar:=1) {
  Send, /macro face /face{Enter}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddCreateAssistToQbar(bank, slot, key, bar:=1) {
  Send, /macro assist /macro assist /assist `%T{Enter}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddAssistToQbar(bank, slot, key, bar:=1) {
  AddQbind(bank, slot, key, bar)
}

SetupKeyboard() {
  global target_pet
  global stick
  global face
  global assist
  global create_assist_macro

  if(IsDaoc()) {
    AddStandardQbinds(5)
    AddFnQbindsToBar(6)
    AddFnQbindsToBar(7, "!")
    AddPetTarget(10, 7, target_pet)
    AddStickToQbar(10, 8, stick)
    AddFaceToQbar(10, 9, face)
    AddCreateAssistToQbar(10, 10, create_assist_macro)
    AddAssistToQbar(1, 10, assist)
  }

  return
}

LoadPlayerScript() {
  if(IsDaoc()) {
    WinGetActiveTitle, current_title

    Gui, Margin, 5, 20
    Gui, Font, S10, Verdana
    Gui, Add, Edit, w300 R1 Limit80 vwindow_title, %current_title%
    Gui, Add, Button, +5 0x8000 w55 h25, &Cancel
    Gui, Add, Button, default x+5 0x8000 w55 h25 gSubmitPlayerScript, &Apply
    Gui, Show, , Enter Player Name
  }

  return
}

SubmitPlayerScript() {
  global window_title

  Gui, Submit, NoHide
  Gui, Destroy
  Sleep, 100

  if(IsDaoc()) {
    WinSetTitle, %window_title%

    player_script_file := A_ScriptDir . "\PlayerScripts\" . window_title . ".ahk"

    if(FileExist(player_script_file)) {
      Include(player_script_file, player_script_file)
    } else {
      MsgBox, Player script does not exist: %player_script_file%
    }
  }

  return
}

Reload() {
  static last_reload := A_Now

  ; only allow reloading every 3 seconds
  if(A_Now - last_reload >= 3) {
    last_reload := A_Now
    Reload
  }

  return
}
