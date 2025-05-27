//
//  HomeView.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//
import SwiftUI

struct HomeView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @StateObject var chatViewModel = ChatViewModel()
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(chatViewModel.messages) { message in
                        HStack {
                            if message.senderId == loginViewModel.userId {
                                Spacer()
                                VStack(alignment: .trailing, spacing: 4) {
                                    Text((loginViewModel.name?.isEmpty == false) ? loginViewModel.name! : message.senderId)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    
                                    Text(message.text)
                                        .padding(12)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(16, corners: [.topLeft, .topRight, .bottomLeft])
                                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: .trailing)
                                }
                            } else {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(message.senderId)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    
                                    Text(message.text)
                                        .padding(12)
                                        .background(Color.gray.opacity(0.3))
                                        .foregroundColor(.black)
                                        .cornerRadius(16, corners: [.topLeft, .topRight, .bottomRight])
                                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: .leading)
                                }
                                Spacer()
                            }
                        }
                    }

                }
                .padding()
            }
            
            HStack {
                TextField("Type a message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button("Send") {
                    guard let senderId = loginViewModel.userId else { return }
                    chatViewModel.sendMessage(text: messageText, senderId: senderId)
                    messageText = ""
                }
            }
            .padding()
        }
    }
}

// Extension para redondear solo ciertas esquinas
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = 0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
