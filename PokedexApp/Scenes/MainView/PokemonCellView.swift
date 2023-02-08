//
//  PokemonCellView.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import SwiftUI

struct PokemonCellView: View {
	var pokemon: Pokemon!
	var body: some View {
		HStack{
			Text(pokemon.name)
			Image(pokemon.name)
				.resizable()
				.scaledToFit()
				.frame(width: 50, height: 50)

		}
		.padding()
		.background(.red)
		.cornerRadius(15)
		.shadow(color: .red, radius: 20, x: 10, y: 10)
		.border(.black, width: 4)



    }
}

struct PokemonCellView_Previews:
	PreviewProvider {
    static var previews: some View {
		PokemonCellView(pokemon: allPokemeon[1])
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
