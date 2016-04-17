//
//  Global.swift
//  RxTest
//
//  Created by saichi on 2016/04/17.
//  Copyright © 2016年 saichi. All rights reserved.
//

import Foundation
import SwiftyBeaver

let Log: SwiftyBeaver.Type = {
    let log = SwiftyBeaver.self
    let console = ConsoleDestination()
    log.addDestination(console)
    return log
}()