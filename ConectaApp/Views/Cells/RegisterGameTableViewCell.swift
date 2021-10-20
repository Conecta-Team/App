//
//  RegisterGameTableViewCell.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterGameTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "registerGameTableViewCell"
    let buttonUnselectedImage = UIImage(named: "shapeButtonUnselected")
    let buttonSelectedImage = UIImage(named: "shapeButtonSelected")
    var gameSelected = false
    var game: Games = .freeFire
    
    weak var delegate: SelectedGamesDelegate?

    internal lazy var gameButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(buttonUnselectedImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.textBlue, for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func handleTap(_ sender: UIButton) {
        gameSelected.toggle()
        let image = self.gameSelected ? buttonSelectedImage : buttonUnselectedImage
        let color: UIColor = self.gameSelected ? .white : .textBlue
        self.gameButton.setBackgroundImage(image, for: .normal)
        self.gameButton.setTitleColor(color, for: .normal)
    
        self.delegate?.handleTap(isSelected: self.gameSelected, game: self.game)
    }
    
    private func setupCell() {
        self.addSubview(self.gameButton)
        self.backgroundColor = .gray
        self.contentView.isUserInteractionEnabled = false
        NSLayoutConstraint.activate([
            gameButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            gameButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
    
    public func configure(game: Games) {
        self.gameButton.setTitle(game.name, for: .normal)
        self.game = game
    }

}
