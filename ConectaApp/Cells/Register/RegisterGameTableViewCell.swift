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
    var collectionHeight: NSLayoutConstraint!

    var games: [(Games, Bool)] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
        }
    }

    weak var delegate: SelectedGamesDelegate?

    let collection: CustomCollection = {
        let layout = TokenCollViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 14
        let collection = CustomCollection(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .backgroundPurple
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(GameButtonCollectionViewCell.self, forCellWithReuseIdentifier: GameButtonCollectionViewCell.reusableIdentifier)
        collection.isScrollEnabled = false
        collection.translatesAutoresizingMaskIntoConstraints = false

        return collection
      }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.collection.delegate = self
        self.collection.dataSource = self
        collectionHeight = collection.heightAnchor.constraint(equalToConstant: 50)

        self.collection.intrinsicContentSizeDidChange = { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.collectionHeight.constant = strongSelf.collection.collectionViewLayout.collectionViewContentSize.height * 1.05
        }
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func configureCell(indexPath: IndexPath, games: [(Games, Bool)]) {
        self.contentView.isUserInteractionEnabled = false
        self.games = games
        self.indexPath = indexPath
    }
    
    private func setupCell() {
        self.contentView.addSubview(collection)

        collectionHeight.priority = .defaultHigh

        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            collection.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            collection.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            collection.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            collectionHeight
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
            cell.configureButton(game: self.games[indexPath.row].0, isSelected: self.games[indexPath.row].1, editable: true)
            cell.selectGame = { status in
                self.delegate?.handleTap(isSelected: status, indexPath: self.indexPath)
            }
            if indexPath.row == self.games.count - 1 {
                self.superview?.layoutSubviews()
            }
            return cell
        }
        return UICollectionViewCell()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}
