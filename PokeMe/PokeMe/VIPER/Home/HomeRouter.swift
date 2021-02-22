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
    func presentPokemonDetailView(dto: PokemonDetailDTO)
    func presentFavoriteList()
    func presentAppInfo()
}

final class HomeRouter: BaseRouter<HomePresenterProtocol, HomeView>, HomeRouterProtocol {

    func presentPokemonDetailView(dto: PokemonDetailDTO) {
        let pokemonDetail = PokemonDetailAssembly.pokemonDetailPresenterView(pokemonDetailDTO: dto)
        self.present(pokemonDetail, animated: true)
    }
    
    func presentFavoriteList(){
        let favoriteList = FavoriteListAssembly.favoriteListPresenterView()
        self.present(favoriteList, animated: true)
    }
    
    func presentAppInfo(){
        let appInfo = AppInfoAssembly.appInfoPresenterView()
        self.present(appInfo, animated: true)
    }

}
