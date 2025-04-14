//
//  MainView.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct MainView: View {
    @State private var showLoggedIn: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignIn: $showLoggedIn)
            }
        }
        .onAppear {
            let user = try? Authentication.shared.getUser()
            self.showLoggedIn = user == nil ? true : false
        }
        .fullScreenCover(isPresented: $showLoggedIn) {
            NavigationStack {
                AuthenticationView(showSignIn: $showLoggedIn)
            }
        }
    }
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
