//
//  HomeView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var loginViewModel : LoginViewModel
    
    var body: some View {
        VStack {
            Text("Bienvenido")
                .font(.title)
                .foregroundStyle(.black)
            Text(loginViewModel.email ?? "usuario")
                .font(.subheadline)
                .foregroundStyle(.black)
        }
        
    }
}
