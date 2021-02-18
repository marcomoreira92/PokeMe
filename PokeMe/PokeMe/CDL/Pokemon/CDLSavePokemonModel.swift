//
//  CDLSavePokemonModel.swift
//  PokeMe
//
//  Created by mmalaqui on 18/02/2021.
//

import Foundation

class CDLSavePokemonModel : CommonDataLayerBaseModel, Codable{
    var id : Int?
    var success = false
    override init() {
        //TODO
    }
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case id = "id"

    }
    
}
