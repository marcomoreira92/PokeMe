//
//  FavoriteListCollectionReusableView.swift
//  PokeMe
//
//  Created by mmalaqui on 22/02/2021.
//

import UIKit

class FavoriteListCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var headerTitleLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(){
        //TODO
        headerTitleLabel.text = "favorite.list.title".localized
    }
    
}
