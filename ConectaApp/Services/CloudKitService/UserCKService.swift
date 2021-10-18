//
//  UserCKService.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import CloudKit

class UserCKService: CloudKitService {

    public func createUser(name: String, games: [Int], goal: Int, instagram: String?, discord: String?, steam: String?, completion: @escaping (Result<(CKRecord, CKRecord), CloudKitError>) -> Void) {

        let publicUserRecord = CKRecord(recordType: "User")
        publicUserRecord["name"] = name
        publicUserRecord["Games"] = games
        publicUserRecord["goal"] = goal
        publicUserRecord["Instagram"] = instagram
        
        let userGamesRecords: [CKRecord]
        let userReference = CKRecord.Reference(recordID: publicUserRecord.recordID, action: .none)
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
                    self.createUserPrivate(publicID: publicUserRecord.recordID) { privateUser in
                        completion(.success((publicUserRecord, privateUser)))
                    }
                case .failure(_):
                    completion(.failure(.cantCreateUSer))
                }
            }
        } else {
            operation.modifyRecordsCompletionBlock = { saved, deleted, error in
                if error != nil {
                    completion(.failure(.cantCreateUSer))
                }
                
                self.createUserPrivate(publicID: publicUserRecord.recordID) { privateUser in
                    completion(.success((publicUserRecord, privateUser)))
                }
            }
        }
        self.publicDatabase.add(operation)
    }

    private func createUserPrivate(publicID: CKRecord.ID, completion: @escaping (CKRecord)->Void) {
        let privateUser = CKRecord(recordType: "UserPrivate")
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
        let query = CKQuery(recordType: "UserPrivate", predicate: predicate)

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
