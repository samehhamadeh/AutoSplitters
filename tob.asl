// Tales of Berseria Auto Splitter by LurkingSR
// Version 1.1 (January 30th, 2021)
// If you find any issues with the splitter or would want any changes or additions to it
// you can mention it in the Issues section in the github repository, or contact me on 
// Discord at Lurking#1001 or through the Tales of Speedruns server.

state("Tales of Berseria")
{
	// int targetedEnemyHP: 0x00F1D128, 0x0, 0x1B0, 0x708, 0x20, 0x38, 0x0, 0xC;
	int currentGald: 0x00F1D1E8, 0x28, 0x60, 0x18, 0x150, 0x20, 0x30, 0x0;
}

startup
{
	print("AUTOSPLITTER LOADING....");

	// Create list of splits
	vars.splits = new List<Tuple<string, int>>() {
	Tuple.Create("seres", 1572),
	Tuple.Create("drake", 4240),
	Tuple.Create("dyle", 9520),
	Tuple.Create("teresa", 1657), //Placeholder
	Tuple.Create("eizen", 8034),
	Tuple.Create("guardian", 10576),
	Tuple.Create("eleanor1", 9250),
	Tuple.Create("eleanor2", 11528),
	Tuple.Create("zaveid", 12132), //Starts at Eizen, Zaveid's HP is 154623
	Tuple.Create("artorius1", 45480),
	Tuple.Create("eleanor3", 6671),
	Tuple.Create("onesoul", 7763),
	Tuple.Create("kurogane", 17902),
	Tuple.Create("shigure1", 7395),
	Tuple.Create("shigure2", 21087),
	Tuple.Create("rhinobeetle", 23678),
	Tuple.Create("wyverns", 16832),
	Tuple.Create("poisontoad", 42234),
	Tuple.Create("mahina", 18923),
	Tuple.Create("kamoana", 40116),
	Tuple.Create("antiquearmor", 22656),
	Tuple.Create("dullahan", 38515),
	Tuple.Create("pandorapot", 42606),
	Tuple.Create("shenlong", 90714),
	Tuple.Create("medisa", 53550),
	Tuple.Create("xenomantis", 57712),
	Tuple.Create("cerberus", 61981),
	Tuple.Create("teresaoscar", 51302), // Teresa: 58757
	Tuple.Create("chimera", 73846),
	Tuple.Create("melchior1", 63474),
	Tuple.Create("hellkite", 79027),
	Tuple.Create("aifried", 71705),
	Tuple.Create("shigure3", 76281),
	Tuple.Create("melchior2", 84206),
	Tuple.Create("artorius2", 77873),
	Tuple.Create("artorius3", 151621),

	Tuple.Create("bludewolf", 1415),
	Tuple.Create("hellawesguards", 1907),
	Tuple.Create("lizards", 2107),
	Tuple.Create("bullandrat", 6153),
	Tuple.Create("snakeladies", 2918),
	Tuple.Create("vesterguards", 888),
	Tuple.Create("bushape", 9732),
	Tuple.Create("octopot", 6937),
	Tuple.Create("zombopot", 5651),
	Tuple.Create("faldiestrash", 12489),
	Tuple.Create("aballtrash", 12351),
	Tuple.Create("angel", 21705),
	};

	vars.splitsHit = new HashSet<string>();

	// Add all story bosses
	settings.Add("storybosses", true, "Story Bosses");
	settings.Add("seres", true, "Seres", "storybosses");
	settings.Add("drake", true, "Drake", "storybosses");
	settings.Add("dyle", true, "Dyle", "storybosses");
	settings.Add("teresa", true, "Teresa", "storybosses");
	settings.Add("eizen", true, "Eizen", "storybosses");
	settings.Add("guardian", true, "Guardian", "storybosses");
	settings.Add("eleanor1", true, "Eleanor 1 (Port Zekson)", "storybosses");
	settings.Add("eleanor2", true, "Eleanor 2 (Villa)", "storybosses");
	settings.Add("zaveid", true, "Zaveid and Eizen", "storybosses");
	settings.Add("artorius1", true, "Artorius 1 (Forced loss)", "storybosses");
	settings.Add("eleanor3", true, "Eleanor 3 (1v1 Duel)", "storybosses");
	settings.Add("onesoul", true, "1 Soul Guy", "storybosses");
	settings.Add("kurogane", true, "Kurogane", "storybosses");
	settings.Add("shigure1", true, "Shigure 1 (Vester Tunnels)", "storybosses");
	settings.Add("shigure2", true, "Shigure 2 (Port Cadnix)", "storybosses");
	settings.Add("rhinobeetle", true, "Rhino Beetle", "storybosses");
	settings.Add("wyverns", true, "Wyverns", "storybosses");
	settings.Add("poisontoad", true, "Poison Toad", "storybosses");
	settings.Add("mahina", true, "Mahina", "storybosses");
	settings.Add("kamoana", true, "Kamoana", "storybosses");
	settings.Add("antiquearmor", true, "Antique Armor", "storybosses");
	settings.Add("dullahan", true, "Dullahan", "storybosses");
	settings.Add("pandorapot", true, "Pandora Pot", "storybosses");
	settings.Add("shenlong", true, "Shenlong", "storybosses");
	settings.Add("medisa", true, "Medisa", "storybosses");
	settings.Add("xenomantis", true, "Xeno Mantis", "storybosses");
	settings.Add("cerberus", true, "Cerberus", "storybosses");
	settings.Add("teresaoscar", true, "Teresa and Oscar", "storybosses");
	settings.Add("chimera", true, "Chimera", "storybosses");
	settings.Add("melchior1", true, "Melchior and Silva", "storybosses");
	settings.Add("hellkite", true, "Hellkite", "storybosses");
	settings.Add("aifried", true, "Aifried", "storybosses");
	settings.Add("shigure3", true, "Shigure 3 (Mount Killaraus)", "storybosses");
	settings.Add("melchior2", true, "Melchior 2 (Mount Killaraus)", "storybosses");
	settings.Add("artorius2", true, "Artorius and Innominat", "storybosses");
	settings.Add("artorius3", true, "Armatized Artorius", "storybosses");

	// TODO: ADD ALL SCRUB FIGHTS
	settings.Add("scrubfights", true, "Scrub Fights");
	settings.Add("bludewolf", false, "Blude Wolf", "scrubfights");
	settings.Add("hellawesguards", false, "Hellawes Guards", "scrubfights");
	settings.Add("lizards", false, "Vortigern Lizards", "scrubfights");
	settings.Add("bullandrat", false, "Vortigern Guard and Pets", "scrubfights");
	settings.Add("snakeladies", true, "Snake Ladies", "scrubfights");
	settings.Add("vesterguards", false, "Vester Guards", "scrubfights");
	settings.Add("bushape", false, "Bush Ape", "scrubfights");
	settings.Add("octopot", false, "Octopot", "scrubfights");
	settings.Add("zombopot", false, "Zombopot", "scrubfights");
	settings.Add("faldiestrash", false, "Faldies Guards", "scrubfights");
	settings.Add("aballtrash", false, "Aball Daemons", "scrubfights");
	settings.Add("angel", false, "Loegres Angel", "scrubfights");

	vars.gameConnected = false;
	vars.timerJustStarted = false;
	vars.timerStartedSinceBoot = false;
	vars.currentlyInFight = false;
	vars.currentEnemyHP = 0;
	vars.oldEnemyHP = 0;
	vars.oldOldEnemyHP = 0;
	vars.eleanor2Count = 0;
	vars.hellkiteCount = 0;
	vars.timer_OnStart = (EventHandler)((s, e) =>
	{
		vars.timerJustStarted = true;
	});
	timer.OnStart += vars.timer_OnStart;
}


