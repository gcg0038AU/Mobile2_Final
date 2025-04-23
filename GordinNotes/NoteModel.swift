//
//  NoteModel.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import Foundation
import FirebaseFirestore
import UIKit
struct NoteModel : Codable, Identifiable {
    @DocumentID var id : String?
    var Note_Title : String
    var Note_Content : String
    var User_ID : String
    var Note_Color : String
}
