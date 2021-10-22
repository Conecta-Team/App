//
//  TitleSectionUser.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 18/09/21.
//

import UIKit

class TitleSectionUser: UITableViewHeaderFooterView {

    static let reuseIdentifier = "titleSectionUser"

    let title: UILabel = {
        let label = UILabel()
//        label.font = .appRegularFont(with: 24)
        label.attributedText = NSMutableAttributedString(string: "Nickname", attributes: [
                    NSAttributedString.Key.strokeWidth: -2,
                    NSAttributedString.Key.font: UIFont.appRegularFont(with: 24)])
        label.textColor = UIColor.textLightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
