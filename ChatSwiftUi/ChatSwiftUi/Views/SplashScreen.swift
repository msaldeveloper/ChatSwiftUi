//
//  ContentView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct SplashScreen: View {
    @ObservedObject var loginViewModel : LoginViewModel
    @State var goToLogin = false
    
    var body: some View {
        if let user = loginViewModel.email {
            HomeView(loginViewModel : loginViewModel)
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
        
        
    }
}

