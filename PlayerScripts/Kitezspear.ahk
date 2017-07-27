#NoEnv

spear_anytime = {f1}
spear_side_snare = {f2}
spear_side_followup = {f3}
spear_back_snare = {f4}
spear_parry = {f5}
spear_parry_followup = {f6}
pierce_anytime = {f7}
pierce_side_snare = {f8}
slam = !{f1}

TwoHanded("$1", "1", [spear_side_followup, spear_side_snare, spear_anytime], [])
TwoHanded("$2", "2", [spear_side_snare, spear_back_snare, spear_anytime], [])
TwoHanded("$3", "3", [spear_parry_followup, spear_parry, spear_anytime], [], true)
OneHanded("$4", "4", [slam], [])
OneHanded("$5", "5", [pierce_side_snare, pierce_anytime], [])
