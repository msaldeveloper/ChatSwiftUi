//
//  LoginView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var mail = ""
    @State private var password = ""
    @State var goToRegister = false
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea()
            VStack{
                Image("chatLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/2 )
                    .padding(.bottom)
                
                ZStack{
                    HStack(spacing: 12) {
                        Image(systemName: "person.fill")
                            .font(.title)
                            .foregroundStyle(.yellow)

                        TextField("Correo", text: $mail, prompt: Text("Correo").foregroundStyle(.gray))
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
                
                ZStack{
                    HStack(spacing: 12) {
                        Image(systemName: "lock.open.rotation")
                            .font(.title)
                            .foregroundStyle(.yellow)

                        TextField("Contraseña", text: $password, prompt: Text("Contraseña").foregroundStyle(.gray))
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
                ).padding(.bottom, 100)
                    
                Button {
                    print("login")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.orange)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.black)
                            

                        Text("Ingresar")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding()
                    }.padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                }
                
                Button {
                    goToRegister = true
                    print("Registrate")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.orange)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.black)
                            

                        Text("Registrate")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding()
                    }.padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                }
                .sheet(isPresented: $goToRegister) {
                    RegisterView()
                }

                
            }
        }
    }
}

#Preview {
    LoginView()
}
