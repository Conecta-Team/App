//
//  NickNameTableViewCell.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 18/09/21.
//

import UIKit

class NickNameTableViewCell: UITableViewCell {
    static let reuseIdentifier = "nickNameTableViewCell"

    let nickName: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(with: 32)
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
        self.addSubview(self.nickName)
        NSLayoutConstraint.activate([
            self.nickName.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.nickName.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    public func configure(nickName: String, color: ColorManager) {
        self.backgroundColor = color.lightColor
        self.nickName.textColor = color.fontColor
        self.nickName.text = nickName.uppercased()
    }
}
