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

class CribbleOptionsController: UIViewController {

    @IBOutlet weak var optionsView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var sizeTextField: UITextField!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var colorValueLabel: UILabel!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var opacityValueLabel: UILabel!
    @IBOutlet weak var separatorView1: UIView!
    @IBOutlet weak var separatorView2: UIView!
    @IBOutlet weak var separatorView1HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var separatorView2HeightConstraint: NSLayoutConstraint!
    
    private var currentColorIndex = 0
    private var colors: [CribbleColor] {
        return options?.colors() ?? []
    }
    var options: CribbleOptions? {
        didSet {
            currentColorIndex = colors.indexOf { $0.title == options?.cribbleColor.title } ?? 0
        }
    }
    var onOptionsChanged: ((options: CribbleOptions) -> Void)?
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let separatorHeight = 1 / UIScreen.mainScreen().scale
        
        separatorView1HeightConstraint.constant = separatorHeight
        separatorView2HeightConstraint.constant = separatorHeight

        setupShadows()
        setup(color: colors[currentColorIndex])
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
    }
    
    // MARK: - Setup -
    
    func setup(color cribbleColor: CribbleColor) {

        view.backgroundColor = cribbleColor.color
        separatorView1.backgroundColor = cribbleColor.color
        separatorView2.backgroundColor = cribbleColor.color
        sizeLabel.textColor = cribbleColor.color
        sizeTextField.textColor = cribbleColor.color
        colorLabel.textColor = cribbleColor.color
        colorValueLabel.textColor = cribbleColor.color
        opacityLabel.textColor = cribbleColor.color
        opacityValueLabel.textColor = cribbleColor.color
        opacitySlider.minimumTrackTintColor = cribbleColor.color
        opacitySlider.maximumTrackTintColor = cribbleColor.color
        closeButton.tintColor = cribbleColor.color

        sizeTextField.text = "\(Int(options?.horizontalStep ?? 8))"
        colorValueLabel.text = cribbleColor.title
        opacitySlider.value = Float(options?.opacity ?? 0.5)
        opacityValueLabel.text = String(format: "%.1f", options?.opacity ?? opacitySlider.value)
    }
    
    func setupShadows() {
        
        optionsView.layer.masksToBounds = false
        optionsView.layer.shadowRadius = 5
        optionsView.layer.shadowOpacity = 0.1
        optionsView.layer.shadowOffset = CGSizeMake(0, 10)
        
        closeButton.layer.masksToBounds = false
        closeButton.layer.shadowRadius = 5
        closeButton.layer.shadowOpacity = 0.1
        closeButton.layer.shadowOffset = CGSizeMake(0, 10)
        closeButton.setImage(CribbleImage.close.image, forState: .Normal)
    }

    // MARK: - IB Actions -

    @IBAction func colorButtonClicked(sender: UIButton) {

        currentColorIndex += 1
        if currentColorIndex == colors.count {
            currentColorIndex = 0
        }
        
        let color = colors[currentColorIndex]
        
        UIView.animateWithDuration(0.4) {
            self.setup(color: color)
        }
    }
    
    @IBAction func closeButtonClicked(sender: UIButton) {
        
        let step = Float(sizeTextField.text ?? "") ?? 8
        let opacity = opacitySlider.value

        let options = CribbleOptions(horizontalStep: CGFloat(step), verticalStep: CGFloat(step), opacity: CGFloat(opacity), cribbleColor: colors[currentColorIndex])

        onOptionsChanged?(options: options)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func opacityValueChanged(slider: UISlider) {
        opacityValueLabel.text = String(format: "%.1f", slider.value)
    }
}