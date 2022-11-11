//
// VerticalToolbarInteractor.swift
//

import Foundation

class VerticalToolbarInteractor: VerticalToolbarInputInteractorProtocol {
    
    // MARK: - VerticalToolbarInteractorProtocol
    
    weak var presenter: VerticalToolbarOutputInteractorProtocol?
    
    // MARK: - VerticalToolbarInputInteractorProtocol
    
    func startDemo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.presenter?.didUpdateUnreadMessageCount(2)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) { [weak self] in
            self?.presenter?.didUpdateUnreadMessageCount(8)
        }
    }
}
