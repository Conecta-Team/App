//
//  MatchView.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//

import UIKit

class MatchView: UIView {

    var mainColor: ColorManager = .defaultColor {
        didSet {
            self.backgroundColor = self.mainColor.lightColor
        }
    }

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

    let topViewColor: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.topViewLayout()
        self.collectionLayout()
        self.tableViewLayout()
    }

    private func collectionLayout() {
        self.addSubview(self.collection)

        NSLayoutConstraint.activate([
            self.collection.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.collection.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3),
            self.collection.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.collection.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            self.topViewColor.bottomAnchor.constraint(equalTo: self.collection.centerYAnchor, constant: -20)
        ])
    }

    private func topViewLayout() {
        self.tableView.register(NickNameTableViewCell.self, forCellReuseIdentifier: NickNameTableViewCell.reuseIdentifier)
        self.tableView.register(UserGamesTableViewCell.self, forCellReuseIdentifier: UserGamesTableViewCell.reuseIdentifier)
        self.tableView.register(UserInfosTableViewCell.self, forCellReuseIdentifier: UserInfosTableViewCell.reuseIdentifier)
        
        tableView.register(TitleSectionUser.self,
               forHeaderFooterViewReuseIdentifier: "sectionHeader")

        self.addSubview(self.topViewColor)

        NSLayoutConstraint.activate([
            self.topViewColor.topAnchor.constraint(equalTo: self.topAnchor),
            self.topViewColor.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.topViewColor.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }

    private func tableViewLayout() {
        self.addSubview(self.tableView)

        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.collection.bottomAnchor, constant: 24),
            self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    public func configureViewColors(color: ColorManager) {
        self.topViewColor.backgroundColor = color.darkColor
        self.mainColor = color
    }
}
