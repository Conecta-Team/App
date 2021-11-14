//
//  ProfileViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 21/10/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    let profileViewModel = ProfileViewModel()
    
    init(userDTO: UserDTO) {
        self.profileViewModel.userDTO = userDTO
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileView.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = profileView
        self.navigationController?.navigationBar.tintColor = .actPink
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.actPink, NSAttributedString.Key.font: UIFont.appRegularFont(with: 20)], for: UIControl.State.normal)
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
        profileView.tableView.estimatedRowHeight = 100
    }
    
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
            let name = profileViewModel.userDTO!.name
            let indexLetter = name.index(name.startIndex, offsetBy: 0)
            cell.letterProfileLabel.text = String(name[indexLetter]).uppercased()
            cell.nameLabel.text = profileViewModel.userDTO?.name
            cell.editButton.addTarget(self, action: #selector(editNickname), for: .touchUpInside)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: RegisterGameTableViewCell.reuseIdentifier, for: indexPath) as! RegisterGameTableViewCell
            let gamesArray: [(Games, Bool)] = profileViewModel.userDTO!.games.compactMap { gameInt in
                if let games = Games(rawValue: gameInt) {
                    return (games, true)
                }
                return nil
            }
            cell.configureCell(indexPath: indexPath, games: gamesArray)
            cell.backgroundColor = .clear
            cell.isUserInteractionEnabled = false
            cell.layoutIfNeeded()
            cell.isUserInteractionEnabled = false
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfosTableViewCell.reuseIdentifier, for: indexPath) as! UserInfosTableViewCell
            // cell.configure(discordName: "öiio", steamName: "ouioo", instagramName: "oijio")
            cell.configure(discordName: profileViewModel.userDTO!.discord, steamName: profileViewModel.userDTO!.steam, instagramName: profileViewModel.userDTO!.instagram)
            cell.backgroundColor = .clear
            cell.copyButtonDiscord.isHidden = true
            cell.copyButtonSteam.isHidden = true
            cell.copyButtonInstagram.isHidden = true
            cell.isUserInteractionEnabled = false
            return cell
        case 3:
           let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reuseIdentifier, for: indexPath) as! AccountTableViewCell
            cell.accountButton.addTarget(self, action: #selector(openPrivacityView), for: .touchUpInside)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonsTableViewCell.reuseIdentifier, for: indexPath) as! ButtonsTableViewCell
            cell.deleteButton.addTarget(self, action: #selector(deleteUser), for: .touchUpInside)
            cell.logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
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
        let controller = RegisterNameViewController(isEditScreen: true)
        controller.delegate = self.profileViewModel
        controller.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(controller, animated: true)
    }
    
    @objc func editSocialInfo(_ sender: UIButton) {
        let controller = RegisterSocialInfoViewController(isEditScreen: true)
        controller.delegate = self.profileViewModel
        controller.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(controller, animated: true)
    }
    
    @objc func editGames(_ sender: UIButton) {
        let controller = RegisterGameViewController(isEditScreen: true)
        controller.delegate = self.profileViewModel
        controller.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(controller, animated: true)
    }
    
    @objc func openPrivacityView(_ sender: UIButton) {
        let controller = ProfilePrivacitySecurityViewController()
        controller.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(controller, animated: true)
    }
    
    @objc func deleteUser(_ sender: UIButton) {
        self.profileViewModel.deleteUser {
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    
    @objc func logout(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
