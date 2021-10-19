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
            self.backgroundColor = .backgroundBlack
        }
    }
    let bgView = BackgroundRectView()

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

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundLayout()
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
            self.bgView.topAnchor.constraint(equalTo: self.collection.bottomAnchor, constant: 4)
        ])
    }

    private func backgroundLayout() {
        addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.leftAnchor.constraint(equalTo: self.leftAnchor),
            bgView.rightAnchor.constraint(equalTo: self.rightAnchor),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor)


        ])
//        addSubview(backgroundViewColor)
//        NSLayoutConstraint.activate([
//            backgroundViewColor.leftAnchor.constraint(equalTo: self.leftAnchor),
//            backgroundViewColor.rightAnchor.constraint(equalTo: self.rightAnchor),
//            backgroundViewColor.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
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
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    public func configureViewColors(color: ColorManager) {
//        self.topViewColor.backgroundColor = color.darkColor
        self.mainColor = color
    }
}
