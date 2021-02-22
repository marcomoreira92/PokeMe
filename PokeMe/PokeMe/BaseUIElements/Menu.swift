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
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var aboutAppButton: UIButton!
    @IBOutlet weak var pokeBallButton: UIButton!
    
    let nibName = "Menu"
    
    var favoritesButtonActionFunction: (()->())? = nil
    var aboutAppButtonActionFunction: (()->())? = nil
    var pokeBallButtonActionFunction: (()->())? = nil
    
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
    
    @IBAction func favoritesButtonAction(_ sender: Any) {
        if let favoriteAction = self.favoritesButtonActionFunction {
            favoriteAction()
        }else{
            "favoriteAction function is not set. use Setup funtion to initiazile component".errorLog()
        }
    }
    
    @IBAction func pokeBallButtonAction(_ sender: Any) {
        if let pokeBallAction = self.pokeBallButtonActionFunction {
            pokeBallAction()
        }else{
            "pokeBallButtonAction function is not set. use Setup funtion to initiazile component".errorLog()
        }
    }
    
    @IBAction func aboutAppButtonAction(_ sender: Any) {
        if let aboutAppAction = self.aboutAppButtonActionFunction {
            aboutAppAction()
        }else{
            "aboutAppButtonActionFunction function is not set. use Setup funtion to initiazile component".errorLog()
        }
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
    
    func setup(favoritesButtonActionFunction: @escaping()->(), aboutAppButtonActionFunction: @escaping()->(), pokeBallButtonActionFunction: @escaping()->()){
        self.favoritesButtonActionFunction = favoritesButtonActionFunction
        self.aboutAppButtonActionFunction = aboutAppButtonActionFunction
        self.pokeBallButtonActionFunction = pokeBallButtonActionFunction
    }

}
