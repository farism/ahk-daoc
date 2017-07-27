#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000

#Include <Include>

; ui stuff

qbar_frame_x = 0
qbar_frame_y = 0
qbar_frame_slot_width = 32
pet_frame_x = 1165
pet_frame_y = 755
window_title := ""
window_title := ""

; set in /keyboard

one_handed = {Left}
two_handed = {Up}
ranged = {Right}
target_group1 = {Ins}
target_group2 = {Del}
target_group3 = {PgUp}
target_group4 = {PgDn}
target_group5 = !{Ins}
target_group6 = !{Del}
target_group7 = !{PgUp}
target_group8 = !{PgDn}

; set as a /qbind

target_pet = {=}
create_assist_macro = {Down}
assist = {Home}
face = {End}
stick = {f11}

IsDaoc() {
  return WinActive("ahk_exe game.dll")
}

DiffNow(prev) {
  return (A_Now - prev) * 1000
}

_Sleep(sleep_dur) {
  Sleep, %sleep_dur%
  return
}

_Stick(last_stick_dur) {
  static last_stick := A_Now
  global stick

  if (DiffNow(last_stick) >= last_stick_dur) {
    last_stick := A_Now
    Send, %stick%
  }

  return
}

_Face(last_face_dur) {
  static last_face := A_Now
  global face

  if (DiffNow(last_face) >= last_face_dur) {
    last_face := A_Now
    Send, %face%
  }

  return
}

Sleep(args*) {
  return Func("_Sleep").Bind(args*)
}

Stick(args*) {
  return Func("_Stick").Bind(args*)
}

Face(args*) {
  return Func("_Face").Bind(args*)
}

IsInCombat(){
  PixelGetColor, color, 1915, 1075

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
  Send, %send_key%

  if(IsDaoc()) {
    equipFn := Func(equip_fn)
    styleChain := Func("StyleChain").Bind(styles, reactionary_style_chain)
    spellChain := Func("SpellChain").Bind(spells, false)
    %equipFn%()
    %spellChain%()
    %styleChain%()
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
}

ClearMacro(bank, slot) {
  GoToSlot(bank, slot)
  Send, {Shift down}
  MouseClick, right
  Send, {Shift up}
}

AddMacro(bank, slot) {
  GoToSlot(bank, slot)
  MouseClick
}

AddQbind(bank, slot, key, bar:=1) {
  Send, /qbind %bank% %slot% %bar%{Enter}
  Send, %key%
  return
}

AddMacroAndQbind(bank, slot, key, bar:=1) {
  ClearMacro(bank, slot)
  AddMacro(bank, slot)
  AddQbind(bank, slot, key)
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

AddPetTargetQbind(bank, slot, key, bar:=1) {
  global pet_frame_x
  global pet_frame_y
  Send, {Shift down}
  Click(left, pet_frame_x, pet_frame_y)
  Send, {Shift up}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddStickQbind(bank, slot, key, bar:=1) {
  Send, /macro stick /stick{Enter}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddFaceQbind(bank, slot, key, bar:=1) {
  Send, /macro face /face{Enter}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddCreateAssistQbind(bank, slot, key, bar:=1) {
  Send, /macro assist /macro assist /assist `%T{Enter}
  AddMacroAndQbind(bank, slot, key, bar)
}

AddAssistQbind(bank, slot, key, bar:=1) {
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
    AddPetTargetQbind(10, 7, target_pet)
    AddStickQbind(10, 8, stick)
    AddFaceQbind(10, 9, face)
    AddCreateAssistQbind(10, 10, create_assist_macro)
    AddAssistQbind(1, 10, assist)
  }
}

LoadPlayerScript() {
  WinGetActiveTitle, current_title

  Gui, Margin, 5, 20
  Gui, Font, S10, Verdana
  Gui, Add, Edit, w300 R1 Limit80 vwindow_title, %current_title%
  Gui, Add, Button, +5 0x8000 w55 h25, &Cancel
  Gui, Add, Button, default x+5 0x8000 w55 h25 gSubmitPlayerScript, &Apply
  Gui, Show, , Enter Player Name

  return
}

SubmitPlayerScript() {
  global window_title

  Gui, Submit, NoHide
  Gui, Destroy
  Sleep, 100

  if(IsDaoc()) {
    WinSetTitle, %window_title%
    Sleep, 100
    Include(A_ScriptDir . "\PlayerScripts\" . window_title . ".ahk")
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
