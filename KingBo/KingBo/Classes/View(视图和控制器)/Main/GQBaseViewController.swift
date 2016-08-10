//
//  GQBaseViewController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQBaseViewController: UIViewController {
   
    //自定义导航条
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 64))
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
   
    //重写title的set方法
    override var title:String? {
        didSet {
           navItem.title = title
        }
    }
}

//设置UI
extension GQBaseViewController {

    //设置随机色
    func setUpUI() {
//        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
//        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
//        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let r:CGFloat = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
        let g:CGFloat = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))
        let b:CGFloat = CGFloat(CGFloat(random())/CGFloat(RAND_MAX))

      view.backgroundColor = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        
      view.addSubview(navigationBar)
      navigationBar.items = [navItem]
        //解决右边透明度太高的问题
//      navigationBar.barTintColor = UIColor.whiteColor()
      navigationBar.translucent = false
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGrayColor()]
    }
}