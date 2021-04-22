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
        let timetableButtonWidth: CGFloat = 40
        let timetableButtonHeight: CGFloat = 40
        let timetableButton = NeumorphismView(
            frame: CGRect(
                x: (tabBar.frame.size.width - timetableButtonWidth) / 2,
                y: (tabBar.frame.size.height - timetableButtonHeight) / 2 - 10,
                width: timetableButtonWidth,
                height: timetableButtonHeight
            )
        )
        timetableButton.type = .pushButton
        timetableButton.cornerRadius = timetableButton.frame.height / 2
        timetableButton.addTarget(self, action: #selector(timetableButtonDidTapped), for: .touchUpInside)
        tabBar.addSubview(timetableButton)

        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        timetableButton.setContentView(baseView)

        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "graduationcap")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(imageView)
        [imageView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
         imageView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        [baseView.centerXAnchor.constraint(equalTo: timetableButton.centerXAnchor),
         baseView.centerYAnchor.constraint(equalTo: timetableButton.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

private extension MyUITabBarController {
    
    @objc func timetableButtonDidTapped() {
        print(#function)
    }
    
}
