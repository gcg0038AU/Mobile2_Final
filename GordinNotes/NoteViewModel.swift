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
    @Published private(set) var notes = [NoteModel]()
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
}
