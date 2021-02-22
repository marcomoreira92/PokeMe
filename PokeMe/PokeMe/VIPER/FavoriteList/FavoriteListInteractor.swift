//
//  FavoriteListInteractor.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

protocol FavoriteListInteractorProtocol: AnyObject {
    var favoriteListInteractorModel : FavoriteListInteractorModel? {get set}
    var favoriteListDTO: FavoriteListDTO? {get set}

    func getFavoriteListData(completion: @escaping(_ favoriteListModelEntity : FavoriteListInteractorModel?, _ error: FavoriteListInteractorErrorModel?) -> Void)
    func getPokemonID(index: Int, completion: @escaping(_ pokemonID : Int) -> Void)

    func cleanup()
}

final class FavoriteListInteractor: BaseInteractor<FavoriteListPresenterProtocol>, FavoriteListInteractorProtocol {
    var InteractorID = "FavoriteListInteractor"
    var favoriteListInteractorModel : FavoriteListInteractorModel?
    var favoriteListDTO: FavoriteListDTO? {
        didSet{
            self.favoriteListInteractorModel = FavoriteListInteractorModel(favoriteListDTO: favoriteListDTO)
        }
    }
    var cdlPokemon = CDLPokemon()
    
    func getFavoriteListData(completion: @escaping(_ favoriteListModelEntity : FavoriteListInteractorModel?, _ error: FavoriteListInteractorErrorModel?) -> Void) {
        self.cdlPokemon.getFavoriteList(subscriber: (self.InteractorID, { ( response: CDLResponse? ) -> Void in
            if let response = response {
                switch response {
                case .failure(let error):
                    "cdl responded with failure".errorLog()
                    completion(nil , FavoriteListInteractorErrorModel.convertCDLErrorInteractorErrorModel(error: error))
                    break
                case .success(let model):
                    if let model = model as? CDLFavoritePokemonListModel {
                        self.favoriteListInteractorModel = FavoriteListInteractorModel(favoriteList: model.favoritePokemonIDList)
                        completion(self.favoriteListInteractorModel , nil)
                        return
                    }
                    "no favorites  Found".errorLog()
                    completion(nil , FavoriteListInteractorErrorModel.noFavorites)
                    return
                }
            }else{
                "no favorites  Found".errorLog()
                completion(nil , FavoriteListInteractorErrorModel.noFavorites)
            }
        }))
    }
    
    func getPokemonID(index: Int, completion: @escaping(_ pokemonID : Int) -> Void){
        if let pokemonID = self.favoriteListInteractorModel?.favoritePokemonList[index].id {
            completion(pokemonID)
        }else{
            "No pokemon found".errorLog()
            completion(-1)
        }
    }

    
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}


enum FavoriteListInteractorErrorModel {
    case noFavorites
    case networkError
    case internalError
    
    static func convertCDLErrorInteractorErrorModel(error: CDLErrorType) -> FavoriteListInteractorErrorModel{
        
        switch error {
        case .networkError(_):
            return .networkError
        case .noDataError:
            return .noFavorites
        default:
            break
        }
        return .internalError
    }
}
