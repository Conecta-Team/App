//
//  EmptyStateView.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 28/10/21.
//

import UIKit

class EmptyStateView: UIView {

    internal lazy var borderView: UIView = {
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
    
    internal lazy var message: UILabel = {
        let label = UILabel()
        label.attributedText = NSMutableAttributedString(string: "Algo estranho aconteceu =/", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 16)])
        label.textColor = .textBlue
        label.layer.shadowColor = UIColor.textBlue.cgColor
        label.layer.shadowRadius = 8
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupConstraints()    }
    
    private func setupConstraints() {
        self.addSubview(borderView)
        self.addSubview(message)

        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            borderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            self.message.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.message.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.message.widthAnchor.constraint(lessThanOrEqualTo: self.borderView.widthAnchor, multiplier: 0.8),
            self.message.heightAnchor.constraint(lessThanOrEqualTo: self.borderView.heightAnchor, multiplier: 0.8)
        ])
    }
    
    public func setupMessage(text: String) {
        self.message.text = text
    }
}
