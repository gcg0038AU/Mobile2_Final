//
//  SettingsView.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var settings = SettingsViewModel()
    @Binding var showSignIn: Bool
    var body: some View {
        NavigationStack() {
            VStack(spacing: 40) {
                NavigationLink {
                    ContentView()
                }
                label: {
                    Text("Notes")
                        .foregroundColor(Color.blue)
                }
                .navigationTitle("User Menu")
                Button {
                    Task {
                        do {
                            try settings.signOut()
                            showSignIn = true
                        } catch {
                            print(error)
                        }
                    }
                }
                label: {
                    Text("Sign Out")
                        .foregroundColor(Color.blue)
                }
            }
        }
    }
}

#Preview {
    SettingsView(showSignIn: .constant(false))
}
