//
//  Period.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

enum Period: String, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
}

extension Period {
    
    static func configureSixPeriod(periods: [Self], isHidden: Bool, handler: (Bool) -> Void) -> [Self] {
        switch (periods.contains(.six), isHidden) {
            case (false, false):
                handler(isHidden)
                return periods + [.six]
            case (true, true):
                handler(isHidden)
                return periods.filter { $0 != .six }
            default:
                return periods
        }
    }
    
}
