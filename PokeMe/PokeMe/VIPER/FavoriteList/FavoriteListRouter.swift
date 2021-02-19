//
//  FavoriteListRouter.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

protocol FavoriteListRouterProtocol: AnyObject {
    func presentDetailView()
}

final class FavoriteListRouter: BaseRouter<FavoriteListPresenterProtocol, FavoriteListView>, FavoriteListRouterProtocol {

    internal func presentDetailView() {
        
    }
}
