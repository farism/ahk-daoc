anytime = {f1}
frontal = {f2}
frontal_followup = {f3}
parry = {f4}
parry_followup = {f5}
side_snare = {f6}
rear_stun = {f7}
rear_snare = {f8}

debuff_dex_qui = !{f1}
debuff_str_con = !{f2}
debuff_acu = q
debuff_asr = e

TwoHanded("$1", "1", [frontal_followup, frontal, anytime], [])
TwoHanded("$2", "2", [parry_followup, parry, anytime], [], true)
TwoHanded("$3", "3", [side_snare, rear_snare, anytime], [])
TwoHanded("$4", "4", [rear_stun, anytime], [])
TwoHanded("$q", "", [], [debuff_acu, debuff_str_con, debuff_dex_qui])
OneHanded("$e", "", [], [debuff_asr, debuff_str_con, debuff_dex_qui])
