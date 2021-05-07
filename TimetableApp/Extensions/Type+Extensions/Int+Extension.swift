//
//  Int+Extension.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/24.
//

import Foundation

extension Int {
    
    var toBool: Bool? {
        switch self {
            case 1: return true
            case 0: return false
            default: return nil
        }
    }
    
}

extension Int {
    
    var week: Week {
        let remainder = self % Week.data.count
        return Week(rawValue: remainder)!
    }
    
    var period: Period {
        let quotient = (self - self % Week.data.count) / Week.data.count
        return Period(rawValue: quotient)!
    }
    
}
