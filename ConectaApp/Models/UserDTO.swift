//
//  UserDTO.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 15/09/21.
//

import CloudKit

struct UserDTO {
    
    let userId: CKRecord.ID
    let name: String
    let profileColor: String?
    let profileImage: String?
    let purpose: PurposeDTO
    let socialInfos: SocialInfosDTO

    init(record: CKRecord, purpose: PurposeDTO, socialInfos: SocialInfosDTO) {
        self.userId = record.recordID
        self.name = record["name"] as! String
        self.profileColor = record["profileColor"]
        self.profileImage = record["profileImage"]
        self.purpose = purpose
        self.socialInfos = socialInfos
    }
}
