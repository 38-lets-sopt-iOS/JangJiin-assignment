//
//  PasswordViewController.swift
//  Sopt_38_assignment
//
//  Created by 장지인 on 4/23/26.
//
import UIKit
import Foundation
import SnapKit

class CustomSecureTextField: UITextField {
    override func becomeFirstResponder() -> Bool {
        let result = super.becomeFirstResponder()
        
        if isSecureTextEntry, let currentText = text, !currentText.isEmpty {
            deleteBackward()
            insertText(currentText)
        }
        
        return result
    }
}

class PasswordViewController: UIViewController {
    
    var email: String? = nil
    private var nickname : String = ""

    private func bindID() {
        explainLabel.text = "\(email ?? "")로 가입중"
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "사용할 비밀번호를\n입력해주세요"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-SemiBold", size: 23)
        return label
    }()
    
    private let explainLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray100
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Medium", size: 12)
        return label
    }()
    
    private let PWLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray100
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.text = "영문, 숫자, 특수문자 포함 10글자 이상"
        return label
    }()
    
    private let PWTextField: CustomSecureTextField = {
        let textField = CustomSecureTextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 47))
        textField.leftViewMode = .always
        textField.textAlignment = .left
        textField.placeholder = "비밀번호 입력"
        textField.setPlaceholder(color: .gray400)
        textField.font = UIFont(name: "Pretendard-Regular", size: 12)
        textField.backgroundColor = .gray600
        textField.textColor = .white
        textField.layer.cornerRadius = 5
        textField.tintColor = .watchaPink
        textField.isSecureTextEntry = true
        textField.rightViewMode = .never
        return textField
    }()
    
    private let checkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "enable-off")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("가입하기", for: .normal)
        button.setTitleColor(.gray200, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 18)
        button.backgroundColor = .gray400
        button.layer.cornerRadius = 5
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var clearButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 12, width: 24, height: 24)
        button.setImage(UIImage(named: "clear"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(clearPasswordText), for: .touchUpInside)
        return button
    }()
    
    private lazy var toggleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 32, y: 12, width: 24, height: 24)
        button.setImage(UIImage(named: "eye-off"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(togglePW), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordRightView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 64, height: 47))
        view.addSubview(clearButton)
        view.addSubview(toggleButton)
        return view
    }()
    
    private lazy var sheetButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(
            NSAttributedString(
                string : "닉네임 설정",
                attributes: [
                    .underlineStyle : NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor.gray100,
                    .font: UIFont(name: "Pretendard-Regular", size: 12)!
                ]
            ),for: .normal
        )
        button.addTarget(self, action: #selector(BottomSheetTapped), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func BottomSheetTapped() {
        let vc = BottomSheetViewController()
        vc.onComplete = { [weak self] nickname in
            self?.nickname = nickname
            self?.sheetButton.setAttributedTitle(NSAttributedString(
                string: nickname,
                attributes: [
                    .underlineStyle: NSUnderlineStyle.single.rawValue,
                    .foregroundColor: UIColor.gray100,
                    .font: UIFont(name: "Pretendard-Regular", size: 12)!
                ]
            ), for: .normal)
        }
        
        vc.modalPresentationStyle = .pageSheet
        
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = false
            sheet.preferredCornerRadius = 20
        }
        
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        bindID()
        setLayout()
        setTarget()
        
        PWTextField.rightView = passwordRightView
        PWTextField.rightViewMode = .never
    }
    
    private func setLayout() {
        [titleLabel, explainLabel, PWTextField, nextButton, checkImage, PWLabel,sheetButton].forEach {
            view.addSubview($0)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(152)
            $0.leading.equalToSuperview().offset(30)
            $0.width.equalTo(205)
            $0.height.equalTo(55)
        }
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(titleLabel)
            $0.width.equalTo(272)
            $0.height.equalTo(30)
        }
        PWTextField.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(31)
            $0.height.equalTo(47)
        }
        checkImage.snp.makeConstraints{
            $0.top.equalTo(PWTextField.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(35)
            $0.width.height.equalTo(13)
        }
        PWLabel.snp.makeConstraints{
            $0.centerY.equalTo(checkImage)
            $0.leading.equalTo(checkImage.snp.trailing).offset(8)
            $0.height.equalTo(47)
        }
        sheetButton.snp.makeConstraints{
            $0.top.equalTo(PWTextField.snp.bottom).offset(54)
            $0.centerX.equalToSuperview()
            $0.leading.width.equalTo(80)
            $0.height.equalTo(20)
        }
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(22)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(26)
            $0.height.equalTo(56)
        }
    }
    
    private func setTarget() {
        PWTextField.addTarget(self, action: #selector(textDidBegin(_:)), for: .editingDidBegin)
        PWTextField.addTarget(self, action: #selector(textDidEnd(_:)), for: .editingDidEnd)
        PWTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
    }
    
    @objc
    private func nextButtonDidTapped() {
        pushToWelcomeVC()
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.nickname = nickname
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func textDidBegin(_ sender: UITextField) {
        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.gray400.cgColor
    }
    
    @objc
    private func textDidEnd(_ sender: UITextField) {
        sender.layer.borderWidth = 0
    }
    
    @objc
    private func textChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        let isEmpty = text.isEmpty
        let isValid = text.isValidPW
        
        sender.rightViewMode = isEmpty ? .never : .always
        
        updateCheckImage(isValid: isValid)
        
        PWLabel.textColor = isValid ? .watchaGreen : .gray100
        nextButton.isEnabled = isValid
        nextButton.backgroundColor = isValid ? .watchaPink : .gray400
        nextButton.setTitleColor(isValid ? .white : .gray200, for: .normal)
    }
    
    @objc
    private func clearPasswordText() {
        PWTextField.text = ""
        PWTextField.rightViewMode = .never
        updateCheckImage(isValid: false)
        nextButton.isEnabled = false
        nextButton.backgroundColor = .gray400
        nextButton.setTitleColor(.gray200, for: .normal)
    }
    
    @objc
    private func togglePW() {
        PWTextField.isSecureTextEntry.toggle()
        
        toggleButton.setImage(
            UIImage(named: PWTextField.isSecureTextEntry ? "eye-off" : "eye-on"),
            for: .normal
        )
        
        if PWTextField.isFirstResponder {
            _ = PWTextField.becomeFirstResponder()
        }
    }
    
    private func updateCheckImage(isValid: Bool) {
        checkImage.image = UIImage(named: isValid ? "enable-on" : "enable-off")
    }
}

