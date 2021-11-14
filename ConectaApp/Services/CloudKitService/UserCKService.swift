//
//  UserCKService.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import CloudKit

class UserCKService: CloudKitService {
    var usersGamesToDelete: [CKRecord.ID] = [CKRecord.ID]()

    public func createUser(name: String, games: [Int], goal: Int, instagram: String?, discord: String?, steam: String?, completion: @escaping (Result<(CKRecord, CKRecord), CloudKitError>) -> Void) {

        let publicUserRecord = CKRecord(recordType: "User")
        publicUserRecord["name"] = name
        publicUserRecord["games"] = games
        publicUserRecord["goal"] = goal
        publicUserRecord["instagram"] = instagram
        publicUserRecord["discord"] = discord
        publicUserRecord["steam"] = steam
        publicUserRecord["blocked"] = 0
        
        let userGamesRecords: [CKRecord]
        let userReference = CKRecord.Reference(recordID: publicUserRecord.recordID, action: .deleteSelf)
        userGamesRecords = games.compactMap({ game in
            let userGameRecord = CKRecord(recordType: "UserGames")
            userGameRecord["userReference"] = userReference
            userGameRecord["game"] = game
            return userGameRecord
        })
        
        let recordsToSave = [publicUserRecord] + userGamesRecords
        let operation = CKModifyRecordsOperation(recordsToSave: recordsToSave, recordIDsToDelete: nil)
    
        if #available(iOS 15, *) {
            operation.modifyRecordsResultBlock = {result in
                switch result {
                case .success():
                    self.createUserReference(publicID: publicUserRecord.recordID) { privateUser in
                        completion(.success((publicUserRecord, privateUser)))
                    }
                case .failure(_):
                    completion(.failure(.cantCreateUSer))
                }
            }
        } else {
            operation.modifyRecordsCompletionBlock = { _, _, error in
                if error != nil {
                    completion(.failure(.cantCreateUSer))
                }
                
                self.createUserReference(publicID: publicUserRecord.recordID) { privateUser in
                    completion(.success((publicUserRecord, privateUser)))
                }
            }
        }
        self.publicDatabase.add(operation)
    }

    private func createUserReference(publicID: CKRecord.ID, completion: @escaping (CKRecord) -> Void) {
        let privateUser = CKRecord(recordType: "UserReference")
        privateUser["userPublicReference"] = publicID.recordName

        self.privateDatabase.save(privateUser) { privateRecord, privateError in
            if let error = privateError {
                print(error)
            }
            
            if let record = privateRecord {
                completion(record)
            }
        }
    }

    public func getCurrentUser(completion: @escaping (Result<CKRecord, CloudKitError>) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "UserReference", predicate: predicate)

        self.privateDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, error) in

            if error == nil, let results = results, let userRecord = results.first, let userIdValue = userRecord["userPublicReference"] as? String {
                let userID = CKRecord.ID(recordName: userIdValue)
                
                self.getUser(userID: userID) { result in
                    switch result {
                    case .success(let userRecord):
                        completion(.success(userRecord))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else {
                completion(.failure(.cantGetUser))
            }
        }
    }

    public func getUser(userID: CKRecord.ID, completion: @escaping (Result<CKRecord, CloudKitError>) -> Void) {
        let predicate = NSPredicate(format: "recordID == %@", userID)
        let query = CKQuery(recordType: "User", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { result, error in

            if error == nil, let result = result?.first {
                completion(.success(result))
            } else {
                completion(.failure(.cantGetUser))
            }
        }
    }
}

extension UserCKService {
    public func deleteUser(user: UserDTO, completion: @escaping (Result<CKRecord, CloudKitError>) -> Void) {
        self.publicDatabase.delete(withRecordID: user.userId) {_, error in
            if error == nil {
                let predicate = NSPredicate(format: "userPublicReference == %@", user.userId.recordName)
                let query = CKQuery(recordType: "UserReference", predicate: predicate)
        
                self.privateDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { result, error in

                    if error == nil, let result = result?.first {
                        self.privateDatabase.delete(withRecordID: result.recordID) { _, error in
                            if error == nil {
                                completion(.success(result))
                            } else {
                                completion(.failure(.cantDeleteUser))
                            }
                        }
                    } else {
                        completion(.failure(.cantDeleteUser))
                    }
                }
            } else {
                completion(.failure(.cantDeleteUser))
            }
        }
    }

    public func editUser(user: UserDTO, completion: @escaping (Result<CKRecord, CloudKitError>) -> Void) {
        self.publicDatabase.fetch(withRecordID: user.userId) { userRecord, error in
            if let userRecord = userRecord, error == nil {
                self.manageUserGames(userOldData: userRecord, userNewData: user) { result in
                    switch result {
                    case .success(let user):
                        userRecord["name"] = user.name
                        userRecord["games"] = user.games
                        userRecord["goal"] = user.goal
                        userRecord["instagram"] = user.instagram
                        userRecord["discord"] = user.discord
                        userRecord["steam"] = user.steam
                        
                        self.publicDatabase.save(userRecord) { record, error in
                            if error == nil, let newUserRecord = record {
                                completion(.success(newUserRecord))
                            } else {
                                completion(.failure(.cantEditUser))
                            }
                        }
                        
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            } else {
                completion(.failure(.cantEditUser))
            }
        }
    }

    private func manageUserGames(userOldData: CKRecord, userNewData: UserDTO, completion: @escaping (Result<UserDTO, CloudKitError>) -> Void) {
        if let oldGames = userOldData["games"] as? [Int] {
            let oldGamesSet = Set(oldGames)
            let newGamesSet = Set(userNewData.games)

            let gamesToDelete = oldGamesSet.subtracting(newGamesSet)
            let gamesToCrete = newGamesSet.subtracting(oldGamesSet)
            
            // MARK: verificando antes se ha alteracoes em relacao aos jogos
            if gamesToCrete.isEmpty && gamesToDelete.isEmpty {
                completion(.success(userNewData))
            } else {
                let userReference = CKRecord.Reference(recordID: userNewData.userId, action: .deleteSelf)
                
                // MARK: criando os registros de UserGames dos novos jogos de um usuario
                let userGamesToCreate: [CKRecord] = gamesToCrete.compactMap({ game in
                    let userGameRecord = CKRecord(recordType: "UserGames")
                    userGameRecord["userReference"] = userReference
                    userGameRecord["game"] = game
                    return userGameRecord
                })
                
                // MARK: preparando a operation para encontrar os ids dos registros que devem ser deletados
                let userGamesPredicate = NSPredicate(format: "game IN %@ AND userReference == %@", gamesToDelete, userReference)
                let userGamesQuery = CKQuery(recordType: "UserGames", predicate: userGamesPredicate)
                let userGamesQueryOperation = CKQueryOperation(query: userGamesQuery)
                userGamesQueryOperation.desiredKeys = ["recordID"]
                
                // MARK: preparando operation para salvar records necessarios
                let modifyOperation = CKModifyRecordsOperation(recordsToSave: userGamesToCreate, recordIDsToDelete: nil)
                modifyOperation.addDependency(userGamesQueryOperation)
                
                // MARK: cada novo record encontrado sera adicionado no array de recors para delecao e assim modifyOperation recebera os novos ids para deletar
                userGamesQueryOperation.recordFetchedBlock = { record in
                    self.usersGamesToDelete.append(record.recordID)
                    modifyOperation.recordIDsToDelete = self.usersGamesToDelete
                }
                
                // MARK: tratando o retorno da operation de modificacao
                if #available(iOS 15, *) {
                    modifyOperation.modifyRecordsResultBlock = {result in
                        switch result {
                        case .success():
                            completion(.success(userNewData))
                        case .failure(_):
                            completion(.failure(.cantEditUser))
                        }
                    }
                } else {
                    modifyOperation.modifyRecordsCompletionBlock = { _, _, error in
                        if error != nil {
                            completion(.failure(.cantEditUser))
                        }
                        
                        completion(.success(userNewData))
                    }
                }
                
                self.publicDatabase.add(userGamesQueryOperation)
                self.publicDatabase.add(modifyOperation)
            }
        } else {
            completion(.failure(.cantEditUser))
        }
    }
}
