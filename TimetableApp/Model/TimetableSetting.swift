//
//  TimetableSetting.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import Foundation

struct TimetableSetting {
    let text: String
    var isOn: Bool
}

extension TimetableSetting {
    
    static var data: [TimetableSetting] = [
        TimetableSetting(text: "土曜日を表示", isOn: true),
        TimetableSetting(text: "６限目を表示", isOn: true),
    ]
    
}
