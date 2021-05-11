//
//  TimetableSettingTableViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import UIKit

final class TimetableSettingTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    private var mySwitch: UISwitch!
    private var onTapEvent: ((Bool) -> Void)?
    
}

// MARK: - setup
extension TimetableSettingTableViewCell {
    
    func setup(timetableSetting: TimetableSetting, onTapEvent: ((Bool) -> Void)?) {
        self.onTapEvent = onTapEvent
        mySwitch = UISwitch()
        mySwitch.isOn = timetableSetting.isOn
        mySwitch.onTintColor = #colorLiteral(red: 62/255, green: 179/255, blue: 112/255, alpha: 0.8)
        mySwitch.thumbTintColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        mySwitch.addTarget(self, action: #selector(mySwitchDidTapped), for: .valueChanged)
        myView.addSubview(mySwitch)
        mySwitch.anchor(right: myView.rightAnchor, centerY: myView.centerYAnchor, rightPadding: -20)
        
        let myLabel = UILabel()
        myLabel.text = timetableSetting.text
        myLabel.textColor = .black
        myLabel.textAlignment = .right
        myLabel.font = .boldSystemFont(ofSize: 18)
        myView.addSubview(myLabel)
        myLabel.anchor(right: mySwitch.rightAnchor, centerY: myView.centerYAnchor, rightPadding: -(mySwitch.frame.size.width + 20))
    }
    
}

// MARK: - @objc func
@objc extension TimetableSettingTableViewCell {
    
    func mySwitchDidTapped() {
        onTapEvent?(mySwitch.isOn)
    }
    
}
