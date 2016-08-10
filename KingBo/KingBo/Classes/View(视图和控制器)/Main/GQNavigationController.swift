//
//  GQNavigationController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQNavigationController: UINavigationController {

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
          
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: true)
    }

}
