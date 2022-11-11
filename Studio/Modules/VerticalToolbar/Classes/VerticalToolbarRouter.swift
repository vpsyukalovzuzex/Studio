//
// VerticalToolbarRouter.swift
//

import UIKit

class VerticalToolbarRouter: VerticalToolbarInputRouterProtocol {
    
    // MARK: - VerticalToolbarRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> VerticalToolbarRouter {
        let view = VerticalToolbarView.instantiate()
        let interactor = VerticalToolbarInteractor()
        let presenter = VerticalToolbarPresenter()
        let router = VerticalToolbarRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - VerticalToolbarInputRouterProtocol
    
    // Implement protocol.
}
