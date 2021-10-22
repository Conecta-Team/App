//
//  ViewController.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 13/09/21.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    let mainView: GamesColeectionView = GamesColeectionView(isEditable: false)
    let games: [String] = {
        var arrayNomes = [String]()
        for _ in 0...20 {
            arrayNomes.append(Games(rawValue: Int.random(in: 0..<4))!.name)
        }
        return arrayNomes
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.collection.delegate = self
        self.mainView.collection.dataSource = self
        self.view = mainView
    }
}

extension ViewController:  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        games.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameButtonCollectionViewCell.reusableIdentifier, for: indexPath) as? GameButtonCollectionViewCell
        if let cell = cell {
            //TODO: POR OS JOGOS CORRETOS
            
            cell.configureButton(gameName: games[indexPath.row], isSelected: Bool.random(), editable: self.mainView.isEditable)
            return cell
        }
        return UICollectionViewCell()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}
