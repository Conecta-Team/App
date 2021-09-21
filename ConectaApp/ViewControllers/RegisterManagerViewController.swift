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

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        viewModel.initialization()
        setup()
        style()
        layout()
    }

    func setup() {
        pageControl.isUserInteractionEnabled = false

        pages.append(registerNameViewController)
        pages.append(registerGameViewController)
        pages.append(registerSocialInfoViewController)

        setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
    }

    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.preferredIndicatorImage = UIImage(named: "pageControlUnselected")
        pageControl.currentPageIndicatorTintColor = .darkPurple
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
    }

    func layout() {
        view.addSubview(pageControl)
        view.addSubview(buttonNext)
        view.addSubview(buttonBack)

        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            buttonBack.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -24),
            buttonBack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            buttonNext.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 24),
            buttonNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            buttonNext.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])

    }

    func changeColor() {
        switch pageControl.currentPage {
        case 1:
            pageControl.currentPageIndicatorTintColor = .darkBlue
        case 2:
            pageControl.currentPageIndicatorTintColor = .darkOrange
        default:
            pageControl.currentPageIndicatorTintColor = .darkPurple
        }
    }

    func validadeInfos() -> Bool {
        switch pageControl.currentPage {
        case 0:
            return viewModel.setName(name: registerNameViewController.getName())
        case 1:
            return viewModel.setGame(game: registerGameViewController.getGame())
        case 2:
            let socialInfos = registerSocialInfoViewController.getSocialInfos()
            return viewModel.setSocialInfos(discord: socialInfos.discord, steam: socialInfos.steam, instagram: socialInfos.instagram)
        default:
            return false
        }
    }

    @objc func nextTapped(_ sender: UIButton) {
        if pageControl.currentPage < pages.count - 1 && validadeInfos() {
            pageControl.currentPage += 1
            changeColor()
            setViewControllers([pages[pageControl.currentPage]], direction: .forward, animated: true, completion: nil)
        } else if validadeInfos() && pageControl.currentPage == pages.count - 1 {
            self.viewModel.saveInfosUser()
        }
    }

    @objc func backTapped(_ sender: UIButton) {
        if pageControl.currentPage != 0 {
            pageControl.currentPage -= 1
            changeColor()
            setViewControllers([pages[pageControl.currentPage]], direction: .reverse, animated: true, completion: nil)
        }
    }
}
