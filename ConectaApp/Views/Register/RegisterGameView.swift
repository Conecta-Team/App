//
//  RegisterGameView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterGameView: UIView {
    
    internal lazy var gameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 32)
        label.textColor = .textGreen2
        label.text = "Jogos de Interesse"
        return label
    }()
    
    internal lazy var gameSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 16)
        label.textColor = .textLightGray
        label.text = "É através dele que você encontrará seu duo!"
        label.numberOfLines = 0
        return label
    }()
    
    internal lazy var gamesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .backgroundGray
        tableView.register(RegisterGameTableViewCell.self, forCellReuseIdentifier: RegisterGameTableViewCell.reuseIdentifier)
        tableView.register(RegisterTitleSectionCell.self,
                           forHeaderFooterViewReuseIdentifier: RegisterTitleSectionCell.reuseIdentifier)
        return tableView
    }()
    
    internal lazy var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 12)
        label.textColor = .red
        label.text = "Você precisa escoolher pelo menos um jogo!"
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        addSubview(gameTitle)
        addSubview(gameSubtitle)
        addSubview(gamesTableView)
        addSubview(errorMessageLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gameTitle.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            gameTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            gameTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            gameSubtitle.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 16),
            gameSubtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            gameSubtitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: gameSubtitle.bottomAnchor, constant: 8),
            errorMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            errorMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            gamesTableView.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 16),
            gamesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            gamesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            gamesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
}
