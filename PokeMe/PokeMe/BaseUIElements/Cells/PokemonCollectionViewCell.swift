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
    @IBOutlet weak var favoriteButton: UIButton!
    
    var pokemon: PokemonCollectionViewViewModel? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(pokemon: PokemonCollectionViewViewModel){
        self.pokemon = pokemon
        
        self.pokeTitleLabel.text = (pokemon.name)?.firstCapitalized
        self.pokeDescriptionLabel.text = pokemon.description
       
        if let imgURL = pokemon.imageURL {
            pokeImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            pokeImageView.sd_setImage(with: URL(string: imgURL))
        }else{
            pokeImageView.image = UIImage(named: "poke_icon")
        }
        if(pokemon.favoriteAction == nil){
            self.favoriteContainerView.alpha = 0
            self.favoriteButton.isEnabled = false
        }else{
            self.favoriteContainerView.alpha = 1
            self.favoriteButton.isEnabled = true
        }
    }
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        self.pokemon?.favoriteAction?()
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
    
    var favoriteAction: (()->())? = nil
    
    init(name : String?, description : String, imageURL : String?, favoriteAction: (()->())? = nil){
        self.name = name
        self.description = description
        self.imageURL = imageURL
        self.favoriteAction = favoriteAction
    }
}
