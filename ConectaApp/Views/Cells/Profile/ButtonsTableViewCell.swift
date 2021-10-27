//
//  ButtonsTableViewCell.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 26/10/21.
//

import UIKit

class ButtonsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "buttonsTableViewCell"

    internal lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "logoutButton"), for: .normal)
        button.setTitle("Sair", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    internal lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Deletar conta", for: .normal)
        button.setTitleColor(.actPink, for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 20)
        button.layer.shadowColor = UIColor.actPink.cgColor
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .clear
        self.contentView.isUserInteractionEnabled = false
        
        addSubview(deleteButton)
        addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            deleteButton.widthAnchor.constraint(equalTo: deleteButton.widthAnchor),
            deleteButton.heightAnchor.constraint(equalTo: deleteButton.heightAnchor),
            deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.widthAnchor.constraint(equalTo: logoutButton.widthAnchor),
            logoutButton.heightAnchor.constraint(equalTo: logoutButton.heightAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
