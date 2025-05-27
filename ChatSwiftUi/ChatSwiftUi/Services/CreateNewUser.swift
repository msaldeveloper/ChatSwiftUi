//
//  CreateNewUser.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import FirebaseAuth

class CreateNewUserNetworking {
    func createNewUser(email: String, password : String , completion : @escaping (Result<User, Error>)->()) {
        Auth.auth().createUser(withEmail: email, password: password) { data, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let email = data?.user.email else { return }
            completion(.success(.init(email: email)))
        }
    }
    
    func singIn(email: String, password : String , completion : @escaping (Result<User, Error>)->()){
        Auth.auth().signIn(withEmail: email, password: password) {data,error in
            
            if let error = error {
                completion(.failure(error))
            }
            guard let email = data?.user.email else { return }
            completion(.success(.init(email: email)))
        }
        
    
    }
}
