//
//  Coordinator.swift
//  PokedexApp
//
//  Created by Lorenzo Brown on 2/7/23.
//

import Foundation
import UIKit

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
	var picker: ImagePickerView

	init(picker: ImagePickerView) {
		self.picker = picker
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		guard let selectedImage = info[.originalImage] as? UIImage else { return }
		self.picker.selectedImage = selectedImage
		self.picker.isPresented.wrappedValue.dismiss()
	}

}
