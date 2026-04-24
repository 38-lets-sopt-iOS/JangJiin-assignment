//
//  BottomSheetViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/24/26.
//
import UIKit
import SnapKit

class BottomSheetViewController: UIViewController {
    var onComplete: ((String) -> Void)?
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .white
        label.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        return label
    }()
    
    private let nickNameTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 52))
        textField.leftViewMode = .always
        textField.placeholder = "닉네임"
        textField.setPlaceholder(color: .gray400)
        textField.textColor = .white
        textField.font = UIFont(name: "Pretendard-Regular", size: 16)
        textField.backgroundColor = .gray600
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var completeButton: UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        button.backgroundColor = .gray600
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(dismissSheet),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray400
        
        [titleLabel, nickNameTextField, completeButton].forEach {
            view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalToSuperview().offset(24)
            $0.height.equalTo(21)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
        
        completeButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(56)
        }
    }
    
    @objc
    private func dismissSheet() {
        let nickname = nickNameTextField.text ?? ""
        
        if !nickname.isEmpty {
            onComplete?(nickname)
        }
        
        dismiss(animated: true)
    }
}
