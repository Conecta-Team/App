//
//  LoginViewController.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 14/09/21.
//

import UIKit
import AuthenticationServices
import Security

class LoginViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    let mainView: LoginView
    let viewModel: LoginViewModel = LoginViewModel()

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
        self.viewModel.delegate = self
        mainView.buttonLogin.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        self.view.backgroundColor = UIColor(red: 0.10, green: 0.00, blue: 0.22, alpha: 1.00)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func login(_ sender: UIButton) {
        if FileManager.default.ubiquityIdentityToken != nil {
            self.viewModel.getPrivateUser()
        } else {
            observerLoginAuth()
        }
    }

    func observerLoginAuth() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate {

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        self.viewModel.getPrivateUser()
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}

extension LoginViewController: ViewModelDelegate {
    func willLoadData() {
    }

    func didLoadData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            if self.viewModel.hasUser {
                self.navigationController?.pushViewController(MatchViewController(), animated: true)
            } else {
                self.navigationController?.pushViewController(RegisterManagerViewController(), animated: true)
            }
        })
    }
}
