//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

protocol TimetableCollectionViewCellDelegate: AnyObject {
    func collectionView(week: Week, period: Period)
}

final class TimetableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    
    private var nameLabel: UILabel?
    private var timeLabel: UILabel?
    private var roomLabel: UILabel?
    private var professorLabel: UILabel?
    private var creditLabel: UILabel?
    private let lectureUseCase = LectureUseCase()
    weak var delegate: TimetableCollectionViewCellDelegate?
    
}

// MARK: - setup cell
extension TimetableCollectionViewCell {
    
    func setup(indexPath: IndexPath, hasSaturday: Bool) {
        var index = 0
        if hasSaturday {
            index = indexPath.row
        } else {
            switch indexPath.row {
                case 0...4:   index = indexPath.row
                case 5...9:   index = indexPath.row + 1
                case 10...14: index = indexPath.row + 2
                case 15...19: index = indexPath.row + 3
                case 20...24: index = indexPath.row + 4
                case 25...29: index = indexPath.row + 5
                default: fatalError()
            }
        }
        setupMyView(index: index)
        setupLabel(index: index)
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
    
    func setupLabel(index: Int) {
        nameLabel?.removeFromSuperview()
        nameLabel = UILabel()
        nameLabel?.text = index.week.text
        nameLabel?.textColor = .black
        nameLabel?.textAlignment = .center
        nameLabel?.font = .boldSystemFont(ofSize: 18)
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(nameLabel!)
        [nameLabel!.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         nameLabel!.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        timeLabel = UILabel()
        timeLabel?.text = "時間"
        
        roomLabel?.removeFromSuperview()
        roomLabel = UILabel()
        roomLabel?.text = index.period.text
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
        let week = myView.tag.week
        let period = myView.tag.period
        delegate?.collectionView(week: week, period: period)
    }
    
}

