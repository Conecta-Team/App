//
//  RegisterSocialInfoView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterSocialInfoView: UIView {

    internal lazy var socialInfoTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 32)
        label.textColor = .textBrown
        label.text = "Contatos"
        return label
    }()
    
    internal lazy var socialInfoSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 16)
        label.textColor = .textLightGray
        label.text = "Adicione meios de conversar com você!"
        label.numberOfLines = 0 
        return label
    }()
    
    internal lazy var discordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightOrange
        return view
    }()
    
    internal lazy var discordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textDarkGray
        label.attributedText = NSMutableAttributedString(string: "Discord: ", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 16)])
        return label
    }()
    
    internal lazy var discordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightOrange
        textField.textColor = .textDarkGray
        textField.font = .appRegularFont(with: 16)
        return textField
    }()
    
    internal lazy var steamView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightOrange
        return view
    }()
    
    internal lazy var steamLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textDarkGray
        label.attributedText = NSMutableAttributedString(string: "Steam: ", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 16)])
        return label
    }()
    
    internal lazy var steamTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightOrange
        textField.font = .appRegularFont(with: 16)
        textField.textColor = .textDarkGray
        return textField
    }()

    internal lazy var instagramView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightOrange
        return view
    }()
    
    internal lazy var instagramLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textDarkGray
        label.attributedText = NSMutableAttributedString(string: "Instagram: ", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 16)])
        return label
    }()
    
    internal lazy var instagramTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightOrange
        textField.font = .appRegularFont(with: 16)
        textField.textColor = .textDarkGray
        return textField
    }()
    
    internal lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 12)
        label.textColor = .red
        label.text = "Você precisa preencher pelo menos um campo!"
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        addSubview(socialInfoTitle)
        addSubview(socialInfoSubtitle)
        addSubview(discordView)
        discordView.addSubview(discordLabel)
        discordView.addSubview(discordTextField)
        addSubview(steamView)
        steamView.addSubview(steamLabel)
        steamView.addSubview(steamTextField)
        addSubview(instagramView)
        instagramView.addSubview(instagramLabel)
        instagramView.addSubview(instagramTextField)
        addSubview(errorMessageLabel)
        setupContraints()
    }
    
    func setupContraints() {

        NSLayoutConstraint.activate([
            socialInfoTitle.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            socialInfoTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            socialInfoTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            socialInfoSubtitle.topAnchor.constraint(equalTo: socialInfoTitle.bottomAnchor, constant: 16),
            socialInfoSubtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            socialInfoSubtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            discordView.topAnchor.constraint(equalTo: socialInfoSubtitle.bottomAnchor, constant: 16),
            discordView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            discordView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            discordView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            discordLabel.centerYAnchor.constraint(equalTo: discordView.centerYAnchor),
            discordLabel.leadingAnchor.constraint(equalTo: discordView.leadingAnchor, constant: 8),
            discordLabel.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            discordTextField.topAnchor.constraint(equalTo: discordView.topAnchor),
            discordTextField.leadingAnchor.constraint(equalTo: discordLabel.trailingAnchor, constant: 4),
            discordTextField.trailingAnchor.constraint(equalTo: discordView.trailingAnchor),
            discordTextField.bottomAnchor.constraint(equalTo: discordView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            steamView.topAnchor.constraint(equalTo: discordView.bottomAnchor, constant: 8),
            steamView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            steamView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            steamView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            steamLabel.centerYAnchor.constraint(equalTo: steamView.centerYAnchor),
            steamLabel.leadingAnchor.constraint(equalTo: steamView.leadingAnchor, constant: 8),
            steamLabel.widthAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            steamTextField.topAnchor.constraint(equalTo: steamView.topAnchor),
            steamTextField.leadingAnchor.constraint(equalTo: steamLabel.trailingAnchor, constant: 4),
            steamTextField.trailingAnchor.constraint(equalTo: steamView.trailingAnchor),
            steamTextField.bottomAnchor.constraint(equalTo: steamView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            instagramView.topAnchor.constraint(equalTo: steamView.bottomAnchor, constant: 8),
            instagramView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            instagramView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            instagramView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
        
        NSLayoutConstraint.activate([
            instagramLabel.centerYAnchor.constraint(equalTo: instagramView.centerYAnchor),
            instagramLabel.leadingAnchor.constraint(equalTo: instagramView.leadingAnchor, constant: 8),
            instagramLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            instagramTextField.topAnchor.constraint(equalTo: instagramView.topAnchor),
            instagramTextField.leadingAnchor.constraint(equalTo: instagramLabel.trailingAnchor, constant: 4),
            instagramTextField.trailingAnchor.constraint(equalTo: instagramView.trailingAnchor),
            instagramTextField.bottomAnchor.constraint(equalTo: instagramView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: instagramTextField.bottomAnchor, constant: 8),
            errorMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            errorMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
}
