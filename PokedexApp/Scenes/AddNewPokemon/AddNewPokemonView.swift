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
	@State private var idNumber: String = ""
	@Binding var isPresented: Bool
	@Binding var pokemonCollection:[Pokemon]
	@State var isShowingAlert: Bool = false
	@State var alertMessage: String = ""
	@State var firstSelectedItem = pokeType.none
	@State var secondSelectedItem = pokeType.none

	func savePokemon(){
		guard let idNumberInt = Int(idNumber) else {
			alertMessage = "Invalid ID Number. Please enter a positive integer value."
			isShowingAlert = true
			return
		}
		if idNumberInt < 0 {
			alertMessage = "Invalid ID Number. Please enter a positive integer value."
			isShowingAlert = true
			return
		}
		if firstSelectedItem == .none {
			alertMessage = "Please select a primary type for this pokémon."
			isShowingAlert = true
			return 
		}
		for p in pokemonCollection {
			if p.id == idNumberInt {
				alertMessage = "This id already exists for the pokemon \(p.name). Please choose another ID number."
				isShowingAlert = true
				return
			}
		}
		var newPokemon = Pokemon(id: idNumberInt, name: name, description: description, image: Image(uiImage: selectedImage!), type1: firstSelectedItem)
		if secondSelectedItem != .none {
			newPokemon.type2 = secondSelectedItem
		}
		pokemonCollection.append(newPokemon)
		isPresented = false
	}

	var body: some View {
			NavigationView {
				ScrollView {
					ZStack {
						LinearGradient(colors: [colorForPoketype[firstSelectedItem] ?? Color.white, colorForPoketype[secondSelectedItem] ?? Color.white], startPoint: .bottomTrailing, endPoint: .topLeading)
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
						HStack {
							Button("Take Picture") {
								self.sourceType = .camera
								self.isImagePickerDisplay.toggle()
							}.padding()
								.background(Color(red: 0, green: 0, blue: 0.5))
								.clipShape(Capsule())
								.foregroundColor(.white)

							Button("Upload from Photo Library") {
								self.sourceType = .photoLibrary
								self.isImagePickerDisplay.toggle()

							}.padding()
								.background(Color(red: 0, green: 0, blue: 0.5))
								.clipShape(Capsule())
								.foregroundColor(.white)
						}
						HStack{
							Spacer()
							TextField("Name", text: $name)
								.padding()
							TextField("ID Number", text: $idNumber)
								.padding()
							Spacer()
						}
						HStack {
							Spacer()
							TextField("Description", text: $description,  axis: .vertical)
								.lineLimit(5...10)
								.padding()
						}
						Text("Primary Type")
						Picker("Pick a primary type: ", selection: $firstSelectedItem) { // 3
							ForEach(pokeType.allCases, id: \.self) { item in // 4
								Text(item.rawValue.capitalized) // 5
							}
						}
						Text("Secondary Type (optional)")
						Picker("Pick a secondary type (optional): ", selection: $secondSelectedItem) { // 3
							ForEach(pokeType.allCases, id: \.self) { item in // 4
								Text(item.rawValue.capitalized) // 5
							}
						}
						HStack{
							Button("Save") {
								savePokemon()
							}.padding()

								.background(Color(red: 0, green: 0, blue: 0.5))
								.clipShape(Capsule())
								.foregroundColor(.white)
							Button("Cancel"){
								isPresented = false
							}
							.padding()
							.background(Color(red: 1, green: 0, blue: 0))
							.clipShape(Capsule())
							.foregroundColor(.white)
						}
						.navigationBarTitle("Add A New Pokémon ")
						.sheet(isPresented: self.$isImagePickerDisplay) {
							ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
						}
					}.alert(isPresented: $isShowingAlert) { // 4

						Alert(
							title: Text("Oops!"),
							message: Text(alertMessage)
						)
					}
				}
			}
		}
	}
}

struct AddNewPokemonView_Previews: PreviewProvider {
    static var previews: some View {
		AddNewPokemonView(isPresented: .constant(true), pokemonCollection: .constant(allPokemon) )
    }
}
