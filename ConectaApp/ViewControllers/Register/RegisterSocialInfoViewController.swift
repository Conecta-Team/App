//
//  RegisterSocialInfoViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterSocialInfoViewController: UIViewController {
    
    let registerSocialInfo: RegisterSocialInfoView
    
    init(isEditScreen: Bool = false) {
        self.registerSocialInfo = RegisterSocialInfoView(isEditScreen: isEditScreen)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = registerSocialInfo
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.registerSocialInfo.cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        self.registerSocialInfo.saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
    }
    
    public func getSocialInfos() -> (discord: String?, steam: String?, instagram: String?) {
        return (registerSocialInfo.discordTextField.text, registerSocialInfo.steamTextField.text, registerSocialInfo.instagramTextField.text)
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerSocialInfo.errorMessageLabel.isHidden = ishidden
    }
    
    @objc func cancelAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveAction() {
        
    }
}
