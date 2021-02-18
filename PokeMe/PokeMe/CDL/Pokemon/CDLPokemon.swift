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
                    if let model = modelToReturn{
                        let response = CDLResponse.success(model as CommonDataLayerBaseModel)
                        CommonDataLayer.shared.saveToCache(cacheID: pokemonID, model: model as CommonDataLayerBaseModel)
                        subscriber.1(response)
                    }else{
                        let response = CDLResponse<CommonDataLayerBaseModel>.failure(CDLErrorType.noDataError)
                        subscriber.1(response)
                        break
                    }
                    break
                case .failure(let error):
                    "failed with error \(error)".errorLog()
                    let response = CDLResponse<CommonDataLayerBaseModel>.failure(error)
                    subscriber.1(response)
                    break
                }
        }
    }
    
    func saveFavorite(pokemonModel: CDLPokemonModel, subscriber: CommonDataLayerSubscriber){
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(pokemonModel)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            let data = (json!.data(using: .utf8))! as Data
            
            self.dataRequest(with: CommonDataLayerEndpointBuilderEnum.saveFavorite.endpoint, objectType: CDLSavePokemonModel.self, httpMethod : .post, parameters: data){ (result: CDLResponse) in
                switch result {
                case .success(_):
                    let cdlSavePokemonModel = CDLSavePokemonModel()
                    cdlSavePokemonModel.success = true
                    let response = CDLResponse.success(cdlSavePokemonModel as CommonDataLayerBaseModel)
                    subscriber.1(response)
                    break
                case .failure(let error):
                    "failed with error \(error)".errorLog()
                    let response = CDLResponse<CommonDataLayerBaseModel>.failure(error)
                    subscriber.1(response)
                    break
                }
                
            }
            
            
        }catch{
            let response = CDLResponse<CommonDataLayerBaseModel>.failure(CDLErrorType.invalidParameters)
            subscriber.1(response)
        }

    }
    
}
