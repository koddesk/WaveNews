//
//  FavoritesViewController.swift
//  WaveNews
//
//  Created by KODDER on 10.05.2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    private let underNavItemLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved articles to the library"
        label.font = .interRegular16()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(underNavItemLabel)
    }
}

extension FavoritesViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            underNavItemLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            underNavItemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}
