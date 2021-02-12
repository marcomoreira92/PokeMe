import Foundation
import UIKit

class BaseView<Presenter: Any>: BaseViewController {
    internal var presenter: Presenter?
}
