//
//  CDLFavoritePokemonListModel.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//

import Foundation

class CDLFavoritePokemonListModel : CommonDataLayerBaseModel, Codable{
    var favoritePokemonIDList : [CDLPokemonModel] = []
    
    override init() {
        //TODO
    }
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case favoritePokemonIDList = "favoritePokemonIDList"

    }
}
