//
//  SignUpEmailViewModel.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import Foundation
class SignUpEmailViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    func signUp() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("Invalid email / password")
            return
        }
        var userData = try await Authentication.shared.createUser(email: email, password: password)
    }
    func signIn() async throws{
        guard !email.isEmpty, !password.isEmpty else {
            print("Invalid email / password")
            return
        }
        var userData = try await Authentication.shared.signInUser(email: email, password: password)
    }
}
