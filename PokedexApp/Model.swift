//
//  Model.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import Foundation

struct Pokemon {
	var id = UUID()
	var name: String
	var description: String?
	var image: Data?
}

let squirtle = Pokemon(name: "Squirtle", description: "x", image: nil)
let bulbasaur = Pokemon(name: "Bulbasaur", description: "x", image: nil)
let charmander = Pokemon(name: "Charmander", description: "x", image: nil)



var allPokemeon: [Pokemon] = [squirtle, bulbasaur, charmander]
