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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.favoriteListViewDidLoad()

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
