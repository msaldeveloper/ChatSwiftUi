//
//  ProfileImage.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//
import SwiftUI

public struct ProfileImage: View {
    public var imageData: Data?
    public var selectedImage: UIImage?
    public init(imageData: Data? = nil, selectedImage: UIImage? = nil) {
        self.imageData = imageData
        self.selectedImage = selectedImage
    }

    public var body: some View {
        if let imageData = imageData,
           let uiImage = UIImage(data: imageData) {
            // Si hay una imagen guardada en UserDefaults, se muestra
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(maxWidth: 150)
                .foregroundColor(.white)
        } else if let selectedImage = selectedImage {
            // Si hay una imagen seleccionada pero aún no guardada
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(maxWidth: 150)
                .foregroundColor(.white)
        } else {
            // Imagen predeterminada
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(maxWidth: 150)
                .foregroundColor(.gray)
        }
    }
}
