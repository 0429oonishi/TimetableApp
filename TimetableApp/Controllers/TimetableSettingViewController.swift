//
//  TimetableSettingViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/23.
//

import UIKit

final class TimetableSettingViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    static var identifier: String { String(describing: self) }
    private var timetableSettings: [TimetableSetting] = [
        TimetableSetting(text: "土曜日を表示", isOn: true),
        TimetableSetting(text: "６限目を表示", isOn: true),
    ]
    var timetableSettingInts = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TimetableSettingTableViewCell.nib(),
                           forCellReuseIdentifier: TimetableSettingTableViewCell.identifier)
        
        changeTimetableSettings()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupBackButton()
        
    }
    
    private func changeTimetableSettings() {
        for n in 0..<timetableSettings.count {
            if timetableSettingInts.count < timetableSettings.count {
                timetableSettingInts.append(timetableSettings[n].isOn.toInt)
            }
            if let bool = timetableSettingInts[n].toBool {
                timetableSettings[n].isOn = bool
            }
        }
    }
    
}

// MARK: - setup
private extension TimetableSettingViewController {
    
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backButton.setContentView(imageView)
        [imageView.centerXAnchor.constraint(equalTo: backButton.centerXAnchor),
         imageView.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

// MARK: - @objc func
@objc private extension TimetableSettingViewController {
    
    func backButtonDidTapped(_ sender: Any) {
        UserDefaults.standard.set(timetableSettingInts, forKey: .saturdayAndSixPeriodKey)
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Delegate
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

// MARK: - DataSource
extension TimetableSettingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return timetableSettings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimetableSettingTableViewCell.identifier,
                                                 for: indexPath) as! TimetableSettingTableViewCell
        let timetableSetting = timetableSettings[indexPath.section]
        cell.setup(timetableSetting: timetableSetting, index: indexPath.section)
        cell.onTapEvent = { self.timetableSettingInts[$0.tag] = $0.isOn.toInt }
        return cell
    }
    
}

