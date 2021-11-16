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
    var setView: Bool = false
    
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
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(NickNameTableViewCell.self, forCellReuseIdentifier: NickNameTableViewCell.reuseIdentifier)
        tableView.register(RegisterGameTableViewCell.self, forCellReuseIdentifier: RegisterGameTableViewCell.reuseIdentifier)
        tableView.register(UserInfosTableViewCell.self, forCellReuseIdentifier: UserInfosTableViewCell.reuseIdentifier)
        tableView.register(ReportButtonTableViewCell.self, forCellReuseIdentifier: ReportButtonTableViewCell.reuseIdentifier)
        tableView.register(TitleSectionUser.self,
                           forHeaderFooterViewReuseIdentifier: TitleSectionUser.reuseIdentifier)
        return tableView
    }()
    
    let profileButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "profileButton"), for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.shadowOffset = .zero
        button.layer.shadowColor = UIColor.shadowPink.cgColor
        return button
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundLayout()
        self.profileButtonLayout()
        self.collectionLayout()

        self.tableViewLayout()
        addMultipleLayers()
    }
    
     func addMultipleLayers() {
         
         let cellWidth = self.bounds.size.width * 0.6
         var collectionHeight = self.bounds.size.width * 0.5
         var heightTop = 0
         let viewSize = self.bounds.size.width
         if collectionHeight >= 200 {
             collectionHeight = self.bounds.size.width * 0.6
             heightTop = 10
         }
         let path1 = UIBezierPath()
         path1.move(to: CGPoint(x: 0, y: collectionHeight))
         path1.addLine(to: CGPoint(x: viewSize/2 - cellWidth/2 + 5, y: collectionHeight))
         path1.addLine(to: CGPoint(x: Int(viewSize/2 - cellWidth/2) + 5, y: heightTop))
         path1.addLine(to: CGPoint(x: Int(viewSize/2 + cellWidth/2) - 5, y: heightTop))
         path1.addLine(to: CGPoint(x: viewSize/2 + cellWidth/2 - 5, y: collectionHeight))
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
         if !setView {
             self.bgView.layer.addSublayer(shapeLayer1)
             setView = true
         }

    }
    
    private func collectionLayout() {
        addSubview(collection)
        NSLayoutConstraint.activate([
            collection.widthAnchor.constraint(equalTo: self.widthAnchor),
            collection.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collection.topAnchor.constraint(equalTo: profileButton.bottomAnchor),
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
        addSubview(self.tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: collection.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func profileButtonLayout(){
        addSubview(profileButton)
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor ),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileButton.widthAnchor.constraint(equalToConstant: 42),
            profileButton.heightAnchor.constraint(equalToConstant: 39)
        ])
    }
}
