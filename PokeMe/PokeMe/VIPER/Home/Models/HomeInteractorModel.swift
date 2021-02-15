//
//  HomeInteractorModel.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

//class that represents the interactor data
class HomeInteractorModel {
    var idHome: String?
    var pokemon : HomePokemonModel?
    
    init() {
        //TODO
    }
    
    init(homeDTO: HomeDTO?){
        if let homeDTO = homeDTO {
            //TODO convertion
        }
    }
}

class HomePokemonModel {
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
