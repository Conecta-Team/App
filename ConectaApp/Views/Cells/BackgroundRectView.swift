//
//  BackgroundRectView.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 19/10/21.
//

import UIKit

class BackgroundRectView: UIView {

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}
