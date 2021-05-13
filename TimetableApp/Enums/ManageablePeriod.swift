//
//  Period.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

// このアプリで管理対象となっている何限かを表す
enum ManageablePeriod: Int, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
}

extension ManageablePeriod {
    
    var text: String {
        switch self {
            case .one: return "1"
            case .two: return "2"
            case .three: return "3"
            case .four: return "4"
            case .five: return "5"
            case .six: return "6"
        }
    }
    
}
