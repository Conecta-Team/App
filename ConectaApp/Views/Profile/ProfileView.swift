//
//  ProfileView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 21/10/21.
//

import UIKit

class ProfileView: UIView {

    internal lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.borderColor = UIColor.borderPurple.cgColor
        view.layer.borderWidth = 2
        view.layer.shadowColor = UIColor.borderPurple.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(NicknameTableViewCell.self, forCellReuseIdentifier: NicknameTableViewCell.reuseIdentifier)
        tableView.register(RegisterGameTableViewCell.self, forCellReuseIdentifier: RegisterGameTableViewCell.reuseIdentifier)
        tableView.register(UserInfosTableViewCell.self, forCellReuseIdentifier: UserInfosTableViewCell.reuseIdentifier)
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.reuseIdentifier)
        tableView.register(ButtonsTableViewCell.self, forCellReuseIdentifier: ButtonsTableViewCell.reuseIdentifier)
        tableView.register(SectionHeaderView.self,
                           forHeaderFooterViewReuseIdentifier: SectionHeaderView.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        addSubview(borderView)
        addSubview(tableView)

        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            borderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
