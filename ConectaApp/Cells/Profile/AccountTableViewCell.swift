//
//  AccountTableViewCell.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 26/10/21.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "accountTableViewCell"

    internal lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.borderColor = UIColor.borderGreen.cgColor
        view.layer.borderWidth = 2
        view.layer.shadowColor = UIColor.borderGreen.cgColor
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(with: 16)
        label.text = "Privacidade e Segurança"
        label.numberOfLines = 0
        label.textColor = .textLightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var accountButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "greaterthan")?.withTintColor(.actPink, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
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
        contentView.isUserInteractionEnabled = false
        self.selectionStyle = .none
        addSubview(borderView)
        borderView.addSubview(accountLabel)
        borderView.addSubview(accountButton)
        
        NSLayoutConstraint.activate([
            borderView.heightAnchor.constraint(equalTo: accountLabel.heightAnchor, constant: 24),
            borderView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            accountLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 16),
            accountLabel.centerYAnchor.constraint(equalTo: borderView.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            accountButton.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -16),
            accountButton.centerYAnchor.constraint(equalTo: borderView.centerYAnchor)
        ])
    }
}
