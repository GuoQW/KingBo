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
        
        addComposeBtn()
    }

    //FIXME: 按钮点击事件
  @objc private func composeBtnClick() {
        
        print("撰写博客")
    }
    
    //MARK: - 添加按钮
    private lazy var composeButton:UIButton = {
        () -> UIButton in
        
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState:UIControlState.Highlighted)
        btn.sizeToFit()
        
        return btn
    }()
}

extension GQMainViewController { //UI界面设置
  
    private func setUpAllChidsViewController() {
       
        let arr = [
            ["clsName":"GQHomeViewController","title":"首页","imageName":"home"],
            ["clsName":"GQMessageViewController","title":"消息","imageName":"message_center"],
            ["clsName":"UIViewController"],
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
        
        //设置文字颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orangeColor()], forState: UIControlState.Highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFontOfSize(13)], forState: UIControlState.Normal)
        
        let nav = GQNavigationController(rootViewController: vc)
        
        return nav
    }
    
    private func addComposeBtn() {
    
         tabBar.addSubview(composeButton)
        
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        
        //小细节 count - 1 让 中间那个按钮覆盖周边的按钮
//        composeButton.frame = CGRectInset(tabBar.bounds, w * 2, 0)
        composeButton.frame = tabBar.bounds.insetBy(dx: w * 2, dy: 0)
        
        //添加点击事件
        composeButton.addTarget(self, action: "composeBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    
}