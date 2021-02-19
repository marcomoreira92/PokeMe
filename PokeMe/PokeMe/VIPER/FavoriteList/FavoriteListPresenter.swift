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
        //TODO
        self.interactor?.getFavoriteListData(completion: { (_ favoriteListInteractorModel:FavoriteListInteractorModel) -> Void in
            self.viewModel = FavoriteListViewModel(favoriteListInteractorModel: favoriteListInteractorModel)
            //TODO: update view
        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
