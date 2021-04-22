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
        
        setupTimetableTabBarButton()
        
    }

}

// MARK: - setup
private extension MyUITabBarController {
    
    func setupTimetableTabBarButton() {
        let timetableTabBarButtonWidth: CGFloat = 40
        let timetableTabBarButtonHeight: CGFloat = 40
        let timetableTabBarButton = NeumorphismView(
            frame: CGRect(
                x: (tabBar.frame.size.width - timetableTabBarButtonWidth) / 2,
                y: (tabBar.frame.size.height - timetableTabBarButtonHeight) / 2 - 10,
                width: timetableTabBarButtonWidth,
                height: timetableTabBarButtonHeight
            )
        )
        timetableTabBarButton.type = .pushButton
        timetableTabBarButton.cornerRadius = timetableTabBarButton.frame.height / 2
        timetableTabBarButton.addTarget(self, action: #selector(timetableTabBarButtonDidTapped), for: .touchUpInside)
        tabBar.addSubview(timetableTabBarButton)

        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        timetableTabBarButton.setContentView(baseView)

        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "graduationcap")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(imageView)
        [imageView.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
         imageView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        [baseView.centerXAnchor.constraint(equalTo: timetableTabBarButton.centerXAnchor),
         baseView.centerYAnchor.constraint(equalTo: timetableTabBarButton.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

private extension MyUITabBarController {
    
    @objc func timetableTabBarButtonDidTapped() {
        print(#function)
    }
    
}
