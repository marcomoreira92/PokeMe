//
//  HomeViewCollectionReusableHeaderView.swift
//  PokeMe
//
//  Created by mmalaqui on 18/02/2021.
//

import UIKit

class HomeViewCollectionReusableHeaderView: UICollectionReusableView {

    @IBOutlet weak var subtitleLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        self.subtitleLabel.text = "home.header.subtitle.label".localized
    }
}
