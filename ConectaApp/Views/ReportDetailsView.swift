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
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        backgroundColor = .red
    }
    func setupView() {
        addSubview(blur)
        addSubview(bgView)
        NSLayoutConstraint.activate([
            blur.heightAnchor.constraint(equalTo: heightAnchor),
            blur.widthAnchor.constraint(equalTo: widthAnchor),
            bgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bgView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            bgView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
