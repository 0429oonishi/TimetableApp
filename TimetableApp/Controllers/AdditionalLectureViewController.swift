//
//  AdditionalLectureViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/24.
//

import UIKit

final class AdditionalLectureViewController: UIViewController {
    
    @IBOutlet private weak var LectureView: NeumorphismView!
    @IBOutlet private weak var editButton: NeumorphismView!
    @IBOutlet private weak var attendanceButton: NeumorphismView!
    @IBOutlet private weak var memoButton: NeumorphismView!
    @IBOutlet private weak var colorButton: NeumorphismView!
    @IBOutlet private weak var backButton: NeumorphismView!
    
    static var identifier: String { String(describing: self) }
    var lectureText: String?
    var lectureTime: String?
    var lectureRoom: String?
    var backButtonEvent: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        LectureView.setupLectureView(text: lectureText, time: lectureTime, room: lectureRoom)
        editButton.setupButton("編集")
        attendanceButton.setupButton("出欠")
        memoButton.setupButton("メモ")
        colorButton.setupButton("カラー")
        backButton.setupButton("戻る")
        backButton.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
        
    }
    
}

// MARK: - setup
private extension NeumorphismView {
    
    func setupLectureView(text: String?, time: String?, room: String?) {
        self.type = .normal
        
        let lectureNameLabel = UILabel()
        lectureNameLabel.text = text
        lectureNameLabel.textColor = .black
        lectureNameLabel.textAlignment = .center
        lectureNameLabel.font = .boldSystemFont(ofSize: 25)
        lectureNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lectureNameLabel)
        [lectureNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         lectureNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        let lectureTimeLabel = UILabel()
        lectureTimeLabel.text = time
        lectureTimeLabel.textColor = .black
        lectureTimeLabel.textAlignment = .center
        lectureTimeLabel.font = .boldSystemFont(ofSize: 15)
        lectureTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lectureTimeLabel)
        [lectureTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         lectureTimeLabel.bottomAnchor.constraint(equalTo: lectureNameLabel.bottomAnchor,
                                                  constant: -50),
        ].forEach { $0.isActive = true }
        
        let roomLabel = UILabel()
        roomLabel.text = room
        roomLabel.textColor = .black
        roomLabel.textAlignment = .center
        roomLabel.font = .boldSystemFont(ofSize: 15)
        roomLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(roomLabel)
        [roomLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         roomLabel.topAnchor.constraint(equalTo: lectureNameLabel.topAnchor,
                                        constant: 50),
        ].forEach { $0.isActive = true }
        
    }
    
    func setupButton(_ text: String) {
        self.type = .pushButton
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        [label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

@objc private extension AdditionalLectureViewController {
    
    func backButtonDidTapped() {
        backButtonEvent?()
        dismiss(animated: true, completion: nil)
    }
    
}
