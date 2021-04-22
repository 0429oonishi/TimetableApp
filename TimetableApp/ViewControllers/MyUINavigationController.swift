//
//  MyUINavigationController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/21.
//

import UIKit

final class MyUINavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupScreenshotButton()
        setupTitleButton()
        
    }
    
}

// MARK: - setup
private extension MyUINavigationController {
    
    func setupScreenshotButton() {
        let screenshotButtonWidth: CGFloat = 60
        let screenshotButtonHeight: CGFloat = 30
        let screenshotButton = NeumorphismView(
            frame: CGRect(
                x: navigationBar.frame.size.width - (10 + screenshotButtonWidth),
                y: (navigationBar.frame.size.height - screenshotButtonHeight) / 2,
                width: screenshotButtonWidth,
                height: screenshotButtonHeight
            )
        )
        screenshotButton.type = .pushButton
        screenshotButton.cornerRadius = screenshotButton.frame.height / 2
        screenshotButton.addTarget(self, action: #selector(screenshotButtonDidTapped), for: .touchUpInside)
        navigationBar.addSubview(screenshotButton)
        
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        screenshotButton.setContentView(baseView)
        
        let label = UILabel()
        label.text = "スクショ"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(label)
        [label.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        [baseView.centerXAnchor.constraint(equalTo: screenshotButton.centerXAnchor),
         baseView.centerYAnchor.constraint(equalTo: screenshotButton.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
    func setupTitleButton() {
        let titleButtonWidth: CGFloat = 70
        let titleButtonHeight: CGFloat = 30
        let titleButton = NeumorphismView(
            frame: CGRect(x: navigationBar.center.x - titleButtonWidth / 2,
                          y: (navigationBar.frame.size.height - titleButtonHeight) / 2,
                          width: titleButtonWidth,
                          height: titleButtonHeight
            )
        )
        titleButton.type = .pushButton
        titleButton.cornerRadius = titleButton.frame.size.height / 2
        titleButton.addTarget(self, action: #selector(titleButtonDidTapped), for: .touchUpInside)
        navigationBar.addSubview(titleButton)
        
        let baseView = UIView()
        baseView.translatesAutoresizingMaskIntoConstraints = false
        titleButton.setContentView(baseView)
        
        let label = UILabel()
        label.text = "タイトル"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(label)
        [label.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        [baseView.centerXAnchor.constraint(equalTo: titleButton.centerXAnchor),
         baseView.centerYAnchor.constraint(equalTo: titleButton.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

private extension MyUINavigationController {
    
    @objc func screenshotButtonDidTapped() {
        print(#function)
    }
    
    @objc func titleButtonDidTapped() {
        print(#function)
    }
    
}
