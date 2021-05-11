//
//  TimetableSettingViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import UIKit

final class TimetableSettingViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        setupTableView()
        
        TimetableSetting[.showSaturday].isOn = UserDefaults.standard.bool(forKey: .isHiddenSaturdayViewKey)
        TimetableSetting[.showSixPeriod].isOn = UserDefaults.standard.bool(forKey: .isHiddenSixPeriodViewKey)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupBackButton()
        
    }
    
}

// MARK: - setup
private extension TimetableSettingViewController {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TimetableSettingTableViewCell.nib,
                           forCellReuseIdentifier: TimetableSettingTableViewCell.identifier)
    }
    
    func setupBackButton() {
        let backButtonWidth: CGFloat = 44
        let backButtonHeight: CGFloat = 44
        let backButton = NeumorphismView(
            frame: CGRect(
                x: 30,
                y: 70,
                width: backButtonWidth,
                height: backButtonHeight
            )
        )
        backButton.type = .pushButton
        backButton.cornerRadius = backButton.frame.height / 2
        backButton.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .black
        backButton.setContentView(imageView)
        imageView.anchor(centerY: backButton.centerYAnchor, centerX: backButton.centerXAnchor)
        
    }
    
}

// MARK: - @objc func
@objc private extension TimetableSettingViewController {
    
    func backButtonDidTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UITableViewDelegate
extension TimetableSettingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
}

// MARK: - UITableViewDataSource
extension TimetableSettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TimetableSetting.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimetableSettingTableViewCell.identifier,
                                                 for: indexPath) as! TimetableSettingTableViewCell
        let type = TimetableSettingType(rawValue: indexPath.section)!
        var timetableSetting = TimetableSetting[type]
        cell.setup(timetableSetting: timetableSetting) { isOn in
            timetableSetting.isOn = isOn
            UserDefaults.standard.set(isOn, forKey: type.key)
        }
        return cell
    }
    
}
