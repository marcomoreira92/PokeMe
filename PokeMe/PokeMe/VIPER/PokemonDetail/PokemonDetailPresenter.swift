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
        self.interactor?.getPokemonDetailData(completion: { (_ pokemonDetailInteractorModel:PokemonDetailInteractorModel?, _ error: PokemonDetailInteractorErrorModel?) -> Void in
            if let interactorModel = pokemonDetailInteractorModel{
                DispatchQueue.main.async {
                    self.viewModel = PokemonDetailViewModel(pokemonDetailInteractorModel: interactorModel)
                    self.view?.pokemonDetailCollectionview.reloadData()
                }
                return
            }
            //TODO: handle errors
            
        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
