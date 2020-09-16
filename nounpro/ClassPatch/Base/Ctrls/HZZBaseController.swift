//
//  HZZBaseController.swift
//  noue_pro
//
//  Created by Hu on 2020/9/16.
//  Copyright © 2020 Hu. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher

class HZZBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.background
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           configNavigationBar()
    }
    
    func configUI() {
        
    }
    
    func configNavigationBar() {
           guard let navi = navigationController else { return }
           if navi.visibleViewController == self {
               navi.barStyle(.theme)
               navi.disablePopGesture = false
               navi.setNavigationBarHidden(false, animated: true)
               if navi.viewControllers.count > 1 {
                   navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"),
                                                                      target: self,
                                                                      action: #selector(pressBack))
               }
           }
       }
       
       @objc func pressBack() {
               navigationController?.popViewController(animated: true)
           }

}

extension HZZBaseController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
