//
//  LectureMemoViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/25.
//

import UIKit

final class LectureMemoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func instantiate() -> LectureMemoViewController {
        let lectureColorVC = UIStoryboard.lectureMemo.instantiateViewController(
            identifier: LectureMemoViewController.identifier
        ) as! LectureMemoViewController
        return lectureColorVC
    }
    
}

private extension UIStoryboard {
    
    static var lectureMemo: UIStoryboard {
        UIStoryboard(name: "LectureMemo", bundle: nil)
    }
    
}
