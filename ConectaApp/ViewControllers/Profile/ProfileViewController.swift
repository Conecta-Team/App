//
//  ProfileViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 21/10/21.
//

import UIKit

enum EditButtonType: Int {
    case nickname
    case games
    case userInfo
}

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    let profileViewModel = ProfileViewModel()
    var user: UserDTO!
    var navController = UINavigationController()
    
//    init(userDTO: UserDTO) {
//        self.user = userDTO
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileView
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
        profileView.tableView.estimatedRowHeight = 100
    }
    
    let games: [(Games, Bool)] = {
            var array = [(Games, Bool)]()
            for index in 0...4 {
                array.append((Games(rawValue: index)!, true))
            }
            return array
        }()
    
    var cellHeight: CGFloat = 0 {
        didSet {
            if cellHeight != 0 {
                self.profileView.tableView.reloadData()
            }
        }
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
            cell.nameLabel.text = "helaine"
            // cell.nameLabel.text = user.name
            cell.isUserInteractionEnabled = false
            cell.editButton.addTarget(self, action: #selector(editNickname), for: .touchUpInside)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: RegisterGameTableViewCell.reuseIdentifier, for: indexPath) as! RegisterGameTableViewCell
//            let gamesArray: [(Games, Bool)] = user.games.compactMap { gameInt in
//                if let games = Games(rawValue: gameInt) {
//                    return (games, true)
//                }
//                return nil
//            }
            cell.configureCell(indexPath: indexPath, games: games)
            cell.backgroundColor = .clear
            cell.isUserInteractionEnabled = false
            cell.layoutIfNeeded()
            cell.isUserInteractionEnabled = false
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfosTableViewCell.reuseIdentifier, for: indexPath) as! UserInfosTableViewCell
            cell.configure(discordName: "öiio", steamName: "ouioo", instagramName: "oijio")
            // cell.configure(discordName: user.discord, steamName: user.steam, instagramName: user.instagram)
            cell.backgroundColor = .clear
            cell.copyButtonDiscord.isHidden = true
            cell.copyButtonSteam.isHidden = true
            cell.copyButtonInstagram.isHidden = true
            cell.isUserInteractionEnabled = false
            return cell
        case 3:
           let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reuseIdentifier, for: indexPath) as! AccountTableViewCell
            cell.isUserInteractionEnabled = false
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsTableViewCell.reuseIdentifier, for: indexPath) as! ButtonsTableViewCell
            cell.isUserInteractionEnabled = false
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
            view.editButton.addTarget(self, action: #selector(editGames), for: .touchUpInside)

        case 2:
            view.title.text = "Contatos"
            view.editButton.addTarget(self, action: #selector(editSocialInfo), for: .touchUpInside)

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

extension ProfileViewController {
    
    @objc func editNickname(_ sender: UIButton) {
//        navController.viewControllers = RegisterNameViewController()
//        self.navController.present(RegisterNameViewController(), animated: true, completion: nil)
    }
    
    @objc func editSocialInfo(_ sender: UIButton) {
        let controller = RegisterSocialInfoViewController(isEditScreen: true)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func editGames(_ sender: UIButton) {
        self.navigationController?.present(RegisterGameViewController(), animated: true, completion: nil)
    }
}
