//
//  HomeView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var loginViewModel : LoginViewModel
    @StateObject var chatViewModel = ChatViewModel()
    @State private var messageText = ""
    
        
        var body: some View {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(chatViewModel.messages) { message in
                            HStack {
                                if message.senderId == loginViewModel.userId {
                                    Spacer()
                                    Text(message.text)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                } else {
                                    Text(message.text)
                                        .padding()
                                        .background(Color.gray)
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                
                HStack {
                    TextField("Type a message", text: $messageText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Send") {
                        guard let senderId =  loginViewModel.userId else { return }
                        chatViewModel.sendMessage(text: messageText, senderId: senderId)
                        messageText = ""
                    }
                }
                .padding()
            }
        }
}
