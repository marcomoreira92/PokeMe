//
//  PokemonDetailInteractor.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

protocol PokemonDetailInteractorProtocol: AnyObject {
    var pokemonDetailInteractorModel : PokemonDetailInteractorModel? {get set}
    var pokemonDetailDTO: PokemonDetailDTO? {get set}

    func getPokemonDetailData(completion: @escaping(_ pokemonDetailModelEntity : PokemonDetailInteractorModel) -> Void)
    func cleanup()
}

final class PokemonDetailInteractor: BaseInteractor<PokemonDetailPresenterProtocol>, PokemonDetailInteractorProtocol {
    var InteractorID = "PokemonDetailInteractor"
    var pokemonDetailInteractorModel : PokemonDetailInteractorModel?
    var pokemonDetailDTO: PokemonDetailDTO? {
        didSet{
            self.pokemonDetailInteractorModel = PokemonDetailInteractorModel(pokemonDetailDTO: pokemonDetailDTO)
        }
    }
    
    func getPokemonDetailData(completion: @escaping(_ pokemonDetailModelEntity : PokemonDetailInteractorModel) -> Void) {
        //TODO: Get data and send response to completion
        /* example code
         if let pokemonDetailInteractorModel = pokemonDetailInteractorModel {
            completion(pokemonDetailInteractorModel)
         }
         */
    }
    
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}
