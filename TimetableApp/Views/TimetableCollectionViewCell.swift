//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

protocol TimetableCollectionViewCellDelegate: AnyObject {
    func collectionView(didSelectItemAt index: Int, text: String?)
}

final class TimetableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    private var myLabel: UILabel?
    
    weak var delegate: TimetableCollectionViewCellDelegate?
    
}

// MARK: - setup cell
extension TimetableCollectionViewCell {
    
    func setup(index: Int) {
        setupMyView()
        if index.isMultiple(of: 3) {
            setupMyLabel(text: "実験")
        }
    }
    
}

// MARK: - setup views
private extension TimetableCollectionViewCell {
    
    func setupMyView() {
        myView.type = .pushButton
        myView.cornerRadius = 15
        myView.addTarget(self, action: #selector(myViewDidTapped), for: .touchUpInside)
    }
    
    func setupMyLabel(text: String) {
        myLabel?.removeFromSuperview()
        myLabel = UILabel()
        myLabel?.text = text
        myLabel?.textColor = .black
        myLabel?.textAlignment = .center
        myLabel?.font = .boldSystemFont(ofSize: 18)
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
        delegate?.collectionView(didSelectItemAt: myView.tag, text: myLabel?.text)
    }
    
}

