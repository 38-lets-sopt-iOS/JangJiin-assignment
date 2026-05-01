//
//  BottomSheetViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/24/26.
//
import UIKit

import SnapKit
import Then

class BottomSheetViewController: UIViewController {
    var onComplete: ((String) -> Void)?
    private let titleLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = .white
        $0.font = .subhead1
    }
    
    private let nickNameTextField = UITextField().then {
        $0.addLeftPadding()
        $0.placeholder = "닉네임"
        $0.setPlaceholder(color: .gray400)
        $0.textColor = .white
        $0.font = .body2
        $0.backgroundColor = .gray600
        $0.layer.cornerRadius = 10
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .subhead1
        $0.backgroundColor = .gray600
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(dismissSheet), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray400
        setUI()
        setLayout()
    }
    
    private func setUI(){
        [titleLabel, nickNameTextField, completeButton].forEach {view.addSubview($0)}
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(35)
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(21)
        }
        
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(52)
        }
        
        completeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(56)
        }
    }
    
    @objc
    private func dismissSheet() {
        guard let nickname = nickNameTextField.text else{return}
        
        if !nickname.isEmpty {
            onComplete?(nickname)
        }
        
        dismiss(animated: true)
    }
}
