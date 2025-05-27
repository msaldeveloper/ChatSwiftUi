//
//  ProfileView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var selectedImage: UIImage? = ProfileViewModel.loadSavedImage()
    @State var imageData = UserDefaults.standard.data(forKey: "ProfilePhoto")
    var body: some View {
        VStack{
            Text("Perfil")
                .font(.title)
                .foregroundStyle(.black)
            ZStack{
                Circle()
                    .foregroundStyle(.gray)
                    .frame(maxWidth: 150)
                Image(systemName: "person")
                    .font(.system(size: 50))
                    .foregroundStyle(.black)
                ProfileImage(imageData: imageData, selectedImage: selectedImage)
                    PhotosPicker(selection: $avatarItem, matching: .images) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 50))
                            .foregroundStyle(.green)
                            .frame(alignment: .trailing)
                            .padding(.top, 100)
                            .padding(.leading, 100)
                    }.onChange(of: avatarItem) { _,newItem in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self),
                               let uiImage = UIImage(data: data) {
                                selectedImage = uiImage
                                ProfileViewModel.saveImageToUserDefaults(image: uiImage)
                                imageData = data
                            }
                        }
                    }
                
                
            }.padding(.bottom,50)
            
            Text("nombre")
                .font(.subheadline)
                .foregroundStyle(.black)
            Text("correo")
                .font(.subheadline)
                .foregroundStyle(.black)
            
        }
        
    }
}

#Preview {
    ProfileView()
}
