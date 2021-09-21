//
//  CloudKitService.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 14/09/21.
//

import CloudKit

class CloudKitService {

    let container: CKContainer
    let publicDatabase: CKDatabase
    let privateDatabse: CKDatabase

    static var currentModel = CloudKitService()
    
    init() {
        self.container = CKContainer(identifier: "iCloud.ConectApp")
        self.publicDatabase = container.publicCloudDatabase
        self.privateDatabse = container.privateCloudDatabase
    }

    // MARK: Find all categories saved on iCloud Container
    func getCategories(completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Category", predicate: predicate)

        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, error) in
            completion(results!)
        }
    }

    // MARK: Find all games saved on iCloud by a category
    func getGamesByCategory(category: CKRecord.ID, completion: @escaping (CKRecord) -> Void) {
        let recordToMatch = CKRecord.Reference(recordID: category, action: .deleteSelf)
        let predicate = NSPredicate(format: "categoryReference == %@", recordToMatch)
        let query = CKQuery(recordType: "Game", predicate: predicate)

        let queryOp = CKQueryOperation(query: query)
        queryOp.recordFetchedBlock = { result in
            completion(result)
        }
        self.publicDatabase.add(queryOp)
    }

    // MARK: Find all purpose saved on iCloud Container
    func getAllPurposes(completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Purpose", predicate: predicate)

        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, _) in
            completion(results!)
        }
    }

    // MARK: Get a specific purpose on iCloud Container
    func getPurpose(purpose: CKRecord.ID, completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(format: "recordID == %@", purpose)
        let query = CKQuery(recordType: "Purpose", predicate: predicate)
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
    
    // MARK: Get a specific game on iCloud Container
    func getGame(game: CKRecord.ID, completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(format: "recordID == %@", game)
        let query = CKQuery(recordType: "Game", predicate: predicate)
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
    
    // MARK: Get a specific socialInfos on iCloud Container
    func getSocialInfos(socialInfoId: CKRecord.ID, completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(format: "recordID == %@", socialInfoId)
        let query = CKQuery(recordType: "SocialInfos", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }

    // MARK: Get all user ids by game id. You must add one user id to not included on fetch
    func getUsersByGame(notIncluded userID: CKRecord.ID, gameReference: CKRecord.Reference, completion: @escaping ([CKRecord]) -> Void) {
//        let gameReference = CKRecord.Reference(recordID: gameID, action: .deleteSelf)
        let userReference = CKRecord.Reference(recordID: userID, action: .deleteSelf)
        let predicate = NSPredicate(format: "gameReference == %@ AND NOT (userReference == %@)", gameReference, userReference)
        let query = CKQuery(recordType: "UserGames", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
    
    // MARK: Get a game about
    func getUserGame(userID: String, completion: @escaping ([CKRecord]) -> Void) {
        let recordId = CKRecord.ID(recordName: userID)
        let reference = CKRecord.Reference(recordID: recordId, action: .deleteSelf)
    
        let predicate = NSPredicate(format: "userReference == %@", reference)
        let query = CKQuery(recordType: "UserGames", predicate: predicate)

        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }

    // MARK: Get a specific user on iCloud Container
    func getUsers(usersID: [CKRecord.ID], completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(format: "recordID IN %@", usersID)
        let query = CKQuery(recordType: "User", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
    
    // MARK: Create a SocialInfos record and save into Public database iCloud
    func createSocialInfos(instagram: String? = nil, facebook: String? = nil, steam: String? = nil, discord: String? = nil, completion: @escaping (CKRecord?) -> Void) {
        
        let socialInfos = CKRecord(recordType: "SocialInfos")
        socialInfos["instagram"] = instagram
        socialInfos["facebook"] = facebook
        socialInfos["steam"] = steam
        socialInfos["discord"] = discord
    
        self.publicDatabase.save(socialInfos) { (record, _) in
            completion(record)
        }
    }

    // TODO: acrescentar os dados faltantes quando forem inseridos na interface
    // MARK: Create a User record and save into Public database iCloud
    func createUser(name: String, purpose: CKRecord.ID, socialInfos: CKRecord, completion: @escaping (CKRecord?) -> Void) {
        let purposeReference = CKRecord.Reference(recordID: purpose, action: .none)
        let socialInfosReference = CKRecord.Reference(recordID: socialInfos.recordID, action: .none)
        
        let user = CKRecord(recordType: "User")
        user["name"] = name
        user["purposeReference"] = purposeReference
        user["socialInfosReference"] = socialInfosReference
        
        self.publicDatabase.save(user) { (record, _) in
            if let user = record {
                let userIDString = user.recordID.recordName
                
                let userPrivate = CKRecord(recordType: "UserPrivate")
                userPrivate["userPublicReference"] = userIDString

                self.privateDatabse.save(userPrivate) { _, _ in
                    completion(user)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    //MARK: Create a UserGames record and save into Public database iCloud
    func createUserGames(user: CKRecord.ID, game: CKRecord.ID, completion: @escaping (CKRecord?) -> Void) {
        let userReference = CKRecord.Reference(recordID: user, action: .none)
        let gameReference = CKRecord.Reference(recordID: game, action: .none)
        
        let userGames = CKRecord(recordType: "UserGames")
        userGames["userReference"] = userReference
        userGames["gameReference"] = gameReference
        
        self.publicDatabase.save(userGames) { record, _ in
            completion(record)
        }
    }

    // MARK: Get a public userID on iCloud Container
    func getUserPublicReference(completion: @escaping ([CKRecord]?) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "UserPrivate", predicate: predicate)

        self.privateDatabse.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, _) in
            completion(results)
        }
    }

    func deletePrivateUser() {
        self.getUserPublicReference { record in
            if let record = record, let user = record.first {
                self.privateDatabse.delete(withRecordID: user.recordID) { record, error in
                    print(record, error)
                }
            }
        }
    }
}
