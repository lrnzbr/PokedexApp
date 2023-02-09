//
//  PokemonCellView.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import SwiftUI

struct PokemonCellView: ButtonStyle {
	var pokemon: Pokemon!
	func makeBody(configuration: Self.Configuration) -> some View {
		ZStack {
			LinearGradient(colors: [colorForPoketype[pokemon.type1] ?? Color.red, colorForPoketype[pokemon.type2 ?? pokemon.type1] ?? Color.white], startPoint: .topLeading, endPoint: .bottomTrailing)
			VStack{

				pokemon.image!
					.resizable()
					.scaledToFit()
					.frame(width: 50, height: 50)
				Text(pokemon.name)
			}
		}
		.frame(width: 150, height: 150)
		.cornerRadius(15)
		.shadow(color: colorForPoketype[pokemon.type1]!, radius: 20, x: 10, y: 10)
		.border(.black, width: 4)
	}
}
