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

    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var menu: Menu!
    
    let screenName = "Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.homeViewDidLoad()

    }
    
    func setupCollectionView(){
        self.homeCollectionView.dataSource = self
        self.homeCollectionView.delegate = self
        self.homeCollectionView.register(cellType: PokemonCollectionViewCell.self)
    
        
        if let collectionViewLayout = homeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
    }
    
    // MARK: collectionview delegate functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let _ = self.presenter?.viewModel{
            return 1//FIXME
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 64, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(with: PokemonCollectionViewCell.self, for: indexPath)
        cell.setup()
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension HomeView: BaseViewControllerRefresh {
    func refresh() {
        //TODO: implement all calls needed to refresh the UI
    }
    
    func i18N() {
        self.title = "Home"
    }
    
    func initializeUI() {
        self.setupCollectionView()

    }
}
