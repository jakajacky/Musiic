//
//  DRVerticalText.swift
//  Musiic
//
//  Created by 张小强 on 2019/10/12.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit

class DRVerticalText: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        
    }
    override func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: numberOfLines)
        super.drawText(in: actualRect)
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        switch self.verticalMode! {
        case .top:
            textRect.origin.y = bounds.origin.y + 5
        case .bottom:
            textRect.origin.y = bounds.origin.y + bounds.height - textRect.size.height - 5
        default:
            textRect.origin.y = (bounds.height - textRect.size.height)/2
        }
        
        return textRect
    }
}

enum VerticalMode {
    case top
    case bottom
    case middle
}

extension UILabel {
    /**
     * runtime扩展属性
     */
    private struct AssociatedKeys {
        static var kmode = "kimg"
    }
    
    var verticalMode:VerticalMode? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kmode) as? VerticalMode ?? .middle
        }
        set {
            if let value = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.kmode, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}
