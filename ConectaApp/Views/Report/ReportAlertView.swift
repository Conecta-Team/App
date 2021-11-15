//
//  ReportAlertView.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 15/11/21.
//

import UIKit

class ReportAlertView: UIView {

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
        label.text = "Seu reporte foi registrado! Iremos analisar e punir devidamente o prefil."
        label.font = .appRegularFont(with: 20)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .max
        label.textColor = .textLightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()

    let confirmationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 18)
        button.setBackgroundImage(UIImage(named: "primaryButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    func setupView() {
//        addSubview(blur)
        addSubview(bgView)
        addSubview(titleLabel)
        addSubview(confirmationButton)

        NSLayoutConstraint.activate([
//            blur.heightAnchor.constraint(equalTo: heightAnchor),
//            blur.widthAnchor.constraint(equalTo: widthAnchor),
            bgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 0.2),
            bgView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            
            titleLabel.centerXAnchor.constraint(equalTo: bgView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),

            confirmationButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            confirmationButton.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -24),
//            confirmationButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 24),
            confirmationButton.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 30),
            confirmationButton.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -30),

            confirmationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
