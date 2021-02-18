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
        //TODO:
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 64, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
    
        if let collectionViewLayout = pokemonDetailCollectionview.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
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

    }
}
