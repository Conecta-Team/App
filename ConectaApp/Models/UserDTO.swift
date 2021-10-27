//
//  GameDTO.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import CloudKit

class UserDTO {
    let userId: CKRecord.ID
    let name: String
    let games: [Int]
    let goal: Int
    let instagram: String
    let steam: String
    let discord: String

    init?(record: CKRecord) {
        self.userId = record.recordID
        // TODO: REVER NOMES DAS LAVELS EM PRODUCAO
        if let userName = record["name"] as? String, let goal = record["goal"] as? Int, let games = record["Games"] as? [Int] {
            self.name = userName
            self.games = games
            self.goal = goal
            self.instagram = record["Instagram"] as? String ?? "-"
            self.steam = record["steam"] as? String ?? "-"
            self.discord = record["discord"] as? String ?? "-"
        } else {
            return nil
        }
    }
}
