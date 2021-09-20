//
//  RegisterGameViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterGameViewController: UIViewController {
    
    var games = [GameDTO]()
    var categories = [CategoryDTO]()
    let registerGameView = RegisterGameView()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerGameView.gamesTableView.delegate = self
        registerGameView.gamesTableView.dataSource = self
        self.view = registerGameView
        self.view.backgroundColor = .backgroundGray
    }
}

extension RegisterGameViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterGameTableViewCell.reuseIdentifier, for: indexPath) as! RegisterGameTableViewCell
        cell.configure(gameName: "Valorant")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                RegisterTitleSectionCell.reuseIdentifier) as! RegisterTitleSectionCell
        view.configure(title: "FPS")
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
