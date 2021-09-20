//
//  MatchViewModel.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit
import CloudKit

class MatchViewModel: ViewModelType {
    
    let cloudKitService: CloudKitService = CloudKitService.currentModel

    weak var delegate: ViewModelDelegate?
    private var indexCurrentUser: Int = 0 

    private var userRecord: CKRecord? {
        didSet {
            self.getAllUsersToMatch()
        }
    }
//    var users: [UserDTO] = UserDTO.createMock()
    var users: [UserDTO] = [UserDTO]() {
        didSet {
            self.delegate?.didLoadData()
            self.getSocialInfos()
            self.getGameName()
        }
    }

    var socialInfo: SocialInfosDTO? = nil {
        didSet {
            self.delegate?.willLoadData()
        }
    }

    var userGame: GameDTO? = nil {
        didSet {
            self.delegate?.willLoadData()
        }
    }

    func initialization() {
        self.getUserPublicId()
    }
    
    public func getProfileLetter(index: Int) -> String {
        let name = self.users[index].name
        let indexLetter = name.index(name.startIndex, offsetBy: 0)
        return String(name[indexLetter]).uppercased()
    }
    
    public func setIndexCurrentUser(index: Int) {
        self.indexCurrentUser = index
        self.getSocialInfos()
        self.getGameName()
    }
    
    public func getUserName() -> String {
        return self.users[self.indexCurrentUser].name
    }

    // TODO: futuramente trocar parar TODOS os games de um usuário
    public func getGameName() {
        self.cloudKitService.getGame(game: self.users[self.indexCurrentUser].gameID!) { game in
            self.userGame = GameDTO(record: game.first!)
        }
    }

    public func getSocialInfos() {
        self.cloudKitService.getSocialInfos(socialInfoId: self.users[self.indexCurrentUser].socialInfoID!) { socialInfo in
            self.socialInfo = SocialInfosDTO(record: socialInfo.first!)
        }
    }
    
    private func getUserPublicId() {
        self.cloudKitService.getUserPublicReference { record in
            if let userRecord = record?.first {
                self.userRecord = userRecord
            } else {
                self.userRecord = nil
            }
        }
    }
    
    private func getAllUsersToMatch() {
        let idString: String = self.userRecord!["userPublicReference"] as! String

        self.cloudKitService.getUserGame(userID: idString) { record in
            let gameReference = record[0]["gameReference"] as! CKRecord.Reference
            let userRecordID = CKRecord.ID(recordName: idString)
            self.cloudKitService.getUsersByGame(notIncluded: userRecordID, gameReference: gameReference) { userGames in
                let userReferences: [(CKRecord.ID, CKRecord.ID)] = userGames.map { user in
                    ((user["userReference"]! as CKRecord.Reference).recordID,
                    (user["gameReference"]! as CKRecord.Reference).recordID)
                }
                
                let userIds = userReferences.map { data in
                    data.0
                }

                self.cloudKitService.getUsers(usersID: userIds) { usersToMatch in
                    for userIndex in 0..<usersToMatch.count {
                        // TODO: desmockar purpose
                        let recordSocialMock = CKRecord(recordType: "MockInfo")
                        recordSocialMock["instagram"] = "insta\(index)"
                        recordSocialMock["steam"] = "steam\(index)"
                        recordSocialMock["discord"] = "discord\(index)"
                        let socialInfoMock = SocialInfosDTO(record: recordSocialMock)
                        
                        let recordPurposeMock = CKRecord(recordType: "MockPurpose")
                        recordPurposeMock["name"] = "fun"
                        let purposeMock = PurposeDTO(record: recordPurposeMock)
    
                        var userDTO = UserDTO(record: usersToMatch[userIndex], purpose: purposeMock, socialInfos: socialInfoMock)
                        userDTO.socialInfoID = (usersToMatch[userIndex]["socialInfosReference"] as! CKRecord.Reference).recordID
                        userDTO.gameID = (userReferences[userIndex].1)
                        self.users.append(userDTO)
                    }

//                    self.users = usersToMatch.map({ userData in
//                        // TODO: desmockar purpose
//                        let recordSocialMock = CKRecord(recordType: "MockInfo")
//                        recordSocialMock["instagram"] = "insta\(index)"
//                        recordSocialMock["steam"] = "steam\(index)"
//                        recordSocialMock["discord"] = "discord\(index)"
//                        let socialInfoMock = SocialInfosDTO(record: recordSocialMock)
//
//                        let recordPurposeMock = CKRecord(recordType: "MockPurpose")
//                        recordPurposeMock["name"] = "fun"
//                        let purposeMock = PurposeDTO(record: recordPurposeMock)
//
//                        var userDTO = UserDTO(record: userData, purpose: purposeMock, socialInfos: socialInfoMock)
//                        userDTO.socialInfoID = (userData["socialInfosReference"] as! CKRecord.Reference).recordID
//
//                        return userDTO
//                    })
                }
            }
        }
    }
}

