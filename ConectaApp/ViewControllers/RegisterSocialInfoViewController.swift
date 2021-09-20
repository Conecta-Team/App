//
//  RegisterSocialInfoViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterSocialInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = RegisterSocialInfoView()
        self.view.backgroundColor = .backgroundGray
    }
}
