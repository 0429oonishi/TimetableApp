//
//  Convert.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/03.
//

import Foundation

struct Convert {
    
    var week: Week
    var period: Period
    
    func index(timetable: Timetable) -> Int? {
        let weeks = timetable.weeks
        let periods = timetable.periods
        guard week != .saturday || weeks.contains(.saturday) else { return nil }
        guard period != .six || periods.contains(.six) else { return nil }
        let quotient = Int(period.rawValue)! - 1
        var remainder = 0
        for n in 0..<weeks.count {
            if week == weeks[n] {
                remainder = n
            }
        }
        return quotient * weeks.count + remainder
    }
    
}
