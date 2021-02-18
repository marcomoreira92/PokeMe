//
//  HomeTutorialView.swift
//  PokeMe
//
//  Created by mmalaqui on 18/02/2021.
//

import UIKit

class HomeTutorialView: UIView {

    let nibName = "HomeTutorialView"

    @IBOutlet weak var calloutBackgroundView: UIView!
    @IBOutlet weak var tutorialLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setup(){
        self.tutorialLabel.text = "tutorial.label.info".localized
    }

}


class TriangleView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: (rect.maxX/2.0), y: (rect.maxY)))
        context.addLine(to: CGPoint(x: (rect.maxX), y: rect.minY))
        context.closePath()

        let color = (UIColor(named: "color_primary")!).rgba
        context.setFillColor(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
        context.fillPath()
    }
}
