By [Mark Alldritt](http://markalldritt.com).

## NEW

Added a new inline color picker row (inlineCOLORpickerow) for version 1.2.

## Introduction

ColorPickerRow is a [Eureka](https://github.com/xmartlabs/Eureka) custom row that allows you to choose colors.  ColorRow lets you display a color in a row.

![Demo](Screenshots/ColorPicker.gif)

## ColorPickerRow & InlineColorPickerRow Usage

```swift
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form
            +++ Section("Color Picker Demo")
                <<< ColorPickerRow("colors1") { (row) in
                    row.title = "Color Picker"
                    row.isCircular = false
                    row.showsCurrentSwatch = true
                    row.showsPaletteNames = true
                    row.value = UIColor.green
                }
                .onChange { (picker) in
                    print("color1: \(picker.value!)")
                }
    }
}
```

## ColorRow Usage

```swift
import Eureka

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        form
            +++ Section("Color Swatch Demo")
                <<< ColorRow("swatch1") { (row) in
                    row.title = "Chosen Color"
                    row.value = UIColor.green
                }
    }
}
```

## Requirements

* iOS 10.0+
* Xcode 8.3+
* Eureka 2.0.*

## Getting involved

* If you **want to contribute** please feel free to **submit pull requests**.
* If you **have a feature request** please **open an issue**.
* If you **found a bug** or **need help** please **check older issues, [FAQ](#faq) before submitting an issue.**.

Before contribute check the [CONTRIBUTING](https://github.com/EurekaCommunity/ImageRow/blob/master/CONTRIBUTING.md) file for more info.

If you use **ColorPickerRow** in your app I would love to hear about it! Drop me a line on [twitter](https://twitter.com/alldritt).

## Installation

1. Add the following to your Podfile:
  
~~~~
    pod 'ColorPickerRow', :git => 'https://github.com/EurekaCommunity/ColorPickerRow'  
    pod 'UIColor_Hex_Swift'
~~~~
    
2. Run `$ pod install`

## ColorPickerRow Customization

- `isCircular` allows you to choose between circular and rounded square color swatches.

- `showsCurrentSwatch` determines if the row displays a swatch to the right of the row title showing the currently selected color.

- `showsPaletteNames` determines if color palette names are displayed in the color row.

- `cell.palettes` you can also customize the color palette(s) displayed by configuring the cell's `palettes` property.  Here's a brief example (note that a more complete example of how to do this is included in the Example application).'

```swift
                <<< ColorPickerRow("colors") { (row) in
                    row.title = "Color Picker"
                    row.isCircular = true
                    row.showsCurrentSwatch = false
                    row.showsPaletteNames = false
                    row.value = UIColor.white
                }
                .cellSetup { (cell, row) in
                    let palette = ColorPalette(name: "All",
                                               palette: [ColorSpec(hex: "#ffffff", name: "White"),
                                                         ColorSpec(hex: "#000000", name: "Black")])
                    cell.palettes = [palette]
                }
```

## InlineColorPickerRow Customization

- `isCircular` allows you to choose between circular and rounded square color swatches.

- `showsCurrentSwatch` determines if the row displays a swatch to the right of the row title showing the currently selected color.

- `showsPaletteNames` determines if color palette names are displayed in the color row.

## ColorRow Customization

- `isCircular` allows you to choose between circular and rounded square color swatches.


## Author

- [Mark Alldritt](http://markalldritt.com)

## FAQ

nothing yet

## Applications using ColorPickerRow

- [Tennis Cards](https://itunes.apple.com/us/app/tennis-cards/id1212377801?mt=8)

## Other Rows

See my other contributions to the Eureka Community:

- [ViewRow](https://github.com/EurekaCommunity/ViewRow)
