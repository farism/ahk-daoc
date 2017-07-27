#Include lib/utils.ahk
SetWorkingDir %A_ScriptDir%

; qbinds
;
; 1       = body debuff
; 2       = lifetap
; 3       = root
; f1      = dex debuff
; f2      = str debuff
; f3      = haste debuff
; f4      = energy debuff

$1::TripleBind("1", "{f2}", "{f3}")
$2::DoubleBind("2", "{f1}")
$3::DoubleBind("3", "{f4}")
