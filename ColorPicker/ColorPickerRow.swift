//
//  ColorPickerRow.swift
//  EurekaColorPicker
//
//  Created by Mark Alldritt on 2016-12-05.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka
import UIColor_Hex_Swift


public final class ColorPickerCell : Cell<UIColor>, CellType, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var titleLabel : UILabel
    var swatchView : ColorSwatchView
    var colorsView : UICollectionView
    var isCircular = false {
        didSet {
            swatchView.isCircular = isCircular
            if oldValue != isCircular {
                colorsView.reloadData()
            }
        }
    }
    var showsPaletteNames = true {
        didSet {
            if oldValue != showsPaletteNames {
                (colorsView.collectionViewLayout as? UICollectionViewFlowLayout)?.headerReferenceSize = showsPaletteNames ? CGSize(width: 20.0, height: 20.0) : CGSize(width: 0.0, height: 0.0)
                colorsView.reloadData()
            }
        }
    }

    public var palettes : [ColorPalette] = [iOS().palette,
                                            Solarised().palette,
                                            WP8().palette,
                                            Flat().palette,
                                            Material().palette,
                                            Metro().palette] {
        didSet {
            colorsView.reloadData()
        }
    }

    private var dynamicConstraints = [NSLayoutConstraint]()
    private var notificationObserver : NSObjectProtocol?

    required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 6, right: 10)
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.footerReferenceSize = CGSize(width: 0.0, height: 0.0)
        layout.headerReferenceSize = CGSize(width: 20.0, height: 20.0)
        layout.minimumInteritemSpacing = 2.0
        layout.minimumLineSpacing = 2.0
        layout.scrollDirection = .horizontal

        titleLabel = UILabel()
        swatchView = ColorSwatchView()
        colorsView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)

        swatchView.translatesAutoresizingMaskIntoConstraints = false
        swatchView.isSelected = true
        
        colorsView.translatesAutoresizingMaskIntoConstraints = false
        colorsView.showsHorizontalScrollIndicator = true
        colorsView.showsVerticalScrollIndicator = false
        colorsView.register(ColorSwatchCell.self, forCellWithReuseIdentifier: "swatch")
        colorsView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        colorsView.delegate = self
        colorsView.dataSource = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if let notificationObserver = notificationObserver {
            NotificationCenter.default.removeObserver(notificationObserver)
        }
    }
    
    open override func update() {
        super.update()
    }
    
    open override func setup() {
        super.setup()

        selectionStyle = .none
        layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        colorsView.backgroundColor = backgroundColor
        contentView.addSubview(titleLabel)
        contentView.addSubview(swatchView)
        contentView.addSubview(colorsView)
        
        setNeedsUpdateConstraints()
        
        notificationObserver = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIContentSizeCategoryDidChange,
                                                                      object: nil,
                                                                      queue: nil,
                                                                      using: { [weak self] (note) in
                                                                        self?.titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
                                                                        self?.setNeedsUpdateConstraints()
        })
    }
    
    open override func didSelect() {

    }
    
    open override func updateConstraints(){
        customConstraints()
        super.updateConstraints()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        
        var frame = contentView.frame
        frame.origin.x = -15
        frame.size.width += 30
        contentView.frame = frame
    }
    
    open func customConstraints() {
        contentView.removeConstraints(dynamicConstraints)
        dynamicConstraints = []

        if (titleLabel.text == "" || titleLabel.text == nil) && swatchView.isHidden {
            let views : [String: AnyObject] = ["colorsView": colorsView]
            
            dynamicConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-6-[colorsView(100)]", options: [], metrics: nil, views: views))
            dynamicConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[colorsView]-|", options: [], metrics: nil, views: views))
            contentView.addConstraints(dynamicConstraints)
        }
        else {
            let views : [String: AnyObject] = ["titleLabel" : titleLabel,
                                               "colorsView": colorsView,
                                               "swatchView": swatchView]

            dynamicConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-6-[titleLabel]-4-[colorsView(100)]|", options: [], metrics: nil, views: views))
            dynamicConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[swatchView(30)]", options: [], metrics: nil, views: views))
            dynamicConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[titleLabel]-[swatchView(30)]-30-|", options: [], metrics: nil, views: views))
            dynamicConstraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|-[colorsView]-|", options: [], metrics: nil, views: views))
            contentView.addConstraints(dynamicConstraints)
        }
    }


    public func indexPath(forColor color : UIColor?) -> IndexPath? {
        if let color = color {
            let colorHexString = color.hexString()
            var section = 0
            for palette in palettes {
                var row = 0
                for colorSpec in palette.palette {
                    if colorSpec.color.hexString() == colorHexString {
                        return IndexPath(row: row, section: section)
                    }
                    row += 1
                }
                section += 1
            }
        }
        
        return nil
    }
    
    public func colorSpec(forColor color: UIColor?) -> (palette: ColorPalette, color: ColorSpec)? {
        if let color = color,
           let indexPath = indexPath(forColor: color) {
            let palette = palettes[indexPath.section]
            let colorSpec = palette.palette[indexPath.row]
            
            return (palette: palette, color: colorSpec)
        }
        
        return nil
    }
    
    //  UICollectionViewDelegate
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let palette = palettes[indexPath.section].palette
        let newColor = palette[indexPath.row].color
        
        baseRow.baseValue = newColor
        swatchView.color = newColor
    }

    //  UICollectionViewDataSource
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return palettes.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let palette = palettes[section].palette
        
        return palette.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "swatch", for: indexPath) as! ColorSwatchCell
        let palette = palettes[indexPath.section].palette
        let colorSpec = palette[indexPath.row]
        
        cell.colorSpec = colorSpec
        cell.swatchView.isCircular = isCircular
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let v = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        
        if v.subviews.count == 0 {
            let label = UILabel(frame: CGRect(x: -36.0, y: 40.0, width: 96.0, height: 16.0))
            
            label.font = UIFont.systemFont(ofSize: 11.0)
            label.textAlignment = .center
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.black
            label.transform = CGAffineTransform(rotationAngle: (-90.0 * CGFloat.pi) / 180.0)
            label.backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 8.0
            label.tag = 1234
            
            v.addSubview(label)
        }
        
        if let label = v.viewWithTag(1234) as? UILabel {
            label.text = palettes[indexPath.section].name
        }
        
        return v
    }
}

// MARK: ColorPickerRow

public class _ColorPickerRow: Row<ColorPickerCell> {
    
    open var showsCurrentSwatch = true {
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

    open var isCircular = false {
        didSet {
            guard let _ = section?.form else { return }
            updateCell()
        }
    }
    
    override open func updateCell() {
        cell.titleLabel.text = title
        cell.isCircular = isCircular
        cell.showsPaletteNames = showsPaletteNames
        cell.swatchView.isHidden = !showsCurrentSwatch
        
        let rowHeight = showsCurrentSwatch || title?.count ?? 0 > 0 ? CGFloat(145) : CGFloat(107)
        cell.height = { return rowHeight }

        if value != cell.swatchView.color {
            cell.swatchView.color = value
        
            //  Add code to highlight the selected cell
            if value != nil, let indexPath = cell.indexPath(forColor: value!) {
                cell.colorsView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            }
        }
    }
    
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

public final class ColorPickerRow: _ColorPickerRow, RowType {
    
    required public init(tag: String?) {
        super.init(tag: tag)
    }
}
