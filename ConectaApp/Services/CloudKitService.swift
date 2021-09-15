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

    /// @brief Find all categories saved on CloudKit
    /// @param completion a closure of type ([CKRecord]) -> Void)
    func getCategories(completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Category", predicate: predicate)

        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, _) in
            completion(results!)
        }
    }

    /// @brief Find all games saved on CloudKit by a category
    /// @param category used for filter
    /// @param completion a closure of type ([CKRecord]) -> Void)
    func getGamesByCategory(category: CKRecord, completion: @escaping (CKRecord) -> Void) {
        let recordToMatch = CKRecord.Reference(recordID: category.recordID, action: .deleteSelf)
        let predicate = NSPredicate(format: "categoryReference == %@", recordToMatch)
        let query = CKQuery(recordType: "Game", predicate: predicate)

        let queryOp = CKQueryOperation(query: query)
        queryOp.recordFetchedBlock = { result in
            completion(result)
        }
        self.publicDatabase.add(queryOp)
    }
    
    /// @brief Find all purpose saved on CloudKit
    /// @param completion a closure of type ([CKRecord]) -> Void)
    func getAllPurposes(completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Purpose", predicate: predicate)

        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, _) in
            completion(results!)
        }
    }
    
    /// @brief Find all games saved on CloudKit by a category
    /// @param category used for filter
    /// @param completion a closure of type ([CKRecord]) -> Void)
    func getPurpose(purpose: CKRecord.ID, completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(format: "recordID == %@", purpose)
        let query = CKQuery(recordType: "Purpose", predicate: predicate)
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
    
    ///OK
    func getSocialInfos(socialInfoId: CKRecord.ID, completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(format: "recordID == %@", socialInfoId)
        let query = CKQuery(recordType: "SocialInfos", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
    
    /// OK
    func getUsersByGame(notIncluded userID: CKRecord.ID, gameID: CKRecord.ID, completion: @escaping ([CKRecord]) -> Void) {
        let gameReference = CKRecord.Reference(recordID: gameID, action: .deleteSelf)
        let userReference = CKRecord.Reference(recordID: userID, action: .deleteSelf)
        let predicate = NSPredicate(format: "gameReference == %@ AND NOT (userReference == %@)", gameReference, userReference)
        let query = CKQuery(recordType: "UserGames", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
    
    ///OK
    func getUsers(usersID: [CKRecord.ID], completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(format: "recordID IN %@", usersID)
        let query = CKQuery(recordType: "User", predicate: predicate)
        
        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (result, _) in
            completion(result ?? [CKRecord]())
        }
    }
}
