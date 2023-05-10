//
//  MainTabBarViewController.swift
//  WaveNews
//
//  Created by KODDER on 10.05.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = .label
        tabBar.layer.borderWidth = 1
        tabBar.layer.cornerRadius = 16
        tabBar.layer.borderColor = UIColor.label.cgColor
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: CategoriesViewController())
        let vc3 = UINavigationController(rootViewController: FavoritesViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(named: "Home")
        vc2.tabBarItem.image = UIImage(named: "Categories")
        vc3.tabBarItem.image = UIImage(named: "Favorites")
        vc4.tabBarItem.image = UIImage(named: "Profile")
        
        vc1.title = "Home"
        vc2.title = "Categories"
        vc3.title = "Favorites"
        vc4.title = "Profile"
        
        tabBar.tintColor = .systemBlue
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}
