//
//  HomeAssembly.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

final class HomeAssembly: BaseAssembly {
    
    static func homePresenterNavigationController(homeDTO: HomeDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: homePresenterView(homeDTO: homeDTO))
        return navigationController
    }
    
    static func homePresenterView(homeDTO: HomeDTO? = nil) -> HomeView {
        let view = HomeView(nibName: PokeMeUtils.getXib(xibFile: .homeView), bundle: nil)
        view.presenter = homePresenter(view: view, homeDTO: homeDTO)
        return view
    }
    
    static fileprivate func homePresenter(view: HomeView, homeDTO: HomeDTO? = nil) -> HomePresenterProtocol {
        let presenter = HomePresenter(view: view)
        presenter.router = homeRouter(presenter: presenter, view: view)
        presenter.interactor = homeInteractor(presenter: presenter, homeDTO : homeDTO)
        return presenter
    }
    
    static fileprivate func homeRouter(presenter: HomePresenter, view: HomeView) -> HomeRouterProtocol {
        let router = HomeRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func homeInteractor(presenter: HomePresenterProtocol, homeDTO: HomeDTO? = nil) -> HomeInteractorProtocol {
        let interactor = HomeInteractor(presenter: presenter)
        interactor.homeDTO = homeDTO
        return interactor
    }
}
