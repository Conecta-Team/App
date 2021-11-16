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
    weak var delegate: GetSocialInfoToSaveDelegate?
    let isEditScreen: Bool
    
    init(isEditScreen: Bool = false) {
        self.isEditScreen = isEditScreen
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
        
        if isEditScreen {
            self.isModalInPresentation = true
            self.modalTransitionStyle = .crossDissolve
            let socialInfo = delegate?.getOldSocialInfo()
            registerSocialInfo.discordTextField.text = socialInfo?.discord
            registerSocialInfo.steamTextField.text = socialInfo?.steam
            registerSocialInfo.instagramTextField.text = socialInfo?.instagram
        }
    }
    
    public func getSocialInfos() -> (discord: String?, steam: String?, instagram: String?) {
        return (registerSocialInfo.discordTextField.text, registerSocialInfo.steamTextField.text, registerSocialInfo.instagramTextField.text)
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerSocialInfo.errorMessageLabel.isHidden = ishidden
    }
    
    @objc func cancelAction() {
        self.dismiss(animated: true)
    }
    
    @objc func saveAction() {
        let socialInfo = getSocialInfos()
        if let discord = socialInfo.discord, let steam = socialInfo.steam, let instagram = socialInfo.instagram, discord != "" || steam != "" || instagram != "" {
            registerSocialInfo.saveButton.isUserInteractionEnabled = false
            delegate?.editSocialInfos(discord: socialInfo.discord, steam: socialInfo.steam, instagram: socialInfo.instagram) {
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            }
        } else {
            registerSocialInfo.errorMessageLabel.isHidden = false
        }
    }
}
