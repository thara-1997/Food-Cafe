//
//  MainTabbarViewController.swift
//  Food  Cafe
//
//  Created by Thathsarani Nayanathara  on 1/25/23.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController:  HomeViewController())
        let vc2 = UINavigationController(rootViewController:  FavaouriteViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        vc2.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        
        
        setViewControllers([vc1, vc2], animated: true)
    }


}
