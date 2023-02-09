//
//  PokemonDetailView.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/8/23.
//

import SwiftUI

struct PokemonDetailView: View {
	@Binding var showDetailScreen: Bool
	var pokemon: Pokemon
	var body: some View {
		ZStack {
			LinearGradient(colors: [colorForPoketype[pokemon.type1] ?? Color.red, colorForPoketype[pokemon.type2 ?? .ghost] ?? Color.white], startPoint: .bottomTrailing, endPoint: .topLeading)
			VStack {
				Text(pokemon.name)
				pokemon.image?
					.resizable()
					.frame(width: 90, height: 90)
				Button("Close") {
					showDetailScreen = false
				}
			}
		}.ignoresSafeArea()
			.foregroundColor(Color.white) // 1
			.frame(maxWidth: .infinity, maxHeight: .infinity)

		}

}

//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(pokemon: allPokemon[0])
//    }
//}
