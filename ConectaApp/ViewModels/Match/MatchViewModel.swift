//
//  MatchViewModel.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit
import CloudKit

class MatchViewModel: ViewModelType {

    weak var delegate: ViewModelDelegate?

    let userCKService: UserCKService = UserCKService()
    let filterCKService: FilterCKService = FilterCKService()

    private var indexCurrentUser: Int = 0

    private var user: UserDTO? {
        didSet {
            self.getAllUsersToMatch()
        }
    }

    var usersToMatch: [UserDTO]? = [UserDTO]() {
        didSet {
            self.delegate?.didLoadData()
        }
    }

    convenience init(user: UserDTO) {
        self.init()
        self.user = user
        self.getAllUsersToMatch()
    }

    func initialization() {
        self.delegate?.willLoadData()
        if self.user == nil {
            self.getCurrentUser()
        }
    }

    public func setIndexUser(index: Int) {
        self.indexCurrentUser = index
    }

    public func getUserName() -> String {
        if let user = self.usersToMatch?[self.indexCurrentUser] {
            return user.name
        }
        return "-"
    }

    public func getProfileLetter(index: Int) -> String {
        if let user = self.usersToMatch?[index] {
            let name = user.name
            let indexLetter = name.index(name.startIndex, offsetBy: 0)
            return String(name[indexLetter]).uppercased()
        }
        return "-"
    }

    public func getUserGames() -> [Games] {
        if let user = self.usersToMatch?[self.indexCurrentUser] {
            return user.games.compactMap { game in
                Games(rawValue: game)
            }
        }
        return [Games]()
        
    }

    public func getUserSocialInfos() -> (String, String, String) {
        if let user = self.usersToMatch?[self.indexCurrentUser] {
            return (user.discord, user.steam, user.instagram)
        }
        return ("-", "-", "-")
        
    }
}

extension MatchViewModel {
    
    private func getCurrentUser() {
        self.userCKService.getCurrentUser { result in
            switch result {
            case .success(let userRecord):
                self.user = UserDTO(record: userRecord)
            case .failure(_):
                self.user = nil
            }
        }
    }

    private func getAllUsersToMatch() {
        if let user = self.user {
            self.filterCKService.getAllUsersToMatch(currentUser: user) { result in
                switch result {
                case .success(let usersRecord):
                    self.usersToMatch = usersRecord.compactMap({ userRecord in
                        UserDTO(record: userRecord)
                    })
                case .failure(_):
                    self.usersToMatch = nil
                }
            }
        }
    }
}
