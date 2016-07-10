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

enum CribbleColor {

    case orange
    case green
    case blue

    var color: UIColor {
        switch self {
        case .orange:
            return UIColor.orangeColor()
        case .green:
            return UIColor.greenColor()
        case .blue:
            return UIColor.blueColor()
        }
    }

    var title: String {
        switch self {
        case .orange:
            return "Orange"
        case .green:
            return "Green"
        case .blue:
            return "Blue"
        }
    }
}

public struct CribbleOptions {
    
    let horizontalStep: CGFloat
    let verticalStep: CGFloat
    let color: UIColor

    static func colors() -> [CribbleColor] {
        return [.orange, .green, .blue]
    }
    
    static func defaultOptions() -> CribbleOptions {
        return CribbleOptions(horizontalStep: 8, verticalStep: 8, color: UIColor.redColor().colorWithAlphaComponent(0.5))
    }
}