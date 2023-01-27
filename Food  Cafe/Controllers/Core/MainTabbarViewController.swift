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
        
        vc2.tabBarItem.image = UIImage(systemName: "heart")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        
        
        setViewControllers([vc1, vc2], animated: true)
    }


}
