//
//  AppInfoView.swift
//  PokeMe
//
//  Created by mmalaqui on 22/02/2021.
//  
//

import Foundation
import UIKit

class AppInfoView: BaseView<AppInfoPresenterProtocol> {

    let screenName = "AppInfo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.appInfoViewDidLoad()

    }
    
    deinit {
        //clean all references
        self.presenter?.cleanup()
    }
    
}

// MARK: Extensions declaration of all extension and implementations of protocols 
extension AppInfoView: BaseViewControllerRefresh {
    func refresh() {
        //TODO: implement all calls needed to refresh the UI
    }
    
    func i18N() {
        self.title = "AppInfo"
    }
    
    func initializeUI() {
        //TODO: implement all UI Setups

    }
}
