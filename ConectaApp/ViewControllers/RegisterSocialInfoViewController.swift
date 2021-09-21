//
//  RegisterSocialInfoViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterSocialInfoViewController: UIViewController {
    
    let registerGameView = RegisterSocialInfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = registerGameView
        self.view.backgroundColor = .backgroundGray
    }
    
    public func getSocialInfos() -> (discord: String?, steam: String?, instagram: String?) {
        return (registerGameView.discordTextField.text, registerGameView.steamTextField.text, registerGameView.instagramTextField.text)
    }
}
