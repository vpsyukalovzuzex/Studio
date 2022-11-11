//
// VerticalToolbarPresenter.swift
//

import Foundation

class VerticalToolbarPresenter: VerticalToolbarOutputViewProtocol,
                                VerticalToolbarOutputInteractorProtocol {
    
    // MARK: - VerticalToolbarPresenterProtocol
    
    weak var view: VerticalToolbarInputViewProtocol?
    
    var interactor: VerticalToolbarInputInteractorProtocol?
    
    var router: VerticalToolbarInputRouterProtocol?
    
    // MARK: - VerticalToolbarOutputViewProtocol
    
    func viewDidLoad() {
        interactor?.startDemo()
    }
    
    func didTapHome() {
        // TODO: -
    }
    
    func didTapChats() {
        // TODO: -
    }
    
    func didTapSettings() {
        // TODO: -
    }
    
    func didTapSignout() {
        // TODO: -
    }
    
    // MARK: - VerticalToolbarOutputInteractorProtocol
    
    func didUpdateUnreadMessageCount(_ count: Int) {
        view?.setChatsButtonBadgeText("\(count)")
    }
}
