//
//  LoginViewController.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 14/09/21.
//

import UIKit

class LoginViewController: UIViewController {

  weak var coordinator: MainCoordinator?
  let mainView: LoginView

  init() {
    self.mainView = LoginView()
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = mainView
    self.view.backgroundColor = .white
  }
}
