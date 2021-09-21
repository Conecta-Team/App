//
//  LoginViewModel.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 20/09/21.
//

import Foundation
import CloudKit

class LoginViewModel: ViewModelType {
    weak var delegate: ViewModelDelegate?
    let cloudKitService: CloudKitService = CloudKitService.currentModel

    var hasUser: Bool = false {
        didSet {
            delegate?.didLoadData()
        }
    }

    func initialization() {}

    public func getPrivateUser() {
        self.cloudKitService.getUserPublicReference { result in
            if let resultArray = result, resultArray.first != nil {
                self.hasUser = true
            } else {
                self.hasUser = false
            }
        }
    }
}
