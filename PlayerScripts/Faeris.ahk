stealth = {f1}
mount = {f2}
dismount = {f3}
thrust_anytime = {f4}
thrust_block = {f5}
thrust_block_followup = {f6}
shield_side = {f7}
shield_block = {f8}
std_shot = !{f1}
pwr_shot = !{f2}
crit_shot = !{f3}
pb_shot = !{f4}
root_shot = !{f5}
snare_shot = !{f6}
long_shot = !{f7}

OneHanded("$1", "1", [thrust_block_followup, thrust_block, thrust_anytime], [], true)
Ranged("$2", "2", [pwr_shot, std_shot])
Ranged("$3", "3", [long_shot, std_shot])
Ranged("$4", "4", [pb_shot, std_shot])
Ranged("$5", "5", [root_shot, snare_shot, std_shot])
Ranged("$6", "6", [snare_shot, std_shot])
Ranged("$q", "q", [crit_shot, std_shot])
OneHanded("$e", "e", [shield_side, thrust_anytime], [])
OneHanded("$+e", "E", [shield_block, thrust_anytime], [], true)
CurrentWeapon("$+f", "F", [], [dismount, stealth])
