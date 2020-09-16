//
//  HZZTabBarController.swift
//  noue_pro
//
//  Created by Hu on 2020/9/16.
//  Copyright © 2020 Hu. All rights reserved.
//

import UIKit

class HZZTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        
        setUpCtrls()
    }
    
    func setUpCtrls(){
        /// 首页
        let homeVC = HZZHomeController()
        addChildViewController(homeVC, title: "首页", image: "tab_home", selImage: "tab_home_S")
        
        /// 分类
        let CatVC = HZZCateController()
        addChildViewController(CatVC, title: "分类", image: "tab_class", selImage: "tab_class_S")
        
        /// 书架
        let BookVC = HZZBookController()
        addChildViewController(BookVC, title: "书架", image: "tab_book", selImage: "tab_book_S")
        
        /// 我的
        let MineVC = HZZMineController()
        addChildViewController(MineVC, title: "我的", image: "tab_mine", selImage: "tab_mine_S")
        
    }
    
    /// 添加子控制器
    ///
    /// - Parameters:
    ///   - VC: 子控制器
    ///   - title: 子控制器标题
    ///   - image: 正常状态下的图片
    ///   - selImage: 选中状态下的图片
    func addChildViewController(_ VC:UIViewController, title:String?, image:String?, selImage:String?) {
        
        VC.title = title
        let NorImg = UIImage.init(named: image!)
        let SelImg = UIImage.init(named: selImage!)
        VC.tabBarItem = UITabBarItem(title: nil, image: NorImg?.withRenderingMode(.alwaysOriginal), selectedImage: SelImg?.withRenderingMode(.alwaysOriginal))
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            VC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
        }
        addChild(HZZNavigationController(rootViewController: VC))
    }
    
}
