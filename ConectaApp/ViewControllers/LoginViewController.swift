//
//  LoginViewController.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 14/09/21.
//

import UIKit
import AuthenticationServices
import Security

class LoginViewController: UIViewController, LoginProtocols {

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

        self.view.backgroundColor = .backgroundGray
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func loadView() {
        mainView.loginHandler = self
    }

    func observerLoginAuth(_ sender: UIButton) {
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
//        navigationController?.pushViewController(ViewController(), animated: true)
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
            if self.viewModel.hasUser {
                self.navigationController?.pushViewController(MatchViewController(), animated: true)
            } else {
                self.navigationController?.pushViewController(RegisterManagerViewController(), animated: true)
            }
        }
    }
}
