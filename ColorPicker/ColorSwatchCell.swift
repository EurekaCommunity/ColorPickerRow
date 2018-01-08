//
//  ColorSwatchCell.swift
//  EurekaColorPicker
//
//  Created by Mark Alldritt on 2016-11-20.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit


class ColorSwatchCell: UICollectionViewCell {
    var swatchView : ColorSwatchView
    
    override init(frame: CGRect) {
        swatchView = ColorSwatchView(frame: CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height))

        super.init(frame: frame)
        
        contentView.addSubview(swatchView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var colorSpec : ColorSpec? {
        didSet {
            swatchView.color = colorSpec?.color
        }
    }
    
    override var isSelected: Bool {
        didSet {
            swatchView.isSelected = isSelected
        }
    }
}
