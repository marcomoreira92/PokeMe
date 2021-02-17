//
//  PokemonCollectionViewCell.swift
//  PokeMe
//
//  Created by mmalaqui on 15/02/2021.
//


import UIKit
import SDWebImage

class PokemonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pokeTitleLabel: UILabel!
    @IBOutlet weak var pokeDescriptionLabel: UILabel!
    @IBOutlet weak var pokeCellBackgroundView: UIView!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var favoriteContainerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(pokemon: HomeViewPokemonModel){
        self.pokeTitleLabel.text = (pokemon.name)?.firstCapitalized
        var descriptionText = ""
        
        if let id = pokemon.id{
            descriptionText += "Pokémon \(id)"
        }
        if let height = pokemon.height{
            descriptionText += " \("pokemon.cell.height.label".localized): \(height)"
        }
        self.pokeDescriptionLabel.text = descriptionText

        
       
        if let imgURL = pokemon.imageURL {
            pokeImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            pokeImageView.sd_setImage(with: URL(string: imgURL))
        }else{
            pokeImageView.image = UIImage(named: "poke_icon")
        }

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
