//
//  MainTabBarController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 5/1/26.
//
import UIKit

import Then

class MainTabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let subscribeViewController = SubscribeViewController()
        let purchaseViewController = PurchaseViewController()
        let webtoonViewController = WebtoonViewController()
        let searchViewController = SearchViewController()
        let folderViewController = FolderViewController()
        
        subscribeViewController.tabBarItem = UITabBarItem(title: "구독", image: .W_1, selectedImage: .W)
        purchaseViewController.tabBarItem = UITabBarItem(title: "개별 구매", image: .category1, selectedImage: .category)
        webtoonViewController.tabBarItem = UITabBarItem(title: "웹툰", image: .wallet1, selectedImage: .wallet)
        searchViewController.tabBarItem = UITabBarItem(title: "찾기", image: .search1, selectedImage: .search)
        folderViewController.tabBarItem = UITabBarItem(title: "보관함", image: .folder1, selectedImage: .folder)
        
        viewControllers = [subscribeViewController,purchaseViewController,webtoonViewController,searchViewController,folderViewController]
        tabBar.tintColor = .gray500
        tabBar.barTintColor = .white
    }
}

class PurchaseViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

class WebtoonViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

class SearchViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class FolderViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}
