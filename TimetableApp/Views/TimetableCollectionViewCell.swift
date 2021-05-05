//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

protocol TimetableCollectionViewCellDelegate: AnyObject {
    func collectionView(didSelectItemAt index: Int)
}

final class TimetableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    
    private var nameLabel: UILabel?
    private var timeLabel: UILabel?
    private var roomLabel: UILabel?
    private var professorLabel: UILabel?
    private var creditLabel: UILabel?
    weak var delegate: TimetableCollectionViewCellDelegate?
    
}

// MARK: - setup cell
extension TimetableCollectionViewCell {
    
    func setup(index: Int, lecture: Lecture) {
        setupMyView(index: index)
        setupLabel(lecture: lecture)
    }
    
}

// MARK: - setup views
private extension TimetableCollectionViewCell {
    
    func setupMyView(index: Int) {
        myView.type = .pushButton
        myView.cornerRadius = 15
        myView.tag = index
        myView.addTarget(self, action: #selector(myViewDidTapped), for: .touchUpInside)
    }
    
    func setupLabel(lecture: Lecture) {
        nameLabel?.removeFromSuperview()
        nameLabel = UILabel()
        nameLabel?.text = lecture.name
        nameLabel?.textColor = .black
        nameLabel?.textAlignment = .center
        nameLabel?.font = .boldSystemFont(ofSize: 18)
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(nameLabel!)
        [nameLabel!.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         nameLabel!.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        timeLabel = UILabel()
        timeLabel?.text = lecture.time
        
        roomLabel?.removeFromSuperview()
        roomLabel = UILabel()
        roomLabel?.text = lecture.room
        roomLabel?.textColor = .black
        roomLabel?.textAlignment = .center
        roomLabel?.font = .boldSystemFont(ofSize: 12)
        roomLabel?.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(roomLabel!)
        [roomLabel!.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         roomLabel!.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 20),
        ].forEach { $0.isActive = true }

    }
    
}

// MARK: - @objc func
@objc private extension TimetableCollectionViewCell {
    
    func myViewDidTapped() {
        delegate?.collectionView(didSelectItemAt: myView.tag)
    }
    
}

