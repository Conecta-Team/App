//
//  RegisterGameView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import UIKit

class RegisterGameView: UIView {
    
    internal lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.borderColor = UIColor.borderPurple.cgColor
        view.layer.borderWidth = 2
        view.layer.shadowColor = UIColor.borderPurple.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var gameTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 32)
        label.textColor = .textBlue
        label.text = "Jogos de Interesse"
        return label
    }()
    
    internal lazy var gameSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appRegularFont(with: 16)
        label.textColor = .textLightBlue
        label.text = "É através dele que você encontrará seu duo!"
        label.numberOfLines = 0
        return label
    }()
    
    internal lazy var gamesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .backgroundPurple
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
        addSubview(borderView)
        addSubview(gameTitle)
        addSubview(gameSubtitle)
        addSubview(gamesTableView)
        addSubview(errorMessageLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            gameTitle.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 56),
            gameTitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            gameTitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            gameSubtitle.topAnchor.constraint(equalTo: gameTitle.bottomAnchor, constant: 16),
            gameSubtitle.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            gameSubtitle.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: gameSubtitle.bottomAnchor, constant: 8),
            errorMessageLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            errorMessageLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            gamesTableView.topAnchor.constraint(equalTo: errorMessageLabel.bottomAnchor, constant: 8),
            gamesTableView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            gamesTableView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8),
            gamesTableView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -100)
        ])
    }
}
