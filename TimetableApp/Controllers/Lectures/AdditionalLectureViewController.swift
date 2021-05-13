//
//  AdditionalLectureViewController.swift
//  TimetableApp
//
//  Created by 大西玲音 on 2021/04/25.
//

import UIKit

final class AdditionalLectureViewController: UIViewController {
    
    @IBOutlet private weak var nameView: NeumorphismView!
    @IBOutlet private weak var roomView: NeumorphismView!
    @IBOutlet private weak var professorView: NeumorphismView!
    @IBOutlet private weak var creditView: NeumorphismView!
    @IBOutlet private weak var weekAndPeriodView: NeumorphismView!
    @IBOutlet private weak var backButtonView: NeumorphismView!
    @IBOutlet private weak var addButtonView: NeumorphismView!
    
    private var nameLabel = UILabel()
    private var roomLabel = UILabel()
    private var professorLabel = UILabel()
    private var creditLabel = UILabel()
    private var nameTextField = UITextField()
    private var roomTextField = UITextField()
    private var professorTextField = UITextField()
    private var creditTextField = UITextField()
    private var dismissEvent: (() -> Void)?
    private var week: Week?
    private var period: Period?
    private let lectureUseCase = LectureUseCase()
    private enum AdditionalViewType {
        case name
        case room
        case professor
        case credit
        var text: String {
            switch self {
                case .name: return "講義"
                case .room: return "教室"
                case .professor: return "教員"
                case .credit: return "単位"
            }
        }
        var placeholder: String {
            switch self {
                case .name: return "講義名を入力"
                case .room: return "教室名を入力"
                case .professor: return "教員名を入力"
                case .credit: return "単位数を入力"
            }
        }
    }
    private enum AdditionalButtonType {
        case add
        case back
        var text: String {
            switch self {
                case .add: return "追加"
                case .back: return "戻る"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        
        setupViews(type: .name, view: nameView, label: nameLabel, textField: nameTextField)
        setupViews(type: .room, view: roomView, label: roomLabel, textField: roomTextField)
        setupViews(type: .professor, view: professorView, label: professorLabel, textField: professorTextField)
        setupViews(type: .credit, view: creditView, label: creditLabel, textField: creditTextField)
        
        setupButtonView(type: .add, view: addButtonView)
        addButtonView.addTarget(self, action: #selector(addButtonViewDidTapped), for: .touchUpInside)
        setupButtonView(type: .back, view: backButtonView)
        backButtonView.addTarget(self, action: #selector(backButtonViewDidTapped), for: .touchUpInside)
        setupWeekAndPeriodView()
        
        nameTextField.delegate = self
        roomTextField.delegate = self
        professorTextField.delegate = self
        creditTextField.delegate = self
        creditTextField.keyboardType = .numberPad
        
    }
    
    static func instantiate(week: Week?, period: Period?, dismissEvent: @escaping () -> Void) -> AdditionalLectureViewController {
        let additionalLectureVC = UIStoryboard.additionalLecture.instantiateViewController(
            identifier: AdditionalLectureViewController.identifier
        ) as! AdditionalLectureViewController
        additionalLectureVC.modalPresentationStyle = .fullScreen
        additionalLectureVC.week = week
        additionalLectureVC.period = period
        additionalLectureVC.dismissEvent = dismissEvent
        return additionalLectureVC
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// MARK: - setup views
private extension AdditionalLectureViewController {
    
    // AdditionalViewTypeをprivateにするため、このメソッドにprivateをつけている
    private func setupViews(type: AdditionalViewType, view: UIView, label: UILabel, textField: UITextField) {
        label.text = type.text
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        view.addSubview(label)
        label.anchor(left: view.leftAnchor, centerY: view.centerYAnchor, leftPadding: 20)
        
        textField.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        textField.placeholder = type.placeholder
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        view.addSubview(textField)
        textField.anchor(left: label.leftAnchor,
                         right: view.rightAnchor,
                         centerY: view.centerYAnchor,
                         leftPadding: 60,
                         rightPadding: -20)
    }
    
    // AdditionalViewTypeをprivateにするため、このメソッドにprivateをつけている
    private func setupButtonView(type: AdditionalButtonType, view: NeumorphismView) {
        view.type = .pushButton
        view.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = type.text
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        view.addSubview(label)
        label.anchor(centerY: view.centerYAnchor, centerX: view.centerXAnchor)
    }
    
    func setupWeekAndPeriodView() {
        weekAndPeriodView.type = .normal
        weekAndPeriodView.layer.cornerRadius = 10
        guard let week = week else { return }
        guard let period = period else { return }
        let label = UILabel()
        label.text = "\(week.text)曜 \(period.text)限"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        weekAndPeriodView.addSubview(label)
        label.anchor(centerY: weekAndPeriodView.centerYAnchor,
                     centerX: weekAndPeriodView.centerXAnchor)
    }
    
}

// MARK: - @objc func
@objc private extension AdditionalLectureViewController {
    
    func backButtonViewDidTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func addButtonViewDidTapped() {
        let name = nameTextField.text
        let room = roomTextField.text
        let professor = professorTextField.text
        let credit = Int(creditTextField.text ?? "")
        let lecture = LectureElement(name: name, room: room, professor: professor, credit: credit)
        let index = Convert(week: week, period: period).number
        lectureUseCase.update(index: index, lecture: lecture)
        dismissEvent?()
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UITextFieldDelegate
extension AdditionalLectureViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

private extension UIStoryboard {
    
    static var additionalLecture: UIStoryboard {
        UIStoryboard(name: "AdditionalLecture", bundle: nil)
    }
    
}

