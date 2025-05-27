//
//  HomeView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var loginViewModel : LoginViewModel
    @ObservedObject var chatViewModel : ChatViewModel
    
    var body: some View {
        TabView {
            Tab("Chat", systemImage: "envelope.fill"){
                ChatView(loginViewModel: loginViewModel)
                    .environmentObject(chatViewModel)
            }

            Tab("Perfil", systemImage: "person.fill"){
                ProfileView()
            }
                
        }
    }
}

