//
//  RegisterNameViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RegisterNameView()
        self.view.backgroundColor = .backgroundGray
    }
}
