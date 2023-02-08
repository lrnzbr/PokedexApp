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
					Image(systemName: "snow")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.clipShape(Circle())
						.frame(width: 300, height: 300)
				}

				Button("Camera") {
					self.sourceType = .camera
					self.isImagePickerDisplay.toggle()
				}.padding()

				Button("photo") {
					self.sourceType = .photoLibrary
					self.isImagePickerDisplay.toggle()
				}.padding()
			}
			.navigationBarTitle("Demo")
			.sheet(isPresented: self.$isImagePickerDisplay) {
				ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
			}

		}
	}
}

struct AddNewPokemonView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPokemonView()
    }
}
