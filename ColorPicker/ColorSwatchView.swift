//
//  ColorSwatchView.swift
//  EurekaColorPicker
//
//  Created by Mark Alldritt on 2017-04-22.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit


extension UIColor {
    func rgba() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let components = self.cgColor.components
        let numberOfComponents = self.cgColor.numberOfComponents
        
        switch numberOfComponents {
        case 4:
            return (components![0], components![1], components![2], components![3])
        case 2:
            return (components![0], components![0], components![0], components![1])
        default:
            // FIXME: Fallback to black
            return (0, 0, 0, 1)
        }
    }
    
    func blackOrWhiteContrastingColor() -> UIColor {
        let rgbaT = rgba()
        let value = 1 - ((0.299 * rgbaT.r) + (0.587 * rgbaT.g) + (0.114 * rgbaT.b));
        return value < 0.65 ? UIColor.black : UIColor.white
    }
    
    func blackOrGrayContrastingColor() -> UIColor {
        let rgbaT = rgba()
        let value = 1 - ((0.299 * rgbaT.r) + (0.587 * rgbaT.g) + (0.114 * rgbaT.b));
        return value < 0.75 ? UIColor.black : UIColor.lightGray
    }
}


class ColorSwatchView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    var isCircular = false {
        didSet {
            setNeedsDisplay()
        }
    }
    var color : UIColor? {
        didSet {
            setNeedsDisplay()
        }
    }
    var isSelected = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        if let color = color {
            let swatchRect = bounds.insetBy(dx: 1.0, dy: 1.0)
            let path = isCircular ? UIBezierPath(ovalIn: swatchRect) : UIBezierPath(roundedRect: swatchRect, cornerRadius: CGFloat(Int(swatchRect.width * 0.2)))
            
            color.setFill()
            path.fill()
            
            if isSelected {
                let frameColor = color.blackOrGrayContrastingColor()
                let selectRect = bounds.insetBy(dx: 2.0, dy: 2.0)
                let selectPath = isCircular ? UIBezierPath(ovalIn: selectRect) : UIBezierPath(roundedRect: selectRect, cornerRadius: CGFloat(Int(selectRect.width * 0.2)))

                frameColor.setStroke()
                selectPath.lineWidth = 3.0
                selectPath.stroke()
                
                if frameColor == UIColor.white && false {
                    let outlinePath = isCircular ? UIBezierPath(ovalIn: bounds) : UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(Int(bounds.width * 0.2)))
                    UIColor.black.setStroke()
                    outlinePath.lineWidth = 0.5
                    outlinePath.stroke()
                }
            }
        }
    }
}
