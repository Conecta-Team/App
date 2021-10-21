//
//  RegisterSocialInfoViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterSocialInfoViewController: UIViewController {
    
    let registerSocialInfo = RegisterSocialInfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = registerSocialInfo
    }
    
    public func getSocialInfos() -> (discord: String?, steam: String?, instagram: String?) {
        return (registerSocialInfo.discordTextField.text, registerSocialInfo.steamTextField.text, registerSocialInfo.instagramTextField.text)
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerSocialInfo.errorMessageLabel.isHidden = ishidden
    }
}
