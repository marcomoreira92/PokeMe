import Foundation
import UIKit
import NVActivityIndicatorView

//Base protocol
protocol BaseViewControllerRefresh {
    func refresh()
}

//Base Clasees
class BaseViewController: UIViewController, NVActivityIndicatorViewable{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) { super.viewDidAppear(animated) }
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    override func viewDidDisappear(_ animated: Bool) { super.viewDidDisappear(animated) }
    override func viewWillDisappear(_ animated: Bool) { super.viewWillDisappear(animated) }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    func showLoader() {
        self.startAnimating(CGSize(width: 50, height: 50), message: "", type: NVActivityIndicatorType.ballClipRotatePulse)    }
    
    func hideLoader() {
        self.stopAnimating()
    }
    
    func showAlertWith(title: String, message: String, actions: NSArray?) {
        self.hideLoader()
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        if let actions = actions {
            for action in actions {
                if let actionToBeAdded = action as? UIAlertAction {
                    alert.addAction(actionToBeAdded)
                }
            }
        } else {
            alert.addAction(UIAlertAction(title: ("BaseViewController.Alert.Ok").localized, style: UIAlertAction.Style.default, handler: nil))
        }

        alert.view.tintColor = UIColor(named: "color_primary")
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithError(title: String, message: String, actions: NSArray?) {
        self.showAlertWith(title: title, message: message, actions: actions)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
}
