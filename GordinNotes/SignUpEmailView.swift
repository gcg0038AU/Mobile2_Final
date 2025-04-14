//
//  SignUpEmailView.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

import SwiftUI

struct SignUpEmailView: View {
    @StateObject private var signUp = SignUpEmailViewModel()
    @Binding var showSignIn: Bool
    var body: some View {
            VStack {
                TextField("Email...", text: $signUp.email)
                    .background(Color.gray.opacity(0.3))
                    .padding()
                SecureField("Password...", text: $signUp.password)
                    .background(Color.gray.opacity(0.3))
                    .padding()
                    Button {
                        Task {
                            do {
                                try await signUp.signUp()
                                let uid = try Authentication.shared.getUser().uid
                                print("User signed in with UID: \(uid)")
                                showSignIn = false
                                return
                            } catch {
                                print(error)
                            }
                            do {
                                print("Email in use, attempting sign-in...")
                                try await signUp.signIn()
                                let uid = try Authentication.shared.getUser().uid
                                print("User signed in with UID: \(uid)")
                                showSignIn = false
                                return
                            } catch {
                                print(error)
                            }
                        }
                    }label: {
                        Text("Sign in")
                            .foregroundColor(Color.blue)
                    }
            }
            .navigationTitle("Login / Create New")
        .padding()
    }
}

#Preview {
    SignUpEmailView(showSignIn: .constant(false))
}
