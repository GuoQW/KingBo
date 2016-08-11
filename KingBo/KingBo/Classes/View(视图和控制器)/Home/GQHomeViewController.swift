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
    override func loadData() {
        
        for i in 0..<15 {
          
            statusList.insert(i.description, atIndex: 0)
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

