//
//  TimetableSettingTableViewCell.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import UIKit

final class TimetableSettingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myView: NeumorphismView!
    
    static var identifier: String { String(describing: self) }
    static func nib() -> UINib { UINib(nibName: String(describing: self), bundle: nil) }
    var onTapEvent: ((UISwitch) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
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
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(mySwitch)
        [mySwitch.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -20),
         mySwitch.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        let myLabel = UILabel()
        myLabel.text = timetableSetting.text
        myLabel.textColor = .black
        myLabel.textAlignment = .right
        myLabel.font = .boldSystemFont(ofSize: 18)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myView.addSubview(myLabel)
        [myLabel.trailingAnchor.constraint(equalTo: mySwitch.trailingAnchor,
                                           constant: -(mySwitch.frame.size.width + 20)),
         myLabel.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

private extension TimetableSettingTableViewCell {
    
    @objc func mySwitchDidTapped(_ sender: UISwitch) {
        onTapEvent?(sender)
    }
    
}
