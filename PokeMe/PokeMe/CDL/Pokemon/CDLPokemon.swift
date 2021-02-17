//
//  CDLPokemon.swift
//  PokeMe
//
//  Created by mmalaqui on 15/02/2021.
//  
//

import Foundation
import UIKit
class CDLPokemon : BaseCDL{
    
    override init() {
        super.init()
        cacheID = "CDLPokemon"
    }
    
    func getPokemonByID(pokemonID: String, subscriber: CommonDataLayerSubscriber){
       
        if let pokemonModel = CommonDataLayer.shared.returnFromCache(cacheID: pokemonID){
            //pokemon is saved in cache and will be reused
            let response = CDLResponse.success(pokemonModel)
            subscriber.1(response)
            return
        }
        
        self.dataRequest(with: CommonDataLayerEndpointBuilderEnum.getPokemonByID(ID: pokemonID).endpoint, objectType: CDLPokemonModel.self, httpMethod : .get){ (result: CDLResponse) in
                switch result {
                case .success(let modelToReturn):
                    let response = CDLResponse.success(modelToReturn as CommonDataLayerBaseModel)
                    CommonDataLayer.shared.saveToCache(cacheID: pokemonID, model: modelToReturn as CommonDataLayerBaseModel)
                    subscriber.1(response)
                    break
                case .failure(let error):
                    "failed with error \(error)".errorLog()
                    let response = CDLResponse<CommonDataLayerBaseModel>.failure(error)
                    subscriber.1(response)
                    break
                }
        }
    
    }
    
}
