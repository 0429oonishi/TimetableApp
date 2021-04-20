//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

final class TimetableCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet private weak var myView: NeumorphismView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupNeumorphismView()
        
    }
    
}

// MARK: - setup
private extension TimetableCollectionViewCell {
    
    func setupNeumorphismView() {
        myView.type = .pushButton
        myView.cornerRadius = 15
        myView.addTarget(self, action: #selector(someFunc), for: .touchUpInside)
        
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.backgroundColor = .clear
        
        let label = UILabel()
        label.text = "授業"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(label)
        [label.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        let label2 = UILabel()
        label2.text = "教室"
        label2.textColor = .black
        label2.font = .boldSystemFont(ofSize: 12)
        label2.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(label2)
        [label2.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
         label2.centerYAnchor.constraint(equalTo: baseView.centerYAnchor, constant: 25),
        ].forEach { $0.isActive = true }
        
        myView.setContentView(baseView)
        [baseView.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         baseView.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

private extension TimetableCollectionViewCell {
    
    @objc func someFunc() {
        print(#function)
    }
    
}

