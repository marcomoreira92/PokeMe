//
//  FavoriteListAssembly.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

final class FavoriteListAssembly: BaseAssembly {
    
    static func favoriteListPresenterNavigationController(favoriteListDTO: FavoriteListDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: favoriteListPresenterView(favoriteListDTO: favoriteListDTO))
        return navigationController
    }
    
    static func favoriteListPresenterView(favoriteListDTO: FavoriteListDTO? = nil) -> FavoriteListView {
        let view = FavoriteListView(nibName: PokeMeUtils.getXib(xibFile: .favoriteListView), bundle: nil)
        view.presenter = favoriteListPresenter(view: view, favoriteListDTO: favoriteListDTO)
        return view
    }
    
    static fileprivate func favoriteListPresenter(view: FavoriteListView, favoriteListDTO: FavoriteListDTO? = nil) -> FavoriteListPresenterProtocol {
        let presenter = FavoriteListPresenter(view: view)
        presenter.router = favoriteListRouter(presenter: presenter, view: view)
        presenter.interactor = favoriteListInteractor(presenter: presenter, favoriteListDTO : favoriteListDTO)
        return presenter
    }
    
    static fileprivate func favoriteListRouter(presenter: FavoriteListPresenter, view: FavoriteListView) -> FavoriteListRouterProtocol {
        let router = FavoriteListRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func favoriteListInteractor(presenter: FavoriteListPresenterProtocol, favoriteListDTO: FavoriteListDTO? = nil) -> FavoriteListInteractorProtocol {
        let interactor = FavoriteListInteractor(presenter: presenter)
        interactor.favoriteListDTO = favoriteListDTO
        return interactor
    }
}
