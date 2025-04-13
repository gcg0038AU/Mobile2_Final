//
//  NoteDetail.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct NoteDetail: View {
    var note : NoteModel
    
    var body: some View {
        VStack {
            Text(note.title)
            Text(note.notesdata)
        }
    }
}

