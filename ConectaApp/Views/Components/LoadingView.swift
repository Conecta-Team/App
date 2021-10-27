//
//  LoadingView.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 25/10/21.
//

import UIKit

class LoadingView: UIView {
    
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
    
        indicator.color = .textBlue
        indicator.layer.shadowColor = UIColor.textBlue.cgColor
        indicator.layer.shadowRadius = 8
        indicator.layer.shadowOpacity = 1
        indicator.layer.shadowOffset = .zero
        
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.setup()
    }
    
    private func setup() {
        self.backgroundColor = .backgroundBlack
        self.addSubview(self.indicator)
        
        NSLayoutConstraint.activate([
            self.indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
