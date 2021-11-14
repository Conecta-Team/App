//
//  RegisterSocialInfoView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterSocialInfoView: UIView {
    
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

    internal lazy var socialInfoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSMutableAttributedString(string: "Contatos", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 32)])
        label.textColor = .textBlue
        label.layer.shadowColor = UIColor.textBlue.cgColor
        label.layer.shadowRadius = 8
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        return label
    }()
    
    internal lazy var socialInfoSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 18)
        label.textColor = .textLightBlue
        label.text = "Adicione meios de conversar com você!"
        label.numberOfLines = 0 
        return label
    }()
    
    internal lazy var discordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textBlue
        label.font = .appRegularFont(with: 20)
        label.text = "Discord:"
        return label
    }()
    
    internal lazy var discordTextField: UITextField = {
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
        textField.placeholder = " Digite seu user"
        return textField
    }()
    
    internal lazy var steamLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textBlue
        label.font = .appRegularFont(with: 20)
        label.text = "Steam:"
        return label
    }()
    
    internal lazy var steamTextField: UITextField = {
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
        textField.placeholder = " Digite seu user"
        return textField
    }()
    
    internal lazy var instagramLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textBlue
        label.font = .appRegularFont(with: 20)
        label.text = "Instagram:"
        return label
    }()
    
    internal lazy var instagramTextField: UITextField = {
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
        textField.placeholder = " Digite seu user"
        return textField
    }()
    
    internal lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 14)
        label.textColor = .alertRed
        label.text = "Você precisa preencher pelo menos um campo!"
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

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
    }
    
    func setupView() {
        addSubview(borderView)
        addSubview(socialInfoTitle)
        addSubview(socialInfoSubtitle)
        addSubview(discordLabel)
        addSubview(discordTextField)
        addSubview(steamLabel)
        addSubview(steamTextField)
        addSubview(instagramLabel)
        addSubview(instagramTextField)
        addSubview(errorMessageLabel)
        
        if isEditScreen {
            addSubview(saveButton)
            addSubview(cancelButton)
        }
        setupContraints()
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            borderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            socialInfoTitle.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 56),
            socialInfoTitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            socialInfoTitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            socialInfoSubtitle.topAnchor.constraint(equalTo: socialInfoTitle.bottomAnchor, constant: 16),
            socialInfoSubtitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            socialInfoSubtitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            discordLabel.topAnchor.constraint(equalTo: socialInfoSubtitle.bottomAnchor, constant: 16),
            discordLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            discordLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            discordTextField.topAnchor.constraint(equalTo: discordLabel.bottomAnchor, constant: 8),
            discordTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            discordTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16),
            discordTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            steamLabel.topAnchor.constraint(equalTo: discordTextField.bottomAnchor, constant: 16),
            steamLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            steamLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            steamTextField.topAnchor.constraint(equalTo: steamLabel.bottomAnchor, constant: 8),
            steamTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            steamTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16),
            steamTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            instagramLabel.topAnchor.constraint(equalTo: steamTextField.bottomAnchor, constant: 16),
            instagramLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            instagramLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            instagramTextField.topAnchor.constraint(equalTo: instagramLabel.bottomAnchor, constant: 8),
            instagramTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            instagramTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16),
            instagramTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: instagramTextField.bottomAnchor, constant: 8),
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
