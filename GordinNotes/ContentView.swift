//
//  ContentView.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var noteApp = NoteViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(noteApp.notes) { note in
                    NavigationLink {
                        NoteDetail(note: note)
                    } label: {
                        Text(note.title)
                    }
                }
            }
            .onAppear() {
                noteApp.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
