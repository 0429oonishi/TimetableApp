//
//  Lecture.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/03.
//

import RealmSwift

class Lecture: Object {
    @objc dynamic var name = ""
    @objc dynamic var room = ""
    @objc dynamic var time = ""
    @objc dynamic var professor = ""
    @objc dynamic var credit = 0
}
