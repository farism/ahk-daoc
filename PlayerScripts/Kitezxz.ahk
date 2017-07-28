anytime = {f1}
side_stun = {f2}
side_stun_followup = {f3}
frontal_root = {f4}
frontal_root_followup = {f5}
parry = {f6}
parry_followup = {f7}
back_stun = {f8}
back_stun_followup = {f9}
back_snare = {f10}
lifetap = !{f1}
group_ablative = !{f2}
heat_dd = !{f3}
immolation = e
disease = +e

TwoHanded("$1", "1", [side_stun_followup, side_stun, anytime], [])
TwoHanded("$2", "2", [frontal_root_followup, frontal_root, anytime], [])
TwoHanded("$3", "3", [parry_followup, parry, anytime], [], true)
TwoHanded("$4", "4", [back_stun_followup, back_stun, anytime], [])
TwoHanded("$5", "5", [back_snare, anytime], [])
OneHanded("$e", "", [], [immolation, lifetap, group_ablative])
OneHanded("$+e", "", [], [disease, group_ablative])
