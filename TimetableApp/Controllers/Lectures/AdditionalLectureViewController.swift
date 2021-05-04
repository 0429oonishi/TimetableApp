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
        
        nameTextField.delegate = self
        roomTextField.delegate = self
        professorTextField.delegate = self
        creditTextField.delegate = self
        
    }
    
}

// MARK: - setup views
private extension AdditionalLectureViewController {
    
    func setupViews(type: AdditionalViewType, view: UIView, label: UILabel, textField: UITextField) {
        label.text = type.text
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        [label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ].forEach { $0.isActive = true }
        
        textField.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        textField.placeholder = type.placeholder
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        [textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         textField.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 60),
         textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
         textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
        ].forEach { $0.isActive = true }
    }
    
    func setupButtonView(type: AdditionalButtonType, view: NeumorphismView) {
        view.type = .pushButton
        view.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = type.text
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        [label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

// MARK: - @objc func
@objc private extension AdditionalLectureViewController {
    
    func backButtonViewDidTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func addButtonViewDidTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension AdditionalLectureViewController: UITextFieldDelegate {
    
    
    
}
