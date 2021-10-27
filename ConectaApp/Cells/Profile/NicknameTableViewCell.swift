//
//  NicknameTableViewCell.swift.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 21/10/21.
//

import UIKit

class NicknameTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "nicknameTableViewCell"
    
    internal lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    internal lazy var imageProfile: UIImageView = {
        let image = UIImage(named: "shapeCell")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    internal lazy var letterProfileLabel: UILabel = {
        let label: UILabel = UILabel()
        label.font = .appRegularFont(with: 96)
        label.text = "H"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(with: 18)
        label.text = "Nickname"
        label.numberOfLines = 0
        label.textColor = .textLightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = NSMutableAttributedString(string: "Helaine", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 40)])
        label.textColor = .textBlue
        label.layer.shadowColor = UIColor.textBlue.cgColor
        label.layer.shadowRadius = 8
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = .clear
        addSubview(bgView)
        addSubview(imageProfile)
        imageProfile.addSubview(letterProfileLabel)
        addSubview(nicknameLabel)
        addSubview(nameLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            imageProfile.widthAnchor.constraint(equalTo: imageProfile.widthAnchor),
            imageProfile.heightAnchor.constraint(equalTo: imageProfile.widthAnchor),
            imageProfile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            imageProfile.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            imageProfile.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            letterProfileLabel.centerYAnchor.constraint(equalTo: imageProfile.centerYAnchor),
            letterProfileLabel.centerXAnchor.constraint(equalTo: imageProfile.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nicknameLabel.topAnchor.constraint(equalTo: imageProfile.topAnchor),
            nicknameLabel.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            nicknameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
