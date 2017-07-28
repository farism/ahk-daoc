demez = {f1}
mez = {f2}
amnesia = {f3}
lifetap = {f4}
root = {f5}
debuff_dex = {f6}
debuff_str = {f7}

mez_ae = {f8}
debuff_dex_qui = {f9}
debuff_str_con = {f10}
speedwarp = !{f10}

CurrentWeapon("$1", "1", [], [demez, lifetap, debuff_str_con])
CurrentWeapon("$2", "2", [], [Face(5000), lifetap, debuff_str_con])
CurrentWeapon("$3", "3", [], [demez, mez, debuff_dex, debuff_dex_qui])
CurrentWeapon("$4", "4", [], [demez, mez_ae, debuff_dex, debuff_dex_qui])
CurrentWeapon("$5", "5", [], [demez, root, debuff_dex, debuff_dex_qui])
CurrentWeapon("$e", "e", [], [amnesia])
CurrentWeapon("$+e", "E", [], [debuff_dex, debuff_dex_qui])
CurrentWeapon("$+v", "V", [], [Face(), speedwarp, Sleep(1000), Stick()])
CurrentWeapon("$+x", "X", [], [debuff_str, debuff_str_con])
