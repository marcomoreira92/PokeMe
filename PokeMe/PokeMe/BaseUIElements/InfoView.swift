//
//  InfoView.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//

import UIKit

class InfoView: UIView {

    let nibName = "InfoView"
    
    @IBOutlet weak var errorIcon: UIImageView!
    @IBOutlet weak var errorTitleLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var errorDescriptionLabel: UILabel!
    
    var buttonAction: (()->())?
    
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
    
    @IBAction func tryAgainAction(_ sender: Any) {
        if let buttonAction = buttonAction {
            buttonAction()
        }else{
            "buttonAction is nil, check the setup function".errorLog()
        }
    }
    
    
    func setup(infoViewViewEnum: InfoViewViewEnum){
        switch infoViewViewEnum {
        case .noInternetError(let buttonAction):
            self.buttonAction = buttonAction
            self.errorTitleLabel.text = "infoview.title.no.internet.error".localized
            self.errorDescriptionLabel.text = "infoview.description.no.internet.error".localized
            self.tryAgainButton.setTitle("infoview.button.no.internet.error".localized, for: .normal)
            self.errorIcon.image = UIImage(named: "icon_no_internet")
            self.tryAgainButton.alpha = 1
            self.tryAgainButton.isEnabled = true
            break
            
        case .internalError(let buttonAction):
            self.buttonAction = buttonAction
            self.errorTitleLabel.text = "infoview.title.internal.error".localized
            self.errorDescriptionLabel.text = "infoview.description.internal.error".localized
            self.tryAgainButton.setTitle("infoview.button.internal.error".localized, for: .normal)
            self.errorIcon.image = UIImage(named: "icon_internal_error")
            self.tryAgainButton.alpha = 1
            self.tryAgainButton.isEnabled = true
            break
        
        case .noFavorites:
            self.errorTitleLabel.text = "infoview.title.no.favorites.error".localized
            self.errorDescriptionLabel.text = "infoview.description.no.favorites.error".localized
            self.errorIcon.image = UIImage(named: "icon_no_favorite_error")
            self.tryAgainButton.alpha = 0
            self.tryAgainButton.isEnabled = false
            break
        case .customError(let imageName, let title, let description, let buttonTitle, let buttonAction):
            self.buttonAction = buttonAction
            self.errorTitleLabel.text = title
            self.errorDescriptionLabel.text = description
            self.tryAgainButton.setTitle(buttonTitle, for: .normal)
            self.errorIcon.image = UIImage(named: imageName)
            self.tryAgainButton.alpha = 1
            self.tryAgainButton.isEnabled = true
            break
        }
    }

}

enum InfoViewViewEnum {
    case noInternetError(buttonAction: ()->())
    case internalError(buttonAction: ()->())
    case noFavorites
    case customError(imageName: String, title: String, description: String, buttonTitle: String, buttonAction: ()->())
}
