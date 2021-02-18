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
    
    func setup(pokemon: PokemonCollectionViewViewModel){
        self.pokeTitleLabel.text = (pokemon.name)?.firstCapitalized
        self.pokeDescriptionLabel.text = pokemon.description
       
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

class PokemonCollectionViewViewModel {
    var name : String?
    var description : String = ""
    var imageURL : String? = nil
    
    init(name : String?, description : String, imageURL : String?){
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }
}
