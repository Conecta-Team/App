//
//  UserDTO.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 15/09/21.
//

import CloudKit

struct UserDTO2 {
    
    let userId: CKRecord.ID
    let name: String
    let profileColor: String?
    let profileImage: String?
    let purpose: PurposeDTO
    let socialInfos: SocialInfosDTO
    // TODO: retirar mock de cor e trocar socialInfoID
    let mainColor: ColorManager = ColorManager(rawValue: Int.random(in: 0...2)) ?? .purple
    var socialInfoID: CKRecord.ID? = nil
    var gameID: CKRecord.ID? = nil
    
    init(record: CKRecord, purpose: PurposeDTO, socialInfos: SocialInfosDTO) {
        self.userId = record.recordID
        self.name = record["name"] as! String
        self.profileColor = record["profileColor"]
        self.profileImage = record["profileImage"]
        self.purpose = purpose
        self.socialInfos = socialInfos
    }
}

extension UserDTO2 {
    static func createMock() -> [UserDTO2] {
        var mock = [UserDTO2]()
        for index in 0...10 {
            let recordSocialMock = CKRecord(recordType: "MockInfo")
            recordSocialMock["instagram"] = "insta\(index)"
            recordSocialMock["steam"] = "steam\(index)"
            recordSocialMock["discord"] = "discord\(index)"
            let socialInfoMock = SocialInfosDTO(record: recordSocialMock)
            
            let recordPurposeMock = CKRecord(recordType: "MockPurpose")
            recordPurposeMock["name"] = "fun"
            let purposeMock = PurposeDTO(record: recordPurposeMock)
            
            let recorduserMock = CKRecord(recordType: "MockUser")
            recorduserMock["name"] = "user\(index)"
            let userMock = UserDTO2(record: recorduserMock, purpose: purposeMock, socialInfos: socialInfoMock)
            
            mock.append(userMock)
        }
        return mock
    }
}
