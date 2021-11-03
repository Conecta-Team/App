//
//  MatchView.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit

class MatchView: UIView {
    let bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let collection: UICollectionView = {
        let layout = ZoomAndSnapFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.decelerationRate = .fast
        collection.register(ProfileCollectionViewCell.self,
                            forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let reportButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.setTitle("Denunciar", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 18)
        button.setTitleColor(.actPink, for: .normal)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = .zero
        button.layer.shadowColor = UIColor.shadowPink.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundLayout()
        self.collectionLayout()

        self.tableViewLayout()
//        self.reportButtonLayout()
    }
    
     func addMultipleLayers() {
         let sizeCollection = collection.contentSize.width
         var collectionHeight = collection.contentSize.height
         var heightTop = 0
         if collectionHeight >= 260 {
             collectionHeight = collection.contentSize.height - 30
             heightTop = 10
         }
         let viewSize = self.bounds.size.width
        print(viewSize, sizeCollection)
        let path1 = UIBezierPath()
        
         path1.move(to: CGPoint(x: 0, y: collectionHeight))
         path1.addLine(to: CGPoint(x: viewSize/2 - sizeCollection/2 + 10, y: collectionHeight))
         path1.addLine(to: CGPoint(x: Int(viewSize/2 - sizeCollection/2) + 10, y: heightTop))
         path1.addLine(to: CGPoint(x: Int(viewSize/2 + sizeCollection/2) - 8, y: heightTop))
         path1.addLine(to: CGPoint(x: viewSize/2 + sizeCollection/2 - 8, y: collectionHeight))
         path1.addLine(to: CGPoint(x: viewSize + 3, y: collectionHeight))

         path1.addLine(to: CGPoint(x: viewSize + 3, y: self.bounds.size.height))
         path1.addLine(to: CGPoint(x: 0, y: self.bounds.size.height))
         path1.addLine(to: CGPoint(x: 0, y: collectionHeight))
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.strokeColor = UIColor.borderPurple.cgColor
        shapeLayer1.fillColor = UIColor.backgroundPurple.cgColor
        shapeLayer1 .shadowColor = UIColor.shadowPurple.cgColor
        shapeLayer1.shadowRadius = 20
        shapeLayer1.shadowOffset = .zero
        shapeLayer1.shadowOpacity = 1
        shapeLayer1.lineWidth = 2
        
        self.bgView.layer.addSublayer(shapeLayer1)

    }
    
    private func collectionLayout() {
        addSubview(collection)
        NSLayoutConstraint.activate([
            collection.widthAnchor.constraint(equalTo: self.widthAnchor),
            collection.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            bgView.topAnchor.constraint(equalTo: self.collection.topAnchor)

        ])
    }

    private func backgroundLayout() {
        addSubview(bgView)
        
        NSLayoutConstraint.activate([
            bgView.leftAnchor.constraint(equalTo: leftAnchor, constant: -2),
            bgView.rightAnchor.constraint(equalTo: rightAnchor, constant: 2),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2)
            
        ])
    }

    private func tableViewLayout() {
        tableView.register(NickNameTableViewCell.self, forCellReuseIdentifier: NickNameTableViewCell.reuseIdentifier)
        tableView.register(RegisterGameTableViewCell.self, forCellReuseIdentifier: RegisterGameTableViewCell.reuseIdentifier)
        tableView.register(UserInfosTableViewCell.self, forCellReuseIdentifier: UserInfosTableViewCell.reuseIdentifier)
        
        tableView.register(TitleSectionUser.self,
               forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        addSubview(self.tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 24),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                                                   constant: -40)
        ])
    }
    
    private func reportButtonLayout() {
        addSubview(reportButton)
        NSLayoutConstraint.activate([
            reportButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            reportButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//            reportButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
