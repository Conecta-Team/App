//
//  ProfileCollectionViewCell.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "profileCollectionViewCell"

    var cellColor: ColorManager = .defaultColor

    let shapeCell: UIImageView = {
        let image = UIImage(named: "shapeCell")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageProfile: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 96)
        label.text = "J"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.backgroundColor = .clear

        self.addSubview(shapeCell)
        self.addSubview(imageProfile)

        NSLayoutConstraint.activate([
            shapeCell.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shapeCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            shapeCell.heightAnchor.constraint(equalTo: self.heightAnchor),
            shapeCell.widthAnchor.constraint(equalTo: self.widthAnchor),
            imageProfile.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageProfile.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    public func configureCell(cellColor: ColorManager) {
        self.shapeCell.tintColor = cellColor.darkColor
        self.cellColor = cellColor

        self.shapeCell.layer.shadowColor = cellColor.lightColor.cgColor
        self.shapeCell.layer.shadowOpacity = 1
        self.shapeCell.layer.shadowOffset = .zero
        self.shapeCell.layer.shadowRadius = 2
    }
}
