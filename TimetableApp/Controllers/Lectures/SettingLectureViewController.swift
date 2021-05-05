//
//  SettingLectureViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/24.
//

import UIKit

final class SettingLectureViewController: UIViewController {
    
    @IBOutlet private weak var lectureView: NeumorphismView!
    @IBOutlet private weak var addOrEditButton: NeumorphismView!
    @IBOutlet private weak var attendanceButton: NeumorphismView!
    @IBOutlet private weak var memoButton: NeumorphismView!
    @IBOutlet private weak var colorButton: NeumorphismView!
    @IBOutlet private weak var backButton: NeumorphismView!
    
    var index: Int!
    var backButtonEvent: (() -> Void)?
    var timetable: Timetable?
    private let lectureUseCase = LectureUseCase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupViews()
        
    }
    
}

// MARK: - setup views
private extension SettingLectureViewController {
    
    func setupViews() {
        let lecture = lectureUseCase.read(index: index)
        lectureView.setupLectureView(lecture: lecture)
        if lecture.name.isEmpty {
            addOrEditButton.setupButton("追加")
            addOrEditButton.addTarget(self, action: #selector(addButtonDidTapped), for: .touchUpInside)
            lectureView.isHidden = true
        } else {
            addOrEditButton.setupButton("編集")
            addOrEditButton.addTarget(self, action: #selector(editButtonDidTapped), for: .touchUpInside)
            lectureView.isHidden = false
        }
        attendanceButton.setupButton("出欠")
        attendanceButton.addTarget(self, action: #selector(attendanceButtonDidTapped), for: .touchUpInside)
        memoButton.setupButton("メモ")
        memoButton.addTarget(self, action: #selector(memoButtonDidTapped), for: .touchUpInside)
        colorButton.setupButton("カラー")
        colorButton.addTarget(self, action: #selector(colorButtonDidTapped), for: .touchUpInside)
        backButton.setupButton("戻る")
        backButton.addTarget(self, action: #selector(backButtonDidTapped), for: .touchUpInside)
    }
    
}

// MARK: - setup NeumorphismView
private extension NeumorphismView {
    
    func setupLectureView(lecture: Lecture?) {
        self.type = .normal
        
        let lectureNameLabel = UILabel()
        lectureNameLabel.text = lecture?.name
        lectureNameLabel.textColor = .black
        lectureNameLabel.textAlignment = .center
        lectureNameLabel.font = .boldSystemFont(ofSize: 25)
        lectureNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lectureNameLabel)
        [lectureNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         lectureNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ].forEach { $0.isActive = true }
        
        let lectureTimeLabel = UILabel()
        lectureTimeLabel.text = lecture?.time
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
        roomLabel.text = lecture?.room
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

// MARK: - @objc func
@objc private extension SettingLectureViewController {
    
    func addButtonDidTapped() {
        let additionalLectureVC = UIStoryboard.additionalLecture.instantiateViewController(
            identifier: AdditionalLectureViewController.identifier
        ) as! AdditionalLectureViewController
        additionalLectureVC.modalPresentationStyle = .fullScreen
        additionalLectureVC.index = index
        additionalLectureVC.timetable = timetable
        additionalLectureVC.dismissEvent = {
            self.backButtonEvent?()
            self.dismiss(animated: true, completion: nil)
        }
        present(additionalLectureVC, animated: true, completion: nil)
    }
    
    func editButtonDidTapped() {
        let editLectureVC = UIStoryboard.editLecture.instantiateViewController(
            identifier: EditLectureViewController.identifier
        ) as! EditLectureViewController
        editLectureVC.modalPresentationStyle = .fullScreen
        present(editLectureVC, animated: true, completion: nil)
    }
    
    func attendanceButtonDidTapped() {
        let lectureAttendanceVC = UIStoryboard.lectureAttendance.instantiateViewController(
            identifier: LectureAttendanceViewController.identifier
        ) as! LectureAttendanceViewController
        lectureAttendanceVC.modalPresentationStyle = .fullScreen
        present(lectureAttendanceVC, animated: true, completion: nil)
    }
    
    func memoButtonDidTapped() {
        let lectureMemoVC = UIStoryboard.lectureMemo.instantiateViewController(
            identifier: LectureMemoViewController.identifier
        ) as! LectureMemoViewController
        lectureMemoVC.modalPresentationStyle = .fullScreen
        present(lectureMemoVC, animated: true, completion: nil)
    }
    
    func colorButtonDidTapped() {
        let lectureColorVC = UIStoryboard.lectureColor.instantiateViewController(
            identifier: LectureColorViewController.identifier
        ) as! LectureColorViewController
        lectureColorVC.modalPresentationStyle = .fullScreen
        present(lectureColorVC, animated: true, completion: nil)
    }
    
    func backButtonDidTapped() {
        backButtonEvent?()
        dismiss(animated: true, completion: nil)
    }
    
}
