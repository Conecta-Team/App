//
//  RegisterGameViewModel.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 20/09/21.
//

import Foundation
import CloudKit

class RegisterGameViewModel: ViewModelType {
    var delegate: ViewModelDelegate?
    
    private let cloudKitService = CloudKitServiceAll.currentModel
    public var categories = [CategoryDTO]() {
        didSet {
            getGames()
        }
    }
    public var games = [GameDTO2]() {
        didSet {
            if games.count == categories.count {
                self.delegate?.didLoadData()
            }
        }
    }
    
    func initialization() {
        getCategories()
    }
    
    func getCategories() {
        cloudKitService.getCategories { records in
            self.categories = records.map({ category in
                CategoryDTO(record: category)
            })
        }
    }
    
    func getGames() {
        for category in categories {
            cloudKitService.getGamesByCategory(category: category.categoryId) { game in
                let categoryRef = category
                let gameDTO = GameDTO2(record: game, category: categoryRef)
                self.games.append(gameDTO)
            }
        }
    }

}
