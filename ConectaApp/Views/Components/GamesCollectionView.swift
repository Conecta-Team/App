//
//  GamesView.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 22/10/21.
//

import UIKit

class GamesCollectionView: UIView {
    var isEditable: Bool = true

    let collection: UICollectionView = {
        let layout = TokenCollViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 14
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .backgroundPurple
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(GameButtonCollectionViewCell.self, forCellWithReuseIdentifier: GameButtonCollectionViewCell.reusableIdentifier)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    convenience init(isEditable: Bool) {
        self.init()
        self.isEditable = isEditable
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionLayout()
    }

    private func collectionLayout() {
        self.addSubview(self.collection)

        NSLayoutConstraint.activate([
            self.collection.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.collection.rightAnchor.constraint(equalTo: self.rightAnchor),
            // self.collection.heightAnchor.constraint(greaterThanOrEqualToConstant: 200),
            self.collection.topAnchor.constraint(equalTo: self.topAnchor),
            self.collection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
