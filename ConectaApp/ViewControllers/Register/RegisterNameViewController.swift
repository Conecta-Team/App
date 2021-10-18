//
//  RegisterNameViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterNameViewController: UIViewController {
    
    let registerNameView = RegisterNameView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = registerNameView
        self.view.backgroundColor = .backgroundGray
    }
    
    public func getName() -> String? {
        return registerNameView.nameTextField.text
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerNameView.errorMessageLabel.isHidden = ishidden
    }
}
