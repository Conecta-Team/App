//
//  GameButtonCollectionViewCell.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 20/10/21.
//

import UIKit

class GameButtonCollectionViewCell: UICollectionViewCell {
    static let reusableIdentifier = "gameButtonCollectionViewCell"
    
    var selectGame: ((Bool) -> Void)?
    
    let button: UIButton = {
        let button = UIButton()

        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 14, bottom: 2, right: 14)
        button.setTitleColor(.textLightBlue, for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 16)
    
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var isSelectedGame: Bool = false {
        didSet {
            self.handleVisualButton()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleTap() {
        self.isSelectedGame.toggle()
        self.selectGame?(self.isSelectedGame)
    }
    
    private func handleVisualButton() {
        let image = UIImage(named: self.isSelectedGame ? "selectedShapeButton": "unselectedShapeButton")
        self.button.setBackgroundImage(image, for: .normal)
        
        button.layer.shadowColor = self.isSelectedGame ? UIColor.textBlue.cgColor : UIColor.clear.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
    }

    private func setup() {
        self.addSubview(button)
    
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.topAnchor),
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9)
        ])
    }
    
    public func configureButton(game: Games, isSelected: Bool, editable: Bool) {
        self.button.setTitle(game.name, for: .normal)
        self.isSelectedGame = isSelected
        self.isUserInteractionEnabled = editable
    }
}
