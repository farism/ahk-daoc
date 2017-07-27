SetWorkingDir %A_ScriptDir%
#NoEnv
#Include ./lib/utils.ahk

; qbinds
;
; q       = crit shot
; +q      = pb shot
; e       = bola shot
; +e      = long shot
; +f      = stealth
; +c      = black widow
; f1      = crush arrow
; f2      = pierce arrow
; f3      = slash arrow
; f4      = squall

$1::DoubleBindWithOneHanded("1", "{f4}")
$2::DoubleBindWithOneHanded("2", "{f4}")
$3::BindWithRanged("3")
$4::BindWithRanged("4")
$q::BindWithRanged("q")
$+q::BindWithRanged("+q")
$e::BindWithRanged("e")
$+e::BindWithRanged("+e")
