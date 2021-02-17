//
//  PokemonDetailDTO.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

//class that represents the transfer object of PokemonDetail
class PokemonDetailDTO {
    var pokemonID : Int = -1
    init(id : Int) {
        self.pokemonID = id
    }
}
