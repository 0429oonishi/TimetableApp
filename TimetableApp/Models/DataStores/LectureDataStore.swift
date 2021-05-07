//
//  LectureDataStore.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/05.
//

import RealmSwift

class LectureDataStore: LectureRepository {
    
    private let realm = try! Realm()
    
    func create(_ lecture: Lecture) {
        try! realm.write {
            realm.add(lecture)
        }
    }
    
    func read(index: Int) -> Lecture {
        return realm.objects(Lecture.self)[index]
    }
    
    func readAll() -> [Lecture] {
        var lectures = [Lecture]()
        realm.objects(Lecture.self).forEach { lecture in
            lectures.append(lecture)
        }
        return lectures
    }
    
    func update(index: Int, lecture: LectureElement){
        let lectures = realm.objects(Lecture.self)
        try! realm.write {
            lectures[index].name = lecture.name ?? ""
            lectures[index].room = lecture.room ?? ""
            lectures[index].professor = lecture.professor ?? ""
            lectures[index].credit = lecture.credit ?? 0
        }
    }
    
    func delete(index: Int) {
        let lecture = realm.objects(Lecture.self)[index]
        try! realm.write {
            realm.delete(lecture)
        }
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
