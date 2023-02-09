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
				Spacer()
				Text(pokemon.name)
					.font(.largeTitle)

				pokemon.image?
					.resizable()
					.frame(width: 90, height: 90)
				HStack{
					Text(pokemon.type1.rawValue)

						.fixedSize(horizontal: false, vertical: true)
						.multilineTextAlignment(.center)
						.padding()

						.background(Capsule()
							.fill(colorForPoketype[pokemon.type1] ?? Color.white)
							.frame(width: 70, height: 30))
					if (pokemon.type2 != nil) {
						Text(pokemon.type2!.rawValue)

							.fixedSize(horizontal: false, vertical: true)
							.multilineTextAlignment(.center)
							.padding()

							.background(Capsule()
								.fill(colorForPoketype[pokemon.type2!] ?? Color.white)
								.frame(width: 70, height: 30))
					}
				}
				Text(pokemon.description ?? "").padding()
				Spacer()
				Button("Close") {
					showDetailScreen = false
				}
				.padding()
				.background(Color(red: 0.5, green: 1, blue: 1))
				.clipShape(Capsule())
				.foregroundColor(.indigo)
				Spacer()
			}
		}.ignoresSafeArea()
			.foregroundColor(Color.white) // 1
			.frame(maxWidth: .infinity, maxHeight: .infinity)

		}

}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
		PokemonDetailView(showDetailScreen: .constant(true), pokemon: allPokemon[0])
    }
}
