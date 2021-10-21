//
//  RegisterViewController.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 19/09/21.
//
// swiftlint:disable line_length
import Foundation
import UIKit

class RegisterManagerViewController: UIPageViewController {

    var pages = [UIViewController]()
    var pageControl = UIPageControl()
    var initialPage = 0
    let viewModel = RegisterManagerViewModel()

    let registerNameViewController = RegisterNameViewController()
    let registerGameViewController = RegisterGameViewController()
    let registerSocialInfoViewController = RegisterSocialInfoViewController()

    let buttonNext: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "buttonNext"), for: .normal)
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        return button
    }()

    let buttonBack: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "buttonBack"), for: .normal)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    internal lazy var pageControlImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "firstPageControl")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        pages.append(registerNameViewController)
        pages.append(registerGameViewController)
        pages.append(registerSocialInfoViewController)

        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        style()
    }

    func style() {
        // viewStyle
        self.view.backgroundColor = .backgroundBlack
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        viewModel.initialization()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        // pageControlStyle
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        
        layout()
    }

    func layout() {
        view.addSubview(pageControlImageView)
        view.addSubview(buttonNext)
        view.addSubview(buttonBack)
        
        NSLayoutConstraint.activate([
            pageControlImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            pageControlImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 56),
            buttonBack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])

        NSLayoutConstraint.activate([
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -56),
            buttonNext.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }

    func validadeInfos() -> Bool {
        switch pageControl.currentPage {
        case 0:
            let verification = viewModel.setName(name: registerNameViewController.getName())
            registerNameViewController.setErrorMessage(ishidden: verification)
            return verification
        case 1:
            let verification = viewModel.setGame(games: registerGameViewController.getSelectedGames())
            registerGameViewController.setErrorMessage(ishidden: verification)
            return verification
        case 2:
            let socialInfos = registerSocialInfoViewController.getSocialInfos()
            let verification = viewModel.setSocialInfos(discord: socialInfos.discord, steam: socialInfos.steam, instagram: socialInfos.instagram)
            registerSocialInfoViewController.setErrorMessage(ishidden: verification)
            return verification
        default:
            return false
        }
    }
    
    func changeImageView(index: Int) {
        switch index {
        case 0:
            pageControlImageView.image = UIImage(named: "firstPageControl")
            buttonNext.setImage(UIImage(named: "buttonNext"), for: .normal)
        case 1:
            pageControlImageView.image = UIImage(named: "secondPageControl")
            buttonNext.setImage(UIImage(named: "buttonNext"), for: .normal)
        case 2:
            pageControlImageView.image = UIImage(named: "lastPageControl")
            buttonNext.setImage(UIImage(named: "checkButton"), for: .normal)
        default:
            pageControlImageView.image = UIImage(named: "firstPageControl")
            buttonNext.setImage(UIImage(named: "buttonNext"), for: .normal)
        }
    }

    @objc func nextTapped(_ sender: UIButton) {
        
        if pageControl.currentPage < pages.count - 1 && validadeInfos() {
            changeImageView(index: pageControl.currentPage + 1)
            pageControl.currentPage += 1
            setViewControllers([pages[pageControl.currentPage]], direction: .forward, animated: true, completion: nil)
        } else if pageControl.currentPage == pages.count - 1 && validadeInfos() {
            self.buttonNext.isUserInteractionEnabled = false
            
//            self.viewModel.createUser { result in
//                switch result {
//                case .success(let user):
//                    DispatchQueue.main.async {
//                        let nextController = MatchViewController(user: user)
//                        self.navigationController?.pushViewController(nextController, animated: true)
//                    }
//                case .failure(let error):
//                    // TODO: MENSAGEM DE ERRO AQUI
//                    print(error)
//                }
//            }
        }
    }

    @objc func backTapped(_ sender: UIButton) {
        changeImageView(index: pageControl.currentPage - 1)
        if pageControl.currentPage != 0 {
            pageControl.currentPage -= 1
            setViewControllers([pages[pageControl.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
    }
}
