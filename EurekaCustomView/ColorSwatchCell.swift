//
//  ColorSwatchCell.swift
//  ColorPickerRow
//
//  Created by Mark Alldritt on 2016-11-20.
//  Copyright © 2016 Late Night Software Ltd. All rights reserved.
//

import UIKit



class ColorSwatchCell: UICollectionViewCell {
    var swatchView : ColorSwatchView
    
    override init(frame: CGRect) {
        swatchView = ColorSwatchView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))

        super.init(frame: frame)
        
        swatchView.backgroundColor = UIColor.clear
        contentView.addSubview(swatchView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var color : UIColor? {
        didSet {
            swatchView.color = color
        }
    }
    
    override var isSelected: Bool {
        didSet {
            swatchView.isSelected = isSelected
        }
    }
}
