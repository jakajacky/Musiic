//
//  DRConfig.swift
//  Musiic
//
//  Created by 张小强 on 2019/9/17.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit

class DRConfig: NSObject {
    public var token: String
    static let shared = DRConfig()
    
    private override init() {
        self.token = ""
    }
    
    override func copy() -> Any {
        return self
    }
    
    override func mutableCopy() -> Any {
        return self
    }
    
    
}

extension Notification.Name {
    static let TOKENUPDATE = Notification.Name("TOKENUPDATE")
}
