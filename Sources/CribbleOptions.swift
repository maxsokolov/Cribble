//
//    Copyright (c) 2016 Max Sokolov https://twitter.com/max_sokolov
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public enum CribbleColor {

    case red
    case orange
    case green
    case blue
    case purple
    case custom(UIColor)

    var color: UIColor {
        switch self {
        case .red:
            return UIColor(red: 1, green: 97.0 / 255.0, blue: 99.0 / 255.0, alpha: 1)
        case .orange:
            return UIColor(red: 1, green: 169.0 / 255.0, blue: 97.0 / 255.0, alpha: 1)
        case .green:
            return UIColor(red: 121.0 / 255.0, green: 244.0 / 255.0, blue: 113.0 / 255.0, alpha: 1)
        case .blue:
            return UIColor(red: 97.0 / 255.0, green: 182.0 / 255.0, blue: 1, alpha: 1)
        case .purple:
            return UIColor(red: 118.0 / 255.0, green: 113.0 / 255.0, blue: 244.0 / 255.0, alpha: 1)
        case .custom(let color):
            return color
        }
    }

    var title: String {
        switch self {
        case .red:
            return "Red"
        case .orange:
            return "Orange"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        case .purple:
            return "Purple"
        case .custom:
            return "Custom"
        }
    }
}

enum CribbleImage {
    
    case close

    var image: UIImage? {
        switch self {
        case .close:
            return UIImage(named: "cribble_close_icon", inBundle: NSBundle.frameworkBundle, compatibleWithTraitCollection: nil)?.imageWithRenderingMode(.AlwaysTemplate)
        }
    }
}

public struct CribbleOptions {
    
    public let horizontalStep: CGFloat
    public let verticalStep: CGFloat
    public let opacity: CGFloat
    public let cribbleColor: CribbleColor
    
    static func defaultColors() -> [CribbleColor] {
        return [.red, .orange, .green, .blue, .purple]
    }

    static func defaultOptions() -> CribbleOptions {
        return CribbleOptions(horizontalStep: 8, verticalStep: 8, opacity: 0.5, cribbleColor: CribbleColor.red)
    }
}

extension CribbleOptions {
    
    public init(horizontalStep: CGFloat, verticalStep: CGFloat, opacity: CGFloat, color: UIColor) {
        
        self.horizontalStep = horizontalStep
        self.verticalStep = verticalStep
        self.opacity = opacity
        self.cribbleColor = .custom(color)
    }
}