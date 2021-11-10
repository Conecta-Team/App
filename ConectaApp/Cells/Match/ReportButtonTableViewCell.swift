//
//  reportButtonTableViewCell.swift
//  ConectaApp
//
//  Created by Cecilia Soares on 09/11/21.
//

import UIKit

class ReportButtonTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "reportButtonTableViewCell"
    let reportButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitle("Denunciar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 24)
        button.setTitleColor(.actPink, for: .normal)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = .zero
        button.layer.shadowColor = UIColor.shadowPink.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        backgroundColor = .backgroundPurple
    }
    
    private func setup(){
        contentView.backgroundColor = .clear
        contentView.isUserInteractionEnabled = false
        
        addSubview(reportButton)
        NSLayoutConstraint.activate([
            reportButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reportButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
