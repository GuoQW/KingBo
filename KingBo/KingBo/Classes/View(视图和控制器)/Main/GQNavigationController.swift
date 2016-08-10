//
//  GQNavigationController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        navigationBar.hidden = true
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
          
            viewController.hidesBottomBarWhenPushed = true
           
            //判断控制器的类型
            if let vc = viewController as? GQBaseViewController{
                
                var title = "返回"
                if childViewControllers.count == 1 { //控制第一个为首页的标题
                    
                    title = childViewControllers.first?.title ?? "返回"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, imageName: "navigationbar_return", target: self, action: Selector("popParent"))
            }
           
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    //MARK: - 返回上一级
    @objc private func popParent() {
        popViewControllerAnimated(true)
    }

}
