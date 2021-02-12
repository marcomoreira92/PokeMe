//
//  HomeRouter.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

protocol HomeRouterProtocol: AnyObject {
    func presentDetailView()
}

final class HomeRouter: BaseRouter<HomePresenterProtocol, HomeView>, HomeRouterProtocol {

    internal func presentDetailView() {
        
    }
}
