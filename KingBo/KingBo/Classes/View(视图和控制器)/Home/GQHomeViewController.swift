//
//  GQHomeViewController.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit

private let cellId = "cellId"
class GQHomeViewController: GQBaseViewController {

    //懒加载
    private lazy var statusList = [String]()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
    
    //MARK: - 显示好友
    @objc private func showFriends() {
       
        print("显示好友")
        let testVc = GQDemoViewController()
        navigationController?.pushViewController(testVc, animated: true)
    }
    
    //MARK: - 重写父类的方法
    override func loadData() { //模拟延迟下拉刷新
        
        print("开始刷新数据")
        dispatch_after(2, dispatch_get_main_queue()) { () -> Void in
            
            for i in 0..<15 {
                if self.isToPull {
                  self.statusList.append("上拉刷新\(i)")
                }else {
                    self.statusList.insert(i.description, atIndex: 0)
                }
            }
            
            print("结束刷新")
            self.refresh?.endRefreshing()
            //结束
            self.isToPull = false
            self.tableView?.reloadData()
        }
      
    }

}

//MARK: - 设置数据源和代理
extension GQHomeViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
    }
}

extension GQHomeViewController {
   
    //MARK: - 重写父类的方法
    override func setUpUI(){
        super.setUpUI()
        

        navItem.leftBarButtonItem = UIBarButtonItem(title: "好友", imageName: "", target: self, action: Selector("showFriends"))
        //注册cell
        tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}

