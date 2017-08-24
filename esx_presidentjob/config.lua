Config              = {}
Config.DrawDistance = 100.0

Config.Zones = {

	CloakRoom = {
		Pos   = {x = 129.193, y = -745.111, z = 241.152},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 207, g = 2, b = 0},
		Type  = 1
	},

	Armory = {
		Pos   = {x = 118.801, y = -728.065, z = 241.152},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 2, b = 0},
		Type  = 1
	},

		HelicopterLandingPad1 = {
		Pos   = {x = -415.324, y =  1098.14, z = 332.534},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	   HelicopterLandingPadSpawner1 = {
		Pos   = {x = -415.324, y =  1098.14, z = 332.534},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},


	VehicleSpawner = {
		Pos   = {x = -417.0783, y =  1061.48, z = 323.842},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 2, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos   = {x = -409.483, y = 1061.72, z = 322.841},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	VehicleDeleter1 = {
		Pos   = {x = -422.19, y =  1064.13, z = 323.841},
		Size  = {x = 3, y = 3, z = 3.0},
		Type  = -1
	},
        VehicleDeleter2 = {
		Pos   = {x = -424.19, y =  1064.13, z = 323.841},
		Size  = {x = 3, y = 3, z = 3.0},
		Type  = -1
	}

}
Config.Weapons = {

	{name = 'WEAPON_UNARMED'},
	{name = 'WEAPON_ANIMAL'},
	{name = 'WEAPON_COUGAR'},
	{name = 'WEAPON_KNIFE'},
	{name = 'WEAPON_NIGHTSTICK'},
	{name = 'WEAPON_HAMMER'},
	{name = 'WEAPON_BAT'},
	{name = 'WEAPON_GOLFCLUB'},
	{name = 'WEAPON_CROWBAR'},
	{name = 'WEAPON_PISTOL'},
	{name = 'WEAPON_COMBATPISTOL'},
	{name = 'WEAPON_APPISTOL'},
	{name = 'WEAPON_PISTOL50'},
	{name = 'WEAPON_MICROSMG'},
	{name = 'WEAPON_SMG'},
	{name = 'WEAPON_ASSAULTSMG'},
	{name = 'WEAPON_ASSAULTRIFLE'},
	{name = 'WEAPON_CARBINERIFLE'},
	{name = 'WEAPON_ADVANCEDRIFLE'},
	{name = 'WEAPON_MG'},
	{name = 'WEAPON_COMBATMG'},
	{name = 'WEAPON_PUMPSHOTGUN'},
	{name = 'WEAPON_SAWNOFFSHOTGUN'},
	{name = 'WEAPON_ASSAULTSHOTGUN'},
	{name = 'WEAPON_BULLPUPSHOTGUN'},
	{name = 'WEAPON_STUNGUN'},
	{name = 'WEAPON_SNIPERRIFLE'},
	{name = 'WEAPON_HEAVYSNIPER'},
	{name = 'WEAPON_REMOTESNIPER'},
	{name = 'WEAPON_GRENADELAUNCHER'},
	{name = 'WEAPON_GRENADELAUNCHER_SMOKE'},
	{name = 'WEAPON_RPG'},
	{name = 'WEAPON_PASSENGER_ROCKET'},
	{name = 'WEAPON_AIRSTRIKE_ROCKET'},
	{name = 'WEAPON_STINGER'},
	{name = 'WEAPON_MINIGUN'},
	{name = 'WEAPON_GRENADE'},
	{name = 'WEAPON_STICKYBOMB'},
	{name = 'WEAPON_SMOKEGRENADE'},
	{name = 'WEAPON_BZGAS'},
	{name = 'WEAPON_MOLOTOV'},
	{name = 'WEAPON_FIREEXTINGUISHER'},
	{name = 'WEAPON_PETROLCAN'},
	{name = 'WEAPON_DIGISCANNER'},
	{name = 'WEAPON_BRIEFCASE'},
	{name = 'WEAPON_BRIEFCASE_02'},
	{name = 'WEAPON_BALL'},
	{name = 'WEAPON_FLARE'},
	{name = 'WEAPON_VEHICLE_ROCKET'},
	{name = 'WEAPON_BARBED_WIRE'},
	{name = 'WEAPON_DROWNING'},
	{name = 'WEAPON_DROWNING_IN_VEHICLE'},
	{name = 'WEAPON_BLEEDING'},
	{name = 'WEAPON_ELECTRIC_FENCE'},
	{name = 'WEAPON_EXPLOSION'},
	{name = 'WEAPON_FALL'},
	{name = 'WEAPON_EXHAUSTION'},
	{name = 'WEAPON_HIT_BY_WATER_CANNON'},
	{name = 'WEAPON_RAMMED_BY_CAR'},
	{name = 'WEAPON_RUN_OVER_BY_CAR'},
	{name = 'WEAPON_HELI_CRASH'},
	{name = 'WEAPON_FIRE'},
	--DLC Weapons
	{name = 'WEAPON_SNSPISTOL'},
	{name = 'WEAPON_BOTTLE'},
	{name = 'WEAPON_GUSENBERG'},
	{name = 'WEAPON_SPECIALCARBINE'},
	{name = 'WEAPON_HEAVYPISTOL'},
	{name = 'WEAPON_BULLPUPRIFLE'},
	{name = 'WEAPON_DAGGER'},
	{name = 'WEAPON_VINTAGEPISTOL'},
	{name = 'WEAPON_FIREWORK'},
	{name = 'WEAPON_MUSKET'},
	{name = 'WEAPON_HEAVYSHOTGUN'},
	{name = 'WEAPON_MARKSMANRIFLE'},
	{name = 'WEAPON_HOMINGLAUNCHER'},
	{name = 'WEAPON_PROXMINE'},
	{name = 'WEAPON_SNOWBALL'},
	{name = 'WEAPON_FLAREGUN'},
	{name = 'WEAPON_GARBAGEBAG'},
	{name = 'WEAPON_HANDCUFFS'},
	{name = 'WEAPON_COMBATPDW'},
	{name = 'WEAPON_MARKSMANPISTOL'},
	{name = 'WEAPON_KNUCKLE'},
	{name = 'WEAPON_HATCHET'},
	{name = 'WEAPON_RAILGUN'},
	{name = 'WEAPON_MACHETE'},
	{name = 'WEAPON_MACHINEPISTOL'},
	{name = 'WEAPON_AIR_DEFENCE_GUN'},
	{name = 'WEAPON_SWITCHBLADE'},
	{name = 'WEAPON_REVOLVER'},
	{name = 'WEAPON_DBSHOTGUN'},
	{name = 'WEAPON_COMPACTRIFLE'},
	{name = 'WEAPON_AUTOSHOTGUN'},
	{name = 'WEAPON_BATTLEAXE'},
	{name = 'WEAPON_COMPACTLAUNCHER'},
	{name = 'WEAPON_MINISMG'},
	{name = 'WEAPON_PIPEBOMB'},
	{name = 'WEAPON_POOLCUE'},
	{name = 'WEAPON_WRENCH'}
}