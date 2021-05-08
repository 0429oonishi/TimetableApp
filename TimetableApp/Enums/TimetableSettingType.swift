//
//  TimetableSettingType.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/08.
//

import Foundation

enum TimetableSettingType: Int {
    case showSaturday
    case showSixPeriod
}

extension TimetableSettingType {
    
    var text: String {
        switch self {
            case .showSaturday: return "土曜日を表示"
            case .showSixPeriod: return "６限目を表示"
        }
    }
    
    var key: String {
        switch self {
            case .showSaturday: return .isHiddenSaturdayViewKey
            case .showSixPeriod: return .isHiddenSixPeriodViewKey
        }
    }
    
}
