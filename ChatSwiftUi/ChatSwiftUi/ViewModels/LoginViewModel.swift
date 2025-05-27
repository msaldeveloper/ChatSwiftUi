//
//  LoginViewModel.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//
import SwiftUI
import FirebaseAuth
struct User {
    let email: String
    let userId: String
    let name: String
}

final class LoginViewModel : ObservableObject {
    @Published var userId : String?
    @Published var email : String?
    @Published var name : String?
    @Published var existError = false
    @Published var errorMessage : String?
    private let authenticationRepository : FireBaseUserNetworking
    
    init(authenticationRepository: FireBaseUserNetworking = FireBaseUserNetworking()) {
        self.authenticationRepository = authenticationRepository
    }
    func createNewUser(email : String, password : String, name :  String) {
        authenticationRepository.createNewUser(email: email, password: password, name: name) { [weak self]result in
            switch result {
                
            case let .success(response):
                self?.email = response.email
                self?.userId = response.userId
                self?.name = response.name
            case let .failure(error):
                
                self?.errorMessage = error.localizedDescription
                self?.existError = true
            }
        }
    }
    
    func signIn(email: String, password : String) {
        authenticationRepository.singIn(email: email, password: password) { [weak self]result in
            switch result {
                
            case let .success(response):
                self?.email = response.email
                self?.userId = response.userId
                self?.name = response.name
                UserDefaults.standard.setValue(email, forKey: "Mail")
                UserDefaults.standard.setValue(password, forKey: "Password")
            case let .failure(error):
                
                self?.errorMessage = error.localizedDescription
                self?.existError = true
            }
        }
    }
    
    func saveSession(){
        guard let user = UserDefaults.standard.string(forKey: "Mail"),
              let password = UserDefaults.standard.string(forKey: "Password") else {return}
        signIn(email: user, password: password)
        
    }
}

//remove data
//UserDefaults.standard.removeObject(forKey: "Mail")
//UserDefaults.standard.removeObject(forKey: "Password")
