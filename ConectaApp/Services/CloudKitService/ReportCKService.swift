//
//  ReportCKService.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 05/11/21.
//

import CloudKit

class ReportCKService: CloudKitService {
    let userCKService = UserCKService()

    public func reportUser(user: UserDTO, typeReport: Reports, message: String, completion: @escaping (Result<CKRecord, CloudKitError>) -> Void) {
        
        let userReference = CKRecord.Reference(recordID: user.userId, action: .deleteSelf)
    
        let reportRecord = CKRecord(recordType: "Reports")
        reportRecord["user"] = userReference
        reportRecord["type"] = typeReport.rawValue
        reportRecord["message"] = message
        
        let operation = CKModifyRecordsOperation(recordsToSave: [reportRecord], recordIDsToDelete: nil)

        if #available(iOS 15, *) {
            operation.modifyRecordsResultBlock = {result in
                switch result {
                case .success():
                    completion(.success(reportRecord))
                case .failure(_):
                    completion(.failure(.cantCreateReport))
                }
            }
        } else {
            operation.modifyRecordsCompletionBlock = { _, _, error in
                if error != nil {
                    completion(.failure(.cantCreateReport))
                }
                
                completion(.success(reportRecord))
            }
        }
        self.publicDatabase.add(operation)
    }

    public func blockUser(userToBlock: UserDTO, myUser: UserDTO, completion: @escaping (Result<CKRecord, CloudKitError>) -> Void) {
        self.userCKService.getUser(userID: myUser.userId) { result in
            switch result {
            case .success(let userRecord):
                let userToBlockReference = CKRecord.Reference(recordID: userToBlock.userId, action: .none)

                if let blockedUsers = userRecord["usersBlocked"] as? [CKRecord.Reference] {
                    userRecord["usersBlocked"] = blockedUsers + [userToBlockReference]
                } else {
                    userRecord["usersBlocked"] = [userToBlockReference]
                }
                
                self.publicDatabase.save(userRecord) { record, error in
                    if error == nil, let newUserRecord = record {
                        completion(.success(newUserRecord))
                    } else {
                        completion(.failure(.cantBlockUser))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
