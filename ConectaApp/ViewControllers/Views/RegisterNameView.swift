//
//  RegisterNameView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterNameView: UIView {
    
    internal lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundPurple")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    internal lazy var nameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 32)
        label.textColor = .textPurple
        label.text = "Nickname"
        return label
    }()
    
    internal lazy var nameSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 16)
        label.textColor = .textLightGray
        label.text = "Como gostaria de ser chamada?"
        label.numberOfLines = 0
        return label
    }()
    
    internal lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightPurple
        textField.font = .appRegularFont(with: 16)
        textField.textColor = .textDarkGray
        return textField
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        addSubview(nameTitle)
        addSubview(nameSubtitle)
        addSubview(nameTextField)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        self.addGestureRecognizer(tap)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameTitle.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            nameTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            nameSubtitle.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 16),
            nameSubtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameSubtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameSubtitle.bottomAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
    }
}
