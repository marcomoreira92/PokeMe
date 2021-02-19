//
//  FavoriteListInteractorModel.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

//class that represents the interactor data
class FavoriteListInteractorModel {
    var idFavoriteList: String?
    var favoritePokemonList : [FavoriteListInteractorPokemonModel] = []
    
    init() {
        //TODO
    }
    
    init(favoriteList: [CDLPokemonModel]){
        for favorite in favoriteList{
            favoritePokemonList.append(FavoriteListInteractorPokemonModel(cdlModel: favorite))
        }
    }
    
    init(favoriteListDTO: FavoriteListDTO?){
        if let favoriteListDTO = favoriteListDTO {
            //TODO convertion
        }
    }
}

class FavoriteListInteractorPokemonModel {
    var id : Int?
    var name : String?
    var height : Int?
    var imageURL : String?
    
    init(cdlModel: CDLPokemonModel) {
        self.id = cdlModel.id
        self.name = cdlModel.name
        self.height = cdlModel.height
        if let sprites = cdlModel.sprites {
            if let sprite = sprites.other{
                self.imageURL = sprite.officialartwork?.front_default
            }else{
                self.imageURL = sprites.front_default
            }
        }
    }
}
