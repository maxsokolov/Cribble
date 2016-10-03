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

class CribbleView: UIView {

    var options = CribbleOptions.defaultOptions() {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        
        let lineWidth = 1 / UIScreen.main.scale
        
        let context = UIGraphicsGetCurrentContext()
        context?.setShouldAntialias(false)
        context?.setLineWidth(lineWidth)
        context?.setStrokeColor(options.cribbleColor.color.withAlphaComponent(options.opacity).cgColor)
        
        let columnWidth: CGFloat = options.horizontalStep
        let rowHeight: CGFloat = options.verticalStep
        
        let numberOfColumns: CGFloat = UIScreen.main.bounds.width / columnWidth
        let numberOfRows: CGFloat = UIScreen.main.bounds.height / rowHeight
        
        // Drawing column lines
        for var i in 0..<Int(numberOfColumns) + 1 {
            
            let startPoint = CGPoint(x: columnWidth * CGFloat(i), y: 0)
            let endPoint = CGPoint(x: startPoint.x, y: frame.size.height)
            
            context?.move(to: CGPoint(x: startPoint.x, y: startPoint.y))
            context?.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
            context?.strokePath()
            
            i += 1
        }
        
        // Drawing row lines
        for var j in 0..<Int(numberOfRows) + 1 {
            
            let startPoint = CGPoint(x: 0, y: rowHeight * CGFloat(j))
            let endPoint = CGPoint(x: frame.size.width, y: startPoint.y)
            
            context?.move(to: CGPoint(x: startPoint.x, y: startPoint.y))
            context?.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
            context?.strokePath()
            
            j += 1
        }
    }
}
