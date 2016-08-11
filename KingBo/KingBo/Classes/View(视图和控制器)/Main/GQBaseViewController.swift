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
    //定义刷新控件
    var refresh:UIRefreshControl?
    //上拉刷新
    var isToPull = false
    
    //用户是否登录
    var isLogin = false
    
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
       refresh?.endRefreshing()
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
        isLogin ? setUpTableView() : setupUserView()
     
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
        
        refresh = UIRefreshControl()
        tableView?.addSubview(refresh!)
        refresh?.addTarget(self, action: Selector("loadData"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //MARK: - 设置用户登录视图
    private func setupUserView() {
       
        let loginView = UIView(frame: view.bounds)
        loginView.backgroundColor = UIColor.greenColor()
        view.insertSubview(loginView, belowSubview: navigationBar)
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
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //判断是否 存在行与列
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
          return
        }
        
        let count = tableView.numberOfRowsInSection(section)
        if row == (count - 1) && !isToPull {
            print("上拉刷新")
            isToPull = true
            loadData()
        }
    }
}