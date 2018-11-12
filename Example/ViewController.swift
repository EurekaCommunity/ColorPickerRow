//
//  ViewController.swift
//  EurekaColorPicker
//
//  Created by Mark Alldritt on 2016-12-05.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka


class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form
            //  Build-in color palette example
            +++ Section("Color Picker Demo I")
                <<< ColorPickerRow("colors1") { (row) in
                    row.title = "Color Picker"
                    row.isCircular = false
                    row.showsCurrentSwatch = true
                    row.value = UIColor.green
                }
                .onChange { (picker) in
                    print("color1: \(picker.value!)")
                    
                    if let swatchRow = self.form.rowBy(tag: "swatch1") as? ColorRow {
                        swatchRow.value = picker.value
                        swatchRow.updateCell()
                    }
                    if let nameRow = self.form.rowBy(tag: "name1") as? LabelRow {
                        nameRow.value = picker.cell.colorSpec(forColor: picker.value)?.color.name
                        if let colorSpec = picker.cell.colorSpec(forColor: picker.value)?.color {
                            nameRow.value = "\(colorSpec.name) (\(colorSpec.hex))"
                        }
                        else {
                            nameRow.value = nil
                        }
                        nameRow.updateCell()
                    }
                }
                <<< ColorRow("swatch1") { (row) in
                    row.title = "Chosen Color"
                }
                .cellSetup { (cell, row) in
                    if let colorsRow = self.form.rowBy(tag: "colors1") as? ColorPickerRow {
                        row.value = colorsRow.value
                    }
                }
                <<< LabelRow("name1") { (row) in
                    row.title = "Chosen Color Name"
                }
                .cellSetup { (cell, row) in
                    if let colorsRow = self.form.rowBy(tag: "colors1") as? ColorPickerRow {
                        if let colorSpec = colorsRow.cell.colorSpec(forColor: colorsRow.value)?.color {
                            row.value = "\(colorSpec.name) (\(colorSpec.hex))"
                        }
                        else {
                            row.value = nil
                        }
                    }
                }
                <<< SwitchRow { (row) in
                    row.title = "Circular Swatches"
                    row.value = false
                }
                .onChange { (row) in
                    if let colorsRow = self.form.rowBy(tag: "colors1") as? ColorPickerRow {
                        colorsRow.isCircular = row.value!
                    }
                }
                <<< SwitchRow { (row) in
                    row.title = "Show Current Color Swatch"
                    row.value = true
                }
                .onChange { (row) in
                    if let colorsRow = self.form.rowBy(tag: "colors1") as? ColorPickerRow {
                        colorsRow.showsCurrentSwatch = row.value!
                    }
                }
                <<< SwitchRow { (row) in
                    row.title = "Show Palette Names"
                    row.value = true
                }
                .onChange { (row) in
                    if let colorsRow = self.form.rowBy(tag: "colors1") as? ColorPickerRow {
                        colorsRow.showsPaletteNames = row.value!
                    }
                }

            +++ Section("Color Picker Demo II")
                <<< InlineColorPickerRow("colors3") { (row) in
                    row.title = "Inline Color Picker"
                    row.value = UIColor.white
                }

            //  Custom color palette example
            +++ Section("Color Picker Demo III")
                <<< ColorPickerRow("colors2") { (row) in
                    row.title = "Color Picker"
                    row.isCircular = true
                    row.showsCurrentSwatch = false
                    row.showsPaletteNames = false
                    row.value = UIColor.white
                }
                .cellSetup { (cell, row) in
                    cell.titleLabel.textColor = .blue
                    let palette = ColorPalette(name: "All",
                                               palette: [ColorSpec(hex: "#ffffff", name: ""),
                                                         ColorSpec(hex: "#e2e2e2", name: ""),
                                                         ColorSpec(hex: "#c6c6c6", name: ""),
                                                         ColorSpec(hex: "#aaaaaa", name: ""),
                                                         ColorSpec(hex: "#8e8e8e", name: ""),
                                                         ColorSpec(hex: "#707070", name: ""),
                                                         ColorSpec(hex: "#545454", name: ""),
                                                         ColorSpec(hex: "#383838", name: ""),
                                                         ColorSpec(hex: "#1c1c1c", name: ""),
                                                         ColorSpec(hex: "#000000", name: ""),
                                                         ColorSpec(hex: "#d8fff8", name: ""),
                                                         ColorSpec(hex: "#91ffec", name: ""),
                                                         ColorSpec(hex: "#49ffe0", name: ""),
                                                         ColorSpec(hex: "#00ffd4", name: ""),
                                                         ColorSpec(hex: "#00d8b4", name: ""),
                                                         ColorSpec(hex: "#00b799", name: ""),
                                                         ColorSpec(hex: "#00967d", name: ""),
                                                         ColorSpec(hex: "#007561", name: ""),
                                                         ColorSpec(hex: "#005446", name: ""),
                                                         ColorSpec(hex: "#00332a", name: ""),
                                                         ColorSpec(hex: "#d8ffeb", name: ""),
                                                         ColorSpec(hex: "#a3ffd1", name: ""),
                                                         ColorSpec(hex: "#6dffb6", name: ""),
                                                         ColorSpec(hex: "#38ff9b", name: ""),
                                                         ColorSpec(hex: "#00ff7f", name: ""),
                                                         ColorSpec(hex: "#00d369", name: ""),
                                                         ColorSpec(hex: "#00a854", name: ""),
                                                         ColorSpec(hex: "#007c3e", name: ""),
                                                         ColorSpec(hex: "#005446", name: ""),
                                                         ColorSpec(hex: "#002613", name: ""),
                                                         ColorSpec(hex: "#d8ffd8", name: ""),
                                                         ColorSpec(hex: "#a3ffa3", name: ""),
                                                         ColorSpec(hex: "#6dff6d", name: ""),
                                                         ColorSpec(hex: "#38ff38", name: ""),
                                                         ColorSpec(hex: "#00ff00", name: ""),
                                                         ColorSpec(hex: "#00d600", name: ""),
                                                         ColorSpec(hex: "#00ad00", name: ""),
                                                         ColorSpec(hex: "#008400", name: ""),
                                                         ColorSpec(hex: "#005b00", name: ""),
                                                         ColorSpec(hex: "#003300", name: ""),
                                                         ColorSpec(hex: "#ebffd8", name: ""),
                                                         ColorSpec(hex: "#d1ffa3", name: ""),
                                                         ColorSpec(hex: "#b6ff6d", name: ""),
                                                         ColorSpec(hex: "#9bff38", name: ""),
                                                         ColorSpec(hex: "#7fff00", name: ""),
                                                         ColorSpec(hex: "#6cd800", name: ""),
                                                         ColorSpec(hex: "#59b200", name: ""),
                                                         ColorSpec(hex: "#468c00", name: ""),
                                                         ColorSpec(hex: "#336600", name: ""),
                                                         ColorSpec(hex: "#1f3f00", name: ""),
                                                         ColorSpec(hex: "#ffffd8", name: ""),
                                                         ColorSpec(hex: "#ffff91", name: ""),
                                                         ColorSpec(hex: "#ffff49", name: ""),
                                                         ColorSpec(hex: "#ffff00", name: ""),
                                                         ColorSpec(hex: "#d8d800", name: ""),
                                                         ColorSpec(hex: "#b7b700", name: ""),
                                                         ColorSpec(hex: "#969600", name: ""),
                                                         ColorSpec(hex: "#757500", name: ""),
                                                         ColorSpec(hex: "#545400", name: ""),
                                                         ColorSpec(hex: "#333300", name: ""),
                                                         ColorSpec(hex: "#fff5d8", name: ""),
                                                         ColorSpec(hex: "#ffeaad", name: ""),
                                                         ColorSpec(hex: "#ffdf82", name: ""),
                                                         ColorSpec(hex: "#ffd456", name: ""),
                                                         ColorSpec(hex: "#ffca2b", name: ""),
                                                         ColorSpec(hex: "#ffbf00", name: ""),
                                                         ColorSpec(hex: "#cc9900", name: ""),
                                                         ColorSpec(hex: "#997200", name: ""),
                                                         ColorSpec(hex: "#664c00", name: ""),
                                                         ColorSpec(hex: "#332600", name: ""),
                                                         ColorSpec(hex: "#ffebd8", name: ""),
                                                         ColorSpec(hex: "#ffd6ad", name: ""),
                                                         ColorSpec(hex: "#ffc082", name: ""),
                                                         ColorSpec(hex: "#ffaa56", name: ""),
                                                         ColorSpec(hex: "#ff952b", name: ""),
                                                         ColorSpec(hex: "#ff7f00", name: ""),
                                                         ColorSpec(hex: "#d16800", name: ""),
                                                         ColorSpec(hex: "#a05000", name: ""),
                                                         ColorSpec(hex: "#703800", name: ""),
                                                         ColorSpec(hex: "#3f1f00", name: ""),
                                                         ColorSpec(hex: "#ffe2d8", name: ""),
                                                         ColorSpec(hex: "#ffc1ad", name: ""),
                                                         ColorSpec(hex: "#ffa182", name: ""),
                                                         ColorSpec(hex: "#ff8056", name: ""),
                                                         ColorSpec(hex: "#ff602b", name: ""),
                                                         ColorSpec(hex: "#ff3f00", name: ""),
                                                         ColorSpec(hex: "#d63500", name: ""),
                                                         ColorSpec(hex: "#a82a00", name: ""),
                                                         ColorSpec(hex: "#7a1e00", name: ""),
                                                         ColorSpec(hex: "#4c1300", name: ""),
                                                         ColorSpec(hex: "#ffd8d8", name: ""),
                                                         ColorSpec(hex: "#ffadad", name: ""),
                                                         ColorSpec(hex: "#ff8282", name: ""),
                                                         ColorSpec(hex: "#ff5656", name: ""),
                                                         ColorSpec(hex: "#ff2b2b", name: ""),
                                                         ColorSpec(hex: "#ff0000", name: ""),
                                                         ColorSpec(hex: "#d10000", name: ""),
                                                         ColorSpec(hex: "#a00000", name: ""),
                                                         ColorSpec(hex: "#700000", name: ""),
                                                         ColorSpec(hex: "#3f0000", name: ""),
                                                         ColorSpec(hex: "#ffd8eb", name: ""),
                                                         ColorSpec(hex: "#ffadd6", name: ""),
                                                         ColorSpec(hex: "#ff82c0", name: ""),
                                                         ColorSpec(hex: "#ff56aa", name: ""),
                                                         ColorSpec(hex: "#ff2b95", name: ""),
                                                         ColorSpec(hex: "#ff007f", name: ""),
                                                         ColorSpec(hex: "#cc0066", name: ""),
                                                         ColorSpec(hex: "#99004c", name: ""),
                                                         ColorSpec(hex: "#660033", name: ""),
                                                         ColorSpec(hex: "#330019", name: ""),
                                                         ColorSpec(hex: "#ffd8ff", name: ""),
                                                         ColorSpec(hex: "#ffa3ff", name: ""),
                                                         ColorSpec(hex: "#ff6dff", name: ""),
                                                         ColorSpec(hex: "#ff38ff", name: ""),
                                                         ColorSpec(hex: "#ff00ff", name: ""),
                                                         ColorSpec(hex: "#d600d6", name: ""),
                                                         ColorSpec(hex: "#ad00ad", name: ""),
                                                         ColorSpec(hex: "#840084", name: ""),
                                                         ColorSpec(hex: "#5b005b", name: ""),
                                                         ColorSpec(hex: "#330033", name: ""),
                                                         ColorSpec(hex: "#ebd8ff", name: ""),
                                                         ColorSpec(hex: "#d6adff", name: ""),
                                                         ColorSpec(hex: "#c082ff", name: ""),
                                                         ColorSpec(hex: "#aa56ff", name: ""),
                                                         ColorSpec(hex: "#952bff", name: ""),
                                                         ColorSpec(hex: "#7f00ff", name: ""),
                                                         ColorSpec(hex: "#6600cc", name: ""),
                                                         ColorSpec(hex: "#4c0099", name: ""),
                                                         ColorSpec(hex: "#330066", name: ""),
                                                         ColorSpec(hex: "#190033", name: ""),
                                                         ColorSpec(hex: "#d8d8ff", name: ""),
                                                         ColorSpec(hex: "#adadff", name: ""),
                                                         ColorSpec(hex: "#8282ff", name: ""),
                                                         ColorSpec(hex: "#5656ff", name: ""),
                                                         ColorSpec(hex: "#2b2bff", name: ""),
                                                         ColorSpec(hex: "#0000ff", name: ""),
                                                         ColorSpec(hex: "#0000d1", name: ""),
                                                         ColorSpec(hex: "#0000a0", name: ""),
                                                         ColorSpec(hex: "#000070", name: ""),
                                                         ColorSpec(hex: "#00003f", name: ""),
                                                         ColorSpec(hex: "#d8e5ff", name: ""),
                                                         ColorSpec(hex: "#adc8ff", name: ""),
                                                         ColorSpec(hex: "#82abff", name: ""),
                                                         ColorSpec(hex: "#568eff", name: ""),
                                                         ColorSpec(hex: "#2b71ff", name: ""),
                                                         ColorSpec(hex: "#0055ff", name: ""),
                                                         ColorSpec(hex: "#0044cc", name: ""),
                                                         ColorSpec(hex: "#003399", name: ""),
                                                         ColorSpec(hex: "#002266", name: ""),
                                                         ColorSpec(hex: "#001133", name: ""),
                                                         ColorSpec(hex: "#d8f2ff", name: ""),
                                                         ColorSpec(hex: "#a3e0ff", name: ""),
                                                         ColorSpec(hex: "#6dceff", name: ""),
                                                         ColorSpec(hex: "#38bcff", name: ""),
                                                         ColorSpec(hex: "#00a9ff", name: ""),
                                                         ColorSpec(hex: "#008ed6", name: ""),
                                                         ColorSpec(hex: "#0073ad", name: ""),
                                                         ColorSpec(hex: "#005884", name: ""),
                                                         ColorSpec(hex: "#003d5b", name: ""),
                                                         ColorSpec(hex: "#002133", name: "")])
                    cell.palettes = [palette]
                }
                .onChange { (picker) in
                    print("color2: \(picker.value!)")
                    
                    if let swatchRow = self.form.rowBy(tag: "swatch2") as? ColorRow {
                        swatchRow.value = picker.value
                        swatchRow.updateCell()
                    }
                    if let nameRow = self.form.rowBy(tag: "name2") as? LabelRow {
                        nameRow.value = picker.cell.colorSpec(forColor: picker.value)?.color.hex
                        nameRow.updateCell()
                    }
                }
                <<< ColorRow("swatch2") { (row) in
                    row.title = "Chosen Color"
                }
                .cellSetup { (cell, row) in
                    if let colorsRow = self.form.rowBy(tag: "colors2") as? ColorPickerRow {
                        row.value = colorsRow.value
                    }
                }
                <<< LabelRow("name2") { (row) in
                    row.title = "Chosen Color Name"
                }
                .cellSetup { (cell, row) in
                    if let colorsRow = self.form.rowBy(tag: "colors2") as? ColorPickerRow {
                        row.value = colorsRow.cell.colorSpec(forColor: colorsRow.value)?.color.hex
                    }
                }
                <<< SwitchRow { (row) in
                    row.title = "Circular Swatches"
                    row.value = true
                }
                .onChange { (row) in
                    if let colorsRow = self.form.rowBy(tag: "colors2") as? ColorPickerRow {
                        colorsRow.isCircular = row.value!
                    }
                }
                <<< SwitchRow { (row) in
                    row.title = "Show Current Color Swatch"
                    row.value = false
                }
                .onChange { (row) in
                    if let colorsRow = self.form.rowBy(tag: "colors2") as? ColorPickerRow {
                        colorsRow.showsCurrentSwatch = row.value!
                    }
                }
                <<< SwitchRow { (row) in
                    row.title = "Show Palette Names"
                    row.value = false
                }
                .onChange { (row) in
                    if let colorsRow = self.form.rowBy(tag: "colors2") as? ColorPickerRow {
                        colorsRow.showsPaletteNames = row.value!
                    }
                }
    }

}

