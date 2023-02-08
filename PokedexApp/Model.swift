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

let squirtle = Pokemon(name: "Squirtle", description: "x", image: Image("squirtle"))
let bulbasaur = Pokemon(name: "Bulbasaur", description: "x", image: Image("bulbasaur"))
let charmander = Pokemon(name: "Charmander", description: "x", image: Image("charmander"))



var allPokemeon: [Pokemon] = [squirtle, bulbasaur, charmander]
