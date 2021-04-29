//
//  Week.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

enum Week: String, CaseIterable {
    case monday = "月"
    case tuesday = "火"
    case wednesday = "水"
    case thursday = "木"
    case friday = "金"
    case saturday = "土"
}

extension Week {
    
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
