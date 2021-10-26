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

    let userCKService: UserCKService = UserCKService()
    var user: UserDTO?

    func initialization() {}
}

extension LoginViewModel {
    
    public func getCurrentUser() {
        self.userCKService.getCurrentUser { result in
            switch result {
            case .success(let userRecord):
                self.user = UserDTO(record: userRecord)
            case .failure(_):
                self.user = nil
            }
            self.delegate?.didLoadData()
        }
    }
}
