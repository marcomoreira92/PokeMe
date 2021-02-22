//
//  FavoriteListPresenter.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

protocol FavoriteListPresenterProtocol: AnyObject {
    var viewModel: FavoriteListViewModel? { get set }
    func favoriteListViewDidLoad()
    func cleanup()
}

final class FavoriteListPresenter: BasePresenter<FavoriteListView, FavoriteListRouterProtocol, FavoriteListInteractorProtocol>, FavoriteListPresenterProtocol {
    var viewModel: FavoriteListViewModel?
    

    func favoriteListViewDidLoad() {
        self.interactor?.getFavoriteListData(completion: { (_ favoriteListInteractorModel:FavoriteListInteractorModel?, _ error : FavoriteListInteractorErrorModel?) -> Void in
            if let error = error {
                switch error {
                case .noFavorites:
                    DispatchQueue.main.async {
                        self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.noFavorites)
                        self.view?.displayInfoView()
                    }
                    return
                case .networkError:
                    DispatchQueue.main.async {
                        self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.noInternetError(buttonAction: {
                            self.view?.refresh()
                        }))
                        self.view?.displayInfoView()
                    }
                    return
                default:
                    return
                }
            }
            //TODO: update view
        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
