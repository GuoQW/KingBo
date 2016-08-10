//
//  UIBarButtonItem+Extension.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem { //可以通过判断来决定是否需要图片或者文字
  
    convenience init(title: String,imageName: String, target:AnyObject?, action: Selector){
       
        let btn = UIButton()
     
        btn.setTitle(title, forState: .Normal)
        
        btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Highlighted)
        
   
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName+"_highlighted"), forState: UIControlState.Highlighted)
        btn.sizeToFit()
        
        btn .addTarget(target, action: action, forControlEvents: .TouchUpInside)
        //init对应的也是遍历的构造方法跳进去看就知道了
        self.init(customView:btn)
    }
}