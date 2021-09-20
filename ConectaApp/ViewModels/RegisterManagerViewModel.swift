//
//  RegisterManagerViewModel.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 20/09/21.
//

import Foundation

class RegisterManagerViewModel: ViewModelType {
    var delegate: ViewModelDelegate?
    
    private var nickName: String?
    private var game: GameDTO?
    private var discord: String?
    private var steam: String?
    private var instagram: String?
    
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
}
