//
//  AuthManager.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/26/23.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine

class AuthManger {
    static let shared = AuthManger()
    
    func registerUser(with email: String, password: String) -> AnyPublisher<User, Error> {
       return Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
    
    func loginUser(with email: String, password: String) -> AnyPublisher<User, Error> {
        return Auth.auth().signIn(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
}
