//
//  RegisterNameViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterNameViewController: UIViewController {
    
    let registerNameView: RegisterNameView
    weak var delegate: GetNameToSaveDelegate?
    let isEditScreen: Bool
    
    init(isEditScreen: Bool = false) {
        self.isEditScreen = isEditScreen
        self.registerNameView = RegisterNameView(isEditScreen: isEditScreen)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.view = registerNameView
        
        self.registerNameView.cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        self.registerNameView.saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        
        if isEditScreen {
            self.isModalInPresentation = true
            self.modalTransitionStyle = .crossDissolve
            registerNameView.nameTextField.text = delegate?.getOldName()
        }
    }
    
    public func getName() -> String? {
        return registerNameView.nameTextField.text
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerNameView.errorMessageLabel.isHidden = ishidden
    }
    
    @objc func cancelAction() {
        self.dismiss(animated: true)
    }
    
    @objc func saveAction() {
        let name = getName()
        if let name = name, name != "" {
            registerNameView.saveButton.isUserInteractionEnabled = false
            delegate?.editName(name: name, completion: {
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            })
        } else {
            registerNameView.errorMessageLabel.isHidden = false
        }
    }
}
