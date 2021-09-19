//
//  PurposeDTO.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 15/09/21.
//

import Foundation
import CloudKit

struct PurposeDTO {
    
    let purposeId: CKRecord.ID
    let name: String
    
    init(record: CKRecord) {
        self.purposeId = record.recordID
        self.name = record["name"] as! String
    }
}
