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

    var games: [Category: [Games]] = [Category: [Games]]() {
        didSet {
            self.delegate?.didLoadData()
        }
    }
    
    var selectedGames: [Games] = []

    func initialization() {
        self.games = filterService.getAllGames()
    }
}

extension RegisterGameViewModel: SelectedGamesDelegate {
    func handleTap(isSelected: Bool, game: Games) {
        if isSelected {
            self.selectedGames.append(game)
        } else {
            for index in 0..<self.selectedGames.count {
                if self.selectedGames[index] == game {
                    self.selectedGames.remove(at: index)
                    break
                }
            }
        }
    }
}

protocol SelectedGamesDelegate: AnyObject {
    func handleTap(isSelected: Bool, game: Games)
}
