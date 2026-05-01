//
//  LoginViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/19/26.
//
import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    private let titleLabel = UILabel().then {
        $0.text = "로그인/가입하려는\n이메일을 입력해주세요"
        $0.textColor = .white
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.font = .head2
    }
    
    private let explainLabel = UILabel().then {
        $0.text = "결제 등 중요 정보 알림, 로그인, 비밀번호 찾기에 필요해요.\n사용 중인 이메일을 입력하세요"
        $0.textColor = .gray100
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.font = .body1
    }
    
    private let emailTextField = UITextField().then {
        $0.addLeftPadding()
        $0.textAlignment = .left
        $0.placeholder = "email@address.com"
        $0.setPlaceholder(color: .gray400)
        $0.font = .body2
        $0.backgroundColor = .gray600
        $0.textColor = .white
        $0.layer.cornerRadius = 5
        $0.tintColor = .watchaPink
        $0.rightView = nil
        $0.rightViewMode = .never
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.gray200, for: .normal)
        $0.titleLabel?.font = .medium
        $0.backgroundColor = .gray400
        $0.layer.cornerRadius = 10
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(nextButtonDidtapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
        setLayout()
        setTarget()
    }
    
    private func setUI(){
        [titleLabel, explainLabel, emailTextField, nextButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(152)
            $0.leading.equalToSuperview().inset(30)
            $0.width.equalTo(205)
            $0.height.equalTo(55)
        }
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(titleLabel)
            $0.width.equalTo(272)
            $0.height.equalTo(30)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(30)
            $0.horizontalEdges.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        nextButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(26)
            $0.height.equalTo(56)
        }
    }
    
    private func setTarget() {
        emailTextField.addTarget(self, action: #selector(textDidBegin), for: .editingDidBegin
        )
        
        emailTextField.addTarget(self, action: #selector(textDidEnd), for: .editingDidEnd
        )
        
        emailTextField.addTarget(self, action: #selector(textChanged), for: .editingChanged
        )
    }
    
    @objc
    private func nextButtonDidtapped() {
        let vc = PasswordViewController()
        vc.email = emailTextField.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func textDidBegin(_ sender: UITextField) {
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.gray400.cgColor
    }
    
    @objc
    func textDidEnd(_ sender: UITextField) {
        sender.layer.borderWidth = 0
    }
    
    @objc
    func textChanged(_ sender: UITextField) {
        
        guard let text = sender.text else { return }
        
        if text.isEmpty {
            sender.rightView = nil
            sender.rightViewMode = .never
            
            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray400
            nextButton.setTitleColor(.gray200, for: .normal)
            
            return
        }
        
        let isValid = text.isValidEmail
        
        sender.setClearButton(with: UIImage(named: "clear")!, mode: .always, isValid: isValid)
        
        nextButton.isEnabled = isValid
        nextButton.backgroundColor = isValid ? .watchaPink : .gray400
        
        nextButton.setTitleColor(isValid ? .white : .gray200, for: .normal)
    }
}

extension UITextField {
    func addLeftPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(_ width: CGFloat = 20) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}
