//
//  SectionHeaderView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 26/10/21.
//

import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "sectionHeaderView"
    
    internal lazy var title: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(with: 24)
        label.text = "Nickname"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var editButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "square.and.pencil")?.withTintColor(.actPink, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.isUserInteractionEnabled = false

        addSubview(title)
        addSubview(editButton)

        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            editButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
