//
//  RegisterGameTableViewCell.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterGameTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "registerGameTableViewCell"
    var gameSelected = false
    var indexPath: IndexPath = IndexPath()

    var games: [(Games, Bool)] = [] {
        didSet {
            DispatchQueue.main.async {
                self.gamesCollectionView.collection.reloadData()
            }
        }
    }

    weak var delegate: SelectedGamesDelegate?

    let gamesCollectionView: GamesCollectionView = {
        let collection = GamesCollectionView(isEditable: true)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.gamesCollectionView.collection.delegate = self
        self.gamesCollectionView.collection.dataSource = self
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(indexPath: IndexPath, games: [(Games, Bool)]) {
        self.contentView.isUserInteractionEnabled = false
        self.games = games
        self.indexPath = indexPath
    }
    
    private func setupCell() {
        self.addSubview(gamesCollectionView)

        NSLayoutConstraint.activate([
            gamesCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            gamesCollectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            gamesCollectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            gamesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension RegisterGameTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.games.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameButtonCollectionViewCell.reusableIdentifier, for: indexPath) as? GameButtonCollectionViewCell
        if let cell = cell {
            cell.configureButton(game: self.games[indexPath.row].0, isSelected: self.games[indexPath.row].1, editable: self.gamesCollectionView.isEditable)
            cell.selectGame = { status in
                self.delegate?.handleTap(isSelected: status, indexPath: self.indexPath)
            }
            return cell
        }
        return UICollectionViewCell()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}
