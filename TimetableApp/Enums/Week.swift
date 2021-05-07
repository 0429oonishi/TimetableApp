//
//  Week.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

enum Week: Int, CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

extension Week {
    
    static var data: [Self] { Self.allCases }
    
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
    
    var number: Int {
        switch self {
            case .monday: return 0
            case .tuesday: return 1
            case .wednesday: return 2
            case .thursday: return 3
            case .friday: return 4
            case .saturday: return 5
        }
    }
    
    static func configureSaturday(weeks: [Self], isHidden: Bool, handler: (Bool) -> Void) -> [Self] {
        switch (weeks.contains(.saturday), isHidden) {
            case (false, false):
                handler(isHidden)
                return weeks + [.saturday]
            case (true, true):
                handler(isHidden)
                return weeks.filter { $0 != .saturday }
            default:
                return weeks
        }
    }
    
}
