//
// BaseInteractor.swift
//

import Foundation

class BaseInteractor: BaseInputInteractorProtocol {
    
    // MARK: - BaseInteractorProtocol
    
    weak var presenter: BaseOutputInteractorProtocol?
    
    // MARK: - BaseInputInteractorProtocol
    
    // Implement protocol.
}
