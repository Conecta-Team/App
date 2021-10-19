//
//  BackgroundRectView.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 19/10/21.
//

import UIKit

class BackgroundRectView: UIView {

    let backgroundViewColor: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.borderPurple.cgColor
        view.layer.shadowColor = UIColor.shadowPurple.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 20
        view.layer.shadowOpacity = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .backgroundPurple
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.borderPurple.cgColor
        self.layer.shadowColor = UIColor.shadowPurple.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 20
        self.layer.shadowOpacity = 1
        self.translatesAutoresizingMaskIntoConstraints = false
    }
  
//    private func setup() {
//        addSubview(backgroundViewColor)
//
//        NSLayoutConstraint.activate([
//            backgroundViewColor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            backgroundViewColor.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            backgroundViewColor.heightAnchor.constraint(equalTo: self.heightAnchor),
//            backgroundViewColor.widthAnchor.constraint(equalTo: self.widthAnchor)
//        ])
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
