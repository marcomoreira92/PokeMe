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
    var weight : Int?
    var stats : [PokemonDetailInteractorPokemonStatsModel] = []
    
    init(cdlModel: CDLPokemonModel){
        self.id = cdlModel.id
        self.name = cdlModel.name
        self.height = cdlModel.height
        self.weight = cdlModel.weight
        
        if let sprites = cdlModel.sprites {
            if let sprite = sprites.other{
                self.imageURL = sprite.officialartwork?.front_default
            }else{
                self.imageURL = sprites.front_default
            }
        }
        
        if let cdlStats = cdlModel.stats{
            for cdlStat in cdlStats{
                let base_stat = cdlStat.base_stat
                let effort = cdlStat.effort
                let statName = cdlStat.stat?.name
                self.stats.append(PokemonDetailInteractorPokemonStatsModel(base_stat: base_stat, effort: effort, statName: statName))
            }
        }
    }
}

class PokemonDetailInteractorPokemonStatsModel{
    var base_stat : Int?
    var effort : Int?
    var statName : String?
    
    init(base_stat : Int?, effort : Int?, statName : String?) {
        self.base_stat = base_stat
        self.effort = effort
        self.statName = statName
    }
    
}
