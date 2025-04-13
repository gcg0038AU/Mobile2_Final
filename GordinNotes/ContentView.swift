//
//  ContentView.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(title: "", notesdata: "")
    var body: some View {
        NavigationStack {
            List {
                ForEach($noteApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note)
                    } label: {
                        Text(note.title)
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
            
        }
        .onAppear() {
            noteApp.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
