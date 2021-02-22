//
//  AppInfoPresenter.swift
//  PokeMe
//
//  Created by mmalaqui on 22/02/2021.
//  
//

import Foundation
import UIKit

protocol AppInfoPresenterProtocol: AnyObject {
    var viewModel: AppInfoViewModel? { get set }
    func appInfoViewDidLoad()
    func cleanup()
}

final class AppInfoPresenter: BasePresenter<AppInfoView, AppInfoRouterProtocol, AppInfoInteractorProtocol>, AppInfoPresenterProtocol {
    var viewModel: AppInfoViewModel?
    

    func appInfoViewDidLoad() {
        //TODO
        self.interactor?.getAppInfoData(completion: { (_ appInfoInteractorModel:AppInfoInteractorModel) -> Void in
            self.viewModel = AppInfoViewModel(appInfoInteractorModel: appInfoInteractorModel)
            //TODO: update view
        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
