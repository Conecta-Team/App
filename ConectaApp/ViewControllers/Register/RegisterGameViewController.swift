//
//  RegisterGameViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterGameViewController: UIViewController {
    
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
    
    public func getSelectedGames() -> [Games]? {
        if self.viewModel.selectedGames.count != 0 {
            return self.viewModel.selectedGames
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
        let category = Category(rawValue: section)

        if let category = category, let rowsInSection = self.viewModel.games[category]?.count {
            return rowsInSection
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RegisterGameTableViewCell.reuseIdentifier, for: indexPath) as! RegisterGameTableViewCell

        if let category = Category(rawValue: indexPath.section), let game = viewModel.games[category]?[indexPath.row] {
            cell.configure(game: game)
            cell.delegate = self.viewModel
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                RegisterTitleSectionCell.reuseIdentifier) as! RegisterTitleSectionCell
        if let category = Category(rawValue: section) {
            view.configure(title: category.name)
        }
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

