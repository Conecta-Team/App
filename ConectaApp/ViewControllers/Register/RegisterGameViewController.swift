//
//  RegisterGameViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterGameViewController: UIViewController {
    
    let registerGameView: RegisterGameView
    // var gameSelected = String()
    let viewModel = RegisterGameViewModel()
    weak var delegate: GetGamesToSaveDelegate?
    var isEditScreen: Bool
    
    init(isEditScreen: Bool = false) {
        self.isEditScreen = isEditScreen
        self.viewModel.isEditScreen = isEditScreen
        self.registerGameView = RegisterGameView(isEditScreen: isEditScreen)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        if isEditScreen, let oldGames = delegate?.getOldGames() {
            self.isModalInPresentation = true
            self.modalTransitionStyle = .crossDissolve
            viewModel.oldGames = oldGames
        }
        
        viewModel.initialization()
        viewModel.delegate = self

        registerGameView.gamesTableView.delegate = self
        registerGameView.gamesTableView.dataSource = self
        
        self.registerGameView.cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        self.registerGameView.saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)

        self.view = registerGameView
    }
    
    public func getSelectedGames() -> [Games]? {
        let games = self.viewModel.getSelectedGames()
        if games.count != 0 {
            return games
        }
        return nil
    }
    
    public func setErrorMessage(ishidden: Bool) {
        registerGameView.errorMessageLabel.isHidden = ishidden
    }
    
    @objc func cancelAction() {
        self.dismiss(animated: true)
    }
    
    @objc func saveAction() {
        let games = getSelectedGames()
        if let games = games {
            registerGameView.saveButton.isUserInteractionEnabled = false
            delegate?.editGames(games: games, completion: {
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            })
        } else {
            registerGameView.errorMessageLabel.isHidden = false
        }
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

        if let category = Category(rawValue: indexPath.section), let games = viewModel.games[category] {
            cell.delegate = self.viewModel
            cell.configureCell(indexPath: indexPath, games: games)
        }
        cell.backgroundColor = .clear
        cell.layoutIfNeeded()
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
