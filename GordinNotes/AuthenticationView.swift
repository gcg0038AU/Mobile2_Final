//
//  AuthenticationView.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct AuthenticationView: View {
    @Binding var showSignIn: Bool
    var body: some View {
        NavigationStack {
            NavigationLink {
                SignUpEmailView(showSignIn: $showSignIn)
            } label: {
                Text("Sign in with Email")
                    .foregroundColor(Color.blue)
            }
            .navigationTitle("Notes - Sign in")
        }
    }
}

#Preview {
    AuthenticationView(showSignIn: .constant(false))
}
