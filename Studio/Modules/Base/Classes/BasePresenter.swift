//
// BasePresenter.swift
//

import Foundation

class BasePresenter: BaseOutputViewProtocol,
                     BaseOutputInteractorProtocol {
    
    // MARK: - BasePresenterProtocol
    
    weak var view: BaseInputViewProtocol?
    
    var interactor: BaseInputInteractorProtocol?
    
    var router: BaseInputRouterProtocol?
    
    // MARK: - BaseOutputViewProtocol
    
    // Implement protocol.
    
    // MARK: - BaseOutputInteractorProtocol
    
    // Implement protocol.
}
