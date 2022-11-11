//
// BaseView.swift
//

import UIKit

class BaseView: UIViewController,
                BaseInputViewProtocol {
    
    // MARK: -
    
    @IBOutlet private weak var verticalToolbarViewContainer: UIView!
    
    // MARK: -
    
    private var verticalToolbarView = VerticalToolbarRouter.create().viewController
    
    // MARK: - BaseViewProtocol
    
    var presenter: BaseOutputViewProtocol?
    
    // MARK: - BaseInputViewProtocol
    
    // Implement protocol.
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let verticalToolbarView = verticalToolbarView else {
            return
        }
        verticalToolbarViewContainer.addSubview(verticalToolbarView.view)
        verticalToolbarView.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        verticalToolbarView?.view.frame = verticalToolbarViewContainer.bounds
    }
}
