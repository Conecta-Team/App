//
//  CloudKitService.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 06/10/21.
//

import CloudKit

class CloudKitService {
    var container: CKContainer
    var publicDatabase: CKDatabase
    var privateDatabase: CKDatabase

    init() {
        container = CKContainer(identifier: "iCloud.nada")
        publicDatabase = container.publicCloudDatabase
        privateDatabase = container.privateCloudDatabase
    }
}
