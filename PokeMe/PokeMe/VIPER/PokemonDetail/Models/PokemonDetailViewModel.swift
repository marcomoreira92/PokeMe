//
//  PokemonDetailViewModel.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of PokemonDetail
class PokemonDetailViewModel {
    var idPokemonDetail: String?
    var pokemon : PokemonDetailViewModelPokemonModel?
    init() {}
    init(pokemonDetailInteractorModel : PokemonDetailInteractorModel){
        if let interactorPokemon = pokemonDetailInteractorModel.pokemon {
            self.pokemon = PokemonDetailViewModelPokemonModel(model: interactorPokemon)
        }
    }

}

class PokemonDetailViewModelPokemonModel {
    var id : Int?
    var name : String?
    var height : Int?
    var imageURL: String?
    var weight : Int?
    
    var stats : [PokemonDetailViewModelPokemonStatModel] = []
    
    init(model: PokemonDetailInteractorPokemonModel) {
        self.id = model.id
        self.height = model.height
        self.name = model.name
        self.imageURL = model.imageURL
        self.weight = model.weight
        
        for stat in model.stats{
            var base = "0"
            if let statBase = stat.base_stat{
                base = "\(statBase)"
            }
            
            var effort = "0"
            if let statEffort = stat.effort{
                effort = "\(statEffort)"
            }
            
            self.stats.append(PokemonDetailViewModelPokemonStatModel(base_stat: base, effort: effort, statName: stat.statName))
        }
    }
}


class PokemonDetailViewModelPokemonStatModel{
    var base_stat : String?
    var effort : String?
    var statName : String?
    
    init(base_stat : String?, effort : String?, statName : String?) {
        self.base_stat = base_stat
        self.effort = effort
        self.statName = statName
    }
    
}
