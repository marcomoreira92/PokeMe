//
//  FavoriteListPresenter.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

protocol FavoriteListPresenterProtocol: AnyObject {
    var viewModel: FavoriteListViewModel? { get set }
    func favoriteListViewDidLoad()
    func selectedPokemon(index: Int)
    func cleanup()
}

final class FavoriteListPresenter: BasePresenter<FavoriteListView, FavoriteListRouterProtocol, FavoriteListInteractorProtocol>, FavoriteListPresenterProtocol {
    var viewModel: FavoriteListViewModel?
    

    func favoriteListViewDidLoad() {
        self.interactor?.getFavoriteListData(completion: { (_ favoriteListInteractorModel:FavoriteListInteractorModel?, _ error : FavoriteListInteractorErrorModel?) -> Void in
            if let error = error {
                switch error {
                case .noFavorites:
                    DispatchQueue.main.async {
                        self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.noFavorites)
                        self.view?.displayInfoView()
                    }
                    return
                case .networkError:
                    DispatchQueue.main.async {
                        self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.noInternetError(buttonAction: {
                            self.view?.refresh()
                        }))
                        self.view?.displayInfoView()
                    }
                    return
                default:
                    DispatchQueue.main.async {
                        self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.internalError(buttonAction: {
                            self.view?.refresh()
                        }))
                        self.view?.displayInfoView()
                    }
                    return
                }
            }
            
            if let model = favoriteListInteractorModel {
                
                DispatchQueue.main.async {
                    self.viewModel = FavoriteListViewModel(favoriteListInteractorModel: model)
                    self.view?.favoritesCollectionview.reloadData()
                    self.view?.displayCollectionView()
                }
                return
            }
            
            //default error in case there is no error or interactor model
            DispatchQueue.main.async {
                self.view?.infoView.setup(infoViewViewEnum: InfoViewViewEnum.internalError(buttonAction: {
                    self.view?.refresh()
                }))
                self.view?.displayInfoView()
            }
        })
        
    }
    
    func selectedPokemon(index: Int){
        self.interactor?.getPokemonID(index: index, completion: {(_ id: Int) -> Void in
            let pokemonDetailDTO = PokemonDetailDTO(id: id)
            DispatchQueue.main.async {
                self.router?.presentPokemonDetailView(dto: pokemonDetailDTO)
            }
        })
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
