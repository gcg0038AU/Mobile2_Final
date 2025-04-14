//
//  SettingsViewModel.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import Foundation
class SettingsViewModel : ObservableObject {
    func signOut() throws {
        try Authentication.shared.signOut()
    }
}
