//
//  FavoriteListView.swift
//  PokeMe
//
//  Created by mmalaqui on 19/02/2021.
//  
//

import Foundation
import UIKit

class FavoriteListView: BaseView<FavoriteListPresenterProtocol> {

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
    
    deinit {
        //clean all references
        self.presenter?.cleanup()
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension FavoriteListView: BaseViewControllerRefresh {
    func refresh() {
        //TODO: implement all calls needed to refresh the UI
    }
    
    func i18N() {
        self.title = "FavoriteList"
    }
    
    func initializeUI() {
        //TODO: implement all UI Setups

    }
}
