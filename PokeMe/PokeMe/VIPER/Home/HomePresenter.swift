//
//  HomePresenter.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

protocol HomePresenterProtocol: AnyObject {
    var viewModel: HomeViewModel? { get set }
    func homeViewDidLoad()
    func cleanup()
}

final class HomePresenter: BasePresenter<HomeView, HomeRouterProtocol, HomeInteractorProtocol>, HomePresenterProtocol {
    var viewModel: HomeViewModel?
    

    func homeViewDidLoad() {
        
        self.interactor?.getHomeData(completion: { (_ homeInteractorModel:HomeInteractorModel? , _ error: HomeInteractorErrorModel?) -> Void in
            
            if let homeInteractorModel = homeInteractorModel{
                self.viewModel = HomeViewModel(homeInteractorModel: homeInteractorModel)
                //TODO: update view
                return
            }
            
            if let error = error {
                switch error {
                case .internalError:
                    //TODO:
                    "internalError".errorLog()
                    break
                case .networkError:
                    //TODO
                    "networkError".errorLog()
                    break
                    
                case .noPokemonFound:
                    //TODO
                    "no pokemon found".errorLog()
                    break
                default:
                    break
                }
                return
            }
            
            // in case there is no interactor model or error then it's an internal issue
            "Internal issue, no interactorModel or errorModel".errorLog()
            return

        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
