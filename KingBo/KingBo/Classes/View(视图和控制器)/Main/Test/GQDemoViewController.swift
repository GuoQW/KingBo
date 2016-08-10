//
//  GQDemoViewController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQDemoViewController: GQBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "第\(navigationController?.childViewControllers.count ?? 0)"
    }
    //点击事件
    @objc private func nextClick(){
      
        let vc = GQDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension GQDemoViewController {
  
   //MARK: - 重写UI
    override func setUpUI() {
        super.setUpUI()
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "下一个", style: UIBarButtonItemStyle.Plain, target: self, action: "nextClick")
    }
}