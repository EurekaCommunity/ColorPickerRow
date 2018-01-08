//
//  ColorRow.swift
//  EurekaColorPicker
//
//  Created by Mark Alldritt on 2016-12-05.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka


public final class ColorCell : Cell<UIColor>, CellType {
    
    var swatchView : ColorSwatchView
    var isCircular = false {
        didSet {
            swatchView.isCircular = isCircular
        }
    }
    
    private var dynamicConstraints = [NSLayoutConstraint]()

    required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        swatchView = ColorSwatchView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        swatchView.translatesAutoresizingMaskIntoConstraints = false
        swatchView.isSelected = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func update() {
        super.update()
    }
    
    open override func setup() {
        super.setup()

        swatchView.color = row.value
        selectionStyle = .none
        accessoryView = swatchView
    }
}

// MARK: ColorRow

public class _ColorRow: Row<ColorCell> {

    var isCircular = false {
        didSet {
            guard let _ = section?.form else { return }
            updateCell()
        }
    }
    
    override open func updateCell() {
        super.updateCell()
        cell.isCircular = isCircular
        cell.swatchView.color = value
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

public final class ColorRow: _ColorRow, RowType {
    
    required public init(tag: String?) {
        super.init(tag: tag)
    }
}
