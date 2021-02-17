//
//  PokemonDetailInteractor.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

protocol PokemonDetailInteractorProtocol: AnyObject {
    var pokemonDetailInteractorModel : PokemonDetailInteractorModel? {get set}
    var pokemonDetailDTO: PokemonDetailDTO? {get set}

    func getPokemonDetailData(completion: @escaping(_ pokemonDetailModelEntity : PokemonDetailInteractorModel?, _ error: PokemonDetailInteractorErrorModel?) -> Void)
    func cleanup()
}

final class PokemonDetailInteractor: BaseInteractor<PokemonDetailPresenterProtocol>, PokemonDetailInteractorProtocol {
    var InteractorID = "PokemonDetailInteractor"
    var pokemonDetailInteractorModel : PokemonDetailInteractorModel?
    var pokemonDetailDTO: PokemonDetailDTO? {
        didSet{
            self.pokemonDetailInteractorModel = PokemonDetailInteractorModel(pokemonDetailDTO: pokemonDetailDTO)
        }
    }
    let pokemonCDL = CDLPokemon()
    
    func getPokemonDetailData(completion: @escaping(_ pokemonDetailModelEntity : PokemonDetailInteractorModel?, _ error: PokemonDetailInteractorErrorModel?) -> Void) {
        if let pokemonID = self.pokemonDetailInteractorModel?.idPokemonDetail {
            self.pokemonCDL.getPokemonByID(pokemonID: "\(pokemonID)", subscriber: (self.InteractorID, { ( response: CDLResponse? ) -> Void in
                
                if let response = response {
                    switch response {
                    case .failure(let error):
                        "cdl responded with failure".errorLog()
                        completion(nil , PokemonDetailInteractorErrorModel.convertCDLErrorInteractorErrorModel(error: error))
                        break
                    case .success(let model):
                        if let model = model as? CDLPokemonModel {
                            self.pokemonDetailInteractorModel?.pokemon = PokemonDetailInteractorPokemonModel(cdlModel: model)
                            completion(self.pokemonDetailInteractorModel, nil)
                            return
                        }
                        "no pokemon Found".errorLog()
                        completion(nil , PokemonDetailInteractorErrorModel.noPokemonFound)
                        return
                    }
                }
                
            }))
        }else{
            "pokemon ID is not set".errorLog()
            completion(nil, PokemonDetailInteractorErrorModel.internalError)
        }

    }
    
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}

enum PokemonDetailInteractorErrorModel {
    case noPokemonFound
    case networkError
    case internalError
    
    static func convertCDLErrorInteractorErrorModel(error: CDLErrorType) -> PokemonDetailInteractorErrorModel{
        
        switch error {
        case .networkError(_):
            return .networkError
        default:
            break
        }
        return .internalError
    }
}
