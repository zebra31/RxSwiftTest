//
//  User.swift
//  RxTest
//
//  Created by saichi on 2016/04/16.
//  Copyright © 2016年 saichi. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Articles {
    let title: String
    let id: Int64
    
    init(json: JSON) {
//        guard let title = json["title"].string else {
//            return
//        }
//        self.title = title
//        guard let id = json["user"]["id"].int64 else {
//            return
//        }
//        self.id = id
        
        print("---")
        print(json)
        print(json["title"])
        title = json["title"].string!
        id = json["user"]["id"].int64!
    }
}