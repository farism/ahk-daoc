SetWorkingDir %A_ScriptDir%
#NoEnv
#Include lib/utils.ahk

; qbinds
;
; f1      = speed song
; f2      = mend song
; f3      = power song
; f8      = mez
; f9      = ratfang
; f10     = liontooth
; 1       = basaliskfang
; 2       = pierce
; 3       = wolftooth
; e       = demezz
; shift+q = charm song

$f1::BindWithRanged("{f1}")
$f2::BindWithRanged("{f2}")
$f3::BindWithRanged("{f3}")
$e::DoubleBindWithRanged("e", "{f8}")
$1::DoubleBindWithOneHanded("1", "{f10}")
$2::DoubleBindWithOneHanded("2", "{f10}")
$3::StyleChainWithOneHanded("3", "{f9}", "{f10}")
