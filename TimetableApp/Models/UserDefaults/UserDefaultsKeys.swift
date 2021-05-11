//
//  UserDefaultsKeys.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/12.
//

import Foundation

struct UserDefaultsKeys {
    
    enum TimetableSettingType: String, UserDefautlsKeyProtocol {
        case showSaturday
        case showSixPeriod
        static let domain: Domain = .timetableSettingType
        var id: String { self.rawValue }
    }
    
}
