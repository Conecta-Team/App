//
//  RegisterSocialInfoView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterSocialInfoView: UIView {
    
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
            socialInfoTitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            socialInfoTitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            socialInfoSubtitle.topAnchor.constraint(equalTo: socialInfoTitle.bottomAnchor, constant: 16),
            socialInfoSubtitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            socialInfoSubtitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            discordLabel.topAnchor.constraint(equalTo: socialInfoSubtitle.bottomAnchor, constant: 16),
            discordLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            discordLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            discordTextField.topAnchor.constraint(equalTo: discordLabel.bottomAnchor, constant: 8),
            discordTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            discordTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8),
            discordTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            steamLabel.topAnchor.constraint(equalTo: discordTextField.bottomAnchor, constant: 16),
            steamLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            steamLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            steamTextField.topAnchor.constraint(equalTo: steamLabel.bottomAnchor, constant: 8),
            steamTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            steamTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8),
            steamTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            instagramLabel.topAnchor.constraint(equalTo: steamTextField.bottomAnchor, constant: 16),
            instagramLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            instagramLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            instagramTextField.topAnchor.constraint(equalTo: instagramLabel.bottomAnchor, constant: 8),
            instagramTextField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            instagramTextField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8),
            instagramTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: instagramTextField.bottomAnchor, constant: 8),
            errorMessageLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            errorMessageLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])
    }
}
