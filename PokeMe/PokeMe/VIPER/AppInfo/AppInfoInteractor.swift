//
//  AppInfoInteractor.swift
//  PokeMe
//
//  Created by mmalaqui on 22/02/2021.
//  
//

import Foundation
import UIKit

protocol AppInfoInteractorProtocol: AnyObject {
    var appInfoInteractorModel : AppInfoInteractorModel? {get set}
    var appInfoDTO: AppInfoDTO? {get set}

    func getAppInfoData(completion: @escaping(_ appInfoModelEntity : AppInfoInteractorModel) -> Void)
    func cleanup()
}

final class AppInfoInteractor: BaseInteractor<AppInfoPresenterProtocol>, AppInfoInteractorProtocol {
    var InteractorID = "AppInfoInteractor"
    var appInfoInteractorModel : AppInfoInteractorModel?
    var appInfoDTO: AppInfoDTO? {
        didSet{
            self.appInfoInteractorModel = AppInfoInteractorModel(appInfoDTO: appInfoDTO)
        }
    }
    
    func getAppInfoData(completion: @escaping(_ appInfoModelEntity : AppInfoInteractorModel) -> Void) {
        //TODO: Get data and send response to completion
        /* example code
         if let appInfoInteractorModel = appInfoInteractorModel {
            completion(appInfoInteractorModel)
         }
         */
    }
    
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}
