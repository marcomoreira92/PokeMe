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
    func presentPokemonDetailView(dto: PokemonDetailDTO)
}

final class FavoriteListRouter: BaseRouter<FavoriteListPresenterProtocol, FavoriteListView>, FavoriteListRouterProtocol {

    func presentPokemonDetailView(dto: PokemonDetailDTO) {
        let pokemonDetail = PokemonDetailAssembly.pokemonDetailPresenterView(pokemonDetailDTO: dto)
        self.present(pokemonDetail, animated: true)
    }
}
