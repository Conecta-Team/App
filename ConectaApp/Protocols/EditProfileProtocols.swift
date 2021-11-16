//
//  EditProfileProtocols.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 11/11/21.
//

import Foundation

protocol GetNameToSaveDelegate: AnyObject {
    func getOldName() -> String?
    func editName(name: String?, completion: @escaping () -> Void)
}

protocol GetGamesToSaveDelegate: AnyObject {
    func getOldGames() -> [Games]
    func editGames(games: [Games], completion: @escaping () -> Void)
}

protocol GetSocialInfoToSaveDelegate: AnyObject {
    func getOldSocialInfo() -> (discord: String?, steam: String?, instagram: String?)
    func editSocialInfos(discord: String?, steam: String?, instagram: String?, completion: @escaping () -> Void)
}
