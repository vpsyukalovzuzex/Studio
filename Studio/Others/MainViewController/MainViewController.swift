//
// MainViewController.swift
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: -
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let baseView = BaseRouter.create().viewController else {
            return
        }
        baseView.modalPresentationStyle = .fullScreen
        self.present(baseView, animated: false)
    }
}
