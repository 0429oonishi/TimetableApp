//
//  LectureColorViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/25.
//

import UIKit

final class LectureColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func instantiate() -> LectureColorViewController {
        let lectureColorVC = UIStoryboard.lectureColor.instantiateViewController(
            identifier: LectureColorViewController.identifier
        ) as! LectureColorViewController
        return lectureColorVC
    }
    
}

private extension UIStoryboard {
    
    static var lectureColor: UIStoryboard {
        UIStoryboard(name: "LectureColor", bundle: nil)
    }
    
}
