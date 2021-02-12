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
    
    var historyButtonActionFunction: (()->())? = nil
    var listButtonActionFunction: (()->())? = nil
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
    
    @IBAction func historyButtonAction(_ sender: Any) {
        if let historyAction = self.historyButtonActionFunction {
            historyAction()
        }else{
            "historyButtonAction function is not set. use Setup funtion to initiazile component".errorLog()
        }
    }
    
    @IBAction func pokeBallButtonAction(_ sender: Any) {
        if let pokeBallAction = self.pokeBallButtonActionFunction {
            pokeBallAction()
        }else{
            "pokeBallButtonAction function is not set. use Setup funtion to initiazile component".errorLog()
        }
    }
    
    @IBAction func listButtonAction(_ sender: Any) {
        if let listAction = self.listButtonActionFunction {
            listAction()
        }else{
            "listButtonActionFunction function is not set. use Setup funtion to initiazile component".errorLog()
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
    
    func setup(historyButtonActionFunction: @escaping()->(), listButtonActionFunction: @escaping()->(), pokeBallButtonActionFunction: @escaping()->()){
        self.historyButtonActionFunction = historyButtonActionFunction
        self.listButtonActionFunction = listButtonActionFunction
        self.pokeBallButtonActionFunction = pokeBallButtonActionFunction
    }

}
