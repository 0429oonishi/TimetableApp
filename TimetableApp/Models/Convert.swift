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
    
    var number: Int {
        week.number + Week.data.count * period.number
    }
    
}

