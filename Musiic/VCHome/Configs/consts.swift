//
//  const.swift
//  Musiic
//
//  Created by 张小强 on 2019/10/11.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit
@_exported import SnapKit

class consts: NSObject {
    static let toplist_name = [
        "官方榜",
        "推荐榜",
        "全球榜",
        "更多榜单"
    ]
    static let toplist_list:Dictionary<String,Dictionary<String,Int>> = [
        "官方榜": [
            "19723756":3, // 云音乐飙升榜
            "3779629":0, // 云音乐新歌榜
            "3778678":1, // 云音乐热歌榜
            "2884035":2, // 网易原创歌曲榜
        ],
        "推荐榜": [
            "991319590":23, // 云音乐说唱榜
            "1978921795":25, // 云音乐电音榜
            "10520166":4, // 云音乐国电榜
            "2809577409":32, // 云音乐欧美新歌榜
            "2250011882":26, // 抖音排行榜
            "71385702":22, // 云音乐ACG音乐榜
            "2809513713":31, // 云音乐欧美热歌榜
            "4395559":17, // 华语金曲榜
            "21845217":7 // KTV唛榜
        ],
        "全球榜": [
            "60198":6, // 美国Billboard周榜
            "180106":5, // UK排行榜
            "3812895":21, // Beatport全球电子舞曲排行榜TOP100
            "60131":10, // 日本Oricon周榜
            "11641012":8, // iTunes榜
            "2023401535":29 // 英国Q杂志中文版周榜
        ],
        "更多榜单": [
            "745956260":28, // 云音乐韩语榜
            "112504":14, // 中国TOP排行榜（港台榜）
            "64016":15, // 中国TOP排行榜（内地榜）
            "2617766278":27, // 新声榜"
            "10169002":16, // 香港电台中文歌曲龙虎榜
            "2006508653":30, // 电竞音乐榜
            "2847251561":33, // 说唱TOP榜
            "1899724":18, // 中国嘻哈榜
            "71384707":24, // 云音乐古典音乐榜
        ]
    ]
}
