//
//  ProfileViewModel.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 08/11/21.
//

import Foundation
import UIKit

class ProfileViewModel {
    
    weak var delegate: ViewModelDelegate?
    var userDTO: UserDTO?
    let service = UserCKService()
    
    public func deleteUser(completion: @escaping () -> Void) {
        guard let userDTO = userDTO else {
            return
        }
        service.deleteUser(user: userDTO) { result in
            switch result {
            case .success(_):
                completion()
            case .failure(let error):
                // TODO: Tratar o erro
                print(error)
            }
        }
    }
}

extension ProfileViewModel: GetSocialInfoToSaveDelegate {

    func getOldSocialInfo() -> (discord: String?, steam: String?, instagram: String?) {
        return (userDTO?.discord, userDTO?.steam, userDTO?.instagram)
    }

    func editSocialInfos(discord: String?, steam: String?, instagram: String?, completion: @escaping () -> Void) {
        guard let user = self.userDTO else {
            return
        }
        
        user.discord = discord ?? "-"
        user.steam = steam ?? "-"
        user.instagram = instagram ?? "-"
        
        service.editUser(user: user) { _ in
            completion()
        }
    }
}

extension ProfileViewModel: GetNameToSaveDelegate {
    
    func getOldName() -> String? {
        return userDTO?.name
    }
    
    func editName(name: String?, completion: @escaping () -> Void) {
        guard let user = self.userDTO else {
            return
        }
        
        user.name = name!
        
        service.editUser(user: user) { _ in
            completion()
        }
    }
}

extension ProfileViewModel: GetGamesToSaveDelegate {
    
    func getOldGames() -> [Games] {
        if let user = userDTO {
            return user.games.compactMap { game in
                Games(rawValue: game)
            }
        }
        return [Games]()
    }
    
    func editGames(games: [Games], completion: @escaping () -> Void) {
        guard let user = self.userDTO else {
            return
        }
        
        let games = games.compactMap { games in
            games.rawValue
        }
        
        if games.count > 0 {
            user.games = games
            
            service.editUser(user: user) { _ in
                completion()
            }
        }
    }
}
