//
//  GameDTO.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 14/09/21.
//

import CloudKit

class GameDTO2 {
    static let recordType = "Game"

    let gameId: CKRecord.ID
    let name: String
    let category: CategoryDTO?

    init(record: CKRecord, category: CategoryDTO? = nil) {
        self.name = record["name"] as! String
        self.gameId = record.recordID
        self.category = category
    }
}
