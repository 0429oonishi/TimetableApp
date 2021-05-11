//
//  UserDefaults.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/12.
//

import Foundation

enum Domain: String {
    case timetableSettingType
}

protocol UserDefautlsKeyProtocol {
    static var domain: Domain { get }
    var id: String { get }
    var key: String { get }
}

extension UserDefautlsKeyProtocol {
    var key: String { Self.domain.rawValue + "." + id }
}

final class UserDefault<R: UserDefautlsKeyProtocol> {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
    
    func set(_ value: Any?, forKey identifier: R) {
        userDefaults.set(value, forKey: identifier.key)
    }
    
    func bool(forKey identifier: R) -> Bool? {
        return userDefaults.bool(forKey: identifier.key)
    }
    
}


