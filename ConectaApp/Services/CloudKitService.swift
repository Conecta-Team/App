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

    func getCategories(completion: @escaping ([CKRecord]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Category", predicate: predicate)

        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (results, _) in
            completion(results!)
        }
    }

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

    func getGamesOP() {
        var count = 0
        let predicate = NSPredicate(value: true)

        let query = CKQuery(recordType: "Game", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        operation.zoneID = CKRecordZone.default().zoneID
        operation.queryCompletionBlock = { _, _ in
            count += 1
            print(count)
        }
        self.container.publicCloudDatabase.add(operation)
    }

    func getGames(completion: @escaping (Result<[GameDTO], CloudKitErrors>) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Game", predicate: predicate)

        self.publicDatabase.perform(query, inZoneWith: CKRecordZone.default().zoneID) { (_, error) in
            if error != nil {
                DispatchQueue.main.async {
                    completion(.failure(CloudKitErrors.fetchError))
                }
            }

//            let operation = CKQueryOperation()
//            operation.

//            for game in results! {
//                let idReference = (game["categoryReference"] as! CKRecord.Reference).recordID
//                let predicateCategory = NSPredicate(format: "recordID == %@", idReference)
//                let queryCategory = CKQuery(recordType: "Category", predicate: predicateCategory)
////
//                self.publicDatabase.perform(queryCategory, inZoneWith: CKRecordZone.default().zoneID) {
//                    (results, error) in
//
//                }
//            }
        }

    }
}
