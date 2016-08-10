//
//  GQMainViewController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAllChidsViewController()
    }

}

extension GQMainViewController {
  
    private func setUpAllChidsViewController() {
       
        let arr = [
            ["clsName":"GQHomeViewController","title":"首页","imageName":"home"],
            ["clsName":"GQMessageViewController","title":"消息","imageName":"message_center"],
            ["clsName":"GQDiscoverViewController","title":"发现","imageName":"discover"],
            ["clsName":"GQProfileViewController","title":"我的","imageName":"profile"]
                ]
        var arrM = [UIViewController]()
        
        for dict in arr {
          
            arrM.append(controller(dict))
        }
        
        viewControllers = arrM
    }
    
    //MARK: - 控制器
    private func controller(dict:[String:String]) -> UIViewController {
      
        guard let clsName = dict["clsName"],
                  title = dict["title"],
                  imageName = dict["imageName"],
                 cls = NSClassFromString(NSBundle.mainBundle().namespace + "." + clsName) as? UIViewController.Type else
        {
                  return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named:"tabbar_" + imageName + "_selected")
        
        let nav = UINavigationController(rootViewController: vc)
        
        return nav
    }
    
    
    
    
    
    
    
}