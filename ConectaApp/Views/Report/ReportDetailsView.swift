//
//  ReportDetailsView.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 10/11/21.
//

import UIKit

class ReportDetailsView: UIView {

    lazy var blur: UIView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    }()
    let bgView: UIView = {
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
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Você pode nos dar mais detalhes sobre o ocorrido?"
        label.font = .appRegularFont(with: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .max
        label.textColor = .textLightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    let detailsTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderColor = UIColor.borderGreen.cgColor
        textField.layer.borderWidth = 1
        textField.layer.shadowColor = UIColor.textBlue.cgColor
        textField.layer.shadowRadius = 8
        textField.layer.shadowOpacity = 1
        textField.layer.shadowOffset = .zero
        textField.font = .appRegularFont(with: 18)
        textField.textColor = .textLightBlue
//        textField.textContainer.line
        textField.textContainer.lineBreakMode = .byWordWrapping
        textField.textContainer.maximumNumberOfLines = 0
        textField.text = "Caso não queira, você pode deixar esse espaço em branco."
        textField.textColor = UIColor.lightGray
        
        textField.textAlignment = .justified
        return textField
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancelar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 18)
        button.setBackgroundImage(UIImage(named: "primaryButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reportar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 18)
        button.setBackgroundImage(UIImage(named: "primaryButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func setupConstraints() {
//        addSubview(blur)
        addSubview(bgView)
        addSubview(titleLabel)
        addSubview(detailsTextField)
        addSubview(backButton)
        addSubview(reportButton)

        NSLayoutConstraint.activate([
//            blur.heightAnchor.constraint(equalTo: heightAnchor),
//            blur.widthAnchor.constraint(equalTo: widthAnchor),
            bgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            bgView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            
            titleLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -24),

            detailsTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            detailsTextField.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            detailsTextField.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            detailsTextField.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: -16),
            
            backButton.bottomAnchor.constraint(equalTo: self.bgView.bottomAnchor, constant: -24),
            backButton.leadingAnchor.constraint(equalTo: self.bgView.leadingAnchor, constant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 50),
            backButton.widthAnchor.constraint(equalToConstant: 120),

            reportButton.centerYAnchor.constraint(equalTo: self.backButton.centerYAnchor),
//            reportButton.leadingAnchor.constraint(equalTo: self.backButton.trailingAnchor, constant: 42),

            reportButton.trailingAnchor.constraint(equalTo: self.bgView.trailingAnchor, constant: -24),
            reportButton.heightAnchor.constraint(equalToConstant: 50),
            reportButton.widthAnchor.constraint(equalToConstant: 120)

        ])
    }
}
