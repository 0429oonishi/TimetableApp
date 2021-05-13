//
//  LectureAttendanceViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/25.
//

import UIKit

final class LectureAttendanceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func instantiate() -> LectureAttendanceViewController {
        let lectureAttendanceVC = UIStoryboard.lectureAttendance.instantiateViewController(
            withIdentifier: LectureAttendanceViewController.identifier
        ) as! LectureAttendanceViewController
        return lectureAttendanceVC
    }
    
}

private extension UIStoryboard {
    
    static var lectureAttendance: UIStoryboard {
        UIStoryboard(name: "LectureAttendance", bundle: nil)
    }
    
}
