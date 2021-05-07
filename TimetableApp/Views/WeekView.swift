//
//  WeekView.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/08.
//

import UIKit

final class WeekView: NeumorphismView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = Week(rawValue: self.tag)?.text
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.type = .normal
        setupLabel()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.type = .normal
        setupLabel()
        
    }
    
}

// MARK: - setup
private extension WeekView {
    
    func setupLabel() {
        addSubview(label)
        [label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}
