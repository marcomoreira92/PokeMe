//
//  HomeView.swift
//  PokeMe
//
//  Created by mmalaqui on 12/02/2021.
//  
//

import Foundation
import UIKit

class HomeView: BaseView<HomePresenterProtocol>, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var homeViewTutorial: HomeTutorialView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var menu: Menu!
    @IBOutlet weak var infoView: InfoView!
    
    let screenName = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.showLoader()
        self.presenter?.homeViewDidLoad()

    }
    
    func displayInfoView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.homeCollectionView.alpha = 0
            self.infoView.alpha = 1
        })
    }
    
    func displayCollectionView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.homeCollectionView.alpha = 1
            self.infoView.alpha = 0
        })
    }
    
    func setupCollectionView(){
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.delegate = self
        self.homeCollectionView.register(cellType: PokemonCollectionViewCell.self)
        self.homeCollectionView.register(UINib(nibName: "HomeViewCollectionReusableHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"HomeViewCollectionReusableHeaderView")

        
        if let collectionViewLayout = homeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    func setupMenu(){
        self.menu.setup(favoritesButtonActionFunction: {
            self.presenter?.showFavoriteList()
        }, listButtonActionFunction: {
            self.presenter?.showAppInfo()
        }, pokeBallButtonActionFunction: {
            self.refresh()
            self.hideTutorial()
        })
    }
    
    func showTutorial(){
        let originalFrame = self.homeViewTutorial.frame
        self.homeViewTutorial.frame = CGRect(x: originalFrame.origin.x, y: originalFrame.origin.y+10, width: originalFrame.width, height: originalFrame.height)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.homeViewTutorial.alpha = 0.9
            self.homeViewTutorial.frame = originalFrame
        })
    }
    
    func hideTutorial(){
        if(self.homeViewTutorial.alpha == 0){
            return
        }
        
        let originalFrame = self.homeViewTutorial.frame
        UIView.animate(withDuration: 0.3, animations: {
            self.homeViewTutorial.alpha = 0
            self.homeViewTutorial.frame = CGRect(x: originalFrame.origin.x, y: originalFrame.origin.y+10, width: originalFrame.width, height: originalFrame.height)
        })
    }
    
    // MARK: collectionview delegate functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let _ = self.presenter?.viewModel?.pokemonModel{
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 64, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(with: PokemonCollectionViewCell.self, for: indexPath)
        
        if let pokemon = self.presenter?.viewModel?.pokemonModel {
            var descriptionText = ""
            if let id = pokemon.id{
                descriptionText += "Pokémon \(id)"
            }
            if let height = pokemon.height{
                descriptionText += " \("pokemon.cell.height.label".localized): \(height)"
            }
            
            let viewModel = PokemonCollectionViewViewModel(name: pokemon.name, description: descriptionText, imageURL: pokemon.imageURL, favoriteAction: { (status :Bool) -> Void in 
                self.presenter?.updateFavoriteStatus(index: indexPath.row, favoriteStatus: status)
            })
            cell.setup(pokemon: viewModel)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter?.selectedPokemon(index: indexPath.row)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

       switch kind {
       case UICollectionView.elementKindSectionHeader:
           let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeViewCollectionReusableHeaderView", for: indexPath) as! HomeViewCollectionReusableHeaderView
            headerView.setup()
           return headerView

       default:
           assert(false, "Unexpected element kind")
       }
   }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.homeCollectionView.frame.width, height: 75)
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension HomeView: BaseViewControllerRefresh {
    func refresh() {
        self.showLoader()
        self.presenter?.homeViewDidLoad()
    }
    
    func i18N() {
        self.title = "Home"
    }
    
    func initializeUI() {
        self.setupCollectionView()
        self.setupMenu()
        self.homeViewTutorial.setup()
        self.homeViewTutorial.alpha = 0
        
        let _ = Timer.scheduledTimer(withTimeInterval: 3.5, repeats: false) { timer in
            self.showTutorial()
        }
    }
}
