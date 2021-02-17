//
//  PokemonDetailAssembly.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

final class PokemonDetailAssembly: BaseAssembly {
    
    static func pokemonDetailPresenterNavigationController(pokemonDetailDTO: PokemonDetailDTO? = nil) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: pokemonDetailPresenterView(pokemonDetailDTO: pokemonDetailDTO))
        return navigationController
    }
    
    static func pokemonDetailPresenterView(pokemonDetailDTO: PokemonDetailDTO? = nil) -> PokemonDetailView {
        let view = PokemonDetailView(nibName: PokeMeUtils.getXib(xibFile: .pokemonDetailView), bundle: nil)
        view.presenter = pokemonDetailPresenter(view: view, pokemonDetailDTO: pokemonDetailDTO)
        return view
    }
    
    static fileprivate func pokemonDetailPresenter(view: PokemonDetailView, pokemonDetailDTO: PokemonDetailDTO? = nil) -> PokemonDetailPresenterProtocol {
        let presenter = PokemonDetailPresenter(view: view)
        presenter.router = pokemonDetailRouter(presenter: presenter, view: view)
        presenter.interactor = pokemonDetailInteractor(presenter: presenter, pokemonDetailDTO : pokemonDetailDTO)
        return presenter
    }
    
    static fileprivate func pokemonDetailRouter(presenter: PokemonDetailPresenter, view: PokemonDetailView) -> PokemonDetailRouterProtocol {
        let router = PokemonDetailRouter(presenter: presenter, view: view)
        return router
    }
    
    static fileprivate func pokemonDetailInteractor(presenter: PokemonDetailPresenterProtocol, pokemonDetailDTO: PokemonDetailDTO? = nil) -> PokemonDetailInteractorProtocol {
        let interactor = PokemonDetailInteractor(presenter: presenter)
        interactor.pokemonDetailDTO = pokemonDetailDTO
        return interactor
    }
}
