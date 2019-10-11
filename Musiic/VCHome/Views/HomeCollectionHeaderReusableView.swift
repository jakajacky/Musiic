//
//  HomeCollectionReusableView.swift
//  Musiic
//
//  Created by 张小强 on 2019/10/8.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit

class HomeCollectionHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var showMore1: UIButton!
    @IBOutlet weak var showMore2: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.showMore1.isHidden = true
        self.showMore2.isHidden = true
    }
}
