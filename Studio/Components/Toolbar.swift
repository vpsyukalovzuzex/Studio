//
// Toolbar.swift
//

import UIKit
import CoreGraphics

// MARK: -

protocol ToolbarDataSource: AnyObject {
    
    func toolbar(_ toolbar: Toolbar, numberOfItemsFor section: Toolbar.Section) -> Int
    
    func toolbar(_ toolbar: Toolbar, itemFor section: Toolbar.Section, at index: Int) -> UIView?
}

// MARK: -

class Toolbar: UIView {
    
    // MARK: -
    
    enum Direction {
        
        // MARK: -
        
        case horizontal
        case vertical
        
        // MARK: -
        
        var isHorizontal: Bool {
            return self == .horizontal
        }
    }
    
    // MARK: -
    
    enum Section {
        
        // MARK: -
        
        case sideA
        case sideB
        case central
    }
    
    // MARK: -
    
    var direction = Direction.horizontal {
        didSet {
            let axis: NSLayoutConstraint.Axis = direction.isHorizontal ? .horizontal : .vertical
            sectionStackView.axis = axis
            sideStackViewA.axis = axis
            sideStackViewB.axis = axis
            centralStackView.axis = axis
        }
    }
    
    var sectionSpacing: CGFloat = 8.0 {
        didSet {
            sectionStackView.spacing = sectionSpacing
        }
    }
    
    // MARK: -
    
    weak var dataSource: ToolbarDataSource?
    
    // MARK: -
    
    private let sectionStackView = UIStackView()
    
    private let sideStackViewA = UIStackView()
    private let sideStackViewB = UIStackView()
    
    private let centralStackView = UIStackView()
    
    // MARK: -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: -
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sectionStackView.frame = bounds
    }
    
    // MARK: -
    
    func reloadData() {
        let sections: [Section] = [
            .sideA,
            .sideB,
            .central
        ]
        for section in sections {
            for index in 0..<(dataSource?.toolbar(self, numberOfItemsFor: section) ?? 0) {
                guard let view = dataSource?.toolbar(self, itemFor: section, at: index) else {
                    continue
                }
                stackView(with: section).addArrangedSubview(view)
            }
        }
    }
    
    func view(in section: Section, at index: Int) -> UIView? {
        return stackView(with: section).arrangedSubviews[safe: index]
    }
    
    func setSpacint(_ spacing: CGFloat, for section: Section) {
        stackView(with: section).spacing = spacing
    }
    
    // MARK: -
    
    private func setup() {
        let sections: [Section] = [
            .sideA,
            .sideB,
            .central
        ]
        direction = .horizontal
        sectionSpacing = 8.0
        for section in sections {
            let stackView = stackView(with: section)
            stackView.spacing = 8.0
            stackView.alignment = .center
        }
        sectionStackView.alignment = .center
        sectionStackView.addArrangedSubview(sideStackViewA)
        sectionStackView.addArrangedSubview(centralStackView)
        sectionStackView.addArrangedSubview(sideStackViewB)
        addSubview(sectionStackView)
    }
    
    private func stackView(with section: Section) -> UIStackView {
        switch section {
        case .sideA:
            return sideStackViewA
        case .sideB:
            return sideStackViewB
        case .central:
            return centralStackView
        }
    }
}
