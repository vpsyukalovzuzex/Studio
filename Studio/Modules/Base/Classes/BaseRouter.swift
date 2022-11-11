//
// BaseRouter.swift
//

import UIKit

class BaseRouter: BaseInputRouterProtocol {
    
    // MARK: - BaseRouterProtocol
    
    weak var viewController: UIViewController?
    
    // MARK: - Static functions
    
    static func create() -> BaseRouter {
        let view = BaseView.instantiate()
        let interactor = BaseInteractor()
        let presenter = BasePresenter()
        let router = BaseRouter()
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        return router
    }
    
    // MARK: - BaseInputRouterProtocol
    
    // Implement protocol.
}
