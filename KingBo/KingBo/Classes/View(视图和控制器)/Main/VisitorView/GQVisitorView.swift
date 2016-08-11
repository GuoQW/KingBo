//
//  GQVisitorView.swift
//  KingBo
//
//  Created by Go on 16/8/11.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

class GQVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    //懒加载登录和注册按钮
    private lazy var loginBtn:UIButton = {
       () -> UIButton in
        let btn = UIButton()
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.whiteColor()
        btn.frame = CGRect(x: 150, y: 100, width: 80, height: 40)
        return btn
    }()

    private lazy var registerBtn:UIButton = {
        () -> UIButton in
        let btn = UIButton()
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Highlighted)
        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.whiteColor()
        btn.frame = CGRect(x: 50, y: 100, width: 80, height: 40)
        return btn
    }()
}

//MARK: - 设置UI
extension GQVisitorView {
    
    private func setupUI(){
      
        backgroundColor = UIColor.greenColor()
        addSubview(loginBtn)
        addSubview(registerBtn)
        
        //设置布局
    }
}