//
//  AppInfoRouter.swift
//  PokeMe
//
//  Created by mmalaqui on 22/02/2021.
//  
//

import Foundation
import UIKit

protocol AppInfoRouterProtocol: AnyObject {
    func presentDetailView()
}

final class AppInfoRouter: BaseRouter<AppInfoPresenterProtocol, AppInfoView>, AppInfoRouterProtocol {

    internal func presentDetailView() {
        
    }
}
