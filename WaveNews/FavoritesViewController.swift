//
//  FavoritesViewController.swift
//  WaveNews
//
//  Created by KODDER on 10.05.2023.
//

import UIKit

class FavoritesViewController: UIViewController {
    
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
        view.backgroundColor = .systemBackground
    }
}

extension FavoritesViewController {
    
    private func setConstraints() {
        
    }
}
