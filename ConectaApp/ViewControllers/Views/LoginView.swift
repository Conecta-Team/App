//
//  LoginView.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 13/09/21.
//

import UIKit
import AuthenticationServices

class LoginView: UIView {

  weak var loginHandler: LoginProtocols?

  let titleApp: UILabel = {
    let label = UILabel()
    label.text = "Conecta App"
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let imageIcon: UIImageView = {
    let image = UIImageView(image: UIImage(named: "IconConecta"))
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  let buttonLogin: ASAuthorizationAppleIDButton = {
    let button = ASAuthorizationAppleIDButton()
    button.addTarget(self, action: #selector(oi(_:)), for: .touchUpInside)
    button.setValue(24, forKey: "cornerRadius")
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  @objc func oi(_ sender: UIButton) {
    loginHandler?.observerLoginAuth(sender)
  }
}

extension LoginView {

  override func layoutSubviews() {
    super.layoutSubviews()
    self.addSubview(titleApp)
    self.addSubview(imageIcon)
    self.addSubview(buttonLogin)

    NSLayoutConstraint.activate([
      self.titleApp.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
      self.titleApp.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100)
    ])

    NSLayoutConstraint.activate([
      self.buttonLogin.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
      self.buttonLogin.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: 180),
      self.buttonLogin.widthAnchor.constraint(equalToConstant: 250),
      self.buttonLogin.heightAnchor.constraint(equalToConstant: 50)
    ])

    NSLayoutConstraint.activate([
      self.imageIcon.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
      self.imageIcon.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -70),
      self.imageIcon.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 4/5)
    ])

  }
}
