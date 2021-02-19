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

    func getFavoriteListData(completion: @escaping(_ favoriteListModelEntity : FavoriteListInteractorModel) -> Void)
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
    
    func getFavoriteListData(completion: @escaping(_ favoriteListModelEntity : FavoriteListInteractorModel) -> Void) {
        //TODO: Get data and send response to completion
        /* example code
         if let favoriteListInteractorModel = favoriteListInteractorModel {
            completion(favoriteListInteractorModel)
         }
         */
    }
    
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}
