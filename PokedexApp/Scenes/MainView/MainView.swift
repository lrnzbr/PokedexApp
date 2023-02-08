//
//  MainView.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import SwiftUI

let layout = [GridItem(.adaptive(minimum: 200, maximum: 500), spacing: 4, alignment: .center)]


struct MainView: View {
	@State private var showingSheet = false
	@State var pokemonCollection:[Pokemon] = allPokemeon


	var body: some View {
		ScrollView{
			VStack {
			Button("Capture a New Pokemon"){
				showingSheet.toggle()
			}
			.sheet(isPresented: $showingSheet) {
				AddNewPokemonView(isPresented: $showingSheet, pokemonCollection: $pokemonCollection)
			}
			LazyVGrid(columns: layout, spacing: 4){
				ForEach(pokemonCollection, id: \.self){ pokemon in
					PokemonCellView(pokemon: pokemon )
				}
			}.frame(maxHeight: .infinity)
		}
	}.refreshable {
		}
	}

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
