//
//  SocialInfosDTO.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 15/09/21.
//

import Foundation
import CloudKit

struct SocialInfosDTO {
    let socialInfosId: CKRecord.ID
    let discord: String?
    let facebook: String?
    let steam: String?
    let intagram: String?

    init(record: CKRecord) {
        self.socialInfosId = record.recordID
        self.discord = record["discord"]
        self.facebook = record["facebook"]
        self.steam = record["steam"]
        self.intagram = record["instagram"]
    }
}
