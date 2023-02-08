//
//  MainView.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import SwiftUI

let layout = [GridItem(.adaptive(minimum: 200, maximum: 500), spacing: 4, alignment: .center)]


struct MainView: View {
    var body: some View {
		LazyVGrid(columns: layout, spacing: 4){
			ForEach(allPokemeon, id: \.self){ pokemon in
				PokemonCellView(pokemon: pokemon )
			}
		}.frame(maxHeight: .infinity)
	}

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
