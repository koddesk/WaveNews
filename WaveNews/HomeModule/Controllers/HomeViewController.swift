//
//  HomeViewController.swift
//  WaveNews
//
//  Created by KODDER on 10.05.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Discover things of this world"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    
    private let horizontalMenu = HorizontalMenuCollectionView()
    private let middleCollectionView = MiddleNewsCollectionView()
    private let recommendedTableView = RecommendedTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        showOnboarding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        navigationItem.searchController = searchController
        
        view.addSubview(horizontalMenu)
        view.addSubview(middleCollectionView)
        view.addSubview(recommendedTableView)
    }
    
    private func showOnboarding() {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.modalPresentationStyle = .automatic
        present(onboardingViewController, animated: false)
    }
}

//MARK: - Constraints
extension HomeViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            horizontalMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalMenu.heightAnchor.constraint(equalToConstant: 30),
            
            middleCollectionView.topAnchor.constraint(equalTo: horizontalMenu.bottomAnchor, constant: 25),
            middleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            middleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            middleCollectionView.heightAnchor.constraint(equalToConstant: 260),
            
            recommendedTableView.topAnchor.constraint(equalTo: middleCollectionView.bottomAnchor, constant: 20),
            recommendedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recommendedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recommendedTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}
