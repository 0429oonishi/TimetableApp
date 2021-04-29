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
        let titleButtonWidth: CGFloat = 70
        let titleButtonHeight: CGFloat = 30
        let titleButton = NeumorphismView(
            frame: CGRect(x: (navigationBar.frame.size.width - titleButtonWidth) / 2,
                          y: (navigationBar.frame.size.height - titleButtonHeight) / 2,
                          width: titleButtonWidth,
                          height: titleButtonHeight
            )
        )
        titleButton.type = .pushButton
        titleButton.cornerRadius = titleButton.frame.size.height / 2
        titleButton.addTarget(self, action: #selector(titleButtonDidTapped), for: .touchUpInside)
        navigationBar.addSubview(titleButton)
        
        let label = UILabel()
        label.text = "タイトル"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        titleButton.addSubview(label)
        [label.centerXAnchor.constraint(equalTo: titleButton.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: titleButton.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
    func setupSettingButton() {
        let settingButtonWidth: CGFloat = 32
        let settingButtonHeight: CGFloat = 32
        let settingButton = NeumorphismView(
            frame: CGRect(x: 15,
                          y: (navigationBar.frame.size.height - settingButtonHeight) / 2,
                          width: settingButtonWidth,
                          height: settingButtonHeight
            )
        )
        settingButton.type = .pushButton
        settingButton.cornerRadius = settingButton.frame.size.height / 2
        settingButton.addTarget(self, action: #selector(settingButtonDidTapped), for: .touchUpInside)
        navigationBar.addSubview(settingButton)
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gearshape")
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        settingButton.addSubview(imageView)
        [imageView.centerXAnchor.constraint(equalTo: settingButton.centerXAnchor),
         imageView.centerYAnchor.constraint(equalTo: settingButton.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

// MARK: - @objc func
@objc private extension MyUINavigationController {
    
    func titleButtonDidTapped() {
        print(#function)
    }
    
    func settingButtonDidTapped() {
        let timetableSettingVC = UIStoryboard.timetableSetting.instantiateViewController(
            identifier: TimetableSettingViewController.identifier
        ) as! TimetableSettingViewController
        timetableSettingVC.modalPresentationStyle = .fullScreen
        if let ints = UserDefaults.standard.array(forKey: .saturdayAndSixPeriodKey) as? [Int] {
            timetableSettingVC.timetableSettingInts = ints
        }
        present(timetableSettingVC, animated: true, completion: nil)
    }
    
}

