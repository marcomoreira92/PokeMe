//
//  ShadowView.swift
//  PokeMe
//
//  Created by mmalaqui on 18/02/2021.
//

import Foundation
import UIKit

class ShadowView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.shadowOpacity = 0.15
        self.layer.shadowOffset = CGSize(width: .zero, height: 5)
        self.layer.shadowRadius = 22
    }
}
