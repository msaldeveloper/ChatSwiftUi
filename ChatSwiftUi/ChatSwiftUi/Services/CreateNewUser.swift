//
//  CreateNewUser.swift
//  ChatSwiftUi
//
//  Created by Mario Saldana on 27/05/25.
//

import FirebaseAuth
import FirebaseFirestore

class FireBaseUserNetworking {
    func createNewUser(email: String, password: String, name: String, completion: @escaping (Result<User, Error>) -> ()) {
            Auth.auth().createUser(withEmail: email, password: password) { data, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let user = data?.user else {
                    completion(.failure(NSError(domain: "CreateUser", code: -1, userInfo: [NSLocalizedDescriptionKey: "User data not found"])))
                    return
                }
                
                // Actualizar el perfil con el nombre (displayName)
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges { error in
                    if let error = error {
                        completion(.failure(error))
                        return
                    }
                    
                    // Una vez actualizado el perfil, regresar el usuario con el nombre
                    let userModel = User(email: user.email ?? "", userId: user.uid, name: user.displayName ?? "")
                    completion(.success(userModel))
                }
            }
        }
    
    func singIn(email: String, password : String , completion : @escaping (Result<User, Error>)->()){
        Auth.auth().signIn(withEmail: email, password: password) {data,error in
            
            if let error = error {
                completion(.failure(error))
            }
            guard let email = data?.user.email,
                  let userId = data?.user.uid,
                  let name =  data?.user.displayName
            else {
                guard let email = data?.user.email,
                      let userId = data?.user.uid else { return }
                completion(.success(.init(email: email, userId: userId, name: "")))
                return }
            
            completion(.success(.init(email: email, userId: userId, name: name)))
        }
    }

    func updateUserName(newName: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(.failure(NSError(domain: "No user logged in", code: 401)))
            return
        }
        
        let changeRequest = user.createProfileChangeRequest()
        changeRequest.displayName = newName
        changeRequest.commitChanges { error in
            if let error = error {
                completion(.failure(error))
                return
            }

            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData([
                "name": newName
            ], merge: true) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }

        }
    }

}
