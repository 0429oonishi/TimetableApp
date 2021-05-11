//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

final class TimetableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    
    private var nameLabel: UILabel?
    private var timeLabel: UILabel?
    private var roomLabel: UILabel?
    private var professorLabel: UILabel?
    private var creditLabel: UILabel?
    private var onTapEvent: (() -> Void)?
    
}

// MARK: - setup cell
extension TimetableCollectionViewCell {
    
    func setup(week: Week, period: Period, onTapEvent: @escaping () -> Void) {
        self.onTapEvent = onTapEvent
        setupMyView()
        setupLabel(week: week, period: period)
    }
    
}

// MARK: - setup views
private extension TimetableCollectionViewCell {
    
    func setupMyView() {
        myView.type = .pushButton
        myView.cornerRadius = 15
        myView.addTarget(self, action: #selector(myViewDidTapped), for: .touchUpInside)
    }
    
    func setupLabel(week: Week, period: Period) {
        nameLabel?.removeFromSuperview()
        nameLabel = UILabel()
        nameLabel?.text = week.text
        nameLabel?.textColor = .black
        nameLabel?.textAlignment = .center
        nameLabel?.font = .boldSystemFont(ofSize: 18)
        myView.addSubview(nameLabel!)
        nameLabel!.anchor(centerY: myView.centerYAnchor, centerX: myView.centerXAnchor)
        
        timeLabel = UILabel()
        timeLabel?.text = "時間"
        
        roomLabel?.removeFromSuperview()
        roomLabel = UILabel()
        roomLabel?.text = period.text
        roomLabel?.textColor = .black
        roomLabel?.textAlignment = .center
        roomLabel?.font = .boldSystemFont(ofSize: 12)
        myView.addSubview(roomLabel!)
        roomLabel!.anchor(centerY: myView.centerYAnchor, centerX: myView.centerXAnchor, centerYPadding: 20)
    }
    
}

// MARK: - @objc func
@objc private extension TimetableCollectionViewCell {
    
    func myViewDidTapped() {
        onTapEvent?()
    }
    
}

