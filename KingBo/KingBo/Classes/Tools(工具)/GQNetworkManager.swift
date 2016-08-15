//
//  GQNetworkManager.swift
//  KingBo
//
//  Created by Go on 16/8/15.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import UIKit
import AFNetworking

enum WBHTTPMethod {
    
    case GET
    case POST
}

class GQNetworkManager: AFHTTPSessionManager {
    
    //创建单例
    static let shared = GQNetworkManager()
    
    //使用一个函数封装网络请求
    func request(method:WBHTTPMethod = .GET,URLString:String,paramets:[String:AnyObject], completion:(json:AnyObject?, isSuccess: Bool)->()){
       
        let success = {(task:NSURLSessionDataTask, json:AnyObject?) -> () in
           completion(json: json , isSuccess: true)
        }
        
        let failure = {(task:NSURLSessionDataTask?, error:NSError) -> () in
            completion(json:nil, isSuccess:  false)
        }
        
        //get
        if method == .GET {
           GET(URLString, parameters: paramets, progress: nil, success: success, failure: failure)
        } else {
           POST(URLString, parameters: paramets, progress: nil, success: success, failure: failure)
        }
        
    }
}
