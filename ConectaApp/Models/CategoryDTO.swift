//
//  CategoryDTO.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 14/09/21.
//

import Foundation
import CloudKit

struct CategoryDTO {
    
    let categoryId: CKRecord.ID
    let name: String

    init(record: CKRecord) {
        self.categoryId = record.recordID
        self.name = record["name"] as! String
    }
}
