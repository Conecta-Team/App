//
//  UserInfosTableViewCell.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 18/09/21.
//

import UIKit

class UserInfosTableViewCell: UITableViewCell {
    static let reuseIdentifier = "userInfosTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var discordView = UIView()
    
    var discordLabel = UILabel()
    
    let copyButtonDiscord: UIButton = {
        let button = UIButton()
        
        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(24))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: .regular)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: "doc.on.doc", withConfiguration: configurations)
        let icon = configurationNameIcon?.withTintColor(UIColor.actPink, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.tag = UserInfosButton.discord.rawValue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var steamView = UIView()
    
    var steamLabel = UILabel()
    
    let copyButtonSteam: UIButton = {
        let button = UIButton()
        
        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(24))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: .regular)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: "doc.on.doc", withConfiguration: configurations)
        let icon = configurationNameIcon?.withTintColor(UIColor.actPink, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.tag = UserInfosButton.steam.rawValue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var instagramView = UIView()
    
    var instagramLabel = UILabel()
    
    private func setupLabel() -> UILabel {
        let label = UILabel()
        label.font = .appRegularFont(with: 16)
        label.text = ""
        label.textColor = .textLightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    private func setupView() -> UIView {
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
    }

    let copyButtonInstagram: UIButton = {
        let button = UIButton()

        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(24))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: .regular)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: "doc.on.doc", withConfiguration: configurations)
        let icon = configurationNameIcon?.withTintColor(UIColor.actPink, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.tag = UserInfosButton.instagram.rawValue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func handleTouch(sender: UIButton!) {
        let button: UserInfosButton = UserInfosButton(rawValue: sender!.tag)!
        let fullText: String
        let offSet: Int

        switch button {
        case .discord:
            offSet = 9 // "Discord: "
            fullText = self.discordLabel.text!
        case .steam:
            offSet = 7 // "Steam: "
            fullText = self.steamLabel.text!
        case .instagram:
            offSet = 11 // "Instagram: "
            fullText = self.instagramLabel.text!
        }

        let index = fullText.index(fullText.startIndex, offsetBy: offSet)
        let textoToCopy = String(fullText[index...])
        UIPasteboard.general.string = textoToCopy
        self.animateButtonIcon(button: sender!)
    }

    private func animateButtonIcon(button: UIButton) {
        UIView.animate(withDuration: 6) {
            let icon = self.changeIcon(name: "checkmark", color: .actPink)
            button.setImage(icon, for: .normal)
            button.alpha = 0
        } completion: { _ in
            let icon = self.changeIcon(name: "doc.on.doc", color: .actPink)
            button.setImage(icon, for: .normal)
            button.alpha = 1
        }
    }

    private func changeIcon(name: String, color: UIColor) -> UIImage? {
        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(24))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: .regular)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: name, withConfiguration: configurations)
        let icon = configurationNameIcon?.withTintColor(color, renderingMode: .alwaysOriginal)

        return icon
    }

    private func setup() {
        contentView.backgroundColor = .clear
        contentView.isUserInteractionEnabled = false

        setupDiscord()
        setupSteam()
        setupInstagram()
    }
    private func setupDiscord() {
        copyButtonDiscord.addTarget(self, action: #selector(handleTouch), for: .touchUpInside)
        
        discordView = setupView()
        discordLabel = setupLabel()
        
        addSubview(discordView)
        addSubview(discordLabel)
        addSubview(copyButtonDiscord)
        NSLayoutConstraint.activate([
            discordView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            discordView.heightAnchor.constraint(equalTo: discordLabel.heightAnchor, constant: 24),
            discordView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            discordView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            discordLabel.centerYAnchor.constraint(equalTo: discordView.centerYAnchor),
            discordLabel.leftAnchor.constraint(equalTo: discordView.leftAnchor, constant: 16),
            copyButtonDiscord.centerYAnchor.constraint(equalTo: discordView.centerYAnchor),
            copyButtonDiscord.rightAnchor.constraint(equalTo: discordView.rightAnchor, constant: -8)
        
        ])
    }
    private func setupSteam() {
        copyButtonSteam.addTarget(self, action: #selector(handleTouch), for: .touchUpInside)
       
        steamView = setupView()
        steamLabel = setupLabel()
        addSubview(steamView)
        addSubview(steamLabel)
        addSubview(copyButtonSteam)
        NSLayoutConstraint.activate([
            steamView.topAnchor.constraint(equalTo: discordView.bottomAnchor, constant: 8),
            steamView.heightAnchor.constraint(equalTo: discordView.heightAnchor),
            steamView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            steamView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            steamLabel.centerYAnchor.constraint(equalTo: steamView.centerYAnchor),
            steamLabel.leftAnchor.constraint(equalTo: steamView.leftAnchor, constant: 16),
            copyButtonSteam.centerYAnchor.constraint(equalTo: steamView.centerYAnchor),
            copyButtonSteam.rightAnchor.constraint(equalTo: steamView.rightAnchor, constant: -8)

        ])

    }
    private func setupInstagram() {
        copyButtonInstagram.addTarget(self, action: #selector(handleTouch), for: .touchUpInside)
        
        instagramView = setupView()
        instagramLabel = setupLabel()
        
        addSubview(instagramView)
        addSubview(instagramLabel)
        addSubview(copyButtonInstagram)
        
        NSLayoutConstraint.activate([
            instagramView.topAnchor.constraint(equalTo: steamView.bottomAnchor, constant: 8),
            instagramView.heightAnchor.constraint(equalTo: steamView.heightAnchor),
            instagramView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            instagramView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            instagramLabel.centerYAnchor.constraint(equalTo: instagramView.centerYAnchor),
            instagramLabel.leftAnchor.constraint(equalTo: instagramView.leftAnchor, constant: 16),
            copyButtonInstagram.centerYAnchor.constraint(equalTo: instagramView.centerYAnchor),
            copyButtonInstagram.rightAnchor.constraint(equalTo: instagramView.rightAnchor, constant: -8),
            instagramView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
    }
    public func configure(discordName: String, steamName: String, instagramName: String) {
        backgroundColor = .clear
        discordLabel.text = "Discord: \(discordName)"
        steamLabel.text = "Steam: \(steamName)"
        instagramLabel.text = "Instagram: \(instagramName)"
    }
}
