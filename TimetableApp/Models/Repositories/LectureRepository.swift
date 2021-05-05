//
//  LectureRepository.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/05.
//

import Foundation

protocol LectureRepository {
    func create(_ lecture: Lecture)
    func read(index: Int) -> Lecture
    func readAll() -> [Lecture]
    func update(index: Int, lecture: Lecture)
    func delete(index: Int)
    func deleteAll()
}
