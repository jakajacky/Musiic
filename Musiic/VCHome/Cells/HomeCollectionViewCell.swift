//
//  HomeCollectionViewCell.swift
//  Musiic
//
//  Created by 张小强 on 2019/10/8.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: DRVerticalText!
    @IBOutlet weak var updateFrequency: UILabel!
    var updateFrequencyTime: DRGradientText!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        updateFrequencyTime = DRGradientText(frame: CGRect(x: 0, y: 0, width: 150, height: 50), text: "--", font: UIFont.systemFont(ofSize: 12),startColor: UIColor(white: 0, alpha: 0.5), endColor: UIColor.clear)
        self.addSubview(updateFrequencyTime)
        
        updateFrequencyTime.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(imageView.snp.bottom)
            make.height.equalTo(20)
        }
        
        label.verticalMode = .top
    }
    
    func clear() {
        self.subviews.forEach { (subview) in
            if subview.isKind(of: DRGradientText.self) {
                let drg = subview as! DRGradientText
                drg._text = ""
            }
        }
    }
}
