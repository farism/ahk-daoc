SetWorkingDir %A_ScriptDir%
#NoEnv
#Include ./lib/utils.ahk

; qbinds
;
; f1      = enrage
; f2      = slide slicer
; f3      = riposte
; f4      = cross slash
; f5      = incapacitate

$q::BindWithRanged("q")
$e::BindWithRanged("e")
$+e::BindWithRanged("+e")
$+c::BindWithRanged("+c")
$+v::BindWithRanged("+v")
$5::BindWithRanged("5")
$6::BindWithRanged("6")
$1::
  Send, 1
  SingleStyleChainWithOneHanded("{f2}", "{f1}")
return
$2::
  Send, 2
  SingleStyleChainWithOneHanded("{f3}", "{f1}")
return
$3::
  Send, 3
  SingleStyleChainWithOneHanded("{f5}", "{f1}")
return
$4::
  Send, 3
  SingleStyleChainWithOneHanded("{f4}", "{f1}")
return
