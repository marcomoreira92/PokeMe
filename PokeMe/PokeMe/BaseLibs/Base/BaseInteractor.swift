import Foundation
import UIKit

class BaseInteractor <Presenter: Any>: NSObject {
    
    internal var presenter: Presenter?

    //init
    convenience init(presenter: Presenter? = nil) {
        self.init()
        self.presenter = presenter
    }
    
}
