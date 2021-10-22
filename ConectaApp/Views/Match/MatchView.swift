//
//  MatchView.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit

class MatchView: UIView {
    let bgView = BackgroundRectView()
    let bgTopView = BackgroundRectView()
    
    let bgRect: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.bounds.size.height = 5
//        view.layer.bounds.size.width = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let collection: UICollectionView = {
        let layout = ZoomAndSnapFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
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

    private func collectionLayout() {
        addSubview(bgTopView)
        addSubview(collection)
        addSubview(bgRect)

        bgTopView.layer.bounds.size.width = collection.contentSize.width - 8
        NSLayoutConstraint.activate([
            collection.widthAnchor.constraint(equalTo: self.widthAnchor),
            collection.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collection.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            bgView.topAnchor.constraint(equalTo: self.collection.bottomAnchor, constant: -10),
            bgTopView.centerXAnchor.constraint(equalTo: collection.centerXAnchor),
            bgTopView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            bgTopView.heightAnchor.constraint(equalTo: collection.heightAnchor, constant: 10),
            bgRect.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 4),
            bgRect.bottomAnchor.constraint(equalTo: bottomAnchor),
            bgRect.leftAnchor.constraint(equalTo: self.leftAnchor),
            bgRect.rightAnchor.constraint(equalTo: self.rightAnchor),
            
        ])
    }

    private func backgroundLayout() {
        addSubview(bgView)
        
        NSLayoutConstraint.activate([
            bgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -2),
            bgView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 2),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 2),
            
//            bgRect.widthAnchor.constraint(equalTo: widthAnchor),
//
        ])
    }

    private func tableViewLayout() {
        tableView.register(NickNameTableViewCell.self, forCellReuseIdentifier: NickNameTableViewCell.reuseIdentifier)
        tableView.register(UserGamesTableViewCell.self, forCellReuseIdentifier: UserGamesTableViewCell.reuseIdentifier)
        tableView.register(UserInfosTableViewCell.self, forCellReuseIdentifier: UserInfosTableViewCell.reuseIdentifier)
        
        tableView.register(TitleSectionUser.self,
               forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        addSubview(self.tableView)

        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.collection.bottomAnchor, constant: 24),
            self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            // TODO ajeitar em relação ao denunciar
            self.tableView.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }
    
    private func reportButtonLayout() {
        addSubview(reportButton)
        NSLayoutConstraint.activate([
            reportButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            // TODO ajeitar em relação a table view
            reportButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//            reportButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
