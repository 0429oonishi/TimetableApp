//
//  MyUITabBarController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/21.
//

import UIKit

final class MyUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
         
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupTimetableButton()
        
    }

}

// MARK: - setup
private extension MyUITabBarController {
    
    func setupTimetableButton() {
        let buttonWidth: CGFloat = 40
        let buttonHeight: CGFloat = 40
        let button = NeumorphismView(
            frame: CGRect(
                x: (tabBar.frame.size.width - buttonWidth) / 2,
                y: (tabBar.frame.size.height - buttonHeight) / 2 - 10,
                width: buttonWidth,
                height: buttonHeight
            )
        )
        button.type = .pushButton
        button.cornerRadius = button.frame.height / 2
        button.addTarget(self, action: #selector(timetableButtonDidTapped), for: .touchUpInside)
        tabBar.addSubview(button)

        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "graduationcap")
        imageView.tintColor = .black
        button.addSubview(imageView)
        imageView.anchor(centerY: button.centerYAnchor, centerX: button.centerXAnchor)
        
    }
    
}

// MARK: - @objc func
@objc private extension MyUITabBarController {
    
    func timetableButtonDidTapped() {
        print(#function)
    }
    
}
