//
//  Model.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable, Hashable {
	var id:Int
	var name: String
	var description: String?
	var image: Image?
	var type1: pokeType
	var type2: pokeType?

	func hash(into hasher: inout Hasher) {
		return hasher.combine(id)
	}
}

enum pokeType {
	case bug, dark, dragon , electric, fairy, fighting, fire, flying, ghost, grass, ground, ice, normal, poison, psychic, rock, steel, water
}



let p1 = Pokemon(id: 1, name: "Bulbasaur", description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.", image: Image("001"), type1: .grass, type2: .poison )
let p2 = Pokemon(id: 2, name: "Ivysaur", description: "There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.", image: Image("002"), type1: .grass, type2: .poison )
let p3 = Pokemon(id: 3, name: "Venusaur", description: "Its plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.", image: Image("003"), type1: .grass, type2: .poison )
let p4 = Pokemon(id: 4, name: "Charmander", description: "It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.", image: Image("004"), type1: .fire )
let p5 = Pokemon(id: 5, name: "Charmeleon", description: "It has a barbaric nature. In battle, it whips its fiery tail around and slashes away with sharp claws.", image: Image("005"), type1: .fire )

let p6 = Pokemon(id: 6, name: "Charizard", description: "It spits fire that is hot enough to melt boulders. It may cause forest fires by blowing flames.", image: Image("006"), type1: .fire, type2: .flying )
let p7 = Pokemon(id: 7, name: "Squirtle", description: "When it retracts its long neck into its shell, it squirts out water with vigorous force.", image: Image("007"), type1: .water )
let p8 = Pokemon(id: 8, name: "Wartortle", description: "It is recognized as a symbol of longevity. If its shell has algae on it, that Wartortle is very old.", image: Image("008"), type1: .water )
let p9 = Pokemon(id: 9, name: "Blastoise", description: "It crushes its foe under its heavy body to cause fainting. In a pinch, it will withdraw inside its shell.", image: Image("009"), type1: .water )
let p10 = Pokemon(id: 10, name: "Caterpie", description: "For protection, it releases a horrible stench from the antenna on its head to drive away enemies.", image: Image("010"), type1: .bug )

let p11 = Pokemon(id: 11, name: "Metapod", description: "It is waiting for the moment to evolve. At this stage, it can only harden, so it remains motionless to avoid attack.", image: Image("011"), type1: .bug)
let p12 = Pokemon(id: 12, name: "Butterfree", description: "In battle, it flaps its wings at great speed to release highly toxic dust into the air.", image: Image("012"), type1: .bug, type2: .flying )
let p13 = Pokemon(id: 13, name: "Weedle", description: "Beware of the sharp stinger on its head. It hides in grass and bushes where it eats leaves.", image: Image("013"), type1: .bug, type2: .poison )
let p14 = Pokemon(id: 14, name: "Kakuna", description: "Able to move only slightly. When endangered, it may stick out its stinger and poison its enemy.", image: Image("014"), type1: .bug, type2: .poison )
let p15 = Pokemon(id: 15, name: "Beedrill", description: "It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.", image: Image("015"), type1: .bug, type2: .poison )

let p16 = Pokemon(id: 16, name: "Pidgey", description: "TVery docile. If attacked, it will often kick up sand to protect itself rather than fight back.", image: Image("016"), type1: .normal, type2: .flying )
let p17 = Pokemon(id: 17, name: "Pidgeotto", description: "This Pokémon is full of vitality. It constantly flies around its large territory in search of prey.", image: Image("017"), type1: .normal, type2: .flying )
let p18 = Pokemon(id: 18, name: "Pidgeot", description: "This Pokémon flies at Mach 2 speed, seeking prey. Its large talons are feared as wicked weapons.", image: Image("018"), type1: .normal, type2: .flying )
let p19 = Pokemon(id: 19, name: "Rattata", description: "Will chew on anything with its fangs. If you see one, you can be certain that 40 more live in the area.", image: Image("019"), type1: .normal )
let p20 = Pokemon(id: 20, name: "Raticate", description: "Its hind feet are webbed. They act as flippers, so it can swim in rivers and hunt for prey.", image: Image("020"), type1: .normal)




var allPokemon: [Pokemon] = [p1, p2,p3,p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20]


var colorForPoketype: [pokeType: Color] = [
	.bug : .green,
	.dark: .brown,
	.dragon : .purple,
	.electric : .yellow,
	.fairy : .pink,
	.fighting : Color("DarkBrown"),
	.fire : .orange,
	.flying : .cyan,
	.ghost: .gray,
	.grass: .green,
	.ground: .brown,
	.ice: .blue,
	.normal: .indigo,
	.poison: .purple ,
	.psychic: Color("Fuschia"),
	.rock: Color("Silver") ,
	.steel : .gray,
	.water : .blue
]
