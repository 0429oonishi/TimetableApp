//
//  EditLectureViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/25.
//

import UIKit

final class EditLectureViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func instantiate() -> EditLectureViewController {
        let editLectureVC = UIStoryboard.editLecture.instantiateViewController(
            withIdentifier: EditLectureViewController.identifier
        ) as! EditLectureViewController
        return editLectureVC
    }
    
}

private extension UIStoryboard {
    
    static var editLecture: UIStoryboard {
        UIStoryboard(name: "EditLecture", bundle: nil)
    }
    
}
