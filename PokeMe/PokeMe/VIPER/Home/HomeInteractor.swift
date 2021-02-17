//
//  HomeInteractor.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

protocol HomeInteractorProtocol: AnyObject {
    var homeInteractorModel : HomeInteractorModel? {get set}
    var homeDTO: HomeDTO? {get set}

    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel?, _ error: HomeInteractorErrorModel?) -> Void)
    func getPokemonID(index: Int, completion: @escaping(_ pokemonID : Int) -> Void)
    
    func cleanup()
}

final class HomeInteractor: BaseInteractor<HomePresenterProtocol>, HomeInteractorProtocol {
    var InteractorID = "HomeInteractor"
    var homeInteractorModel : HomeInteractorModel?
    let pokemonCDL = CDLPokemon()
    
    let MAX_POKEMON_NUMBER = 898
    let MIN_POKEMON_NUMBER = 1
    
    var homeDTO: HomeDTO? {
        didSet{
            self.homeInteractorModel = HomeInteractorModel(homeDTO: homeDTO)
        }
    }
    
    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel?, _ error: HomeInteractorErrorModel?) -> Void) {
        
        let randomPokemonID = Int.random(in: (MIN_POKEMON_NUMBER-1)...MAX_POKEMON_NUMBER)
        self.getPokemonByID(id: "\(randomPokemonID)", completion: completion)
    }
    
    func getPokemonByID(id: String, completion: @escaping(_ homeModelEntity : HomeInteractorModel?, _ error: HomeInteractorErrorModel?) -> Void){
        
        self.pokemonCDL.getPokemonByID(pokemonID: id, subscriber: (self.InteractorID, { ( response: CDLResponse? ) -> Void in
    
            if let response = response {
                switch response {
                case .failure(let error):
                    "cdl responded with failure".errorLog()
                    completion(nil , HomeInteractorErrorModel.convertCDLErrorInteractorErrorModel(error: error))
                    break
                case .success(let model):
                    if let model = model as? CDLPokemonModel {
                        self.homeInteractorModel = HomeInteractorModel()
                        self.homeInteractorModel?.pokemon = HomeInteractorPokemonModel(cdlModel: model)
                        completion(self.homeInteractorModel , nil)
                        return
                    }
                    "no pokemon Found".errorLog()
                    completion(nil , HomeInteractorErrorModel.noPokemonFound)
                    return
                }
            }
        }))
        
    }
    
    func getPokemonID(index: Int, completion: @escaping(_ pokemonID : Int) -> Void){
        if let id = self.homeInteractorModel?.pokemon?.id{
            completion(id)
        }else{
            completion(-1)
        }
    }
    
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}

enum HomeInteractorErrorModel {
    case noPokemonFound
    case networkError
    case internalError
    
    static func convertCDLErrorInteractorErrorModel(error: CDLErrorType) -> HomeInteractorErrorModel{
        
        switch error {
        case .networkError(_):
            return .networkError
        default:
            break
        }
        return .internalError
    }
    
}
