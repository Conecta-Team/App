//
//  ProfilePrivacitySecurityViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 12/11/21.
//

import UIKit

class ProfilePrivacitySecurityViewController: UIViewController {
    
    let privacityView = ProfilePrivacitySecurityView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = privacityView
        
        privacityView.okButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
    }
    
    @objc func dismissView(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
