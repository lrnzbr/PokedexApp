//
//  MainView.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import SwiftUI

let layout = [GridItem(.adaptive(minimum: 150, maximum: 150), spacing: 4, alignment: .center)]

struct MainView: View {
	@State private var showingSheet = false
	@State private var showDetailScreen = false
	@State var pokemonCollection:[Pokemon] = allPokemon
	@State var selectedPokemon: Pokemon = allPokemon.randomElement()!
	var body: some View {

			NavigationView{
				VStack {
					Button("Capture a New Pokemon"){
						showingSheet.toggle()
					}.padding()
						.background(Color(red: 0.04, green: 0.65, blue: 0.88))
						.clipShape(Capsule())
						.foregroundColor(.black)
					.sheet(isPresented: $showingSheet) {
						AddNewPokemonView(isPresented: $showingSheet, pokemonCollection: $pokemonCollection)
					}
					ScrollView{
					LazyVGrid(columns: layout, spacing: 4){
						ForEach(pokemonCollection, id: \.self){ p in
							Button("Pokemon"){
								selectedPokemon = p
								showDetailScreen = true
							}
							.fullScreenCover(isPresented: $showDetailScreen) {
							} content: {
								PokemonDetailView(showDetailScreen: $showDetailScreen, pokemon: selectedPokemon)
							}
							.buttonStyle(PokemonCellView(pokemon: p))
						}
					}

				}.frame(maxHeight: .infinity)
				}
			}
		}
	}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct ListSelectionStyle: ButtonStyle {
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.background(configuration.isPressed ? Color.gray : Color.clear)
	}
}
