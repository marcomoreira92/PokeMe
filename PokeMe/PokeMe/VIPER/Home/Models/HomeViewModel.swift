//
//  HomeViewModel.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

//Class that represents the model that should be used in the  view of Home
class HomeViewModel {
    var idHome: String?
    init() {}
    init(homeInteractorModel : HomeInteractorModel){
        //TODO: convert to viewModel
    }

}

class HomeViewPokemonModel {
    var id : Int?
    var name : String?
    var height : Int?
    var imageURL : String?
    
    init(homeInteractorModel : HomeInteractorPokemonModel) {
        self.id = homeInteractorModel.id
        self.name = homeInteractorModel.name
        self.height = homeInteractorModel.height
        self.imageURL = homeInteractorModel.imageURL
    }
}
