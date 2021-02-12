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
        //TODO
        self.interactor?.getHomeData(completion: { (_ homeInteractorModel:HomeInteractorModel) -> Void in
            self.viewModel = HomeViewModel(homeInteractorModel: homeInteractorModel)
            //TODO: update view
        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
