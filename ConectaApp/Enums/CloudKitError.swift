//
//  CloudKitErrors.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 14/09/21.
//

import UIKit

enum CloudKitError: Error {
    case fetchError
    case cantCreateUSer
    case cantGetUser
    case cantGetUsersToMatch
    case cantEditUser
    case cantDeleteUser
}
