//
//  Week.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

// 一般的な全曜日を表す
enum Week: Int, CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

extension Week {

    // このアプリで管理対象となっている全曜日を表す
    static var manageableWeeks: [Self] {
        [.monday,
         .tuesday,
         .wednesday,
         .thursday,
         .friday,
         .saturday]
    }
    
    var text: String {
        switch self {
            case .monday: return "月"
            case .tuesday: return "火"
            case .wednesday: return "水"
            case .thursday: return "木"
            case .friday: return "金"
            case .saturday: return "土"
            case .sunday: return "日"
        }
    }
}
