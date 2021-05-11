//
//  TimetableSettingTableViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import UIKit

protocol TimetableSettingTableViewCellDelegate: AnyObject {
    func mySwitchDidTapped(type: TimetableSettingType, isOn: Bool)
}

final class TimetableSettingTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var myView: NeumorphismView!
    weak var delegate: TimetableSettingTableViewCellDelegate?
    
}

// MARK: - setup
extension TimetableSettingTableViewCell {
    
    func setup(timetableSetting: TimetableSetting, index: Int) {
        let mySwitch = UISwitch()
        mySwitch.isOn = timetableSetting.isOn
        mySwitch.tag = index
        mySwitch.onTintColor = #colorLiteral(red: 62/255, green: 179/255, blue: 112/255, alpha: 0.8)
        mySwitch.thumbTintColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        mySwitch.addTarget(self, action: #selector(mySwitchDidTapped(_:)), for: .valueChanged)
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
@objc private extension TimetableSettingTableViewCell {
    
    func mySwitchDidTapped(_ sender: UISwitch) {
        let type = TimetableSettingType(rawValue: sender.tag)!
        delegate?.mySwitchDidTapped(type: type, isOn: sender.isOn)
    }
    
}
