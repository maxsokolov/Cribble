//
//  CribbleView.swift
//  Cribble
//
//  Created by Max Sokolov on 10/07/16.
//  Copyright © 2016 Cribble. All rights reserved.
//

import UIKit

class CribbleView: UIView {

    private var cribbleOptions = CribbleOptions.defaultOptions()

    override func drawRect(rect: CGRect) {
        
        let lineWidth = 1 / UIScreen.mainScreen().scale
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, lineWidth)
        CGContextSetStrokeColorWithColor(context, cribbleOptions.color.CGColor)
        
        // Calculate column width and row height
        let columnWidth: CGFloat = cribbleOptions.horizontalStep
        let rowHeight: CGFloat = cribbleOptions.verticalStep
        
        let numberOfColumns: CGFloat = UIScreen.mainScreen().bounds.width / columnWidth
        let numberOfRows: CGFloat = UIScreen.mainScreen().bounds.height / rowHeight
        
        // Drawing column lines
        for var i in 0..<Int(numberOfColumns) + 1 {
            
            let startPoint = CGPoint(x: columnWidth * CGFloat(i) - lineWidth, y: 0)
            let endPoint = CGPoint(x: startPoint.x, y: frame.size.height)
            
            CGContextMoveToPoint(context, startPoint.x, startPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
            CGContextStrokePath(context)
            
            i += 1
        }
        
        // Drawing row lines
        for var j in 0..<Int(numberOfRows) + 1 {
            
            let startPoint = CGPoint(x: 0, y: rowHeight * CGFloat(j) - lineWidth)
            let endPoint = CGPoint(x: frame.size.width, y: startPoint.y)
            
            CGContextMoveToPoint(context, startPoint.x, startPoint.y)
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
            CGContextStrokePath(context)
            
            j += 1
        }
    }
}