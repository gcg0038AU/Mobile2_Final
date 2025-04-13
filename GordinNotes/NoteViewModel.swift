//
//  NoteViewModel.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
class NoteViewModel : ObservableObject {
    @Published var notes = [NoteModel]()
    let db = Firestore.firestore()
    func fetchData() {
        self.notes.removeAll()
        db.collection("notes").getDocuments() { (QuerySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in QuerySnapshot!.documents {
                    do {
                        self.notes.append(try document.data(as: NoteModel.self))
                    } catch {
                        print(error)
                    }
                }
            }
            
        }
    }
    func saveData(note : NoteModel) {
        if let id = note.id {
            let docRef = db.collection("notes").document(id)
            docRef.updateData([
                "title" : note.title,
                "notesdata" : note.notesdata
            ]) {err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        } else {
            var ref: DocumentReference? = nil
            ref = db.collection("notes").addDocument(data: [
                "title" : note.title,
                "notesdata" : note.notesdata
            ]) {err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document successfully added")
                }
            }
        }
    }
}
