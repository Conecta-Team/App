//
//  RegisterNameView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterNameView: UIView {
    
    var isEditScreen: Bool
    
    init(isEditScreen: Bool = false) {
        self.isEditScreen = isEditScreen
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.borderColor = UIColor.borderPurple.cgColor
        view.layer.borderWidth = 2
        view.layer.shadowColor = UIColor.borderPurple.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var nameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSMutableAttributedString(string: "Nickname", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 32)])
        label.textColor = .textBlue
        label.layer.shadowColor = UIColor.textBlue.cgColor
        label.layer.shadowRadius = 8
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        return label
    }()
    
    internal lazy var nameSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 18)
        label.textColor = .textLightBlue
        label.text = "Como gostaria de ser chamada?"
        label.numberOfLines = 0
        return label
    }()
    
    internal lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.borderGreen.cgColor
        textField.layer.borderWidth = 1
        textField.layer.shadowColor = UIColor.textBlue.cgColor
        textField.layer.shadowRadius = 8
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = .zero
        textField.font = .appRegularFont(with: 18)
        textField.textColor = .textLightBlue
        textField.placeholder = " Digite seu nickname"
        
        return textField
    }()
    
    internal lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 14)
        label.textColor = .alertRed
        label.text = "Esse campo não pode estar vazio!"
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    internal lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "logoutButton"), for: .normal)
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 12, bottom: 5, right: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    internal lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "buttonGray"), for: .normal)
        button.setTitle("Cancelar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        addSubview(borderView)
        addSubview(nameTitle)
        addSubview(nameSubtitle)
        addSubview(nameTextField)
        addSubview(errorMessageLabel)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
        
        if isEditScreen {
            addSubview(saveButton)
            addSubview(cancelButton)
        }
        
        setConstraints()
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            borderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 56),
            nameTitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            nameTitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            nameSubtitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 16),
            nameSubtitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            nameSubtitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameSubtitle.bottomAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            errorMessageLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            errorMessageLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])
        
        if isEditScreen {
            NSLayoutConstraint.activate([
                saveButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor),
                saveButton.heightAnchor.constraint(equalTo: saveButton.heightAnchor),
                saveButton.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -32),
                saveButton.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -32)
            ])
            
            NSLayoutConstraint.activate([
                cancelButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor),
                cancelButton.heightAnchor.constraint(equalTo: cancelButton.heightAnchor),
                cancelButton.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -32),
                cancelButton.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 32)
            ])
        }
    }
}
