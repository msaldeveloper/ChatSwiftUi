//
//  Message.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import FirebaseFirestore
import Foundation

struct Message: Identifiable, Codable {
    @DocumentID var id: String?
    var text: String
    var senderId: String
    var timestamp: Date
}
