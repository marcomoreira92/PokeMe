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

    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel) -> Void)
    func cleanup()
}

final class HomeInteractor: BaseInteractor<HomePresenterProtocol>, HomeInteractorProtocol {
    var InteractorID = "HomeInteractor"
    var homeInteractorModel : HomeInteractorModel?
    var homeDTO: HomeDTO? {
        didSet{
            self.homeInteractorModel = HomeInteractorModel(homeDTO: homeDTO)
        }
    }
    
    func getHomeData(completion: @escaping(_ homeModelEntity : HomeInteractorModel) -> Void) {
        //TODO: Get data and send response to completion
        /* example code
         if let homeInteractorModel = homeInteractorModel {
            completion(homeInteractorModel)
         }
         */
    }
    
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}
