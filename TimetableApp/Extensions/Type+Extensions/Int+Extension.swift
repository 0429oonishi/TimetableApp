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
