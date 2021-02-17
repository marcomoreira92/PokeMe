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
                DispatchQueue.main.async {
                    self.viewModel = HomeViewModel(homeInteractorModel: homeInteractorModel)
                    self.view?.homeCollectionView.reloadData()
                    self.view?.displayCollectionView()
                }
                return
            }
            
            if let error = error {
                switch error {
                case .internalError:
                    "internalError".errorLog()
                    DispatchQueue.main.async {
                        self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.internalError(buttonAction: {
                            self.view?.refresh()
                        }))
                        self.view?.displayInfoView()
                    }
                    break
                case .networkError:
                    "networkError".errorLog()
                    DispatchQueue.main.async {
                        self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.noInternetError(buttonAction: {
                            self.view?.refresh()
                        }))
                        self.view?.displayInfoView()
                    }
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
            DispatchQueue.main.async {
                self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.internalError(buttonAction: {
                    self.view?.refresh()
                }))
                self.view?.displayInfoView()
            }
            return

        })
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
