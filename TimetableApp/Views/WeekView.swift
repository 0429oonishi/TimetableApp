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
        label.text = ManageableWeek(tag: self.tag)?.text
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
private extension WeekView {
    
    func setupLabel() {
        addSubview(label)
        label.anchor(centerY: self.centerYAnchor, centerX: self.centerXAnchor)
    }
    
}

private extension ManageableWeek {
    init?(tag: Int) {
        switch tag {
        case 0: self = .monday
        case 1: self = .tuesday
        case 2: self = .wednesday
        case 3: self = .thursday
        case 4: self = .friday
        case 5: self = .saturday
        default:
            return nil
        }
    }
}
