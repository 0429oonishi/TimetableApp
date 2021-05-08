//
//  TimetableCollectionViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/19.
//

import UIKit

// 責務
// やること
// - 渡された情報の表示
// やらないこと
// - 表示場所の意識
final class TimetableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    
    private var nameLabel: UILabel?
    private var timeLabel: UILabel?
    private var roomLabel: UILabel?
    private var professorLabel: UILabel?
    private var creditLabel: UILabel?

    private var didTapHandler: () -> Void = {}
}

// MARK: - setup cell
extension TimetableCollectionViewCell {
    func setup(week: Week, period: Period, didTap: @escaping () -> Void) {
        didTapHandler = didTap

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
        nameLabel?.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(nameLabel!)
        [nameLabel!.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
         nameLabel!.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        timeLabel = UILabel()
        timeLabel?.text = "時間"
        
        roomLabel?.removeFromSuperview()
        roomLabel = UILabel()
        roomLabel?.text = period.text
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
        didTapHandler()
    }
}
