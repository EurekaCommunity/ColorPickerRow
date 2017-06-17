//
//  ColorPalettes.swift
//  EurekaColorPicker
//
//  Created by Mark Alldritt on 2016-11-20.
//  Copyright © 2017 Late Night Software Ltd. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift


public struct ColorSpec {
    public let hex : String
    public let name : String
    
    public var color : UIColor {
        return UIColor(hex)
    }
    
    public init(hex: String, name: String) {
        self.hex = hex
        self.name = name
    }
}

public struct ColorPalette {
    public let name : String
    public let palette : [ColorSpec]
    
    public init(name: String, palette: [ColorSpec]) {
        self.name = name
        self.palette = palette
    }
}

public extension Sequence where Iterator.Element == ColorPalette {
    public func combined(usingName name: String) -> ColorPalette {
        var colorSpecs = [ColorSpec]()
        for colorPalette in self {
            colorSpecs.append(contentsOf: colorPalette.palette)
        }
        return ColorPalette(name: name, palette: colorSpecs)
    }
}

public struct iOS {
    public let palette = ColorPalette(name: "Apple",
                                      palette: [ColorSpec(hex: UIColor.black.hexString(), name: "black"),
                                                ColorSpec(hex: UIColor.darkGray.hexString(), name: "dark gray"),
                                                ColorSpec(hex: UIColor.gray.hexString(), name: "gray"),
                                                ColorSpec(hex: UIColor.lightGray.hexString(), name: "light gray"),
                                                ColorSpec(hex: UIColor.white.hexString(), name: "white"),
                                                ColorSpec(hex: UIColor.red.hexString(), name: "red"),
                                                ColorSpec(hex: UIColor.green.hexString(), name: "green"),
                                                ColorSpec(hex: UIColor.blue.hexString(), name: "blue"),
                                                ColorSpec(hex: UIColor.cyan.hexString(), name: "cyan"),
                                                ColorSpec(hex: UIColor.yellow.hexString(), name: "yellow"),
                                                ColorSpec(hex: UIColor.magenta.hexString(), name: "magenta"),
                                                ColorSpec(hex: UIColor.orange.hexString(), name: "orange"),
                                                ColorSpec(hex: UIColor.purple.hexString(), name: "purple"),
                                                ColorSpec(hex: UIColor.brown.hexString(), name: "brown")])
    
    public init() {}
}

public struct Solarised {
    public let palette = ColorPalette(name: "Solarised",
                                      palette: [ColorSpec(hex: "#002b36", name: "base03"),
                                                ColorSpec(hex: "#073642", name: "base02"),
                                                ColorSpec(hex: "#586e75", name: "base01"),
                                                ColorSpec(hex: "#657b83", name: "base00"),
                                                ColorSpec(hex: "#839496", name: "base0"),
                                                ColorSpec(hex: "#93a1a1", name: "base1"),
                                                ColorSpec(hex: "#eee8d5", name: "base2"),
                                                ColorSpec(hex: "#fdf6e3", name: "base3"),
                                                ColorSpec(hex: "#b58900", name: "yellow"),
                                                ColorSpec(hex: "#cb4b16", name: "orange"),
                                                ColorSpec(hex: "#dc322f", name: "red"),
                                                ColorSpec(hex: "#d33682", name: "magenta"),
                                                ColorSpec(hex: "#6c71c4", name: "violet"),
                                                ColorSpec(hex: "#268bd2", name: "blue"),
                                                ColorSpec(hex: "#2aa198", name: "cyan"),
                                                ColorSpec(hex: "#859900", name: "green")])
    
    public init() {}
}

public struct WP8 {
    public let palette = ColorPalette(name: "WP8",
                                      palette: [ColorSpec(hex: "#A4C400", name: "lime"),
                                                ColorSpec(hex: "#60A917", name: "green"),
                                                ColorSpec(hex: "#008A00", name: "emerald"),
                                                ColorSpec(hex: "#00ABA9", name: "teal"),
                                                ColorSpec(hex: "#1BA1E2", name: "cyan"),
                                                ColorSpec(hex: "#0050EF", name: "cobalt"),
                                                ColorSpec(hex: "#6A00FF", name: "indigo"),
                                                ColorSpec(hex: "#AA00FF", name: "violet"),
                                                ColorSpec(hex: "#F472D0", name: "pink"),
                                                ColorSpec(hex: "#D80073", name: "magenta"),
                                                ColorSpec(hex: "#A20025", name: "crimson"),
                                                ColorSpec(hex: "#E51400", name: "red"),
                                                ColorSpec(hex: "#FA6800", name: "orange"),
                                                ColorSpec(hex: "#F0A30A", name: "amber"),
                                                ColorSpec(hex: "#E3C800", name: "yellow"),
                                                ColorSpec(hex: "#825A2C", name: "brown"),
                                                ColorSpec(hex: "#6D8764", name: "olive"),
                                                ColorSpec(hex: "#647687", name: "steel"),
                                                ColorSpec(hex: "#76608A", name: "mauve"),
                                                ColorSpec(hex: "#87794E", name: "taupe")])
    public init() {}
}

