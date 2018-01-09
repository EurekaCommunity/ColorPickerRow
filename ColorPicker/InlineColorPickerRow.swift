//
//  InlineColorPickerRow.swift
//  ColorPicker
//
//  Created by Mark Alldritt on 2018-01-07.
//  Copyright © 2018 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka


public final class InlineColorPickerCell : Cell<UIColor>, CellType {
    
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
        selectionStyle = .default
        accessoryView = swatchView
    }
}

// MARK: InlineColorPickerRow

public class _InlineColorPickerRow: Row<InlineColorPickerCell> {
    
    open var isCircular = false {
        didSet {
            guard let _ = section?.form else { return }
            updateCell()
        }
    }
    
    open var showsPaletteNames = true {
        didSet {
            guard let _ = section?.form else { return }
            updateCell()
        }
    }

    open var palettes : [ColorPalette] = [iOS().palette,
                                            Solarised().palette,
                                            WP8().palette,
                                            Flat().palette,
                                            Material().palette,
                                            Metro().palette]

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

public final class InlineColorPickerRow: _InlineColorPickerRow, RowType, InlineRowType {
    public func setupInlineRow(_ inlineRow: ColorPickerRow) {
        inlineRow.value = value
        inlineRow.isCircular = isCircular
        inlineRow.showsCurrentSwatch = false
        inlineRow.cell.palettes = palettes
        inlineRow.showsPaletteNames = showsPaletteNames

        if value != nil, let indexPath = inlineRow.cell.indexPath(forColor: value!) {
            inlineRow.cell.colorsView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
    }
    
    public typealias InlineRow = ColorPickerRow
    
    required public init(tag: String?) {
        super.init(tag: tag)
        onExpandInlineRow { cell, row, _ in
            row.deselect()
        }
        onCollapseInlineRow { cell, row, _ in
            row.deselect()
        }
    }
    
    public override func customDidSelect() {
        super.customDidSelect()
        if !isDisabled {
            toggleInlineRow()
            
            if isExpanded {
                if value != nil, let indexPath = inlineRow?.cell.indexPath(forColor: value!) {
                    inlineRow?.cell.colorsView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
                }
            }
        }
    }
}
