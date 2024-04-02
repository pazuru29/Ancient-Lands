//
//  LocationStorage.swift
//  Ancient Lands
//
//  Created by Yaroslav Chlek on 25.03.2024.
//

import Foundation

struct GameStorage {
    static let startLocations: [Location] = [
        Location(assetName: "CastleSurroundings", name: "Castle Surroundings", story: "Waking up in the camp outside the castle, you decide to find out the reason for the strange silence that has enveloped the surrounding area. You leave the camp and head in the opposite direction, deeper into the forest.", type: .forest, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "SylvanHaven", name: "Sylvan Haven", story: "You find yourself in a tranquil haven, where the forest seems to embrace you like an old friend.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "NomadCamp", name: "Nomad Camp", story: "You come across a nomad camp, its inhabitants eking out a living in this harsh desert environment.", type: .desert, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "DesertedOutpost", name: "Deserted Outpost", story: "You stumble upon a deserted outpost in the desert sands, its structures weathered by time and neglect.", type: .desert, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
    ]
    
    static let gameLocations: [Location] = [
        //Forest
        Location(assetName: "TrailInTheWoods", name: "Trail In The Woods", story: "You're walking down a path in the woods.", type: .forest, nextLocations: [.forest, .field, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyGrove", name: "Mossy Grove", story: "You enter a serene grove, surrounded by ancient moss-covered trees.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "SunlitGlade", name: "Sunlit Glade", story: "Sunlight filters through the canopy, illuminating a peaceful glade.", type: .forest, nextLocations: [.forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "WhisperingWoods", name: "Whispering Woods", story: "The gentle rustle of leaves fills the air as you step into the whispering woods.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "FernValley", name: "Fern Valley", story: "Ferns carpet the forest floor, creating a lush green valley.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "EnchantedForest", name: "Enchanted Forest", story: "Magic crackles in the air as you venture deeper into the enchanted forest.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "EternalWoodlands", name: "Eternal Woodlands", story: "The woods seem to stretch on endlessly, an eternal expanse of green.", type: .forest, nextLocations: [.forest, .caves, .gorges, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "SecretGlen", name: "Secret Glen", story: "You stumble upon a hidden glen, shielded from the outside world.", type: .forest, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "EmeraldThicket", name: "Emerald Thicket", story: "Thick foliage surrounds you, forming an emerald thicket.", type: .forest, nextLocations: [.forest, .field], actions: [.lookAround, .moveOn]),
        Location(assetName: "SereneGlade", name: "Serene Glade", story: "A sense of peace washes over you as you enter the serene glade.", type: .forest, nextLocations: [.forest, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "MysticWoods", name: "Mystic Woods", story: "Mystical energies pulse through the air, infusing the woods with a sense of wonder.", type: .forest, nextLocations: [.forest, .field], actions: [.lookAround, .moveOn]),
        
        //Field
        Location(assetName: "GoldenMeadow", name: "Golden Meadow", story: "The meadow stretches out before you, bathed in the warm glow of the sun.", type: .field, nextLocations: [.field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SunflowerPatch", name: "Sunflower Patch", story: "A sea of vibrant sunflowers sways gently in the breeze, filling the air with their sweet scent.", type: .field, nextLocations: [.field], actions: [.lookAround, .moveOn]),
        Location(assetName: "SunnyPasture", name: "Sunny Pasture", story: "You find yourself in a peaceful pasture, where sheep graze lazily in the sunshine.", type: .field, nextLocations: [.field, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "VerdantMeadow", name: "Verdant Meadow", story: "The meadow is lush and green, dotted with colorful wildflowers.", type: .field, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "GrazingPasture", name: "Grazing Pasture", story: "Cows graze peacefully in the pasture, their bells softly tinkling in the distance.", type: .field, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "TallGrass", name: "Tall Grass", story: "Tall grass sways in the wind, obscuring your view of the horizon.", type: .field, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "OpenPrairie", name: "Open Prairie", story: "The vast expanse of the prairie stretches out before you, wild and untamed.", type: .field, nextLocations: [.field, .forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "BucolicMeadows", name: "Bucolic Meadows", story: "The meadows are alive with the sound of buzzing bees and chirping crickets.", type: .field, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        
        //Mount
        Location(assetName: "SnowyPeak", name: "Snowy Peak", story: "The snow-capped peak looms above you, majestic and imposing.", type: .mount, nextLocations: [.mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "JaggedRidge", name: "Jagged Ridge", story: "You stand on the edge of a jagged ridge, with sheer cliffs dropping away on either side.", type: .mount, nextLocations: [.mount, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "MajesticSummit", name: "Majestic Summit", story: "From the summit, you can see for miles around, the world spread out below you in all its splendor.", type: .mount, nextLocations: [.mount, .field, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "WindsweptPlateau", name: "Windswept Plateau", story: "The windswept plateau stretches out before you, desolate and barren.", type: .mount, nextLocations: [.field, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "RockyPeak", name: "Rocky Peak", story: "You scramble over rocky terrain, the peak looming ever closer above you.", type: .mount, nextLocations: [.field, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "MistyMountain", name: "Misty Mountain", story: "Mist clings to the slopes of the mountain, shrouding the landscape in mystery.", type: .mount, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "CloudyCrest", name: "Cloudy Crest", story: "Dark clouds gather overhead as you climb higher, the summit obscured by mist.", type: .mount, nextLocations: [.caves, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "DistantPeak", name: "Distant Peak", story: "The distant peak rises above the clouds, a daunting challenge for any adventurer.", type: .mount, nextLocations: [.caves, .field, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "StormyAscent", name: "Stormy Ascent", story: "Lightning flashes overhead as you struggle to make your way up the stormy ascent.", type: .mount, nextLocations: [.caves, .mount], actions: [.lookAround, .moveOn]),
        
        //Desert
        Location(assetName: "SandyDunes", name: "Sandy Dunes", story: "Endless dunes of sand stretch out before you, the sun beating down relentlessly.", type: .desert, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "Oasis", name: "Oasis", story: "You stumble upon a hidden oasis, where palm trees sway in the gentle breeze and clear water sparkles in the sunlight.", type: .desert, nextLocations: [.desert, .caves, .gorges, .dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "ScorchedWastes", name: "Scorched Wastes", story: "The landscape is desolate and barren, scorched by the relentless heat of the sun.", type: .desert, nextLocations: [.desert, .caves, .dungeons, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "RockyBadlands", name: "Rocky Badlands", story: "You find yourself in a maze of rocky badlands, where every step is treacherous.", type: .desert, nextLocations: [.desert, .caves, .dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "EndlessDunes", name: "Endless Dunes", story: "The dunes stretch on endlessly in every direction, an unforgiving landscape of sand and sun.", type: .desert, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "MirageMist", name: "Mirage Mist", story: "Mirage mist shrouds the desert, distorting your perception of reality.", type: .desert, nextLocations: [.desert, .field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "ForgottenRuins", name: "Forgotten Ruins", story: "You stumble upon the forgotten ruins of an ancient civilization, buried beneath the shifting sands.", type: .desert, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "SearingWasteland", name: "Searing Wasteland", story: "The heat is unbearable as you traverse the searing wasteland, your throat parched and dry.", type: .desert, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "AridPlateau", name: "Arid Plateau", story: "You stand on an arid plateau, the landscape stretching out before you in all its desolate beauty.", type: .desert, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SandyOasis", name: "Sandy Oasis", story: "A sandy oasis lies before you, its cool waters a welcome relief from the blistering heat.", type: .desert, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "CactusValley", name: "Cactus Valley", story: "You find yourself in a valley filled with towering cacti, their spines gleaming in the sunlight.", type: .desert, nextLocations: [.desert, .field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "DesolateExpanse", name: "Desolate Expanse", story: "The desert stretches out before you in a desolate expanse, devoid of life.", type: .desert, nextLocations: [.caves, .field], actions: [.lookAround, .moveOn]),
        
        //Swamp
        Location(assetName: "MistyMarsh", name: "Misty Marsh", story: "Mist hangs heavy in the air as you navigate the murky waters of the marsh.", type: .swamp, nextLocations: [.swamp, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "BoggyWetland", name: "Boggy Wetland", story: "The ground squelches beneath your feet as you traverse the boggy wetland.", type: .swamp, nextLocations: [.swamp, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "SoggyThicket", name: "Soggy Thicket", story: "You push your way through a soggy thicket, the air thick with the scent of decay.", type: .swamp, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "FoggySwamp", name: "Foggy Swamp", story: "Thick fog obscures your vision as you wade through the murky waters of the swamp.", type: .swamp, nextLocations: [.swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "QuagmireMarsh", name: "Quagmire Marsh", story: "You find yourself in a quagmire marsh, where every step threatens to suck you down into the muck.", type: .swamp, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyBog", name: "Mossy Bog", story: "Moss-covered trees rise from the murky waters of the bog, their twisted roots reaching out like grasping fingers.", type: .swamp, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "MurkyWaters", name: "Murky Waters", story: "You can barely see through the murky waters of the swamp, your path obscured by tangled roots and floating debris.", type: .swamp, nextLocations: [.swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "RottingMire", name: "Rotting Mire", story: "The stench of decay fills the air as you navigate the rotting mire, the ground soft and squishy beneath your feet.", type: .swamp, nextLocations: [.swamp, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "QuicksandBog", name: "Quicksand Bog", story: "You tread carefully through the quicksand bog, every step a potential danger.", type: .swamp, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        
        //Dungeons
        Location(assetName: "DarkPassageway", name: "Dark Passageway", story: "You step into a dark passageway, the air heavy with the scent of damp stone and decay.", type: .dungeons, nextLocations: [.dungeons, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "GloomyCell", name: "Gloomy Cell", story: "You find yourself in a gloomy cell, its walls lined with rusty iron bars.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "ShadowyCorridor", name: "Shadowy Corridor", story: "Shadows dance across the walls of the corridor as you make your way deeper into the dungeon.", type: .dungeons, nextLocations: [.dungeons, .desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "ForgottenCrypt", name: "Forgotten Crypt", story: "You enter a forgotten crypt, its stone sarcophagi looming ominously in the darkness.", type: .dungeons, nextLocations: [.dungeons, .desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "CursedVault", name: "Cursed Vault", story: "The vault is filled with ancient treasures, but you can't shake the feeling of impending doom.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "HauntedPrison", name: "Haunted Prison", story: "You find yourself in a haunted prison, where the spirits of the condemned still linger.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "EerieTunnels", name: "Eerie Tunnels", story: "The tunnels twist and turn, leading you deeper into the heart of the dungeon.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "CreepyCatacombs", name: "Creepy Catacombs", story: "You enter a network of creepy catacombs, the walls lined with ancient skulls and bones.", type: .dungeons, nextLocations: [.dungeons, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "MalevolentChamber", name: "Malevolent Chamber", story: "You step into a malevolent chamber, where dark energies crackle in the air.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "SinisterPassage", name: "Sinister Passage", story: "The passage twists and turns, leading you deeper into the bowels of the dungeon.", type: .dungeons, nextLocations: [.dungeons, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "ForbiddenVault", name: "Forbidden Vault", story: "The vault is sealed with powerful magic, its contents hidden from prying eyes.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "DreadfulLabyrinth", name: "Dreadful Labyrinth", story: "You find yourself in a dreadful labyrinth, where every twist and turn could lead to danger.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "AccursedChamber", name: "Accursed Chamber", story: "You step into an accursed chamber, where the very air seems to pulse with dark energy.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        
        //Caves
        Location(assetName: "GlowingGrotto", name: "Glowing Grotto", story: "The grotto glows with an otherworldly light, illuminating the darkness of the cave.", type: .caves, nextLocations: [.mount, .desert, .field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "CrystalCavern", name: "Crystal Cavern", story: "The cavern is filled with glittering crystals, their facets catching the faint light of your torch.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SubterraneanLake", name: "Subterranean Lake", story: "You come upon a subterranean lake, its still waters reflecting the stalactites hanging from the cavern ceiling.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "StalactiteGarden", name: "Stalactite Garden", story: "The cavern is filled with towering stalactites, like a forest of stone reaching up to the ceiling.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "UndergroundRiver", name: "Underground River", story: "An underground river rushes past, its waters dark and swift.", type: .caves, nextLocations: [.forest, .desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "ShadowyTunnel", name: "Shadowy Tunnel", story: "You enter a shadowy tunnel, the darkness pressing in around you.", type: .caves, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyChamber", name: "Mossy Chamber", story: "The chamber is overgrown with moss, giving it an ancient and forgotten feel.", type: .caves, nextLocations: [.forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SpectralGlow", name: "Spectral Glow", story: "A spectral glow emanates from deep within the cave, casting eerie shadows on the walls.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "ChitteringCavern", name: "Chittering Cavern", story: "You enter a cavern filled with the sound of chittering insects, their eyes glowing in the darkness.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "CollapsedPassage", name: "Collapsed Passage", story: "You squeeze through a collapsed passage, the rubble blocking your path.", type: .caves, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SlipperySlope", name: "Slippery Slope", story: "You navigate a slippery slope, the ground slick with moisture.", type: .caves, nextLocations: [.mount, .forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "FossilizedVault", name: "Fossilized Vault", story: "You stumble upon a vault filled with fossilized remains, the bones of ancient creatures preserved for eternity.", type: .caves, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        
        //Gorges
        Location(assetName: "DustyCanyon", name: "Dusty Canyon", story: "The canyon stretches out before you, its rocky walls rising high into the sky, casting deep shadows on the dusty ground below.", type: .gorges, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "AlpineGorge", name: "Alpine Gorge", story: "You find yourself in an alpine gorge, surrounded by towering cliffs and snow-capped peaks.", type: .gorges, nextLocations: [.forest, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "MistyGorge", name: "Misty Gorge", story: "Mist hangs in the air as you navigate the winding paths of the gorge, the sound of rushing water echoing off the stone walls.", type: .gorges, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "RumblingRavine", name: "Rumbling Ravine", story: "The ravine rumbles with the sound of cascading waterfalls, its walls slick with moisture.", type: .gorges, nextLocations: [.forest, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "ThunderingChasm", name: "Thundering Chasm", story: "A deep chasm cuts through the landscape, the sound of thunder echoing off its walls.", type: .gorges, nextLocations: [.mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "ShadowyCanyon", name: "Shadowy Canyon", story: "The canyon is shrouded in shadows, the light barely penetrating the darkness below.", type: .gorges, nextLocations: [.mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyChasm", name: "Mossy Chasm", story: "The chasm is overgrown with moss and vines, giving it an ancient and mysterious feel.", type: .gorges, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "FoggyGorge", name: "Foggy Gorge", story: "A thick fog blankets the gorge, obscuring your vision and adding to the sense of mystery.", type: .gorges, nextLocations: [.swamp], actions: [.lookAround, .moveOn]),
    ]
    
    //TODO: - add boss location to game
    static let bossLocations: [Location] = [
        Location(assetName: "ForrestBoss1", name: "Temple of the Great One", story: "You meet the temple of the great one, its magnitude paralyzing you. Are you ready to take this fight?", type: .boss, nextLocations: [], actions: [.fight,.backOut]),
        Location(assetName: "ForrestBoss2", name: "Hall of Great Warriors", story: "This hall was once frequented by the most famous warriors of the land. But now it's home to a less than kind creature.", type: .boss, nextLocations: [], actions: [.fight,.backOut]),
    ]
    
    static let meditation: Location = Location(assetName: "MeditationStone", name: "Meditation Stone", story: "You've come to the meditation stone. It's good luck to meet him. This stone remembers many great battles, you can meditate near it to increase your skills.", type: .any, nextLocations: [], actions: [.improveHp, .improveAttack, .improveDefense])
    
    static let somebody = Supplement(assetName: "Somebody", name: "Somebody", story: "You're detecting someone.", actions: [.useTheTrap, .attack, .escape])
    
    static let ancientChest = Supplement(assetName: "AncientChest", name: "Ancient Chest", story: "You have discovered an ancient chest, travelers know they are more valuable as ancient warriors hid their weapons in them.", actions: [.examine, .open, .passBy])
    
    static let chest = Supplement(assetName: "Chest", name: "Chest", story: "You have discovered a chest, such chests are usually used to hide food and valuables. Perhaps its owner is nearby.", actions: [.examine, .open, .passBy])
    
    static let nothing = Supplement(story: "You don't notice anything.", actions: [.moveOn])
    
    static let trap = Supplement(assetName: "Trap", name: "Trap", story: "You set a trap and wait for the enemy to get caught in it.", actions: [.wait])
    
    static let potionTrap = Supplement(assetName: "PoisonTrap", name: "Poison Trap", story: "You set a poison trap and wait for the enemy to get caught in it.", actions: [.wait])
    
    static let easyEnemys: [Enemy] = [
        Enemy(assetName: "ForestGoblin", name: "Forest Goblin", typeOfLocation: .forest, hp: 30, attacks: [5,10,15], debuffs: [])
    ]
    
    static let mediumEnemys: [Enemy] = [
        Enemy(assetName: "ChiefForestGoblin", name: "Chief Forest Goblin", typeOfLocation: .forest, hp: 75, attacks: [20,30,45], debuffs: [])
    ]
    
    static let bossEnemys: [Enemy] = [
        //TODO: - add boss
        Enemy(assetName: "ChiefForestGoblin", name: "Chief Forest Goblin", typeOfLocation: .forest, hp: 250, attacks: [30,50,70], debuffs: [])
    ]
}
