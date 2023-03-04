//
//  HomeTabBarController.swift
//  ProyectoDos
//
//  Created by vero on 23/2/22.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupTabs()

    }
    
    private func setupTabs(){
        let navigationControler = UINavigationController(rootViewController: HeroesListTableViewController())
        let tabImageTableView = UIImage(systemName: "heart")!
        navigationControler.tabBarItem = UITabBarItem(title: "Heroes", image: tabImageTableView, tag: 0)
        
        let navigationControler2 = UINavigationController(rootViewController: HeroesMapViewController())
        let tabImageCollectionView = UIImage(systemName: "map")!
        navigationControler2.tabBarItem = UITabBarItem(title: "Location", image: tabImageCollectionView, tag: 0)
        

        
        viewControllers = [navigationControler, navigationControler2]
    }
    

    private func setupLayout(){
        
        tabBar.backgroundColor = .systemTeal
    }

}
