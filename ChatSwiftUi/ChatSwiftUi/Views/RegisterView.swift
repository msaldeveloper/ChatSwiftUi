//
//  RegisterView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct RegisterView: View {
    @State var textFieldEmail: String = ""
    @State var textFieldPassword: String = ""
       
       var body: some View {
           VStack {
               Image("chatLogo")
                   .resizable()
                   .scaledToFit()
                   .frame(width: UIScreen.main.bounds.width/2 )
                   .padding(.bottom)
                   .padding(.top)
               Group {
                   Text("Registrate Para ingresar")
                       .tint(.black)
                       .multilineTextAlignment(.center)
                       .padding(.top, 2)
                       .padding(.bottom, 32)
                   ZStack{
                       HStack(spacing: 12) {
                           Image(systemName: "lock.open.rotation")
                               .font(.title)
                               .foregroundStyle(.yellow)

                           TextField("Correo", text: $textFieldEmail, prompt: Text("Correo").foregroundStyle(.gray))
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

                           TextField("Contraseña", text: $textFieldPassword, prompt: Text("Contraseña").foregroundStyle(.gray))
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
                       print("Registrarse")
                   } label: {
                       ZStack {
                           RoundedRectangle(cornerRadius: 10)
                               .fill(.orange)
                               .frame(maxWidth: .infinity, maxHeight: 50)
                               .foregroundColor(.black)
                               

                           Text("Registrarse")
                               .font(.title3)
                               .foregroundStyle(.white)
                               .padding()
                       }.padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
                   }

               }
               Spacer()
           }
       }
}
