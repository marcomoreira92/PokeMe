//
//  PokemonDetailRouter.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

protocol PokemonDetailRouterProtocol: AnyObject {
    func presentDetailView()
}

final class PokemonDetailRouter: BaseRouter<PokemonDetailPresenterProtocol, PokemonDetailView>, PokemonDetailRouterProtocol {

    internal func presentDetailView() {
        
    }
}
