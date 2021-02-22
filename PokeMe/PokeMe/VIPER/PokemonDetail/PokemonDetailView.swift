//
//  PokemonDetailView.swift
//  PokeMe
//
//  Created by mmalaqui on 17/02/2021.
//  
//

import Foundation
import UIKit

class PokemonDetailView: BaseView<PokemonDetailPresenterProtocol>, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let screenName = "PokemonDetail"
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var infoView: InfoView!
    @IBOutlet weak var pokemonDetailCollectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.pokemonDetailViewDidLoad()
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: collectionview delegate functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(with: PokemonCollectionViewCell.self, for: indexPath)
            
            if let pokemon = self.presenter?.viewModel?.pokemon {
                
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
        
        let cell = collectionView.dequeueReusableCell(with: PokemonStatsCollectionViewCell.self, for: indexPath)
        if let stats = self.presenter?.viewModel?.pokemon?.stats{
            var pokemonStatsCollectionViewCellViewModel : [PokemonStatsCollectionViewCellViewModel] = []
            for stat in stats{
                pokemonStatsCollectionViewCellViewModel.append(PokemonStatsCollectionViewCellViewModel(base_stat: stat.base_stat, effort: stat.effort, statName: stat.statName))
            }
            cell.setup(viewModel: pokemonStatsCollectionViewCellViewModel)
        }
        
        return cell
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func setupCollectionView(){
        self.pokemonDetailCollectionview.dataSource = self
        self.pokemonDetailCollectionview.delegate = self
        self.pokemonDetailCollectionview.register(cellType: PokemonStatsCollectionViewCell.self)
        self.pokemonDetailCollectionview.register(cellType: PokemonCollectionViewCell.self)
    
        if let collectionViewLayout = pokemonDetailCollectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    func displayInfoView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.pokemonDetailCollectionview.alpha = 0
            self.infoView.alpha = 1
        })
    }
    
    func displayCollectionView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.pokemonDetailCollectionview.alpha = 1
            self.infoView.alpha = 0
        })
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
        setupCollectionView()
        self.infoView.alpha = 0 

    }
}
