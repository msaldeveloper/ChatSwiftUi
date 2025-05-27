//
//  ContentView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct SplashScreen: View {
    @ObservedObject var loginViewModel : LoginViewModel
    @StateObject var chatViewModel = ChatViewModel()
    @State var goToLogin = false
    
    var body: some View {
        VStack{
            if let user = loginViewModel.email {
                HomeView(loginViewModel : loginViewModel, chatViewModel: chatViewModel)
                    
            }else {
                if goToLogin {
                    LoginView(loginViewModel : loginViewModel)
                }else {
                    VStack {
                        Image("chatLogo")
                            .resizable()
                            .scaledToFit()
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    goToLogin = true
                                }
                            }
                    }
                    .padding()
                }
            }
        }.onAppear {
            loginViewModel.saveSession()
        }
        
        
        
    }
}

