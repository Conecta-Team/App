//
//  GameDTO.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import CloudKit

class UserDTO {
    let userId: CKRecord.ID
    var name: String
    var games: [Int]
    var goal: Int
    var instagram: String
    var steam: String
    var discord: String
    var blocked: Bool
    var usersBlocked: [CKRecord.Reference]

    init?(record: CKRecord) {
        self.userId = record.recordID
        if let userName = record["name"] as? String, let goal = record["goal"] as? Int, let games = record["games"] as? [Int] {
            self.name = userName
            self.games = games
            self.goal = goal
            self.instagram = record["instagram"] as? String ?? "-"
            self.steam = record["steam"] as? String ?? "-"
            self.discord = record["discord"] as? String ?? "-"
            self.blocked = (record["blocked"] ?? 0) == 0 ? false : true

            let usersBlocked = record["usersBlocked"] as? [CKRecord.Reference]
            self.usersBlocked = usersBlocked ?? [CKRecord.Reference]()
        } else {
            return nil
        }
    }
}
