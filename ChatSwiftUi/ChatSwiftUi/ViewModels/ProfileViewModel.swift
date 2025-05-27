//
//  ProfileViewModel.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import SwiftUI

final class ProfileViewModel : ObservableObject {
    
    static func loadSavedImage() -> UIImage? {
       if let imageData = UserDefaults.standard.data(forKey: "ProfilePhoto") {
           return UIImage(data: imageData)
       }
       return nil
   }
    
    static func saveImageToUserDefaults(image: UIImage) {
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            UserDefaults.standard.set(imageData, forKey: "ProfilePhoto")
        }
    }
}
