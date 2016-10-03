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

extension Bundle {
    
    static var frameworkBundle: Bundle? {
        let bundle = Bundle(for: Cribble.self)
        if let path = bundle.path(forResource: "Cribble", ofType: "bundle") {
            return Bundle(path: path)
        }
        return bundle
    }
}

class CribbleWindow: UIWindow {
    
    var touchableRect: CGRect?

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let rect = touchableRect else { return true }

        return rect.contains(point)
    }
}

open class Cribble: NSObject {

    open static let shared = Cribble()
    open var options: CribbleOptions?

    private var window: CribbleWindow?
    private var cribbleController: CribbleController?

    open var hidden: Bool = true {
        didSet {
            if !hidden {
                display()
            } else {
                hide()
            }
        }
    }

    private func display() {
        
        if window != nil {
            return
        }

        cribbleController = CribbleController.storyboardController()
        cribbleController?.options = options
        cribbleController?.onChangeOptionsButtonFrame = { [weak self] frame in
            self?.window?.touchableRect = frame
        }
        
        window = CribbleWindow(frame: UIScreen.main.bounds)
        window?.windowLevel = UIWindowLevelStatusBar + 1
        window?.rootViewController = cribbleController
        window?.makeKeyAndVisible()
    }
    
    private func hide() {
        
        if window == nil {
            return
        }

        options = cribbleController?.options

        window?.isHidden = true
        window?.rootViewController = nil
        cribbleController?.presentedViewController?.dismiss(animated: false, completion: nil)
        cribbleController = nil
        
        window?.removeFromSuperview()
        window = nil
    }
}
