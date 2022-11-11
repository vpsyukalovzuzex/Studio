//
// VerticalToolbarView.swift
//

import UIKit

class VerticalToolbarView: UIViewController,
                           VerticalToolbarInputViewProtocol,
                           ToolbarDataSource {
    
    // MARK: -
    
    @IBOutlet private weak var toolbar: Toolbar!
    
    // MARK: -
    
    private var logoImageView = UIImageView()
    
    private var homeButton = BadgeButton()
    private var chatsButton = BadgeButton()
    private var settingsButton = BadgeButton()
    
    private var signoutButton = UIButton()
    
    // MARK: -
    
    private var sideViewA: [UIView] {
        return [
            logoImageView,
            homeButton,
            chatsButton
        ]
    }
    
    private var sideViewB: [UIView] {
        return [
            settingsButton,
            signoutButton
        ]
    }
    
    // MARK: - VerticalToolbarViewProtocol
    
    var presenter: VerticalToolbarOutputViewProtocol?
    
    // MARK: - VerticalToolbarInputViewProtocol
    
    func setChatsButtonBadgeText(_ text: String) {
        chatsButton.badge = text
    }
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolbar.direction = .vertical
        toolbar.dataSource = self
        toolbar.setSpacint(36.0, for: .sideA)
        toolbar.setSpacint(30.0, for: .sideB)
        logoImageView.image = UIImage(named: "logo")
        // Add constraint because logo image size is not native for this case.
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = false
        //
        homeButton.setImage(UIImage(named: "home"), for: .normal)
        homeButton.setImage(UIImage(named: "home-active"), for: .selected)
        chatsButton.setImage(UIImage(named: "messages"), for: .normal)
        chatsButton.setImage(UIImage(named: "messages-active"), for: .selected)
        settingsButton.setImage(UIImage(named: "settings"), for: .normal)
        settingsButton.setImage(UIImage(named: "settings-active"), for: .selected)
        signoutButton.setImage(UIImage(named: "logout"), for: .normal)
        // Add constraint because signout button image size is not native for this case.
        signoutButton.translatesAutoresizingMaskIntoConstraints = false
        signoutButton.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        signoutButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        //
        homeButton.addTarget(
            self,
            action: #selector(homeButtonAction(_:)),
            for: .touchUpInside
        )
        chatsButton.addTarget(
            self,
            action: #selector(chatsButtonAction(_:)),
            for: .touchUpInside
        )
        settingsButton.addTarget(
            self,
            action: #selector(settingsButtonAction(_:)),
            for: .touchUpInside
        )
        signoutButton.addTarget(
            self,
            action: #selector(signoutButtonAction(_:)),
            for: .touchUpInside
        )
        toolbar.reloadData()
        presenter?.viewDidLoad()
    }
    
    // MARK: - ToolbarDataSource
    
    func toolbar(_ toolbar: Toolbar, numberOfItemsFor section: Toolbar.Section) -> Int {
        switch section {
        case .sideA:
            return sideViewA.count
        case .sideB:
            return sideViewB.count
        case .central:
            return 0
        }
    }
    
    func toolbar(_ toolbar: Toolbar, itemFor section: Toolbar.Section, at index: Int) -> UIView? {
        switch section {
        case .sideA:
            return sideViewA[safe: index]
        case .sideB:
            return sideViewB[safe: index]
        case .central:
            return nil
        }
    }
    
    // MARK: -
    
    @objc private func homeButtonAction(_ sender: UIButton) {
        
    }
    
    @objc private func chatsButtonAction(_ sender: UIButton) {
        
    }
    
    @objc private func settingsButtonAction(_ sender: UIButton) {
        
    }
    
    @objc private func signoutButtonAction(_ sender: UIButton) {
        
    }
}
