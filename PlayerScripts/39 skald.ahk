SetWorkingDir %A_ScriptDir%
#NoEnv
#Include ./lib/utils.ahk

; qbinds
;
; f1      = comminute
; f2      = demolish
; f3      = frost hammerw
; f4      = conquer
; f5      = ruiner

$e::BindWithOneHanded("e")
$+e::BindWithOneHanded("+e")
$q::BindWithOneHanded("q")
$1::
  Send, 1
  StyleChainWithTwoHanded("{f2}", "{f3}", "{f1}")
return
$2::
  Send, 2
  StyleChainWithTwoHanded("{f3}", "{f4}", "{f1}")
return
$3::
  Send, 3
  StyleChainWithTwoHanded("{f5}", "{f3}", "{f1}")
return
