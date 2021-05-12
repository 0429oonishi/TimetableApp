//
//  UIStoryboard+Extension.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/29.
//

import UIKit

extension UIStoryboard {
    
    static var timetableSetting: UIStoryboard {
        UIStoryboard(name: .timetableSetting, bundle: nil)
    }
    
    static var settingLecture: UIStoryboard {
        UIStoryboard(name: .settingLecture, bundle: nil)
    }
    
    static var additionalLecture: UIStoryboard {
        UIStoryboard(name: .additionalLecture, bundle: nil)
    }
    
    static var editLecture: UIStoryboard {
        UIStoryboard(name: .editLecture, bundle: nil)
    }
    
    static var lectureAttendance: UIStoryboard {
        UIStoryboard(name: .lectureAttendance, bundle: nil)
    }
    
    static var lectureMemo: UIStoryboard {
        UIStoryboard(name: .lectureMemo, bundle: nil)
    }
    
    static var lectureColor: UIStoryboard {
        UIStoryboard(name: .lectureColor, bundle: nil)
    }
    
}

private extension String {

    // MARK: - UIStoryboard name
    static let timetableSetting = "TimetableSetting"
    static let settingLecture = "SettingLecture"
    static let additionalLecture = "AdditionalLecture"
    static let editLecture = "EditLecture"
    static let lectureAttendance = "LectureAttendance"
    static let lectureMemo = "LectureMemo"
    static let lectureColor = "LectureColor"

}