public struct Flat {
    public let palette = ColorPalette(name: "Flat",
                                      palette: [ColorSpec(hex: "#1abc9c", name: "turquoise"),
                                                ColorSpec(hex: "#16a085", name: "greensea"),
                                                ColorSpec(hex: "#2ecc71", name: "emerald"),
                                                ColorSpec(hex: "#27ae60", name: "nephritis"),
                                                ColorSpec(hex: "#3498db", name: "peterriver"),
                                                ColorSpec(hex: "#2980b9", name: "belizehole"),
                                                ColorSpec(hex: "#9b59b6", name: "amethyst"),
                                                ColorSpec(hex: "#8e44ad", name: "wisteria"),
                                                ColorSpec(hex: "#34495e", name: "wetasphalt"),
                                                ColorSpec(hex: "#2c3e50", name: "midnightblue"),
                                                ColorSpec(hex: "#f1c40f", name: "subflower"),
                                                ColorSpec(hex: "#f39c12", name: "orange"),
                                                ColorSpec(hex: "#e67e22", name: "carrot"),
                                                ColorSpec(hex: "#d35400", name: "pumpkin"),
                                                ColorSpec(hex: "#e74c3c", name: "alizarin"),
                                                ColorSpec(hex: "#c0392b", name: "pomegranate"),
                                                ColorSpec(hex: "#ecf0f1", name: "clouds"),
                                                ColorSpec(hex: "#bdc3c7", name: "silver"),
                                                ColorSpec(hex: "#95a5a6", name: "concrete"),
                                                ColorSpec(hex: "#7f8c8d", name: "asbestos")])
    public init() {}
}

public struct Material {
    public let palette = ColorPalette(name: "Material",
                                      palette: [ColorSpec(hex: "#f44336", name: "red"),
                                                ColorSpec(hex: "#E91E63", name: "pink"),
                                                ColorSpec(hex: "#9C27B0", name: "purple"),
                                                ColorSpec(hex: "#673AB7", name: "deeppurple"),
                                                ColorSpec(hex: "#3F51B5", name: "indego"),
                                                ColorSpec(hex: "#2196F3", name: "blue"),
                                                ColorSpec(hex: "#03A9F4", name: "lightblue"),
                                                ColorSpec(hex: "#00BCD4", name: "cyan"),
                                                ColorSpec(hex: "#009688", name: "teal"),
                                                ColorSpec(hex: "#4CAF50", name: "green"),
                                                ColorSpec(hex: "#8BC34A", name: "litegreen"),
                                                ColorSpec(hex: "#CDDC39", name: "lime"),
                                                ColorSpec(hex: "#FFEB3B", name: "yellow"),
                                                ColorSpec(hex: "#FFC107", name: "amber"),
                                                ColorSpec(hex: "#FF9800", name: "orange"),
                                                ColorSpec(hex: "#FF5722", name: "deeporange"),
                                                ColorSpec(hex: "#795548", name: "brown"),
                                                ColorSpec(hex: "#9E9E9E", name: "grey"),
                                                ColorSpec(hex: "#607D8B", name: "bluegrey")])
    public init() {}
}

public struct Metro {
    public let palette = ColorPalette(name: "Metro",
                                      palette: [ColorSpec(hex: "#a4c400", name: "lime"),
                                                ColorSpec(hex: "#60a917", name: "green"),
                                                ColorSpec(hex: "#008a00", name: "emerald"),
                                                ColorSpec(hex: "#00aba9", name: "teal"),
                                                ColorSpec(hex: "#1ba1e2", name: "cyan"),
                                                ColorSpec(hex: "#0050ef", name: "cobalt"),
                                                ColorSpec(hex: "#6a00ff", name: "indigo"),
                                                ColorSpec(hex: "#aa00ff", name: "violet"),
                                                ColorSpec(hex: "#f472d0", name: "pink"),
                                                ColorSpec(hex: "#d80073", name: "magenta"),
                                                ColorSpec(hex: "#a20025", name: "crimson"),
                                                ColorSpec(hex: "#e51400", name: "red"),
                                                ColorSpec(hex: "#fa6800", name: "orange"),
                                                ColorSpec(hex: "#f0a30a", name: "amber"),
                                                ColorSpec(hex: "#e3c800", name: "yellow"),
                                                ColorSpec(hex: "#825a2c", name: "brown"),
                                                ColorSpec(hex: "#6d8764", name: "olive"),
                                                ColorSpec(hex: "#647687", name: "steel"),
                                                ColorSpec(hex: "#76608a", name: "mauve"),
                                                ColorSpec(hex: "#a0522d", name: "sienna")])
    public init() {}
}
