//
//  ProfileView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    var fireBaseUserNetworking = FireBaseUserNetworking()
    @EnvironmentObject var chatViewModel : ChatViewModel
    @ObservedObject var loginViewModel : LoginViewModel
    @State private var textFieldName = ""
    @State private var changeNameButton =  false
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
            Group{
                HStack{
                    Text("Nombre:")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    Text(loginViewModel.name ?? "usuario")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                }
            }
            
            Group{
                HStack{
                    Text("Correo:")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                    Text(loginViewModel.email ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.black)
                }
            }
            .padding(.bottom,50)
            Button {
                changeNameButton = true
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.orange)
                        .frame(height: 50)
                        .padding(.horizontal,50)
                    Text("Cambiar Nombre")
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
                
            }.sheet(isPresented: $changeNameButton) {
                VStack{
                    ZStack{
                        HStack(spacing: 12) {
                            Image(systemName: "person.circle")
                                .font(.title)
                                .foregroundStyle(.yellow)

                            TextField("Nombre", text: $textFieldName, prompt: Text("Nombre").foregroundStyle(.gray))
                                .font(.system(size: 18))
                                .foregroundStyle(.black)
                                .textContentType(.emailAddress)
                                .textInputAutocapitalization(.never)
                        }
                        .padding(6)
                        
                    }.padding(.horizontal, 50)
                        
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(.black)
                            .padding(.horizontal, 50)
                    )
                    .padding(.bottom)
                    Button {
                        fireBaseUserNetworking.updateUserName(newName: textFieldName) { result in
                            switch result {
                                
                            case .success():
                                loginViewModel.name = textFieldName
                                changeNameButton = false
                                
                            case let .failure(error):
                                print(error.localizedDescription)
                            }
                        }
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.orange)
                                .frame(height: 50)
                                .padding(.horizontal,50)
                            Text("Cambiar Nombre")
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                        }
                        
                    }
                }.presentationDetents([.fraction(1 / 2.5)])
            }

            
        }
        
    }
}

