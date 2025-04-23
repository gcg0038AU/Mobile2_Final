//
//  NoteModel.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import Foundation
import FirebaseFirestore
struct NoteModel : Codable, Identifiable {
    @DocumentID var id : String?
    var Note_title : String
    var Note_Content : String
    var User_ID : String
}
