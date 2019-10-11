//
//  ViewController.swift
//  Musiic
//
//  Created by 张小强 on 2019/9/11.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit
import Alamofire
import LoadingShimmer
import SwiftyJSON
import Kingfisher

class HomeViewController: CustomViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var datasource:Array<Any>! = []
    var final_data_source:Dictionary<String,Array<TopList>> = Dictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.collectionView.contentInsetAdjustmentBehavior = .never
//        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
        LoadingShimmer.startCovering(collectionView)
        getTopList()
        // 自定义列表
        customFlowLayout()
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell1")
        collectionView.register(UINib(nibName: "HomeCollectionHeaderReusableView", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header1")
        collectionView.register(UINib(nibName: "HomeCollectionFooterReusableView", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer1")
    }
    @objc func getTopList() {
        print("获取榜单")
        // 获取分类
        let headers: HTTPHeaders = [
            "Authorization": DRConfig.shared.token,
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
        DRNetworking.Get(
            url: "toplist/detail",
            param: ["":""],
            rHeaders: headers,
            callback: { (success, response) in
                if (success) {
                    let cate = response["list"]
                    self.datasource = cate.rawValue as? Array<Any>
                    self.final_data_source = self.calcDataSource()
                    self.collectionView.reloadData()
                }
                else {
                    
                }
                LoadingShimmer.stopCovering(self.collectionView)
        })
    }
    func customFlowLayout() {
        // 加内边距
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        collectionView.backgroundColor = UIColor(red: 30/255.0, green: 32/255.0, blue: 34/255.0, alpha: 1)
        let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        let itemWidth = (view.bounds.width - 4*2)/3
        flowLayout?.itemSize = CGSize(width: itemWidth, height: itemWidth+35)
        // 最小行间距
        flowLayout?.minimumLineSpacing = 1
        // 最小元素之间的间距
        flowLayout?.minimumInteritemSpacing = 1
        flowLayout?.headerReferenceSize = CGSize(width: view.bounds.width, height: 44)
        flowLayout?.footerReferenceSize = CGSize(width: view.bounds.width, height: 0)
    }
    func calcDataSource() -> Dictionary<String,Array<TopList>> {
        var final_data_source:Dictionary<String,Array<TopList>> = Dictionary()
        for (index,topls) in ([[String:Int]](consts.toplist_list.values)).enumerated() {
            let idx_list = [String](topls.keys)
            var toplist:Array<TopList> = []
            for idx in idx_list {
                var model:Dictionary<String,Any> = ["":""]
                self.datasource.forEach { (item) in
                    let item_dic = item as! Dictionary<String,Any>
                    let ids:Int = item_dic["id"] as! Int
                    if ids == Int(idx) {
                        model = item_dic
                        
                        if let top = try? JSONModel(TopList.self, withKeyValues: model) {
                            toplist.append(top)
                        }
                    }
                }
            }
            final_data_source[([String](consts.toplist_list.keys))[index]] = toplist
        }
        return final_data_source
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.final_data_source.values.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let l = self.final_data_source[consts.toplist_name[section]]
        else {
            return 0
        }
        return l.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! HomeCollectionViewCell
//        let topls = ([[String:Int]](consts.toplist_list.values))[indexPath.section]
//        let idx_list = [String](topls.keys)
//        let idx = idx_list[indexPath.row]
//        var model:Any = []
//        self.datasource.forEach { (item) in
//            let item_dic = item as! Dictionary<String,Any>
//            let ids:Int = item_dic["id"] as! Int
//            if ids == Int(idx) {
//                model = item
//            }
//        }
        let toplist:TopList = self.final_data_source[consts.toplist_name[indexPath.section]]![indexPath.row]
//        let data = self.datasource[indexPath.row]
//        let model = JSON(data)
//        let name  = model["name"].rawString()
//        let icon  = model["icons"][0]["url"].rawString()
//
        let url = URL(string: toplist.coverImgURL!)
        cell.imageView.kf.setImage(with: url)
        cell.label.text = toplist.name
        cell.updateFrequency.text = toplist.updateFrequency
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header1", for: indexPath) as! HomeCollectionHeaderReusableView
            
            let keys = consts.toplist_name
            view.label.text = keys[indexPath.section]
            return view
        }
        else {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footer1", for: indexPath) as! HomeCollectionFooterReusableView
            view.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 0)
            return view
        }
    }
}

