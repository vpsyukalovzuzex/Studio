//
// UIViewController+Common.swift
//

import UIKit

extension UIViewController {
    
    // MARK: -
    
    static func instantiate() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: nil).instantiateInitialViewController() as! Self
    }
}
