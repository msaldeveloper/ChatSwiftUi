//
//  ContentView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct SplashScreen: View {
    @State var goToLogin = false
    
    var body: some View {
        if goToLogin {
            LoginView()
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

#Preview {
    SplashScreen()
}
