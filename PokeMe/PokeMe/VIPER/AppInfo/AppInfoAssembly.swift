//
//  AppInfoAssembly.swift
//  PokeMe
//
//  Created by mmalaqui on 22/02/2021.
//  
//

import Foundation
import UIKit

final class AppInfoAssembly: BaseAssembly {
    
    static func appInfoPresenterNavigationController(appInfoDTO: AppInfoDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: appInfoPresenterView(appInfoDTO: appInfoDTO))
        return navigationController
    }
    
    static func appInfoPresenterView(appInfoDTO: AppInfoDTO? = nil) -> AppInfoView {
        let view = AppInfoView(nibName: PokeMeUtils.getXib(xibFile: .appInfoView), bundle: nil)
        view.presenter = appInfoPresenter(view: view, appInfoDTO: appInfoDTO)
        return view
    }
    
    static fileprivate func appInfoPresenter(view: AppInfoView, appInfoDTO: AppInfoDTO? = nil) -> AppInfoPresenterProtocol {
        let presenter = AppInfoPresenter(view: view)
        presenter.router = appInfoRouter(presenter: presenter, view: view)
        presenter.interactor = appInfoInteractor(presenter: presenter, appInfoDTO : appInfoDTO)
        return presenter
    }
    
    static fileprivate func appInfoRouter(presenter: AppInfoPresenter, view: AppInfoView) -> AppInfoRouterProtocol {
        let router = AppInfoRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func appInfoInteractor(presenter: AppInfoPresenterProtocol, appInfoDTO: AppInfoDTO? = nil) -> AppInfoInteractorProtocol {
        let interactor = AppInfoInteractor(presenter: presenter)
        interactor.appInfoDTO = appInfoDTO
        return interactor
    }
}
