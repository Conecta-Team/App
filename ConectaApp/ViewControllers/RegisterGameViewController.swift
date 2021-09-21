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
    let registerGameView = RegisterGameView()
    var gameSelected = String()
    let viewModel = RegisterGameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.initialization()
        viewModel.delegate = self
        registerGameView.gamesTableView.delegate = self
        registerGameView.gamesTableView.dataSource = self
        self.view = registerGameView
        self.view.backgroundColor = .backgroundGray
    }
    
    public func getGame() -> GameDTO? {
        if viewModel.games.count > 0 {
            for index in 0..<viewModel.games.count {
                let cell = self.registerGameView.gamesTableView.cellForRow(at: IndexPath(row: 0, section: index)) as! RegisterGameTableViewCell
                if cell.gameSelected {
                    return cell.game
                }
            }
        }
        return nil
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerGameView.errorMessageLabel.isHidden = ishidden
    }
}

extension RegisterGameViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.games.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categories.count == 0 ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterGameTableViewCell.reuseIdentifier, for: indexPath) as! RegisterGameTableViewCell
        cell.configure(game: viewModel.games[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                RegisterTitleSectionCell.reuseIdentifier) as! RegisterTitleSectionCell
        view.configure(title: viewModel.games[section].category!.name)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

extension RegisterGameViewController: ViewModelDelegate {
    func willLoadData() {
    }
    
    func didLoadData() {
        DispatchQueue.main.async {
            self.registerGameView.gamesTableView.reloadData()
        }
    }
}
