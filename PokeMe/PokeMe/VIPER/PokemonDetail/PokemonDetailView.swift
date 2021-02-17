//
//  PokemonDetailView.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

class PokemonDetailView: BaseView<PokemonDetailPresenterProtocol> {

    let screenName = "PokemonDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.pokemonDetailViewDidLoad()

    }
    
    deinit {
        //clean all references
        self.presenter?.cleanup()
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension PokemonDetailView: BaseViewControllerRefresh {
    func refresh() {
        //TODO: implement all calls needed to refresh the UI
    }
    
    func i18N() {
        self.title = "PokemonDetail"
    }
    
    func initializeUI() {
        //TODO: implement all UI Setups

    }
}
