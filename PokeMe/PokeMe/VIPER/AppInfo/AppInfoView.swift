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
    @IBOutlet weak var allRightsReservedLabel: UILabel!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var developedByLabel: UILabel!
    @IBOutlet weak var developerNameLabel: UILabel!
    @IBOutlet weak var appVersionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeUI()
        self.i18N()
        
        self.presenter?.appInfoViewDidLoad()

    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        
        let version: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        
        self.allRightsReservedLabel.text = "about.app.rigths".localized
        self.appVersionLabel.text = "\("about.app.version".localized) \(version) (\(build))"
        self.developedByLabel.text = "about.app.developed.by".localized

    }
}
