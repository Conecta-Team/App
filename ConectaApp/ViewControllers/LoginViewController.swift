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
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc func login(_ sender: UIButton) {
        if FileManager.default.ubiquityIdentityToken != nil {
            self.viewModel.getCurrentUser()
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
        self.viewModel.getCurrentUser()
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
        DispatchQueue.main.async {
            if let user = self.viewModel.user {
                let nextController: UIViewController
                if user.blocked {
                    nextController = UIViewController()
                    let emptyView = EmptyStateView()
                    emptyView.setupMessage(text: "Seu usuário foi banido por excesso de reports. Se isso foi um erro, entre em contato conosco pelo nosso instagram @conectaapp.oficial")
                    nextController.view = emptyView
                    nextController.modalTransitionStyle = .crossDissolve
                    nextController.modalPresentationStyle = .fullScreen
                    self.present(nextController, animated: true)
                } else {
                    nextController = MatchViewController(user: user)
                    self.navigationController?.pushViewController(nextController, animated: true)
                }
            } else {
                self.navigationController?.pushViewController(RegisterManagerViewController(), animated: true)
            }
        }
    }
}
