//
//  GameDTO.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import CloudKit

class UserDTO {
    let id: CKRecord.ID
    let name: String
    let games: [Int]
    let goal: Int
    let instagram: String

    init?(record: CKRecord) {
        self.id = record.recordID
        if let userName = record["name"] as? String, let goal = record["goal"] as? Int, let games = record["Games"] as? [Int], let insta = record["Instagram"] as? String {
            self.name = userName
            self.games = games
            self.goal = goal
            self.instagram = insta
        } else {
            return nil
        }
    }
}
