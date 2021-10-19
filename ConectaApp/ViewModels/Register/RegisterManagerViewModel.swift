//
//  RegisterManagerViewModel.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 20/09/21.
//

import Foundation
import CloudKit

class RegisterManagerViewModel: ViewModelType {
    weak var delegate: ViewModelDelegate?

    let userCKService: UserCKService = UserCKService()
    
    private var nickName: String?
    private var games: [Games]?
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
    
    func setGame(games: [Games]?) -> Bool {
        if let games = games {
            self.games = games
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
    
    func createUser(completion: @escaping (Result<UserDTO, CloudKitError>) -> Void) {
        let gamesIds = self.games!.compactMap({ game in
            game.rawValue
        })
    
        self.userCKService.createUser(name: self.nickName!,
                                      games: gamesIds,
                                      goal: Goal.forFun.rawValue,
                                      instagram: self.instagram,
                                      discord: self.discord,
                                      steam: self.steam) { result in
            switch result {
            case .success(let data):
                let userDTO = UserDTO(record: data.0)
                if let user = userDTO {
                    completion(.success(user))
                } else {
                    completion(.failure(.cantCreateUSer))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
