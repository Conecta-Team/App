//
//  UserGamesTableViewCell.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 18/09/21.
//

import UIKit

class UserGamesTableViewCell: UITableViewCell {
    static let reuseIdentifier = "userGamesTableViewCell"
    
    var games: [Games] = [Games]()

    let shape: UIImageView = {
        let image = UIImage(named: "shapeGameInterest")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let gameName: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(with: 24)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.addSubview(self.shape)
        self.addSubview(self.gameName)

        NSLayoutConstraint.activate([
            self.gameName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.gameName.centerXAnchor.constraint(equalTo: self.shape.centerXAnchor),
            self.shape.centerYAnchor.constraint(equalTo: self.gameName.centerYAnchor),
            self.shape.widthAnchor.constraint(equalTo: self.gameName.widthAnchor, constant: 12),
            self.shape.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
        ])
    }

    public func configure(games: [Games]) {
        self.games = games

        // TODO: ainda precisa ser uma collection aqui
        if let game = self.games.first {
            self.gameName.text = game.name
        }
    }
}
