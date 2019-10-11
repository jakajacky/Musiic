//
//  DRNetworking.swift
//  Musiic
//
//  Created by 张小强 on 2019/9/12.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var client_id = "9c244d8eaa8641d6bad86c1f7fb5fdcb"; // Your client id
var client_secret = "e8ee50436d4645d0b30e9cad8cafeafb"; // Your secret

var BaseUrl = "http://localhost:1234"

var access_token = ""
typealias CallBack = (Bool, JSON) -> Void

class DRNetworking: NSObject {
    private class func getDefaultHeader() -> HTTPHeaders {
        let uft8nEncodeData:NSData = (client_id + ":" + client_secret).data(using: .utf8, allowLossyConversion: true)! as NSData
        let base64EncodeString = uft8nEncodeData.base64EncodedString(options: .init(rawValue: 0))
        
        let defaultHeader: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Basic " + base64EncodeString,
        ]
        
        return defaultHeader
    }
    
    // 类方法
    static func Get(url: String, param: Parameters, rHeaders: HTTPHeaders, callback: @escaping CallBack) {
        // 自定义header
        var headers: HTTPHeaders = getDefaultHeader()
        if rHeaders.count > 0 {
            rHeaders.forEach { (header) in
                headers.add(header)
            }
        }
        
        AF.request(URL(string: String(format: "%@/%@", BaseUrl, url))!, method: .get, parameters: param, encoding: URLEncoding.default, headers: headers)
        .responseJSON { response in
            debugPrint(response)
            switch response.result {
                case .success(let json):
//                    let res = json as! Dictionary<String, Any>
                    let res  = JSON(json)
                    callback(true, res)
                case .failure(let error):
                    let err = JSON(error)
                    callback(false, err)
            }
        }
    }
    static func Post(url: String, param: Parameters, rHeaders: HTTPHeaders, callback: @escaping CallBack) {
        // 自定义header
        var headers: HTTPHeaders = getDefaultHeader()
        if rHeaders.count > 0 {
            rHeaders.forEach { (header) in
                headers.add(header)
            }
        }
        
        AF.request(URL(string: String(format: "%@/%@", BaseUrl, url))!, method: .post, parameters: param, encoding: URLEncoding.default, headers: headers)
        .responseJSON(completionHandler: { (response) in
            debugPrint(response)
            switch response.result {
                case .success(let json):
                    let res = JSON(json)
                    callback(true, res)
                case .failure(let error):
                    let err = JSON(error)
                    callback(false, err)
            }
        })
    }
    
}
