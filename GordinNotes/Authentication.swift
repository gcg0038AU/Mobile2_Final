//
//  Authentication.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import Foundation
import FirebaseAuth

class Authentication {
    static let shared = Authentication()
    private init() {
        
    }
    func getUser()  throws -> AuthResultModel{
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthResultModel(user: user)
    }
    func createUser(email : String, password : String) async throws -> AuthResultModel{
        let response = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthResultModel(user: response.user)
    }
    func signInUser(email : String, password : String) async throws -> AuthResultModel{
        let response = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthResultModel(user: response.user)
    }
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
