//
//  PokemonCollectionViewCell.swift
//  PokeMe
//
//  Created by mmalaqui on 15/02/2021.
//


import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokeTitleLabel: UILabel!
    @IBOutlet weak var pokeDescriptionLabel: UIView!
    @IBOutlet weak var pokeCellBackgroundView: UIView!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var favoriteContainerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(){
        //TODO
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pokeCellBackgroundView.layer.shadowOpacity = 0.15
        pokeCellBackgroundView.layer.shadowOffset = CGSize(width: .zero, height: 5)
        pokeCellBackgroundView.layer.shadowRadius = 22
        
        
        favoriteContainerView.layer.shadowOpacity = 0.15
        favoriteContainerView.layer.shadowOffset = CGSize(width: .zero, height: 5)
        favoriteContainerView.layer.shadowRadius = 10
        
        
    }

}
