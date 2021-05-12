//
//  Week.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

// このアプリで管理可能な曜日を表す
enum ManageableWeek: CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

extension ManageableWeek {

    var text: String {
        switch self {
            case .monday: return "月"
            case .tuesday: return "火"
            case .wednesday: return "水"
            case .thursday: return "木"
            case .friday: return "金"
            case .saturday: return "土"
        }
    }
}
