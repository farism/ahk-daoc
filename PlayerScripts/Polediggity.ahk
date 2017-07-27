#NoEnv

pole_anytime = {f1}
pole_side_snare = {f2}
pole_side_snare_followup = {f3}
pole_back_snare = {f4}
pole_back_snare_followup = {f5}
pole_parry = {f6}
pole_parry_followup = {f7}
thrust_anytime = {f8}
thrust_side_asr_debuff = {f9}
engage = !{f1}
slam = !{f2}

TwoHanded("$1", "1", [pole_side_snare_followup, pole_side_snare, pole_anytime], [])
TwoHanded("$2", "2", [pole_back_followup, pole_back_snare, pole_anytime], [])
TwoHanded("$3", "3", [pole_side_snare, pole_back_snare, pole_anytime], [])
OneHanded("$4", "4", [thrust_side_asr_debuff, thrust_anytime], [])
TwoHanded("$5", "5", [pole_parry_followup, pole_parry, pole_anytime], [], true)
OneHanded("$q", "q", [Sleep(100), engage], [])
OneHanded("$e", "e", [slam], [])
