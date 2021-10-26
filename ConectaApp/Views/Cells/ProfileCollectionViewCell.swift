//
//  ProfileCollectionViewCell.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "profileCollectionViewCell"

    let shapeCell: UIImageView = {
        let image = UIImage(named: "ShapeSquare")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.shadowColor = UIColor.white.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let imageProfile: UILabel = {
        let label: UILabel = UILabel()
        label.font = .appRegularFont(with: 96)
        label.text = ""
        label.textColor = .textBlue
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 2
        label.layer.shadowOffset = .zero
        label.layer.shadowColor = UIColor(red: 0.90, green: 0.96, blue: 0.97, alpha: 1.00).cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    let blurView: UIView = {
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        return blurEffectView
//
//    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func setup() {
        self.backgroundColor = .clear
        
        addSubview(shapeCell)
        addSubview(imageProfile)

        NSLayoutConstraint.activate([
            shapeCell.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shapeCell.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            shapeCell.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -20),
            shapeCell.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20),
            
            imageProfile.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageProfile.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }

    public func configureCell(profileLetter: String) {
        self.imageProfile.text = profileLetter

    }
}
