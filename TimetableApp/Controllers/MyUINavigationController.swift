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
        
        setupTitleButton()
        setupSettingButton()
        
    }
    
}

// MARK: - setup
private extension MyUINavigationController {
    
    func setupTitleButton() {
        let buttonWidth: CGFloat = 70
        let buttonHeight: CGFloat = 30
        let button = NeumorphismView(
            frame: CGRect(x: (navigationBar.frame.size.width - buttonWidth) / 2,
                          y: (navigationBar.frame.size.height - buttonHeight) / 2,
                          width: buttonWidth,
                          height: buttonHeight
            )
        )
        button.type = .pushButton
        button.cornerRadius = button.frame.size.height / 2
        button.addTarget(self, action: #selector(titleButtonDidTapped), for: .touchUpInside)
        navigationBar.addSubview(button)
        
        let label = UILabel()
        label.text = "タイトル"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        button.addSubview(label)
        label.anchor(centerY: button.centerYAnchor, centerX: button.centerXAnchor)
    }
    
    func setupSettingButton() {
        let buttonWidth: CGFloat = 32
        let buttonHeight: CGFloat = 32
        let button = NeumorphismView(
            frame: CGRect(x: 15,
                          y: (navigationBar.frame.size.height - buttonHeight) / 2,
                          width: buttonWidth,
                          height: buttonHeight
            )
        )
        button.type = .pushButton
        button.cornerRadius = button.frame.size.height / 2
        button.addTarget(self, action: #selector(settingButtonDidTapped), for: .touchUpInside)
        navigationBar.addSubview(button)
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gearshape")
        imageView.tintColor = .black
        button.addSubview(imageView)
        imageView.anchor(centerY: button.centerYAnchor, centerX: button.centerXAnchor)
    }
    
}

// MARK: - @objc func
@objc private extension MyUINavigationController {
    
    func titleButtonDidTapped() {
        print(#function)
    }
    
    func settingButtonDidTapped() {
        let timetableSettingVC = TimetableSettingViewController.instantiate()
        timetableSettingVC.modalPresentationStyle = .fullScreen
        present(timetableSettingVC, animated: true, completion: nil)
    }
    
}

