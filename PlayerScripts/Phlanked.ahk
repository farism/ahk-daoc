#NoEnv

; qbinds
;
; Q       = resist song
; e       = flute mez
; E       = range song
; 4       = side slicer
;
; f2      = speed
; f3      = mend
; f4      = power
; f5      = ablative
; f6      = siege redux
; f7      = amethyst slash

$+q::BindWithRanged("Q")
$e::BindWithRanged("e")
$+e::BindWithRanged("E")
$+f::BindWithRanged("F")
$f2::BindWithRanged("{f2}")
$f3::BindWithRanged("{f3}")
$f4::BindWithRanged("{f4}")
$4::SingleStyleChainWithOneHanded("4", "{f7}")
