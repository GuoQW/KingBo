//
//  NSBundle+Extension.swift
//  KingBo
//
//  Created by Go on 16/8/10.
//  Copyright © 2016年 guoqing. All rights reserved.
//

import Foundation

extension NSBundle {

    var namespace:String {
        
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}