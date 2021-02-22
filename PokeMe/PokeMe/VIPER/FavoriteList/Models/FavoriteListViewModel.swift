//
//  FavoriteListViewModel.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of FavoriteList
class FavoriteListViewModel {
    var idFavoriteList: String?
    var pokemonList : [FavoriteListViewPokemonModel] = []
    init() {}
    init(favoriteListInteractorModel : FavoriteListInteractorModel){
        for pokemon in favoriteListInteractorModel.favoritePokemonList {
            self.pokemonList.append(FavoriteListViewPokemonModel(model: pokemon))
        }
    }

}



class FavoriteListViewPokemonModel {
    var id : Int?
    var name : String?
    var height : Int?
    var imageURL : String?
    
    init(model: FavoriteListInteractorPokemonModel) {
        self.id = model.id
        self.name = model.name
        self.height = model.height
        self.imageURL = model.imageURL
    }
}
