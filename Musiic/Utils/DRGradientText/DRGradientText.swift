//
//  DRGradientText.swift
//  Musiic
//
//  Created by 张小强 on 2019/10/12.
//  Copyright © 2019 张小强. All rights reserved.
//

import UIKit

class DRGradientText: UIView {
    var _textLayer:CATextLayer!
    var _backLayer:CAGradientLayer!
    var _text:String! = "Label"
    var _font:UIFont! = UIFont.systemFont(ofSize: 14)
    var _startColor:UIColor! = UIColor(white: 0, alpha: 0.5)
    var _endColor:UIColor! = UIColor.clear
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        _textLayer = CATextLayer()
        
        _textLayer.alignmentMode = CATextLayerAlignmentMode.left
        _textLayer.string = _text
        _textLayer.contentsScale = UIScreen.main.scale
        _textLayer.foregroundColor = UIColor.white.cgColor
        
        let fontName = _font.fontName as CFString
        let fontRef = CGFont(fontName)
        _textLayer.font = fontRef
        _textLayer.fontSize = _font.pointSize
        
        let textSize = NSString(string: _text).size(withAttributes: [kCTFontAttributeName as NSAttributedString.Key: _font as Any])
        var frame = _textLayer.frame
        frame.size = textSize
        _textLayer.frame = CGRect(x: 8, y: self.frame.size.height/2 - frame.size.height/2, width: textSize.width, height: textSize.height)
        
        _backLayer = CAGradientLayer()
        _backLayer.colors = [_startColor.cgColor, _endColor.cgColor]
        _backLayer.locations = [NSNumber(0), NSNumber(1)]
        _backLayer.startPoint = CGPoint(x: 0, y: 1)
        _backLayer.endPoint = CGPoint(x: 1, y: 0)
        _backLayer.frame = self.bounds
//        _backLayer.mask = _textLayer 用于文字带渐变色
        
        self.layer.addSublayer(_backLayer)
        self.layer.addSublayer(_textLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame:CGRect, text:String, font:UIFont, startColor:UIColor, endColor:UIColor) {
        super.init(frame: frame)
        _text = text
        _font = font
        _startColor = startColor
        _endColor = endColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
