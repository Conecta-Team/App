//
//  Coordinator.swift
//  ConectaApp
//
//  Created by Ana Karolina Costa da Silva on 14/09/21.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController {get set}

    func start()
}
