//
//  AdditionalViewType.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/04.
//

import Foundation

enum AdditionalViewType {
    case name
    case room
    case professor
    case credit
    var text: String {
        switch self {
            case .name: return "講義"
            case .room: return "教室"
            case .professor: return "教員"
            case .credit: return "単位"
        }
    }
    var placeholder: String {
        switch self {
            case .name: return "講義名を入力"
            case .room: return "教室名を入力"
            case .professor: return "教員名を入力"
            case .credit: return "単位数を入力"
        }
    }
}


enum AdditionalButtonType {
    case add
    case back
    var text: String {
        switch self {
            case .add: return "追加"
            case .back: return "戻る"
        }
    }
}
