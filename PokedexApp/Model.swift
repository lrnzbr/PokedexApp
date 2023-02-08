//
//  Model.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable, Hashable {
	var id = UUID()
	var name: String
	var description: String?
	var image: Image?

	func hash(into hasher: inout Hasher) {
		return hasher.combine(id)
	}
}

let squirtle = Pokemon(name: "Squirtle", description: "x", image: Image("Squirtle"))
let bulbasaur = Pokemon(name: "Bulbasaur", description: "x", image: Image("Bulbasaur"))
let charmander = Pokemon(name: "Charmander", description: "x", image: Image("Charmander"))



var allPokemeon: [Pokemon] = [squirtle, bulbasaur, charmander]
