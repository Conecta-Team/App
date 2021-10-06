//
//  FilterCKService.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import CloudKit

class FilterCKService: CloudKitService {
    
    var users: [CKRecord] = []
    var usersID: [CKRecord.ID] = [CKRecord.ID]()

    // variavel usada na funcao getAllUsersToMatch para filtrar usuario repetidos
    var recordNamesToFilter: [String] = []

    public func getAllUsersToMatch(currentUser: UserDTO, completion: @escaping (Result<[CKRecord], CloudKitError>) -> Void) {
        let userReference = CKRecord.Reference(recordID: currentUser.id, action: .none)

        let userGamesPredicate = NSPredicate(format: "game IN %@ AND NOT(userReference == %@)", currentUser.games, userReference)
        let userGamesQuery = CKQuery(recordType: "UserGames", predicate: userGamesPredicate)

        let userGamesQueryOperation = CKQueryOperation(query: userGamesQuery)
        userGamesQueryOperation.desiredKeys = ["userReference"]
        
        let usersQueryOperation = CKFetchRecordsOperation(recordIDs: self.usersID)
        usersQueryOperation.addDependency(userGamesQueryOperation)

        userGamesQueryOperation.recordFetchedBlock = { record in
            if let userRefenrece = record["userReference"] as? CKRecord.Reference {
                self.usersID.append(userRefenrece.recordID)
                usersQueryOperation.recordIDs = self.usersID
            }
        }

        if #available(iOS 15, *) {
            usersQueryOperation.perRecordResultBlock = { _, result in
                switch result {
                case .success(let record):
                    self.addUserIfNotExist(user: record)
                default:
                    break
                }
            }
        } else {
            usersQueryOperation.perRecordCompletionBlock = { record, _, error in
                if error == nil, let record = record {
                    self.addUserIfNotExist(user: record)
                }
            }
        }

        usersQueryOperation.completionBlock = {
            self.recordNamesToFilter = []
            completion(.success(self.users))
        }

        self.publicDatabase.add(userGamesQueryOperation)
        self.publicDatabase.add(usersQueryOperation)
    }

    private func addUserIfNotExist(user: CKRecord) {
        let recordName = user.recordID.recordName

        if !(self.recordNamesToFilter.contains(recordName)) {
            self.recordNamesToFilter.append(recordName)
            self.users.append(user)
        }
    }
}

extension FilterCKService {
    public func getAllGames() -> [Category: [Games]] {
        var gamesByCategory: [Category: [Games]] = [Category: [Games]]()
                
        for game in Games.allCases {
            if gamesByCategory[game.category] != nil {
                gamesByCategory[game.category]?.append(game)
            } else {
                gamesByCategory[game.category] = [game]
            }
        }
        
        return gamesByCategory
    }

    public func getGameByNumber(gameNumbers: [Int]) -> [Games] {
        let games: [Games]

        games = gameNumbers.compactMap({ gameNumber in
            Games(rawValue: gameNumber)
        })
        return games
    }

    public func getAllPurposes() -> [Goal] {
        return Goal.allCases
    }

    public func getGoalByNumber(goalNumber: Int) -> Goal? {
        let goal = Goal(rawValue: goalNumber)
        return goal
    }
}
