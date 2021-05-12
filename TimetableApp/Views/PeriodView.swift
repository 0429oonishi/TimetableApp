//
//  PeriodView.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/08.
//

import UIKit

final class PeriodView: NeumorphismView {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = Period(tag: self.tag)?.text
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
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
private extension PeriodView {
    
    func setupLabel() {
        addSubview(label)
        label.anchor(centerY: self.centerYAnchor, centerX: self.centerXAnchor)
    }
    
}

private extension Period {
    init?(tag: Int) {
        switch tag {
        case 0: self = .one
        case 1: self = .two
        case 2: self = .three
        case 3: self = .four
        case 4: self = .five
        case 5: self = .six
        default:
            return nil
        }
    }
}
