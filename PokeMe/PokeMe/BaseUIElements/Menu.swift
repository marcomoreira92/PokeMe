//
//  Menu.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//

import UIKit

class Menu: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var menuContainerView: UIView!
    
    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    @IBOutlet weak var pokeBallButton: UIButton!
    
    let nibName = "Menu"
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        menuContainerView.layer.shadowOpacity = 0.15
        menuContainerView.layer.shadowOffset = CGSize(width: .zero, height: 5)
        menuContainerView.layer.shadowRadius = 22
    }

}
