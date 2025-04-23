//
//  NoteDetail.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct NoteDetail: View {
    @Binding var note : NoteModel
    @StateObject var noteApp = NoteViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Note Title", text: $note.Note_Title)
                .font(.system(size: 25))
                .fontWeight(.bold)
            HStack {
                Text("Note Color:")
                Picker("colorPicker", selection: $note.Note_Color) {
                    Text("Blue").tag("blue")
                    Text("Red").tag("red")
                    Text("Orange").tag("orange")
                    Text("Purple").tag("purple")
                }
                .accentColor(colorVal(name : note.Note_Color))
            }
            TextEditor(text: $note.Note_Content)
                .font(.system(size: 25))
                .foregroundStyle(colorVal(name: note.Note_Color))
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    noteApp.saveData(note: note)
                    note.Note_Title = ""
                    note.Note_Content = ""
                } label: {
                    Text("Save")
                }
            }
        }
    }
    func colorVal(name : String) -> Color {
        var result : Color = Color.blue
        if (name == "blue") {
            result = Color.blue
        }
        else if (name == "red") {
            result = Color.red
        }
        else if (name == "orange") {
            result = Color.orange
        }
        else if (name == "purple") {
            result = Color.purple
        }
        return result
    }
}
