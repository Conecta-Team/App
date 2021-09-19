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

extension UIColor {
    static let purpleProfile = UIColor(red: 0.33, green: 0.00, blue: 0.77, alpha: 1.00)
    static let purpleBackground = UIColor(red: 0.93, green: 0.90, blue: 0.98, alpha: 1.00)

    static let orangeProfile = UIColor(red: 0.91, green: 0.32, blue: 0.14, alpha: 1.00)
    static let orangeBackground = UIColor(red: 0.99, green: 0.93, blue: 0.91, alpha: 1.00)

    static let blueProfile = UIColor(red: 0.00, green: 0.66, blue: 0.73, alpha: 1.00)
    static let blueBackground = UIColor(red: 0.90, green: 0.96, blue: 0.97, alpha: 1.00)

}
