//
//  ProfileViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 21/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileView
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: NicknameTableViewCell.reuseIdentifier, for: indexPath) as! NicknameTableViewCell
            return cell
//        case 2:
//            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfosTableViewCell.reuseIdentifier, for: indexPath) as! UserInfosTableViewCell
//            cell.configure(discordName: "Oii", steamName: "Oii", instagramName: "jdjsc")
//            cell.backgroundColor = .clear
//            cell.copyButtonDiscord.isHidden = true
//            cell.copyButtonSteam.isHidden = true
//            cell.copyButtonInstagram.isHidden = true
//            return cell
        case 3:
           let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reuseIdentifier, for: indexPath) as! AccountTableViewCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsTableViewCell.reuseIdentifier, for: indexPath) as! ButtonsTableViewCell
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                                                                SectionHeaderView.reuseIdentifier) as! SectionHeaderView

        switch section {
        case 1:
            view.title.text = "Jogos de Interesse"
        case 2:
            view.title.text = "Contatos"
        case 3:
            view.title.text = "Conta"
            view.editButton.isHidden = true
        default:
            return UIView()
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 4:
            return 24
        default:
            return UITableView.automaticDimension
        }
    }
}
