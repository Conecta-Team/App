//
//  MainCoordinator.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 14/09/21.
//
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = [Coordinator]()

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController()
        vc.coordinator = self
        self.navigationController.pushViewController(vc, animated: true)
    }

    func login() {
      let vc = LoginViewController()
      vc.coordinator = self
      self.navigationController.pushViewController(vc, animated: true)
    }

}
