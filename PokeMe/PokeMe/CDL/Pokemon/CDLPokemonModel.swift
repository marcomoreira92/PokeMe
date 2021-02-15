//
//  CDLPokemonModel.swift
//  PokeMe
//
//  Created by mmalaqui on 15/02/2021.
//  
//

import Foundation
import UIKit

class CDLPokemonModel : CommonDataLayerBaseModel, Codable{
    var id : Int?
    var name : String?
    var height : Int?
    var stats : [CDLStatsModel]?
    var sprites : CDLspritesModel?
    
    override init() {
        //TODO
    }
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case height = "height"
        case stats = "stats"
        case sprites = "sprites"
    }
    
}

class CDLStatsModel: CommonDataLayerBaseModel, Codable {
    var base_stat : Int?
    var effort : Int?
    var stat :CDLStatDescriptionModel?
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case base_stat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
}

class CDLStatDescriptionModel: CommonDataLayerBaseModel, Codable {
    var name : String?
    var url : String?
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

class CDLspritesModel: CommonDataLayerBaseModel, Codable  {
    var back_default : String?
    var front_default : String?
    var other : CDLSpritesOtherModel?
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case back_default = "back_default"
        case front_default = "front_default"
        case other = "other"
    }
}

class CDLSpritesOtherModel: CommonDataLayerBaseModel, Codable {
    var officialartwork : CDLSpritesOtherOfficialartworkModel?
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case officialartwork = "official-artwork"
    }
}

class CDLSpritesOtherOfficialartworkModel: CommonDataLayerBaseModel, Codable {
    var front_default : String?
    
    //enum to match model properties and JSON names
    enum CodingKeys: String, CodingKey {
        case front_default = "front_default"
    }
}
