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
