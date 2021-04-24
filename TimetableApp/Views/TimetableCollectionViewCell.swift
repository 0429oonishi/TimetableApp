//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

protocol TimetableCollectionViewCellDelegate: class {
    func myViewDidTapped()
}

final class TimetableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    
    static var identifier: String { String(describing: self) }
    static func nib() -> UINib { UINib(nibName: String(describing: self), bundle: nil) }
    weak var delegate: TimetableCollectionViewCellDelegate?
    
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
        myView.addTarget(self, action: #selector(myViewDidTapped), for: .touchUpInside)

        let label = UILabel()
        label.text = "授業"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(label)
        [label.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        let label2 = UILabel()
        label2.text = "教室"
        label2.textColor = .black
        label.textAlignment = .center
        label2.font = .boldSystemFont(ofSize: 12)
        label2.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(label2)
        [label2.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         label2.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 25),
        ].forEach { $0.isActive = true }
    }
    
}

private extension TimetableCollectionViewCell {
    
    @objc func myViewDidTapped() {
        delegate?.myViewDidTapped()
    }
    
}

