//
//  MatchViewController.swift
//  ConectaApp
//
//  Created by José João Silva Nunes Alves on 17/09/21.
//
// swiftlint:disable force_cast

import UIKit

class MatchViewController: UIViewController {

    let mainView = MatchView()
    let viewModel: MatchViewModel = MatchViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.collection.dataSource = self
        mainView.collection.delegate = self

        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self

        self.view = mainView
        self.mainView.configureViewColors(color: self.viewModel.dados[0])
    }
}

extension MatchViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.dados.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.mainView.collection.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseIdentifier, for: indexPath) as? ProfileCollectionViewCell

        if let profileCell = cell {
            let colorCell = self.viewModel.dados[indexPath.row]
            profileCell.configureCell(cellColor: colorCell)
            return profileCell
        }
        return ProfileCollectionViewCell()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width * 0.4
        return CGSize(width: size, height: size)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let centerCell = self.mainView.collection.visibleCells.sorted(by: { cell1, cell2 in
            cell1.frame.width > cell2.frame.width
        }).first as? ProfileCollectionViewCell

        self.mainView.configureViewColors(color: centerCell?.cellColor ?? ColorManager.defaultColor)
        self.mainView.tableView.reloadData()
    }
}

extension MatchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = NickNameTableViewCell()
            cell.configure(nickName: "Joana", color: self.mainView.mainColor)
            return cell
        case 1:
            let cell = UserGamesTableViewCell()
            cell.configure(gameName: "Valorant", color: self.mainView.mainColor)
            return cell
        default:
            let cell = UserInfosTableViewCell()
            cell.configure(discordName: "jjoaosilvaDisc", steamName: "jjoaoSteam", instagramName: "ze_jao_", color: self.mainView.mainColor)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
           "sectionHeader") as! TitleSectionUser
        switch section {
        case 0:
            view.title.text = "Nickname"
        case 1:
            view.title.text = "Jogos de interesse"
        default:
            view.title.text = "Contatos"
        }
        view.configure(color: self.mainView.mainColor)
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 50
        case 1:
            return 50
        default:
            return 144
        }
    }
}
