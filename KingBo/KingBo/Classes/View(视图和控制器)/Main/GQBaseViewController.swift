//
//  GQBaseViewController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }

}

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
    }
}