shutdown
{
	try {
		timer.OnStart -= vars.timer_OnStart;
	} catch {}
	vars.gameConnected = false;
	vars.timerStartedSinceBoot = false;
	vars.currentlyInFight = false;
	vars.currentFight = "none";
}


init
{
	print("Game found!");
	vars.gameConnected = true;
	vars.enemyHPDeepPointer = new DeepPointer("Tales of Berseria.exe", 0x00F1D128, 0x0, 0x1B0, 0x708, 0x20, 0x38, 0x0, 0xC);
}


exit
{
	vars.gameConnected = false;
	vars.currentlyInFight = false;
	print("EXITING THE GAME!");

}


update
{
	vars.oldOldOldEnemyHP = vars.oldOldEnemyHP;
	vars.oldOldEnemyHP = vars.oldEnemyHP;
	vars.oldEnemyHP = vars.currentEnemyHP;
	vars.currentEnemyHP = vars.enemyHPDeepPointer.Deref<int>(game, -1);
	print("Current enemy HP is: " + vars.currentEnemyHP + " and old enemy HP is: "+ vars.oldEnemyHP);
	if (!vars.gameConnected) {
		return false;
	}

	if (vars.timerJustStarted) {
		vars.splitsHit.Clear();
		vars.timerJustStarted = false;
		vars.timerStartedSinceBoot = true;
		vars.currentlyInFight = false;
	}
	if (vars.gameConnected == false) {
		vars.currentlyInFight = false;
		return false;
	}

	// This is to deal with the problem of splitting when exitting the game mid-fight
	if (vars.currentlyInFight && old.currentGald != current.currentGald) {
		vars.currentlyInFight = false;
	}
}


split
{
	// Don't try anything if our vars state might be dirty
	if (!vars.gameConnected || vars.timerJustStarted || !vars.timerStartedSinceBoot) {
		return false;
	}

	// We just entered a fight
	if (vars.oldEnemyHP == -1 && vars.currentEnemyHP != -1) {
		vars.currentlyInFight = true;
		vars.enemyMaxHP = vars.currentEnemyHP;
		foreach (var split in vars.splits) {
			if (!settings[split.Item1] || vars.splitsHit.Contains(split.Item1)) {
				continue;
			}
			if (vars.enemyMaxHP == split.Item2) {
				vars.currentFight = split.Item1;
			}
		}
	}

	// We just finished a fight
	if (vars.oldOldOldEnemyHP != -1 && vars.oldOldEnemyHP == -1 && vars.oldEnemyHP == -1 && vars.currentEnemyHP == -1) {
		if (vars.gameConnected && vars.currentlyInFight && settings[vars.currentFight] && !vars.splitsHit.Contains(vars.currentFight)) {
			print("I just split for " + vars.currentFight);
			print("There current HP is " + vars.currentEnemyHP + " and their old HP is " + vars.oldOldEnemyHP);
			if (vars.currentFight == "eleanor2" && vars.eleanor2Count == 0) {
				vars.eleanor2Count++;
				return false;
			}
			if (vars.currentFight == "hellkite" && vars.hellkiteCount == 0) {
				vars.hellkiteCount++;
				return false;
			}
			vars.splitsHit.Add(vars.currentFight);
			vars.currentFight = "none";
			vars.currentlyInFight = false;
			return true;
		}
	}
}


start
{
	if (old.currentGald == 0 && current.currentGald == 200) {
		vars.currentFight = "none";
		vars.hellkiteCount = 0;
		vars.eleanor2Count = 0;
		return true;
	}
}