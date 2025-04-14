//
//  AuthResultModel.swift
//  GordinNotes
//
//  Created by Jake Gordin on 4/13/25.
//

import Foundation
import FirebaseAuth
struct AuthResultModel {
    let uid: String
    init(user: User) {
        self.uid = user.uid
    }
}
