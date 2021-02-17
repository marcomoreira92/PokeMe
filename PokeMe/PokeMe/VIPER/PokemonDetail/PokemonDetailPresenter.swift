//
//  PokemonDetailPresenter.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

protocol PokemonDetailPresenterProtocol: AnyObject {
    var viewModel: PokemonDetailViewModel? { get set }
    func pokemonDetailViewDidLoad()
    func cleanup()
}

final class PokemonDetailPresenter: BasePresenter<PokemonDetailView, PokemonDetailRouterProtocol, PokemonDetailInteractorProtocol>, PokemonDetailPresenterProtocol {
    var viewModel: PokemonDetailViewModel?
    

    func pokemonDetailViewDidLoad() {
        //TODO
        self.interactor?.getPokemonDetailData(completion: { (_ pokemonDetailInteractorModel:PokemonDetailInteractorModel?, _ error: PokemonDetailInteractorErrorModel?) -> Void in
            //self.viewModel = PokemonDetailViewModel(pokemonDetailInteractorModel: pokemonDetailInteractorModel)
            //TODO: update view
        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
