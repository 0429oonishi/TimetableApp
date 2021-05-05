//
//  LectureUseCase.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/05/05.
//

import Foundation

class LectureUseCase {
    
    private let repository: LectureRepository
    
    init(repository: LectureRepository = LectureDataStore()) {
        self.repository = repository
    }
    
    func create(_ lecture: Lecture) {
        repository.create(lecture)
    }
    
    func read(index: Int) -> Lecture {
        return repository.read(index: index)
    }
    
    func readAll() -> [Lecture] {
        return repository.readAll()
    }
    
    func update(index: Int, lecture: Lecture) {
        repository.update(index: index, lecture: lecture)
    }
    
    func delete(index: Int) {
        repository.delete(index: index)
    }
    
    func deleteAll() {
        repository.deleteAll()
    }
    
}
