//
//  LoginView.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 13/09/21.
//

import UIKit

class LoginView: UIView {

  let titleApp: UILabel = {
    let label = UILabel()
    label.text = "Conecta App"
    label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  let buttonLogin: UIButton = {
    let button = UIButton()
    button.setTitle("Entrar", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor.systemBlue
    button.layer.cornerRadius = 25
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
}

extension LoginView {
  override func layoutSubviews() {
    super.layoutSubviews()
    self.addSubview(titleApp)
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

  }
}
