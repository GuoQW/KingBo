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
    
    //定义tablView
    var tableView:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        loadData()
    }
   
    //重写title的set方法
    override var title:String? {
        didSet {
           navItem.title = title
        }
    }
    
    //设置数据源
    func loadData(){
    
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
       automaticallyAdjustsScrollViewInsets = false
        setUpNav()
        setUpTableView()
     
    }
    
    private func setUpNav() {
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        //解决导航栏右边透明度太高的问题
        //      navigationBar.barTintColor = UIColor.whiteColor()
        navigationBar.translucent = false
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGrayColor()]
    }
    
    private func setUpTableView() {
      
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: UIScreen.mainScreen().bounds.size.height))
         view.insertSubview(tableView!, belowSubview: navigationBar)
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.contentInset = UIEdgeInsetsMake(navigationBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
    }
}

//MARK: - 设置数据源和代理
extension GQBaseViewController: UITableViewDataSource,UITableViewDelegate {
  
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}