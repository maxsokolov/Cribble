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

class CribbleController: UIViewController {

    @IBOutlet weak var optionsButton: UIButton!

    var options: CribbleOptions?
    var onChangeOptionsButtonFrame: ((_ frame: CGRect?) -> Void)?
    var cribbleView: CribbleView? {
        return view as? CribbleView
    }
    
    static func storyboardController() -> CribbleController? {
        return UIStoryboard(name: "Cribble", bundle: Bundle.frameworkBundle).instantiateViewController(withIdentifier: String(describing: self)) as? CribbleController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup(options: options ?? CribbleOptions.defaultOptions())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        onChangeOptionsButtonFrame?(optionsButton.frame)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        onChangeOptionsButtonFrame?(nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let optionsController = segue.destination as? CribbleOptionsController else { return }
        
        optionsController.options = options
        optionsController.onOptionsChanged = { [weak self] options in

            self?.options = options
            self?.setup(options: options)
        }
    }
    
    // MARK: - Setup -

    func setup(options: CribbleOptions) {

        cribbleView?.options = options
        
        optionsButton.layer.masksToBounds = false
        optionsButton.layer.shadowRadius = 5
        optionsButton.layer.shadowOpacity = 0.2
        optionsButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        optionsButton.backgroundColor = options.cribbleColor.color
    }
}
