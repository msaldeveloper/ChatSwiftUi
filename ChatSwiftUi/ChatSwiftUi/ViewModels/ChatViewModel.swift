//
//  ChatViewModel.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import FirebaseFirestore
import Combine

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    
    private var db = Firestore.firestore()
    private var listener: ListenerRegistration?

    init() {
        fetchMessages()
    }

    func fetchMessages() {
        listener = db.collection("messages")
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { [weak self] snapshot, error in
                guard let documents = snapshot?.documents else { return }

                self?.messages = documents.compactMap { doc -> Message? in
                    try? doc.data(as: Message.self)
                }
            }
    }

    func sendMessage(text: String, senderId: String) {
        let message = Message(text: text, senderId: senderId, timestamp: Date())

        do {
            _ = try db.collection("messages").addDocument(from: message)
        } catch {
            print("❌ Error sending message: \(error)")
        }
    }

    deinit {
        listener?.remove()
    }
}
