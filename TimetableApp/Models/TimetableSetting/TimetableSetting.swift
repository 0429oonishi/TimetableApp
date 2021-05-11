//
//  TimetableSetting.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

struct TimetableSetting {
    
    let text: String
    var isOn: Bool
    
    static subscript(type: TimetableSettingType) -> TimetableSetting {
        get {
            let userDefault = UserDefault<UserDefaultsKeys.TimetableSettingType>()
            let isOn = userDefault.bool(forKey: type.key) ?? false
            return TimetableSetting(text: type.text, isOn: isOn)
        }
        set {
            Self.data[type.rawValue].isOn = newValue.isOn
        }
    }
    
    static private var data: [TimetableSetting] = [
        TimetableSetting(text: TimetableSettingType.showSaturday.text, isOn: true),
        TimetableSetting(text: TimetableSettingType.showSixPeriod.text, isOn: true),
    ]
    
    static var count: Int {
        Self.data.count
    }
    
}
