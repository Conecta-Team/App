//
//  LoginView.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 13/09/21.
//

import UIKit
import AuthenticationServices

class LoginView: UIView {

    let titleApp: UILabel = {
        let label = UILabel()
        label.text = "CONECTA"
        label.font = .appRegularFont(with: 50)
        label.textColor = UIColor(red: 0.46, green: 0.94, blue: 1.00, alpha: 1.00)
        label.layer.shadowColor = UIColor(red: 0.46, green: 0.94, blue: 1.00, alpha: 1.00).cgColor
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let subtitleApp: UILabel = {
        let label = UILabel()
        label.text = "Encontre garotas para jogar junto."
        label.font = .appRegularFont(with: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imageIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let buttonLogin: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "buttonLogin"), for: .normal)
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

extension LoginView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(imageIcon)
        self.addSubview(titleApp)
        self.addSubview(subtitleApp)
        self.addSubview(buttonLogin)

        // MARK: Constraints
        NSLayoutConstraint.activate([
            self.imageIcon.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            self.imageIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageIcon.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            self.imageIcon.heightAnchor.constraint(equalTo: self.imageIcon.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            self.titleApp.topAnchor.constraint(equalTo: imageIcon.bottomAnchor, constant: 8),
            self.titleApp.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            self.subtitleApp.topAnchor.constraint(equalTo: titleApp.bottomAnchor, constant: 24),
            self.subtitleApp.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            self.buttonLogin.topAnchor.constraint(greaterThanOrEqualTo: subtitleApp.bottomAnchor, constant: 100),
            self.buttonLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 77),
            self.buttonLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -77),
            self.buttonLogin.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -64),
            self.buttonLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.buttonLogin.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
