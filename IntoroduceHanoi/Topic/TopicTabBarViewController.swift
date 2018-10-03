//
//  TopicTabBarViewController.swift
//  IntoroduceHanoi
//
//  Created by 安井春輝 on 10/2/30 H.
//  Copyright © 30 Heisei haruki yasui. All rights reserved.
//

import UIKit

class TopicTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    let vietnameseTabController = VietnameseViewController()
    let taxiTabController = TaxiViewController()
    let restauntrantTabController = RestaurantViewController()
    let calculateTabController = CalculateViewController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        self.delegate = self
        
        setTabBar()
        
    }
    
    override func viewWillLayoutSubviews() {
        var tabBarHeight: CGFloat
        var tabFrame = tabBar.frame
        //detect iphone X to change height of tabbar
        if UIDevice().userInterfaceIdiom == .phone && UIScreen.main.nativeBounds.height == 2436 {
            tabBarHeight = 100
        } else {
            tabBarHeight = 65
        }
        
        tabFrame.size.height = tabBarHeight
        tabFrame.origin.y = self.view.frame.size.height - tabBarHeight
        tabBar.frame = tabFrame
        
        
        
        
        

    }
    
    func setTabBar() {
        self.tabBar.tintColor = UIColor.orange
        let vietnameseTabImage = UIImage(named: "language")
        let taxiTabImage = UIImage(named: "taxi")
        let restaurantTabImage = UIImage(named: "restaurant")
        let calculateTabImage = UIImage(named: "calculator")
        
        let vietnameseTab = UITabBarItem(title: "ベトナム語", image: vietnameseTabImage, selectedImage: vietnameseTabImage)
        let taxiTab = UITabBarItem(title: "タクシー", image: taxiTabImage, selectedImage: taxiTabImage)
        let restaurantTab = UITabBarItem(title: "レストラン", image: restaurantTabImage, selectedImage: restaurantTabImage)
        let calculateTab = UITabBarItem(title: "換算", image: calculateTabImage, selectedImage: calculateTabImage)
        
        vietnameseTabController.tabBarItem = vietnameseTab
        taxiTabController.tabBarItem = taxiTab
        restauntrantTabController.tabBarItem = restaurantTab
        calculateTabController.tabBarItem = calculateTab
        
        self.viewControllers = [vietnameseTabController, taxiTabController, restauntrantTabController, calculateTabController]
    }
    
}
