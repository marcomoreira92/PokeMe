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
    func presentPokemonDetailView()
    func presentFavoriteList()
}

final class HomeRouter: BaseRouter<HomePresenterProtocol, HomeView>, HomeRouterProtocol {

    func presentPokemonDetailView() {
        
    }
    
    func presentFavoriteList(){
        let favoriteList = FavoriteListAssembly.favoriteListPresenterView()
        self.present(favoriteList, animated: true)
    }

}
