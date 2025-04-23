//
//  SettingsModel.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/23/25.
//

import Foundation
import FirebaseFirestore
struct SettingsModel : Codable, Identifiable {
    @DocumentID var id : String?
    var User_ID : String
}
