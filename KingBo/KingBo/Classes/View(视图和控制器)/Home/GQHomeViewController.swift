//
//  GQHomeViewController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQHomeViewController: GQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - 显示好友
    @objc private func showFriends() {
       
        print("显示好友")
        let testVc = GQDemoViewController()
        navigationController?.pushViewController(testVc, animated: true)
    }

}

extension GQHomeViewController {
   
    //MARK: - 重写父类的方法
    override func setUpUI(){
        super.setUpUI()
        
//        let leftItem = UIBarButtonItem(title: "好友", style: UIBarButtonItemStyle.Plain, target: self, action: "showFriends")
        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", imageName: "", target: self, action: Selector("showFriends"))
    }
}