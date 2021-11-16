//
//  ReportReasonView.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 08/11/21.
//

import UIKit

class ReportReasonView: UIView {
    
    let blurView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.borderColor = UIColor.borderPurple.cgColor
        view.layer.borderWidth = 2
        view.layer.shadowColor = UIColor.borderPurple.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = .appRegularFont(with: 18)
        label.numberOfLines = 0
        label.text = "Por qual motivo você quer reportar esse perfil?"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var fakeProfileButton: UIButton = UIButton()
    var fakeButtonSelected: Bool = false

    var toxicProfileButton: UIButton = UIButton()
    var toxicButtonSelected: Bool = false

    var blockProfileButton: UIButton = UIButton()
    var blockButtonSelected: Bool = false

    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancelar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 14)
        button.setBackgroundImage(UIImage(named: "primaryButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continuar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 14)
        button.setBackgroundImage(UIImage(named: "cancelButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()

    private func setupButton(with text: String, tag: Reports) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.contentHorizontalAlignment = .leading
        button.titleLabel?.font = .appRegularFont(with: 16)
        button.setBackgroundImage(UIImage(named: "borderButton"), for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 8, bottom: 2, right: 8)
        button.tag = tag.rawValue
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .clear
        self.setupView()
    }
    
    private func handleStatusContinueButton() {
        let nameAssetButton: String
        if self.fakeButtonSelected || self.toxicButtonSelected || self.blockButtonSelected {
            self.continueButton.isUserInteractionEnabled = true
            nameAssetButton = "primaryButton"
        } else {
            self.continueButton.isUserInteractionEnabled = false
            nameAssetButton = "cancelButton"
        }
        self.continueButton.setBackgroundImage(UIImage(named: nameAssetButton), for: .normal)
    }

    @objc private func handleTap(button: UIButton) {
        if let typeButton = Reports(rawValue: button.tag) {
            let boolValue: Bool
            switch typeButton {
            case .fakeProfile:
                self.fakeButtonSelected.toggle()
                boolValue = self.fakeButtonSelected
            case .toxicPerson:
                self.toxicButtonSelected.toggle()
                boolValue = self.toxicButtonSelected
            case .blockProfile:
                self.blockButtonSelected.toggle()
                boolValue = self.blockButtonSelected
            }
            button.backgroundColor = boolValue ? .actPink : .clear
            self.handleStatusContinueButton()
        }
    }
    
    public func getReports() -> [Reports] {
        var reports: [Reports] = [Reports]()

        if self.fakeButtonSelected {
            reports.append(.fakeProfile)
        }
        if self.toxicButtonSelected {
            reports.append(.toxicPerson)
        }
        if self.blockButtonSelected {
            reports.append(.blockProfile)
        }

        return reports
    }

    private func setupView() {
        self.fakeProfileButton = self.setupButton(with: "Esse é um perfil falso", tag: .fakeProfile)
        self.toxicProfileButton = self.setupButton(with: "Essa pessoa é tóxica", tag: .toxicPerson)
        self.blockProfileButton = self.setupButton(with: "Não quero ver esse perfil", tag: .blockProfile)

        self.addSubview(self.blurView)
        self.addSubview(self.borderView)
        self.addSubview(self.title)
        self.addSubview(self.fakeProfileButton)
        self.addSubview(self.toxicProfileButton)
        self.addSubview(self.blockProfileButton)
        self.addSubview(self.cancelButton)
        self.addSubview(self.continueButton)
        self.setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.blurView.topAnchor.constraint(equalTo: self.topAnchor),
            self.blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.blurView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.blurView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])

        NSLayoutConstraint.activate([
            self.borderView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.borderView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.borderView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            self.borderView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
        ])

        NSLayoutConstraint.activate([
            self.title.centerXAnchor.constraint(equalTo: self.borderView.centerXAnchor),
            self.title.topAnchor.constraint(equalTo: self.borderView.topAnchor, constant: 24),
            self.title.leadingAnchor.constraint(equalTo: self.borderView.leadingAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: self.borderView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            self.fakeProfileButton.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 24),
            self.fakeProfileButton.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            self.fakeProfileButton.widthAnchor.constraint(equalTo: self.title.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.toxicProfileButton.topAnchor.constraint(equalTo: self.fakeProfileButton.bottomAnchor, constant: 8),
            self.toxicProfileButton.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            self.toxicProfileButton.widthAnchor.constraint(equalTo: self.title.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.blockProfileButton.topAnchor.constraint(equalTo: self.toxicProfileButton.bottomAnchor, constant: 8),
            self.blockProfileButton.leadingAnchor.constraint(equalTo: self.title.leadingAnchor),
            self.blockProfileButton.widthAnchor.constraint(equalTo: self.title.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.cancelButton.bottomAnchor.constraint(equalTo: self.borderView.bottomAnchor, constant: -24),
            self.cancelButton.leadingAnchor.constraint(equalTo: self.borderView.leadingAnchor, constant: 24),
            self.cancelButton.widthAnchor.constraint(equalTo: self.cancelButton.widthAnchor),
        
            self.continueButton.centerYAnchor.constraint(equalTo: self.cancelButton.centerYAnchor),
            self.continueButton.trailingAnchor.constraint(equalTo: self.borderView.trailingAnchor, constant: -24),
            self.continueButton.widthAnchor.constraint(equalTo: self.continueButton.widthAnchor)
        ])
    }
}
