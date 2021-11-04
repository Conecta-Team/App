//
//  MatchViewController.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//
// swiftlint:disable force_cast

import UIKit
import CloudKit

class MatchViewController: UIViewController {

    let mainView = MatchView()
    let loadingView: LoadingView = LoadingView()
    let viewModel: MatchViewModel

    init(user: UserDTO? = nil) {
        self.viewModel = (user != nil) ? MatchViewModel(user: user!) : MatchViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.mainView.addMultipleLayers()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.viewModel.initialization()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    
        mainView.collection.dataSource = self
        mainView.collection.delegate = self

        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self

        self.view = mainView
    }

    
}

extension MatchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.usersToMatch?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.mainView.collection.dequeueReusableCell(withReuseIdentifier:
                                                                    ProfileCollectionViewCell.reuseIdentifier,
                                                                for: indexPath) as? ProfileCollectionViewCell

        if let profileCell = cell {
            let profileLetter = self.viewModel.getProfileLetter(index: indexPath.row)

            profileCell.configureCell(profileLetter: profileLetter)
            return profileCell
        }
        return ProfileCollectionViewCell()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width * 0.4
        return CGSize(width: size, height: size)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let centerCell = self.mainView.collection.visibleCells.sorted(by: { cell1, cell2 in
            cell1.frame.width > cell2.frame.width
        }).first as? ProfileCollectionViewCell
       
        let index = self.mainView.collection.indexPathForItem(at: centerCell!.center)!
        self.mainView.collection.scrollToItem(at: IndexPath(row: index.row, section: 0),
                                              at: .centeredHorizontally, animated: false)

        self.viewModel.setIndexUser(index: index.row)
        self.mainView.tableView.reloadData()
        
        self.mainView.collection.scrollToItem(at: IndexPath(row: index.row, section: 0),
                                              at: .centeredHorizontally, animated: false)
        
    }
    
}

extension MatchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.usersToMatch?.count == 0 ? 0 : 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        self.viewModel.usersToMatch?.count == 0 ? 0 : 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: NickNameTableViewCell.reuseIdentifier,
                for: indexPath) as! NickNameTableViewCell
            let userName = self.viewModel.getUserName()
            cell.configure(nickName: userName)
            return cell
        case 1:
            let userGames = self.viewModel.getUserGames()
            var games: [(Games, Bool)] = []
            if let myGames = self.viewModel.user?.games.compactMap({ game in
                Games(rawValue: game)
            }) {
                games = userGames.compactMap({ game in
                    (game, myGames.contains(game))
                })
                games.sorted { game1, game2 in
                    game1.1 && !game2.1
                }
//                for userGame in userGames {
//                    for myGame in myGames {
//                        if myGame == userGame {
//                            games.insert((userGame, true), at: 0)
//                        } else {
//                            games.append((userGame, false))
//                        }
//                    }
//                }
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: RegisterGameTableViewCell.reuseIdentifier, for: indexPath) as! RegisterGameTableViewCell
          
            cell.configureCell(indexPath: indexPath, games: games)
            
            cell.backgroundColor = .clear
            cell.isUserInteractionEnabled = false
            cell.layoutIfNeeded()
            return cell
        default:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: UserInfosTableViewCell.reuseIdentifier,
                for: indexPath) as! UserInfosTableViewCell
            let (discord, steam, instagram) = self.viewModel.getUserSocialInfos()
            cell.configure(discordName: discord, steamName: steam, instagramName: instagram)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
           "sectionHeader") as! TitleSectionUser
        switch section {
        case 0:
            view.title.text = ""
        case 1:
            view.title.text = "Jogos de interesse"
        default:
            view.title.text = "Contatos"
        }
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 3 {
            return 0
        }
        return UITableView.automaticDimension
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.section {
//        case 0:
//            return 50
//        case 1:
//            return 80
//        default:
//            return 144
//        }
////       return UITableView.automaticDimension
//    }
}

extension MatchViewController: ViewModelDelegate {
    func willLoadData() {
        DispatchQueue.main.async {
            self.view = self.loadingView
        }
    }
    
    func didLoadData() {
        DispatchQueue.main.async {
            self.view = self.mainView
            self.mainView.collection.reloadData()
            self.mainView.tableView.reloadData()
        }
    }
}
