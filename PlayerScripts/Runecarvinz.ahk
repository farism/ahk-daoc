#NoEnv

root = {f1}
bolt = {f2}
cold_dd = {f3}
spirit_dd = {f4}
debuff_dex = {f5}
debuff_str = {f6}

bolt_spec = !{f1}
energy_dd_spec = !{f2}
debuff_cold = !{f3}
nearsight = !{f4}
debuff_abs = !{f5}
confuse = !{f6}
bladeturn = !{f7}
bladeturn_grp = !{f8}
speedwarp = !{f10}

CurrentWeapon("$1", "1", [], [bladeturn, energy_dd_spec, debuff_str])
CurrentWeapon("$2", "2", [], [Assist(5000), Face(10000), energy_dd_spec, debuff_str])
CurrentWeapon("$3", "3", [], [Face(1000), bolt_spec, bolt, energy_dd_spec, debuff_dex])
CurrentWeapon("$q", "q", [], [Face(10000), bladeturn, root, debuff_dexz])
CurrentWeapon("$e", "e", [], [Face(10000), bladeturn, nearsight, debuff_dex])
CurrentWeapon("$+v", "V", [], [Face(), speedwarp, Sleep(1200), Stick()])
CurrentWeapon("$+x", "X", [], [Face(10000), bladeturn, confuse])
