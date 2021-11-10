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
    
    init(isEditScreen: Bool = false) {
        self.registerNameView = RegisterNameView(isEditScreen: isEditScreen)
        if isEditScreen {
            registerNameView.nameTextField.text = delegate?.getOldName()
        }
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
    }
    
    public func getName() -> String? {
        return registerNameView.nameTextField.text
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerNameView.errorMessageLabel.isHidden = ishidden
    }
    
    @objc func cancelAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func saveAction() {
        let name = getName()
        delegate?.editName(name: name, completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
}

protocol GetNameToSaveDelegate: AnyObject {
    func getOldName() -> String?
    func editName(name: String?, completion: @escaping () -> Void)
}
