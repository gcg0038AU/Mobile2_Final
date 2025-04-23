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
        do {
            let currentUID = try Authentication.shared.getUser().uid
            db.collection("UserNotes").whereField("User_ID", isEqualTo: currentUID).getDocuments() { (QuerySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in QuerySnapshot!.documents {
                        do {
                            self.notes.append(try document.data(as: NoteModel.self))
                        } catch {
                            print("Error adding retrieved document to array")
                            print(error)
                        }
                    }
                }
                
            }
        }
        catch {
            print(error)
        }
       
    }
    func saveData(note : NoteModel) {
        if let id = note.id { //edit existing note
            if !note.Note_title.isEmpty || !note.Note_Content.isEmpty {
                let docRef = db.collection("UserNotes").document(id)
                do {
                    let currentUID = try Authentication.shared.getUser().uid
                    docRef.updateData([
                        "Note_title" : note.Note_title,
                        "Note_Content" : note.Note_Content,
                        "User_ID" : currentUID
                    ]) {err in
                        if let err = err {
                            print("Error updating document: \(err)")
                        } else {
                            print("Document successfully updated")
                        }
                    }
                }
                catch {
                    print(error)
                }
            }
        } else { //add new note
            if !note.Note_title.isEmpty || !note.Note_Content.isEmpty {
                var ref: DocumentReference? = nil
                do {
                    let currentUID = try Authentication.shared.getUser().uid
                    ref = db.collection("UserNotes").addDocument(data: [
                        "Note_title" : note.Note_title,
                        "Note_Content" : note.Note_Content,
                        "User_ID" : currentUID
                    ]) {err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            print("Document successfully added")
                        }
                    }
                }
                catch {
                    print(error)
                }
                
            }
        }
    }
}
