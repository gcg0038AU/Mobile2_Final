//
//  ContentView.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(Note_Title: "", Note_Content: "", User_ID: "", Note_Color : "")
    var body: some View {
        NavigationStack {
            List {
                ForEach($noteApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text(note.Note_Title)
                    }
                }
                Section {
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text("New Note")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            .onAppear() {
                noteApp.fetchData()
            }
            .refreshable {
                noteApp.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
