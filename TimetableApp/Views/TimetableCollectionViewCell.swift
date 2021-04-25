//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

protocol TimetableCollectionViewCellDelegate: class {
    func collectionView(didSelectItemAt index: Int)
}

final class TimetableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    private var myLabel: UILabel?
    
    static var identifier: String { String(describing: self) }
    static func nib() -> UINib { UINib(nibName: String(describing: self), bundle: nil) }
    weak var delegate: TimetableCollectionViewCellDelegate?
    
}

// MARK: - setupCell
extension TimetableCollectionViewCell {
    
    func setup(index: Int) {
        myView.tag = index
        setupMyView(index: myView.tag)
    }
    
}

// MARK: - setup
private extension TimetableCollectionViewCell {
    
    func setupMyView(index: Int) {
        myView.type = .pushButton
        myView.cornerRadius = 15
        myView.addTarget(self, action: #selector(myViewDidTapped), for: .touchUpInside)
        myLabel?.removeFromSuperview()
        myLabel = UILabel()
        myLabel?.text = String(myView.tag)
        myLabel?.textColor = .black
        myLabel?.textAlignment = .center
        myLabel?.font = .boldSystemFont(ofSize: 20)
        myLabel?.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(myLabel!)
        [myLabel!.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         myLabel!.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

// MARK: - @objc func
@objc private extension TimetableCollectionViewCell {
    
    func myViewDidTapped() {
        delegate?.collectionView(didSelectItemAt: myView.tag)
    }
    
}

