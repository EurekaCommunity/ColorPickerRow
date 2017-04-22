//
//  ViewController.swift
//  EurekaCustomView
//
//  Created by Mark Alldritt on 2016-12-05.
//  Copyright © 2016 Late Night Software Ltd. All rights reserved.
//

import UIKit
import Eureka


class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form
            +++ Section("Color Picker Demo")
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
                <<< ColorPickerRow("colors1") { (row) in
                    row.title = "Square Color Picker"
                    row.isCircular = false
                    row.showsCurrentSwatch = true
                    row.value = UIColor.green
                }
                .onChange { (picker) in
                    print("color: \(picker.value!)")
                    if let colors2Row = self.form.rowBy(tag: "colors2") as? ColorPickerRow {
                        colors2Row.value = picker.value
                        colors2Row.updateCell()
                    }
                }
                <<< ColorPickerRow("colors2") { (row) in
                    row.title = "Circular Color Picker Without Swatch"
                    row.isCircular = true
                    row.showsCurrentSwatch = false
                    row.value = UIColor.blue
                }

            +++ Section("Section 2")
                <<< LabelRow { (row) in
                    row.title = "A Label Row"
                    row.value = "Testing"
                }
    }

}

