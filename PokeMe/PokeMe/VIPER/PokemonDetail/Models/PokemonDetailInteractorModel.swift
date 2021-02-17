//
//  PokemonDetailInteractorModel.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

//class that represents the interactor data
class PokemonDetailInteractorModel {
    var idPokemonDetail: Int?
    var pokemon : PokemonDetailInteractorPokemonModel?
    
    init() {
        //TODO
    }
    
    init(pokemonDetailDTO: PokemonDetailDTO?){
        if let pokemonDetailDTO = pokemonDetailDTO {
            self.idPokemonDetail = pokemonDetailDTO.pokemonID
        }
    }
}
class PokemonDetailInteractorPokemonModel {
    var id : Int?
    var name : String?
    var height : Int?
    var imageURL: String?
    
    var stats : [PokemonDetailInteractorPokemonStatsModel] = []
}

class PokemonDetailInteractorPokemonStatsModel{
    var base_stat : Int?
    var effort : Int?
    var statName : String?
}
