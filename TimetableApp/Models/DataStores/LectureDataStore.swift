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

    /*
     Note that the order of Results is only guaranteed to stay consistent when the query is sorted. For performance reasons, insertion order is not guaranteed to be preserved. If you need to maintain order of insertion, some solutions are proposed here.
     結果の順序は、クエリがソートされたときにのみ一貫性が保たれることが保証されていることに注意してください。パフォーマンス上の理由から、挿入順序の保持は保証されていません。挿入順序を維持する必要がある場合は、ここでいくつかの解決策が提案されています。

     Realm: Create reactive mobile apps in a fraction of the time
     https://docs.mongodb.com/realm-legacy/docs/swift/latest/index.html
     */
    
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
