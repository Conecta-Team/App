//
//  RegisterManagerViewModel.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 20/09/21.
//

import Foundation
import CloudKit

class RegisterManagerViewModel: ViewModelType {
    var delegate: ViewModelDelegate?
    
    private var nickName: String?
    private var game: GameDTO?
    private var discord: String?
    private var steam: String?
    private var instagram: String?
    let cloudKitService = CloudKitService.currentModel
    let purposeID = CKRecord.ID(recordName: "1B35A248-4423-6FB4-8A90-561F3F198677")

    func initialization() {
    }
    
    func setName(name: String?) -> Bool {
        if let name = name, name != "" {
            self.nickName = name
            return true
        }
        return false
    }
    
    func setGame(game: GameDTO?) -> Bool {
        if let game = game {
            self.game = game
            return true
        }
        return false
    }
    
    func setSocialInfos(discord: String?, steam: String?, instagram: String?) -> Bool {
        if let discord = discord, let steam = steam, let instagram = instagram, discord != "" || steam != "" || instagram != "" {
            self.discord = discord
            self.steam = steam
            self.instagram = instagram
            return true
        }
        return false
    }
    
    func saveInfosUser(completion: @escaping (CKRecord) -> Void) {
        cloudKitService.createSocialInfos(instagram: self.instagram, steam: self.steam, discord: self.discord) { socialInfo in
            if let socialInfo = socialInfo {
                self.cloudKitService.createUser(name: self.nickName!, purpose: self.purposeID, socialInfos: socialInfo) { user, userPrivate in
                    if let user = user, let userPrivate = userPrivate {
                        self.cloudKitService.createUserGames(user: user.recordID, game: self.game!.gameId) { _ in
                            completion(userPrivate)
                        }
                    }
                }
            }
        }
    }
}
