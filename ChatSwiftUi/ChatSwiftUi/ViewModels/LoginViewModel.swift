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
}

final class LoginViewModel : ObservableObject {
    @Published var email : String?
    @Published var existError = false
    @Published var errorMessage : String?
    private let authenticationRepository : CreateNewUserNetworking
    
    init(authenticationRepository: CreateNewUserNetworking = CreateNewUserNetworking()) {
        self.authenticationRepository = authenticationRepository
    }
    func createNewUser(email : String, password : String) {
        authenticationRepository.createNewUser(email: email, password: password) { [weak self]result in
            switch result {
                
            case let .success(response):
                self?.email = response.email
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
            case let .failure(error):
                
                self?.errorMessage = error.localizedDescription
                self?.existError = true
            }
        }
    }
}
