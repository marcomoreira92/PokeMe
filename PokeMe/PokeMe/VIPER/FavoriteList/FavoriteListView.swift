//
//  FavoriteListView.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

class FavoriteListView: BaseView<FavoriteListPresenterProtocol>, UICollectionViewDelegate, UICollectionViewDataSource {

    let screenName = "FavoriteList"
    @IBOutlet weak var infoView: InfoView!
    @IBOutlet weak var favoritesCollectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.favoriteListViewDidLoad()

    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func displayInfoView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.favoritesCollectionview.alpha = 0
            self.infoView.alpha = 1
        })
    }
    
    func displayCollectionView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.favoritesCollectionview.alpha = 1
            self.infoView.alpha = 0
        })
    }
    
    func setupCollectionView(){
        self.favoritesCollectionview.dataSource = self
        self.favoritesCollectionview.delegate = self
        self.favoritesCollectionview.register(cellType: PokemonCollectionViewCell.self)

        if let collectionViewLayout = favoritesCollectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    // MARK: collectionview delegate functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let list = self.presenter?.viewModel?.pokemonList{
            return list.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(with: PokemonCollectionViewCell.self, for: indexPath)
        
        if let pokemon = self.presenter?.viewModel?.pokemonList[indexPath.row]{
            var descriptionText = ""
            if let id = pokemon.id{
                descriptionText += "Pokémon \(id)"
            }
            if let height = pokemon.height{
                descriptionText += " \("pokemon.cell.height.label".localized): \(height)"
            }
            
            let viewModel = PokemonCollectionViewViewModel(name: pokemon.name, description: descriptionText, imageURL: pokemon.imageURL)
            cell.setup(pokemon: viewModel)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.presenter?.selectedPokemon(index: indexPath.row)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    deinit {
        //clean all references
        self.presenter?.cleanup()
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension FavoriteListView: BaseViewControllerRefresh {
    func refresh() {
        self.presenter?.favoriteListViewDidLoad()
    }
    
    func i18N() {
        self.title = "FavoriteList"
    }
    
    func initializeUI() {
        self.setupCollectionView()
    }
}
