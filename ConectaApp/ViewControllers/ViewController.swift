//
//  ViewController.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 13/09/21.
//

import UIKit

class ViewController: UIViewController {

  weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationItem.leftBarButtonItem?.isEnabled = false
    }
}
