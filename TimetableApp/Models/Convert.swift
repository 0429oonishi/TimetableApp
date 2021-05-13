//
//  Convert.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/03.
//

import Foundation

struct Convert {
    
    var week: ManageableWeek?
    var period: ManageablePeriod?
    
    var number: Int {
        guard let week = week else { return -1 }
        guard let period = period else { return -1 }
        return week.number + ManageableWeek.allCases.count * period.number
    }
    
}

