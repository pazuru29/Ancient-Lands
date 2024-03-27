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
    ]
    
    static let gameLocations: [Location] = [
        //Forest
        Location(assetName: "TrailInTheWoods", name: "Trail In The Woods", story: "You're walking down a path in the woods.", type: .forest, nextLocations: [.forest, .field, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyGrove", name: "Mossy Grove", story: "You find yourself surrounded by a peaceful grove, where moss-covered trees stand sentinel.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "SunlitGlade", name: "Sunlit Glade", story: "A sunlit glade opens up before you, inviting you to explore its tranquil beauty.", type: .forest, nextLocations: [.forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "WhisperingWoods", name: "Whispering Woods", story: "The trees seem to whisper secrets to one another as you navigate through the dense woods.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "FernValley", name: "Fern Valley", story: "A lush valley filled with ferns stretches out before you, a verdant oasis within the forest.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "EnchantedForest", name: "Enchanted Forest", story: "You step into an enchanted forest, where magic seems to permeate every leaf and branch.", type: .forest, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "EternalWoodlands", name: "Eternal Woodlands", story: "The forest stretches on endlessly, a timeless expanse of greenery and wonder.", type: .forest, nextLocations: [.forest, .caves, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "SecretGlen", name: "Secret Glen", story: "In a secluded glen, you discover a hidden world of natural beauty hidden away from prying eyes.", type: .forest, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "EmeraldThicket", name: "Emerald Thicket", story: "A dense thicket of emerald foliage surrounds you, creating a verdant paradise within the forest.", type: .forest, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "SereneGlade", name: "Serene Glade", story: "In a serene glade, sunlight filters through the canopy, illuminating the forest floor in a warm glow.", type: .forest, nextLocations: [.forest, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "MysticWoods", name: "Mystic Woods", story: "You enter a realm of mystic woods, where ancient magic still lingers in the air.", type: .forest, nextLocations: [.forest, .field], actions: [.lookAround, .moveOn]),
        Location(assetName: "FrozenTundra", name: "Frozen Tundra", story: "The landscape is frozen and desolate, with icy winds whipping across the barren tundra.", type: .forest, nextLocations: [.forest, .field], actions: [.lookAround, .moveOn]),
        
        //Field
        Location(assetName: "GoldenMeadow", name: "Golden Meadow", story: "You find yourself in a vast meadow, bathed in the warm glow of the sun.", type: .field, nextLocations: [.field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SunflowerPatch", name: "Sunflower Patch", story: "You stumble upon a vibrant patch of sunflowers, their cheerful faces turned towards the sun.", type: .field, nextLocations: [.field], actions: [.lookAround, .moveOn]),
        Location(assetName: "SunnyPasture", name: "Sunny Pasture", story: "A sun-drenched pasture stretches out before you, dotted with contented grazing animals.", type: .field, nextLocations: [.field, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "VerdantMeadow", name: "Verdant Meadow", story: "You enter a lush meadow, where wildflowers carpet the ground in a riot of colors.", type: .field, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "GrazingPasture", name: "Grazing Pasture", story: "Cattle graze peacefully in the pasture, their contented lowing adding to the serene atmosphere.", type: .field, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "TallGrass", name: "Tall Grass", story: "Tall grasses sway in the wind, creating a mesmerizing sea of green.", type: .field, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "OpenPrairie", name: "Open Prairie", story: "You stand on the edge of an open prairie, where the grass stretches out endlessly before you.", type: .field, nextLocations: [.field, .forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "BucolicMeadows", name: "Bucolic Meadows", story: "The meadows here are truly bucolic, evoking a sense of peace and tranquility.", type: .field, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        
        //Mount
        Location(assetName: "SnowyPeak", name: "Snowy Peak", story: "You stand atop a snowy peak, the world stretching out below you in all directions.", type: .mount, nextLocations: [.mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "JaggedRidge", name: "Jagged Ridge", story: "A jagged ridge stretches out before you, its rocky spires reaching towards the sky.", type: .mount, nextLocations: [.mount, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "MajesticSummit", name: "Majestic Summit", story: "You reach the summit of a majestic mountain, where the air is thin and the views are breathtaking.", type: .mount, nextLocations: [.mount, .field, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "WindsweptPlateau", name: "Windswept Plateau", story: "A windswept plateau spreads out before you, the wind howling as it rushes across the open space.", type: .mount, nextLocations: [.field, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "RockyPeak", name: "Rocky Peak", story: "You climb to the top of a rocky peak, where the air is crisp and the views are unparalleled.", type: .mount, nextLocations: [.field, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "MistyMountain", name: "Misty Mountain", story: "The mountain is shrouded in mist, creating an ethereal atmosphere as you ascend its slopes.", type: .mount, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "CloudyCrest", name: "Cloudy Crest", story: "You reach the crest of the mountain, where clouds swirl around you, obscuring your view.", type: .mount, nextLocations: [.caves, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "DistantPeak", name: "Distant Peak", story: "In the distance, you can see another peak rising high above the surrounding mountains, beckoning you onward.", type: .mount, nextLocations: [.caves, .field, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "StormyAscent", name: "Stormy Ascent", story: "A storm gathers on the horizon as you begin your ascent, dark clouds swirling ominously overhead.", type: .mount, nextLocations: [.caves, .mount], actions: [.lookAround, .moveOn]),
        
        //Desert --
        Location(assetName: "SandyDunes", name: "Sandy Dunes", story: "You find yourself amidst vast sandy dunes, their shifting shapes creating an otherworldly landscape.", type: .desert, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "Oasis", name: "Oasis", story: "You stumble upon a lush oasis, its vibrant greenery a stark contrast to the surrounding desert.", type: .desert, nextLocations: [.desert, .caves, .gorges, .dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "ScorchedWastes", name: "Scorched Wastes", story: "The landscape is barren and desolate, with nothing but scorched earth for miles around.", type: .desert, nextLocations: [.desert, .caves, .dungeons, .gorges], actions: [.lookAround, .moveOn]),
        Location(assetName: "RockyBadlands", name: "Rocky Badlands", story: "You navigate through rocky badlands, where jagged cliffs and boulders dominate the landscape.", type: .desert, nextLocations: [.desert, .caves, .dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "EndlessDunes", name: "Endless Dunes", story: "The dunes seem to stretch on endlessly, with no sign of civilization in sight.", type: .desert, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "MirageMist", name: "Mirage Mist", story: "A shimmering mirage dances on the horizon, teasing you with promises of water and shade.", type: .desert, nextLocations: [.desert, .field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "ForgottenRuins", name: "Forgotten Ruins", story: "You stumble upon the ruins of an ancient civilization, its secrets buried beneath the sands of time.", type: .desert, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "SearingWasteland", name: "Searing Wasteland", story: "The desert stretches out before you like a searing wasteland, its unforgiving terrain posing a formidable challenge.", type: .desert, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "AridPlateau", name: "Arid Plateau", story: "You climb to the top of an arid plateau, where the view of the surrounding desert is both breathtaking and desolate.", type: .desert, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SandyOasis", name: "Sandy Oasis", story: "A sandy oasis lies hidden amidst the dunes, providing a welcome respite from the desert heat.", type: .desert, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "CactusValley", name: "Cactus Valley", story: "You wander through a valley filled with towering cacti, their spiky forms a testament to the resilience of desert life.", type: .desert, nextLocations: [.desert, .field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "DesolateExpanse", name: "Desolate Expanse", story: "The desert stretches out before you in a desolate expanse, its emptiness overwhelming.", type: .desert, nextLocations: [.caves, .field], actions: [.lookAround, .moveOn]),
        
        //Swamp
        Location(assetName: "MistyMarsh", name: "Misty Marsh", story: "You find yourself in a misty marsh, where thick fog blankets the murky waters.", type: .swamp, nextLocations: [.swamp, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "BoggyWetland", name: "Boggy Wetland", story: "The ground beneath your feet is soft and boggy, making each step a challenge.", type: .swamp, nextLocations: [.swamp, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "SoggyThicket", name: "Soggy Thicket", story: "You push your way through a soggy thicket, the damp foliage clinging to your clothes.", type: .swamp, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "FoggySwamp", name: "Foggy Swamp", story: "A thick fog hangs in the air, obscuring your vision as you navigate the swamp.", type: .swamp, nextLocations: [.swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "QuagmireMarsh", name: "Quagmire Marsh", story: "You tread carefully through a quagmire marsh, where each step threatens to swallow you whole.", type: .swamp, nextLocations: [.forest, .swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyBog", name: "Mossy Bog", story: "The ground is covered in a thick layer of moss, creating a soft, spongy surface beneath your feet.", type: .swamp, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "MurkyWaters", name: "Murky Waters", story: "You wade through murky waters, the dark depths concealing who knows what beneath the surface.", type: .swamp, nextLocations: [.swamp], actions: [.lookAround, .moveOn]),
        Location(assetName: "RottingMire", name: "Rotting Mire", story: "The mire is filled with rotting vegetation, the stench overpowering as you make your way through the swamp.", type: .swamp, nextLocations: [.swamp, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "QuicksandBog", name: "Quicksand Bog", story: "You tread carefully through a quicksand bog, each step threatening to pull you under.", type: .swamp, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        
        //Dungeons
        Location(assetName: "DarkPassageway", name: "Dark Passageway", story: "You find yourself in a dark passageway, the air thick with the scent of damp earth and decay.", type: .dungeons, nextLocations: [.dungeons, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "GloomyCell", name: "Gloomy Cell", story: "You stumble upon a gloomy cell, its bars rusted and its walls covered in mysterious markings.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "ShadowyCorridor", name: "Shadowy Corridor", story: "A shadowy corridor stretches out before you, its twists and turns leading deeper into the dungeon's depths.", type: .dungeons, nextLocations: [.dungeons, .desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "ForgottenCrypt", name: "Forgotten Crypt", story: "You step into a forgotten crypt, the resting place of long-dead souls shrouded in darkness.", type: .dungeons, nextLocations: [.dungeons, .desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "CursedVault", name: "Cursed Vault", story: "You discover a cursed vault, its contents guarded by malevolent spirits and ancient curses.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "HauntedPrison", name: "Haunted Prison", story: "The dungeon's haunted prison is filled with the echoes of tormented souls, their anguished cries filling the air.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "EerieTunnels", name: "Eerie Tunnels", story: "You navigate through eerie tunnels, their walls lined with flickering torches that cast dancing shadows.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "CreepyCatacombs", name: "Creepy Catacombs", story: "You enter a network of creepy catacombs, where the bones of the dead lie entombed in ancient sarcophagi.", type: .dungeons, nextLocations: [.dungeons, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "MalevolentChamber", name: "Malevolent Chamber", story: "A malevolent chamber looms before you, its aura of darkness and despair palpable.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "SinisterPassage", name: "Sinister Passage", story: "You traverse a sinister passage, its walls adorned with grotesque carvings and sinister symbols.", type: .dungeons, nextLocations: [.dungeons, .forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "ForbiddenVault", name: "Forbidden Vault", story: "You enter a forbidden vault, its treasures guarded by ancient traps and deadly guardians.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "DreadfulLabyrinth", name: "Dreadful Labyrinth", story: "The dungeon's dreadful labyrinth twists and turns in impossible ways, disorienting and confusing all who dare to enter.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        Location(assetName: "AccursedChamber", name: "Accursed Chamber", story: "An accursed chamber lies before you, its walls seeping with malevolent energy that chills you to the bone.", type: .dungeons, nextLocations: [.dungeons], actions: [.lookAround, .moveOn]),
        
        //Caves
        Location(assetName: "GlowingGrotto", name: "Glowing Grotto", story: "You enter a glowing grotto, where bioluminescent fungi cast an ethereal light on the cave walls.", type: .caves, nextLocations: [.mount, .desert, .field, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "CrystalCavern", name: "Crystal Cavern", story: "You stumble upon a crystal cavern, its walls shimmering with colorful formations of precious gems.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SubterraneanLake", name: "Subterranean Lake", story: "You come upon a subterranean lake, its dark waters reflecting the eerie glow of the cave's bioluminescent inhabitants.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "StalactiteGarden", name: "Stalactite Garden", story: "You find yourself in a stalactite garden, where the cave ceiling is adorned with beautiful formations of dripping rock.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "UndergroundRiver", name: "Underground River", story: "An underground river rushes past, its dark waters carving intricate patterns into the cave walls.", type: .caves, nextLocations: [.forest, .desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "ShadowyTunnel", name: "Shadowy Tunnel", story: "You venture into a shadowy tunnel, its depths shrouded in darkness.", type: .caves, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyChamber", name: "Mossy Chamber", story: "The chamber is carpeted with moss, giving the cave a lush and verdant appearance.", type: .caves, nextLocations: [.forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SpectralGlow", name: "Spectral Glow", story: "A spectral glow emanates from the walls, casting strange shadows that seem to dance and flicker.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "ChitteringCavern", name: "Chittering Cavern", story: "The cavern echoes with the chittering of unseen creatures, their presence felt but not seen.", type: .caves, nextLocations: [.caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "CollapsedPassage", name: "Collapsed Passage", story: "You come upon a collapsed passage, its rubble blocking your path deeper into the cave.", type: .caves, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "SlipperySlope", name: "Slippery Slope", story: "The slope is slippery with moisture, making each step treacherous as you descend deeper into the cave.", type: .caves, nextLocations: [.mount, .forest, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "FossilizedVault", name: "Fossilized Vault", story: "You discover a fossilized vault, its contents preserved for eons within the stone.", type: .caves, nextLocations: [.desert, .caves], actions: [.lookAround, .moveOn]),
        Location(assetName: "DampPassageway", name: "Damp Passageway", story: "The passageway is damp and humid, with moisture dripping from the ceiling and pooling on the cave floor.", type: .caves, nextLocations: [.forest, .caves], actions: [.lookAround, .moveOn]),
        
        //Gorges
        Location(assetName: "DustyCanyon", name: "Dusty Canyon", story: "You descend into a dusty canyon, its walls rising high on either side as you navigate the narrow passageway.", type: .gorges, nextLocations: [.desert], actions: [.lookAround, .moveOn]),
        Location(assetName: "AlpineGorge", name: "Alpine Gorge", story: "You find yourself in an alpine gorge, where sheer cliffs rise on either side.", type: .gorges, nextLocations: [.forest, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "MistyGorge", name: "Misty Gorge", story: "You find yourself in a misty gorge, where tendrils of fog weave through the towering cliffs.", type: .gorges, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "RumblingRavine", name: "Rumbling Ravine", story: "A rumbling ravine stretches out before you, its depths echoing with the sound of rushing water.", type: .gorges, nextLocations: [.forest, .mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "ThunderingChasm", name: "Thundering Chasm", story: "You come upon a thundering chasm, where cascading waterfalls plummet into the depths below.", type: .gorges, nextLocations: [.mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "ShadowyCanyon", name: "Shadowy Canyon", story: "The canyon is shadowy and foreboding, its depths obscured by the towering cliffs that surround you.", type: .gorges, nextLocations: [.mount], actions: [.lookAround, .moveOn]),
        Location(assetName: "MossyChasm", name: "Mossy Chasm", story: "The chasm is mossy and overgrown, with lush vegetation clinging to the cliffs that line its edges.", type: .gorges, nextLocations: [.forest], actions: [.lookAround, .moveOn]),
        Location(assetName: "FoggyGorge", name: "Foggy Gorge", story: "A thick fog hangs in the air, obscuring your vision as you navigate the misty gorge.", type: .gorges, nextLocations: [.swamp], actions: [.lookAround, .moveOn]),
    ]
    
    //TODO: - add boss location to game
    static let bossLocations: [Location] = [
        Location(assetName: "ForrestBoss1", name: "Temple of the Great One", story: "You meet the temple of the great one, its magnitude paralyzing you. Are you ready to take this fight?", type: .boss, nextLocations: [], actions: [.fight,.passBy]),
        Location(assetName: "ForrestBoss2", name: "Hall of Great Warriors", story: "This hall was once frequented by the most famous warriors of the land. But now it's home to a less than kind creature.", type: .boss, nextLocations: [], actions: [.fight,.passBy]),
    ]
    
    static let meditation: Location = Location(assetName: "MeditationStone", name: "Meditation Stone", story: "You've come to the meditation stone. It's good luck to meet him. This stone remembers many great battles, you can meditate near it to increase your skills.", type: .any, nextLocations: [], actions: [.knight, .elf, .wizard])
    
    static let somebody = Supplement(assetName: "Somebody", name: "Somebody", story: "You're detecting someone.", actions: [.useTheTrap, .attack, .escape])
    
    //TODO: Make 2 chests - ancient - 5%, chest - 10%, enemy - 20%, noting - 65%
    static let ancientChest = Supplement(assetName: "AncientChest", name: "Ancient Chest", story: "You have discovered an ancient chest, travelers know they are more valuable as ancient warriors hid their weapons in them.", actions: [.examine, .open, .passBy])
    
    static let chest = Supplement(assetName: "Chest", name: "Chest", story: "You have discovered a chest, such chests are usually used to hide food and valuables. Perhaps its owner is nearby.", actions: [.examine, .open, .passBy])
    
    static let nothing = Supplement(story: "You don't notice anything.", actions: [.moveOn])
    
    //TODO: - add trap to supplement
    
    static let easyEnemys: [Enemy] = [
        Enemy(assetName: "ForestGoblin", name: "Forest Goblin", typeOfLocation: .forest, hp: 30, attacks: [5,10,15], debuffs: [])
    ]
    
    static let mediumEnemys: [Enemy] = [
        Enemy(assetName: "ChiefForestGoblin", name: "Chief Forest Goblin", typeOfLocation: .forest, hp: 75, attacks: [20,30,45], debuffs: [])
    ]
    
    static let bossEnemys: [Enemy] = [
        //TODO: - add boss
    ]
}
