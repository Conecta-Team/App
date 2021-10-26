//
//  RegisterGameViewModel.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 20/09/21.
//

import Foundation
import CloudKit

class RegisterGameViewModel: ViewModelType {
    weak var delegate: ViewModelDelegate?

    let filterService: FilterCKService = FilterCKService()

    var games: [Category: [(Games, Bool)]] = [Category: [(Games, Bool)]]() {
        didSet {
            self.delegate?.didLoadData()
        }
    }

    func initialization() {
        self.games = filterService.getAllGames().reduce([Category: [(Games, Bool)]]()) { partialResult, newValue in
            var dict = partialResult
            dict[newValue.key] = newValue.value.map({ game in
                (game, false)
            })
            return dict
        }
    }
    
    func getSelectedGames() -> [Games] {
        let selectedGames = self.games.reduce([Games]()) { partialResult, newValue in
            var array = partialResult
            array += newValue.value.filter {$0.1}.map { value in
                value.0
            }
            return array
        }
        return selectedGames
    }
}

extension RegisterGameViewModel: SelectedGamesDelegate {
    func handleTap(isSelected: Bool, indexPath: IndexPath) {
        if let category = Category(rawValue: indexPath.section) {
            self.games[category]![indexPath.row].1.toggle()
        }
    }
}

protocol SelectedGamesDelegate: AnyObject {
    func handleTap(isSelected: Bool, indexPath: IndexPath)
}
