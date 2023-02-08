//
//  AddNewPokemonView.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import SwiftUI

struct AddNewPokemonView: View {
	@State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
	@State private var selectedImage: UIImage?
	@State private var isImagePickerDisplay = false
	@State private var name: String = ""
	@State private var description: String = ""
	@Binding var isPresented: Bool
	@Binding var pokemonCollection:[Pokemon]

	func savePokemon(){
		let newPokemon = Pokemon(name: name, description: description, image: Image(uiImage: selectedImage!))
		pokemonCollection.append(newPokemon)
		isPresented = false
		}

	var body: some View {
		NavigationView {
			VStack {

				if selectedImage != nil {
					Image(uiImage: selectedImage!)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.clipShape(Circle())
						.frame(width: 300, height: 300)
				} else {
					Image("whosThatPokemon")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.clipShape(Circle())
						.frame(width: 300, height: 300)
				}

				Button("Camera") {
					self.sourceType = .camera
					self.isImagePickerDisplay.toggle()
				}.padding()

				Button("Photo Library") {
					self.sourceType = .photoLibrary
					self.isImagePickerDisplay.toggle()
				}.padding()

				TextField("Name", text: $name)
				TextField("Description", text: $description)
				Button("Save") {
					savePokemon()
				}.padding()
			}
			.navigationBarTitle("Add A New Pokémon ")
			.sheet(isPresented: self.$isImagePickerDisplay) {
				ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
			}

		}
	}
}

struct AddNewPokemonView_Previews: PreviewProvider {
    static var previews: some View {
		AddNewPokemonView(isPresented: .constant(true), pokemonCollection: .constant(allPokemeon) )
    }
}
