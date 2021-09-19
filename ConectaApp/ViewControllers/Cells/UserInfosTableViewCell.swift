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

    let discordView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let discordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let copyButtonDiscord: UIButton = {
        let button = UIButton()

        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(24))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: .regular)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: "doc.on.doc", withConfiguration: configurations)
        let icon = configurationNameIcon?.withTintColor(UIColor.red, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.tag = UserInfosButton.discord.rawValue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let steamView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let steamLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let copyButtonSteam: UIButton = {
        let button = UIButton()

        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(24))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: .regular)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: "doc.on.doc", withConfiguration: configurations)
        let icon = configurationNameIcon?.withTintColor(UIColor.red, renderingMode: .alwaysOriginal)
        button.setImage(icon, for: .normal)
        button.tag = UserInfosButton.steam.rawValue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let instagramView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let instagramLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let copyButtonInstagram: UIButton = {
        let button = UIButton()

        let configurationSizeIcon = UIImage.SymbolConfiguration(pointSize: CGFloat(24))
        let configurationWeightIcon = UIImage.SymbolConfiguration(weight: .regular)
        let configurations = configurationSizeIcon.applying(configurationWeightIcon)
        let configurationNameIcon =  UIImage(systemName: "doc.on.doc", withConfiguration: configurations)
        let icon = configurationNameIcon?.withTintColor(UIColor.red, renderingMode: .alwaysOriginal)
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
            let icon = self.changeIcon(name: "checkmark", color: .green)
            button.setImage(icon, for: .normal)
            button.alpha = 0
        } completion: { _ in
            let icon = self.changeIcon(name: "doc.on.doc", color: .red)
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
        self.contentView.backgroundColor = .clear
        self.contentView.isUserInteractionEnabled = false

        self.copyButtonDiscord.addTarget(self, action: #selector(handleTouch), for: .touchUpInside)
        self.copyButtonSteam.addTarget(self, action: #selector(handleTouch), for: .touchUpInside)
        self.copyButtonInstagram.addTarget(self, action: #selector(handleTouch), for: .touchUpInside)

        self.addSubview(self.discordView)
        self.addSubview(self.discordLabel)
        self.addSubview(self.steamView)
        self.addSubview(self.steamLabel)
        self.addSubview(self.instagramView)
        self.addSubview(self.instagramLabel)
        self.addSubview(self.copyButtonDiscord)
        self.addSubview(self.copyButtonSteam)
        self.addSubview(self.copyButtonInstagram)

        NSLayoutConstraint.activate([
            self.discordView.topAnchor.constraint(equalTo: self.topAnchor),
            self.discordView.heightAnchor.constraint(equalTo: self.discordLabel.heightAnchor, constant: 24),
            self.discordView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.discordView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.discordLabel.centerYAnchor.constraint(equalTo: self.discordView.centerYAnchor),
            self.discordLabel.leftAnchor.constraint(equalTo: self.discordView.leftAnchor, constant: 16),
            self.copyButtonDiscord.centerYAnchor.constraint(equalTo: discordView.centerYAnchor),
            self.copyButtonDiscord.rightAnchor.constraint(equalTo: self.discordView.rightAnchor, constant: -8),

            self.steamView.topAnchor.constraint(equalTo: self.discordView.bottomAnchor, constant: 8),
            self.steamView.heightAnchor.constraint(equalTo: self.discordView.heightAnchor),
            self.steamView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.steamView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.steamLabel.centerYAnchor.constraint(equalTo: self.steamView.centerYAnchor),
            self.steamLabel.leftAnchor.constraint(equalTo: self.steamView.leftAnchor, constant: 16),
            self.copyButtonSteam.centerYAnchor.constraint(equalTo: steamView.centerYAnchor),
            self.copyButtonSteam.rightAnchor.constraint(equalTo: self.steamView.rightAnchor, constant: -8),

            self.instagramView.topAnchor.constraint(equalTo: self.steamView.bottomAnchor, constant: 8),
            self.instagramView.heightAnchor.constraint(equalTo: self.steamView.heightAnchor),
            self.instagramView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.instagramView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.instagramLabel.centerYAnchor.constraint(equalTo: self.instagramView.centerYAnchor),
            self.instagramLabel.leftAnchor.constraint(equalTo: self.instagramView.leftAnchor, constant: 16),
            self.copyButtonInstagram.centerYAnchor.constraint(equalTo: instagramView.centerYAnchor),
            self.copyButtonInstagram.rightAnchor.constraint(equalTo: self.instagramView.rightAnchor, constant: -8)
        ])
    }

    public func configure(discordName: String? = nil, steamName: String? = nil, instagramName: String? = nil, color: ColorManager) {
        self.backgroundColor = color.lightColor
        self.discordLabel.textColor = color.darkColor
        self.steamLabel.textColor = color.darkColor
        self.instagramLabel.textColor = color.darkColor

        self.discordLabel.text = "Discord: \(discordName ?? "-")"
        self.steamLabel.text = "Steam: \(steamName ?? "-")"
        self.instagramLabel.text = "Instagram: \(instagramName ?? "-")"

        self.discordView.layer.borderColor = color.darkColor.cgColor
        self.steamView.layer.borderColor = color.darkColor.cgColor
        self.instagramView.layer.borderColor = color.darkColor.cgColor
    }
}
