//
//  RegisterTitleSectionCell.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//

import Foundation
import UIKit

class RegisterTitleSectionCell: UITableViewHeaderFooterView {
    
    static let reuseIdentifier = "registerTitleSectionCell"
    
    let title: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(with: 24)
        label.textColor = .textGreen2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        self.addSubview(self.title)
        self.contentView.backgroundColor = .backgroundGray

        NSLayoutConstraint.activate([
            self.title.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            self.title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    public func configure(title: String) {
        self.title.text = title
    }
}
